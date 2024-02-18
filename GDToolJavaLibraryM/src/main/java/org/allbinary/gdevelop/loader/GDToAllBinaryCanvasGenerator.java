/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.loader;

import org.allbinary.data.CamelCaseUtil;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.StringBufferInputStream;
import javax.xml.transform.stream.StreamSource;
import org.allbinary.canvas.Processor;
import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.gdevelop.json.GDLayout;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDToAllBinaryCanvasGenerator extends Processor
{
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final XslHelper xslHelper = XslHelper.getInstance();
    private final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    private final String GD_LAYOUT = "<GDLayout>";
    private final String GD_CURRENT_LAYOUT_INDEX = "<GD_CURRENT_INDEX>";

    private final StringMaker stringBuilder = new StringMaker();

    private final String xslPath;
    private final String path;
    
    private int index;
    private String name;
    private String className;
    private String orig;

    public GDToAllBinaryCanvasGenerator(final String xslPath, final String path) {
        this.xslPath = xslPath;
        this.path = path;
    }
    
    public void loadLayout(final GDLayout layout, final int index, final int size) throws Exception
    {
        this.index = index;
        name = this.camelCaseUtil.getAsCamelCase(layout.name, stringBuilder);
        stringBuilder.delete(0, stringBuilder.length());
//        if (index == 1 || size == 1)
//        {
            className = stringBuilder.append("GDGame").append(name).append("Canvas").toString();
            this.orig = gdToolStrings.ROOT_PATH + this.xslPath;
//        } else
//        {
//            className = stringBuilder.append("GDGameStart").append(name).append("Canvas").toString();
//            this.orig = gdToolStrings.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameStartGDLayoutCanvas.xsl";
//        }
    }

    @Override
    public void process() throws Exception
    {

        stringBuilder.delete(0, stringBuilder.length());
        final String CANVAS = stringBuilder.append(gdToolStrings.ROOT_PATH + this.path).append(this.className).append(".java").toString();

        final StreamUtil streamUtil = StreamUtil.getInstance();
        final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
        final byte[] byteArray = new byte[16384];

        final FileInputStream fileInputStream = new FileInputStream(this.orig);        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, outputStream, byteArray));
        
        final Replace replace = new Replace(GD_LAYOUT, this.name);
        final Replace replace2 = new Replace(GD_CURRENT_LAYOUT_INDEX, Integer.toString(this.index));

        String updatedXslDocumentStr = replace.all(androidRFileAsString);
        updatedXslDocumentStr = replace2.all(updatedXslDocumentStr);

        final FileInputStream gameInputStream = new FileInputStream(gdToolStrings.GAME_XML_PATH);
        outputStream.reset();
        final String xmlDocumentStr = new String(streamUtil.getByteArray(gameInputStream, outputStream, byteArray));

        final String result = this.xslHelper.translate(new BasicUriResolver(),
                new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                new StreamSource(new StringBufferInputStream(xmlDocumentStr)));

        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + CANVAS, this, commonStrings.PROCESS));
        
        this.bufferedWriterUtil.overwrite(CANVAS, result);
    }

}

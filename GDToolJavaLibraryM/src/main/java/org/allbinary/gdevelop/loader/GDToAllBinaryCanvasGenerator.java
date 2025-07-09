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
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonLabels;

/**
 *
 * @author User
 */
public class GDToAllBinaryCanvasGenerator extends Processor
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final XslHelper xslHelper = XslHelper.getInstance();
    private final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    
    private final StringMaker stringMaker = new StringMaker();

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
        name = this.camelCaseUtil.getAsCamelCase(layout.name, stringMaker);
        stringMaker.delete(0, stringMaker.length());
//        if (index == 1 || size == 1)
//        {
            className = stringMaker.append("GDGame").append(name).append("Canvas").toString();
            this.orig = gdToolStrings.ROOT_PATH + this.xslPath;
//        } else
//        {
//            className = stringMaker.append("GDGameStart").append(name).append("Canvas").toString();
//            this.orig = gdToolStrings.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameStartGDLayoutCanvas.xsl";
//        }
    }

    @Override
    public void process() throws Exception
    {
        
        stringMaker.delete(0, stringMaker.length());
        final String CANVAS = stringMaker.append(gdToolStrings.ROOT_PATH + this.path).append(this.className).append(".java").toString();

        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();
        
        final FileInputStream fileInputStream = new FileInputStream(this.orig);        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
        
        final Replace replace = new Replace(this.gdToolStrings.GD_LAYOUT, this.name);
        final Replace replace2 = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, Integer.toString(this.index));

        String updatedXslDocumentStr = replace.all(androidRFileAsString);
        updatedXslDocumentStr = replace2.all(updatedXslDocumentStr);

        final FileInputStream gameInputStream = new FileInputStream(gdToolStrings.GAME_XML_PATH);
        sharedBytes.outputStream.reset();
        final String xmlDocumentStr = new String(streamUtil.getByteArray(gameInputStream, sharedBytes.outputStream, sharedBytes.byteArray));

        final String result = this.xslHelper.translate(new BasicUriResolver(),
                new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                new StreamSource(new StringBufferInputStream(xmlDocumentStr)));

        logUtil.put(this.gdToolStrings.FILENAME + CANVAS, this, commonStrings.PROCESS);
        
        this.bufferedWriterUtil.overwrite(CANVAS, result);
        
    }

}

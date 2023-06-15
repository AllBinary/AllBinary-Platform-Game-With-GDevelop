/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.loader;

import org.allbinary.data.CamelCaseUtil;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.StringBufferInputStream;
import javax.xml.transform.stream.StreamSource;
import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.gdevelop.json.GDLayout;
import org.allbinary.logic.basic.io.BufferedWriterUtil;
import org.allbinary.logic.basic.io.StreamUtil;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.basic.string.StringMaker;
import org.allbinary.logic.basic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDToAllBinaryMIDletGenerator
{
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final XslHelper xslHelper = XslHelper.getInstance();
    private final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    private final StringMaker stringBuilder = new StringMaker();
    
    private BasicArrayList layoutNameList = new BasicArrayList();
    private BasicArrayList nameList = new BasicArrayList();
    private BasicArrayList classNameList = new BasicArrayList();
    
    public void loadLayout(final GDLayout layout, final int index) throws Exception {
        final String name = this.camelCaseUtil.getAsCamelCase(layout.name, stringBuilder);
        
        //LogUtil.put(LogFactory.getInstance(name, this, "loadLayout"));
        
        stringBuilder.delete(0, stringBuilder.length());
        
        String className;
        if(index == 1) {
            className = stringBuilder.append("GDGame").append(name).append("Canvas").toString();
        } else {
            className = stringBuilder.append("GDGameStart").append(name).append("Canvas").toString();
        }
        
        LogUtil.put(LogFactory.getInstance(className, this, "loadLayout"));
        
        this.layoutNameList.add(layout.name.toUpperCase());
        this.nameList.add(name);
        this.classNameList.add(className);
    }

    public void process() throws Exception {
        
        //final String MIDLET_REPLACED = gdToolStrings.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet_replaced.xsl";
        //final String MIDLET_XML = gdToolStrings.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.xml";
        
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
        final byte[] byteArray = new byte[16384];

        final FileInputStream gameInputStream = new FileInputStream(gdToolStrings.GAME_XML_PATH);
        final String xmlDocumentStr = new String(streamUtil.getByteArray(gameInputStream, outputStream, byteArray));
        
        final InputStream[] inputStreamArray = {
            new FileInputStream(gdToolStrings.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.xsl"),
            new FileInputStream(gdToolStrings.ROOT_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.xsl"),
            new FileInputStream(gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameCommandFactory.xsl"),
            new FileInputStream(gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameThreedLevelBuilderFactory.xsl")
        };

        final String[] outputArray = {
            gdToolStrings.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.java",
            gdToolStrings.ROOT_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.java",
            gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameCommandFactory.java",
            gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameThreedLevelBuilderFactory.java"
        };
        
        final int size2 = inputStreamArray.length;
        for (int index2 = 0; index2 < size2; index2++)
        {
            final InputStream fileInputStream = inputStreamArray[index2];
            outputStream.reset();
            final String xslFileAsString = new String(streamUtil.getByteArray(fileInputStream, outputStream, byteArray));

            final String newFileAsString = xslFileAsString;
            final String updatedXslDocumentStr = newFileAsString;

            LogUtil.put(LogFactory.getInstance(updatedXslDocumentStr, this, CommonStrings.getInstance().CONSTRUCTOR));
            //this.bufferedWriterUtil.overwrite(MIDLET_REPLACED, updatedXslDocumentStr);

            //LogUtil.put(LogFactory.getInstance(xmlDocumentStr, this, CommonStrings.getInstance().CONSTRUCTOR));
            //this.bufferedWriterUtil.overwrite(MIDLET_XML, xmlDocumentStr);
            final String result = this.xslHelper.translate(new BasicUriResolver(),
                    new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                    new StreamSource(new StringBufferInputStream(xmlDocumentStr)));

            LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + outputArray[index2], this, this.commonStrings.CONSTRUCTOR));
            this.bufferedWriterUtil.overwrite(outputArray[index2], result);
        }
    }
    
}

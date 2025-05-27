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
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDToAllBinaryRotationGenerator
{
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final XslHelper xslHelper = XslHelper.getInstance();
    private final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    private final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);
    
    private final StringMaker stringMaker = new StringMaker();
    
    private BasicArrayList layoutNameList = new BasicArrayList();
    private BasicArrayList nameList = new BasicArrayList();
    private BasicArrayList classNameList = new BasicArrayList();
    
    public void loadLayout(final GDLayout layout, final int index, final int size) throws Exception {
        final String name = this.camelCaseUtil.getAsCamelCase(layout.name, stringMaker);
        
        //LogUtil.put(LogFactory.getInstance(name, this, "loadLayout"));
        
        stringMaker.delete(0, stringMaker.length());
        
        String className;
//        if(index == 1) {
            className = stringMaker.append("GDGame").append(name).append("Canvas").toString();
//        } else {
//            className = stringMaker.append("GDGameStart").append(name).append("Canvas").toString();
//        }
        
        LogUtil.put(LogFactory.getInstance(className, this, "loadLayout"));
        
        this.layoutNameList.add(layout.name.toUpperCase());
        this.nameList.add(name);
        this.classNameList.add(className);
    }

    public void process() throws Exception {
        
        timeDelayHelper.setStartTime();
        
        //final String MIDLET_REPLACED = gdToolStrings.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet_replaced.xsl";
        //final String MIDLET_XML = gdToolStrings.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.xml";
        
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();

        final FileInputStream gameInputStream = new FileInputStream(gdToolStrings.GAME_XML_PATH);
        final String xmlDocumentStr = new String(streamUtil.getByteArray(gameInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
        
        final String[] xslPathInputArray = {
            gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\animation\\GDRotationAnimation.xsl",
        };

        final String[] outputArray = {
            gdToolStrings.ROTATION_ANIMATION_FILE_PATH,
        };
        
        final int size2 = xslPathInputArray.length;
        for (int index2 = 0; index2 < size2; index2++)
        {
            LogUtil.put(LogFactory.getInstance(xslPathInputArray[index2], this, commonStrings.PROCESS));
            final InputStream fileInputStream = new FileInputStream(xslPathInputArray[index2]);
            sharedBytes.outputStream.reset();
            final String xslFileAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));

            final String newFileAsString = xslFileAsString;
            final String updatedXslDocumentStr = newFileAsString;

            LogUtil.put(LogFactory.getInstance(updatedXslDocumentStr, this, commonStrings.PROCESS));
            //this.bufferedWriterUtil.overwrite(MIDLET_REPLACED, updatedXslDocumentStr);

            //LogUtil.put(LogFactory.getInstance(xmlDocumentStr, this, commonStrings.PROCESS));
            //this.bufferedWriterUtil.overwrite(MIDLET_XML, xmlDocumentStr);
            final String result = this.xslHelper.translate(new BasicUriResolver(),
                    new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                    new StreamSource(new StringBufferInputStream(xmlDocumentStr)));

            stringMaker.delete(0, stringMaker.length());
            LogUtil.put(LogFactory.getInstance(stringMaker.append(this.gdToolStrings.FILENAME).append(outputArray[index2]).toString(), this, this.commonStrings.PROCESS));
            this.bufferedWriterUtil.overwrite(outputArray[index2], result);
        }
        
        stringMaker.delete(0, stringMaker.length());
        LogUtil.put(LogFactory.getInstance(stringMaker.append(CommonLabels.getInstance().ELAPSED).append(this.timeDelayHelper.getElapsed()).toString(), this, commonStrings.PROCESS));
        
        LogUtil.put(LogFactory.getInstance("Generated hasRotationImages", this, commonStrings.PROCESS));
    }
    
}

/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
* 
* By agreeing to this license you and any business entity you represent are
* legally bound to the AllBinary Open License Version 1 legal agreement.
* 
* You may obtain the AllBinary Open License Version 1 legal agreement from
* AllBinary or the root directory of AllBinary's AllBinary Platform repository.
* 
* Created By: Travis Berthelot
* 
 */
package org.allbinary.gdevelop.loader;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.StringBufferInputStream;
import javax.xml.transform.stream.StreamSource;
import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.gdevelop.json.GDLayout;
import org.allbinary.logic.basic.io.BufferedWriterUtil;
import org.allbinary.logic.basic.io.StreamUtil;
import org.allbinary.logic.basic.string.CommonStrings;
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

    private final String GD_LAYOUT = "<GDLayout";
    private final String GD_LAYOUT_NAME = "<GDLayoutName";
    private final String END = ">";

    private final StringBuilder stringBuilder = new StringBuilder();
    
    private BasicArrayList layoutNameList = new BasicArrayList();
    private BasicArrayList nameList = new BasicArrayList();
    private BasicArrayList classNameList = new BasicArrayList();
    
    public void loadLayout(final GDLayout layout, final int index) {
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
        
        this.layoutNameList.add(layout.name);
        this.nameList.add(name);
        this.classNameList.add(className);
    }

    public void process() throws Exception {
        final String MIDLET_ORIGINAL = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.xsl";
        final String MIDLET_REPLACED = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet_replaced.xsl";
        final String MIDLET_XML = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.xml";
        final String MIDLET = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.java";
        
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
        final byte[] byteArray = new byte[16384];

        final FileInputStream fileInputStream = new FileInputStream(MIDLET_ORIGINAL);        
        final String midletXslFileAsString = new String(streamUtil.getByteArray(fileInputStream, outputStream, byteArray));
        
        String newFileAsString = midletXslFileAsString;

        final int size = this.classNameList.size();
        String indexAsString;
        for(int index = 0; index < size; index++) { 
            indexAsString = Integer.toString(index);
            Replace replace = new Replace(GD_LAYOUT + index + END, (String) this.classNameList.get(index));
            Replace replace2 = new Replace(GD_LAYOUT_NAME + index + END, (String) this.layoutNameList.get(index));
            newFileAsString = replace.all(newFileAsString);
            newFileAsString = replace2.all(newFileAsString);
        }

        final String updatedXslDocumentStr = newFileAsString;

        //LogUtil.put(LogFactory.getInstance(updatedXslDocumentStr, this, CommonStrings.getInstance().CONSTRUCTOR));
        //this.bufferedWriterUtil.overwrite(MIDLET_REPLACED, updatedXslDocumentStr);
        
        final FileInputStream gameInputStream = new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\game.xml");
        
        outputStream.reset();
        final String xmlDocumentStr = new String(streamUtil.getByteArray(gameInputStream, outputStream, byteArray));

        //LogUtil.put(LogFactory.getInstance(xmlDocumentStr, this, CommonStrings.getInstance().CONSTRUCTOR));

        //this.bufferedWriterUtil.overwrite(MIDLET_XML, xmlDocumentStr);
        
        final String result = this.xslHelper.translate(new BasicUriResolver(),
                new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                new StreamSource(new StringBufferInputStream(xmlDocumentStr)));
        
        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + MIDLET, this, this.commonStrings.CONSTRUCTOR));
        this.bufferedWriterUtil.overwrite(MIDLET, result);
    }
    
}

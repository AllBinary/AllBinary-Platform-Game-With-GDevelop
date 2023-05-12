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
public class GDLayoutsToAllBinaryRunnableGenerator
{
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    private final StringMaker stringBuilder = new StringMaker();
        
    private final XslHelper xslHelper = XslHelper.getInstance();

    private final String GD_CURRENT_LAYOUT_INDEX = "<GD_CURRENT_INDEX>";

    public GDLayoutsToAllBinaryRunnableGenerator()
    {
    }

    private BasicArrayList nameList = new BasicArrayList();
    
    
    public void loadLayout(final GDLayout layout, final int index) throws Exception {
        final String name = this.camelCaseUtil.getAsCamelCase(layout.name, stringBuilder);
        stringBuilder.delete(0, stringBuilder.length());
                
        this.nameList.add(name);
    }
    
    public void process()
    {
        try
        {
            final String RESULT = "result: ";

            final StringMaker stringBuilder = new StringMaker();
            
            final StreamUtil streamUtil = StreamUtil.getInstance();
            final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
            final byte[] byteArray = new byte[16384];

            final InputStream inputStream = new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDLayoutRunnable.xsl");
            final String xslDocumentStr = new String(streamUtil.getByteArray(inputStream, outputStream, byteArray));
            
            final FileInputStream gameInputStream = new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\game.xml");
            
            outputStream.reset();
            final String xmlDocumentStr = new String(streamUtil.getByteArray(gameInputStream, outputStream, byteArray));

            //final Replace replace2 = new Replace(".Width()", ".Width(graphics)");
            //xmlDocumentStr = replace2.all(xmlDocumentStr);
            //final Replace replace3 = new Replace(".Height()", ".Height(graphics)");
            //xmlDocumentStr = replace3.all(xmlDocumentStr);

            final String START = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameStart";
            final String END = "CanvasRunnable.java";
            
            final int size = this.nameList.size();
            for (int index = 2; index < size; index++)
            {
                final Replace replace = new Replace(GD_CURRENT_LAYOUT_INDEX, (String) this.nameList.get(index));
                final String updatedXslDocumentStr = replace.all(xslDocumentStr);

                final String result = this.xslHelper.translate(new BasicUriResolver(),
                        new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                        new StreamSource(new StringBufferInputStream(xmlDocumentStr)));

                stringBuilder.delete(0, stringBuilder.length());
                final String fileName = stringBuilder.append(START).append(this.nameList.get(index)).append(END).toString();

                LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + fileName, this, CommonStrings.getInstance().CONSTRUCTOR));

                this.bufferedWriterUtil.overwrite(fileName, result);

                LogUtil.put(LogFactory.getInstance(RESULT + result, this, CommonStrings.getInstance().CONSTRUCTOR));
            }

        } catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().CONSTRUCTOR, e));
        }

    }

//    public static void main(String[] args) throws Exception
//    {
//        new GDLayoutsToAllBinaryRunnableGenerator().process(3);
//    }

}


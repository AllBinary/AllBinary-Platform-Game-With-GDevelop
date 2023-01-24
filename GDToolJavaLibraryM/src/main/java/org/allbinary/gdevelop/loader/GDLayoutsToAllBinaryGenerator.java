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
import java.io.InputStream;
import java.io.StringBufferInputStream;
import javax.xml.transform.stream.StreamSource;
import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.logic.basic.io.BufferedWriterUtil;
import org.allbinary.logic.basic.io.StreamUtil;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.basic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDLayoutsToAllBinaryGenerator
{
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final XslHelper xslHelper = XslHelper.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    private final String GD_CURRENT_LAYOUT_INDEX = "<GD_CURRENT_INDEX>";

    public GDLayoutsToAllBinaryGenerator()
    {
    }

    public void process(int size)
    {
        try
        {
            final String RESULT = "result: ";

            final StringBuilder stringBuilder = new StringBuilder();
            
            final StreamUtil streamUtil = StreamUtil.getInstance();
            final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
            final byte[] byteArray = new byte[16384];
            
            final InputStream inputStream = new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayout.xsl");
            final InputStream inputStream3 = new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutAsXml.xsl");
            final String xslDocumentStr = new String(streamUtil.getByteArray(inputStream, outputStream, byteArray));
            outputStream.reset();
            final String xslDocumentStr3 = new String(streamUtil.getByteArray(inputStream3, outputStream, byteArray));
            final FileInputStream gameInputStream = new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\game.xml");
            outputStream.reset();
            String xmlDocumentStr = new String(streamUtil.getByteArray(gameInputStream, outputStream, byteArray));
            final Replace replace2 = new Replace(".Width()", ".Width(graphics)");
            xmlDocumentStr = replace2.all(xmlDocumentStr);
            final Replace replace3 = new Replace(".Height()", ".Height(graphics)");
            xmlDocumentStr = replace3.all(xmlDocumentStr);

            final String START = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD";
            final String END = "SpecialAnimation.java";
            final String END2 = "SpecialAnimation.xml";
            
            String indexAsString;
            for (int index = 0; index < size; index++)
            {
                indexAsString = Integer.toString(index);
                final Replace replace = new Replace(GD_CURRENT_LAYOUT_INDEX, indexAsString);
                final String updatedXslDocumentStr = replace.all(xslDocumentStr);
                final String updatedXslDocumentStr3 = replace.all(xslDocumentStr3);

                final String result = this.xslHelper.translate(new BasicUriResolver(),
                        new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                        new StreamSource(new StringBufferInputStream(xmlDocumentStr)));

                final String result2 = this.xslHelper.translate(new BasicUriResolver(),
                        new StreamSource(new StringBufferInputStream(updatedXslDocumentStr3)),
                        new StreamSource(new StringBufferInputStream(xmlDocumentStr)));
                        
                stringBuilder.delete(0, stringBuilder.length());
                final String fileName = stringBuilder.append(START).append(indexAsString).append(END).toString();
                stringBuilder.delete(0, stringBuilder.length());
                final String fileName2 = stringBuilder.append(START).append(indexAsString).append(END2).toString();
                
                LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + fileName, this, CommonStrings.getInstance().CONSTRUCTOR));

                this.bufferedWriterUtil.overwrite(fileName, result);
                this.bufferedWriterUtil.overwrite(fileName2, result2);

                //LogUtil.put(LogFactory.getInstance(RESULT + result, this, CommonStrings.getInstance().CONSTRUCTOR));
            }

            final InputStream inputStream2 = new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl");
            outputStream.reset();
            final String xslDocumentStr2 = new String(streamUtil.getByteArray(inputStream2, outputStream, byteArray));
            final String FILE = "G:\\mnt\\bc\\mydev\\GDGamesP\\resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java";
            for (int index = 1; index < size - 1; index++)
            {
                indexAsString = Integer.toString(index);
                final Replace replace = new Replace(GD_CURRENT_LAYOUT_INDEX, indexAsString);
                final String updatedXslDocumentStr = replace.all(xslDocumentStr2);

                final String result = this.xslHelper.translate(new BasicUriResolver(),
                        new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                        new StreamSource(new StringBufferInputStream(xmlDocumentStr)));

                stringBuilder.delete(0, stringBuilder.length());
                LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + FILE, this, CommonStrings.getInstance().CONSTRUCTOR));
                
                this.bufferedWriterUtil.overwrite(FILE, result);

                LogUtil.put(LogFactory.getInstance(RESULT + result, this, CommonStrings.getInstance().CONSTRUCTOR));
            }

        } catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().CONSTRUCTOR, e));
        }

    }

    public static void main(String[] args) throws Exception
    {
        new GDLayoutsToAllBinaryGenerator().process(3);
    }

}

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

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.StringBufferInputStream;
import javax.xml.transform.stream.StreamSource;
import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.logic.basic.io.BufferedWriterUtil;
import org.allbinary.logic.basic.io.StreamUtil;
import org.allbinary.logic.basic.io.file.AbFile;
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

    private final XslHelper xslHelper = XslHelper.getInstance();

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

            final InputStream inputStream = new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\canvas\\GDTitleSpecialAnimation.xsl");
            final String xslDocumentStr = streamUtil.getAsString(inputStream);
            final FileInputStream gameInputStream = new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\game.xml");
            String xmlDocumentStr = streamUtil.getAsString(gameInputStream);;
            final Replace replace2 = new Replace(".Width()", ".Width(graphics)");
            xmlDocumentStr = replace2.all(xmlDocumentStr);

            final String START = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\canvas\\GD";
            final String END = "SpecialAnimation.java";
            
            String indexAsString;
            for (int index = 0; index < size; index++)
            {
                indexAsString = Integer.toString(index);
                final Replace replace = new Replace(GD_CURRENT_LAYOUT_INDEX, indexAsString);
                final String updatedXslDocumentStr = replace.all(xslDocumentStr);

                final String result = this.xslHelper.translate(new BasicUriResolver(),
                        new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                        new StreamSource(new StringBufferInputStream(xmlDocumentStr)));

                stringBuilder.delete(0, stringBuilder.length());
                final AbFile abFile = new AbFile(stringBuilder.append(START).append(indexAsString).append(END).toString());
                if (abFile.exists())
                {
                    abFile.delete();
                }
                BufferedWriterUtil.write(abFile, result);

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

/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
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
            
            final FileInputStream gameInputStream = new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\game.xml");
            String gameXmlAsString = new String(streamUtil.getByteArray(gameInputStream, outputStream, byteArray));
            //final Replace replace2 = new Replace(".Width()", ".Width(globals.graphics)");
            final Replace replace2 = new Replace(".Width()", ".Width(null)");
            gameXmlAsString = replace2.all(gameXmlAsString);
            //final Replace replace3 = new Replace(".Height()", ".Height(globals.graphics)");
            final Replace replace3 = new Replace(".Height()", ".Height(null)");
            gameXmlAsString = replace3.all(gameXmlAsString);
            final Replace replace4 = new Replace("GlobalVariable(", "GlobalVariable(globals.");
            gameXmlAsString = replace4.all(gameXmlAsString);
            
            String layoutGameXmlAsString = new String(gameXmlAsString);
            final String VARIABLE = "Variable(";
            final String GLOBALS = "globals.";
            for(int index = 0; index >= 0;) {
                index = layoutGameXmlAsString.indexOf(VARIABLE, index + VARIABLE.length());
                    //skip digits
                if(Character.isDigit(layoutGameXmlAsString.charAt(index + VARIABLE.length()))) {
                    //skip graphics
                } else if(layoutGameXmlAsString.charAt(index + VARIABLE.length()) == 'g') {
                    //skip angle
                } else if(layoutGameXmlAsString.charAt(index + VARIABLE.length()) == 'a') {
                    //skip movement_angle
                } else if(layoutGameXmlAsString.charAt(index + VARIABLE.length()) == 'm' && layoutGameXmlAsString.charAt(index + VARIABLE.length() + 1) == 'o') {
                } else {
                    stringBuilder.delete(0, stringBuilder.length());
                    layoutGameXmlAsString = stringBuilder.append(layoutGameXmlAsString.substring(0, index + VARIABLE.length())).append(GLOBALS).append(layoutGameXmlAsString.substring(index + VARIABLE.length())).toString();
                }
            }

            final Replace replace5 = new Replace("PointX(&quot;", "PointX(&quot;globals.");
            layoutGameXmlAsString = replace5.all(layoutGameXmlAsString);

            final Replace replace6 = new Replace("PointY(&quot;", "PointY(&quot;globals.");
            layoutGameXmlAsString = replace6.all(layoutGameXmlAsString);

            final String[] xmlStringArray = {
                layoutGameXmlAsString,
                layoutGameXmlAsString,
                layoutGameXmlAsString,
                
                layoutGameXmlAsString,
                layoutGameXmlAsString,
                layoutGameXmlAsString,
                layoutGameXmlAsString,
                layoutGameXmlAsString,
                layoutGameXmlAsString,
                layoutGameXmlAsString,
                layoutGameXmlAsString,
                
                layoutGameXmlAsString,
                
                gameXmlAsString,
                gameXmlAsString,
            };

            final InputStream[] inputStreamArray = 
            {
                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutAsXml.xsl"),
                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayout.xsl"),
                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutBuilder.xsl"),

                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalActionGDNodes.xsl"),
                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalConditionGDNodes.xsl"),
                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalObjectEventGDNodes.xsl"),
                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalOtherEventGDNodes.xsl"),

                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutActionGDNodes.xsl"),
                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutConditionGDNodes.xsl"),
                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutObjectEventGDNodes.xsl"),
                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutOtherEventGDNodes.xsl"),

                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutGDResources.xsl"),
                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutGlobals.xsl"),
                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutGDObjects.xsl")
            };

            final int xslTotal = inputStreamArray.length;
            final String[] xslDocumentAsString = new String[xslTotal];            
            for(int index = 0; index < xslTotal; index++) {
                outputStream.reset();
                xslDocumentAsString[index] = new String(streamUtil.getByteArray(inputStreamArray[index], outputStream, byteArray));
            }

            final String START_WITH_PATH = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD";
            final String[] END = {
                "SpecialAnimation.xml",
                "SpecialAnimation.java",
                "SpecialAnimationBuilder.java",

                "SpecialAnimationExternalActionGDNodes.java",
                "SpecialAnimationExternalConditionGDNodes.java",
                "SpecialAnimationExternalObjectEventGDNodes.java",
                "SpecialAnimationExternalOtherEventGDNodes.java",

                "SpecialAnimationActionGDNodes.java",
                "SpecialAnimationConditionGDNodes.java",
                "SpecialAnimationObjectEventGDNodes.java",
                "SpecialAnimationOtherEventGDNodes.java",

                "SpecialAnimationGDResources.java",
                "SpecialAnimationGlobals.java",
                "GDObjectsFactory.java"
            };
            
            String indexAsString;
            for (int index = 0; index < size; index++)
            {
                indexAsString = Integer.toString(index);
                final Replace replace = new Replace(GD_CURRENT_LAYOUT_INDEX, indexAsString);
                
                for(int index2 = 0; index2 < xslTotal; index2++) {

                    //LogUtil.put(LogFactory.getInstance("xsl index: " + index2, this, CommonStrings.getInstance().CONSTRUCTOR));
                    
                    final String updatedXslDocumentAsString = replace.all(xslDocumentAsString[index2]);

                    final String result = this.xslHelper.translate(new BasicUriResolver(),
                            new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
                            new StreamSource(new StringBufferInputStream(xmlStringArray[index2])));

                    stringBuilder.delete(0, stringBuilder.length());
                    final String fileName = stringBuilder.append(START_WITH_PATH).append(indexAsString).append(END[index2]).toString();

                    LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + fileName, this, CommonStrings.getInstance().CONSTRUCTOR));

                    this.bufferedWriterUtil.overwrite(fileName, result);
                    
                    //LogUtil.put(LogFactory.getInstance(RESULT + result, this, CommonStrings.getInstance().CONSTRUCTOR));
                }

            }

            final InputStream[] inputStreamArray2 = 
            {
                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"),
                new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl")
            };

            final String[] OUTPUT_FILE_PATHS = {
                "G:\\mnt\\bc\\mydev\\GDGamesP\\resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
                "G:\\mnt\\bc\\mydev\\GDGamesP\\resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java"
            };

            final int xslTotal2 = OUTPUT_FILE_PATHS.length;
            final String[] xslDocumentAsString2 = new String[xslTotal2];
            for(int index = 0; index < xslTotal2; index++) {
                outputStream.reset();
                xslDocumentAsString2[index] = new String(streamUtil.getByteArray(inputStreamArray2[index], outputStream, byteArray));
            }

            //TWB - need to update to allow loading for every layout.
            for (int index = size - 1; index < size; index++)
            {
                indexAsString = Integer.toString(index);
                final Replace replace = new Replace(GD_CURRENT_LAYOUT_INDEX, indexAsString);
                
                for(int index2 = 0; index2 < xslTotal2; index2++) {
                    
                    //LogUtil.put(LogFactory.getInstance("xsl2 index: " + index2, this, CommonStrings.getInstance().CONSTRUCTOR));
                    
                    final String updatedXslDocumentStr = replace.all(xslDocumentAsString2[index2]);

                    final String result = this.xslHelper.translate(new BasicUriResolver(),
                            new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                            new StreamSource(new StringBufferInputStream(gameXmlAsString)));

                    stringBuilder.delete(0, stringBuilder.length());
                    LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + OUTPUT_FILE_PATHS[index2], this, CommonStrings.getInstance().CONSTRUCTOR));

                    this.bufferedWriterUtil.overwrite(OUTPUT_FILE_PATHS[index2], result);
                    
                    //LogUtil.put(LogFactory.getInstance(RESULT + result, this, CommonStrings.getInstance().CONSTRUCTOR));
                }
            }

        } catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance("Is the game xml formatted when it is not we get an error from: gglobals.dVersion", this, CommonStrings.getInstance().CONSTRUCTOR, e));
        }

    }

    public static void main(String[] args) throws Exception
    {
        new GDLayoutsToAllBinaryGenerator().process(3);
    }

}

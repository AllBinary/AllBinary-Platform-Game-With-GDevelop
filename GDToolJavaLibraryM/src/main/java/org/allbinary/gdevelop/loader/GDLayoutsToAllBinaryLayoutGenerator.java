/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.loader;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.StringBufferInputStream;
import javax.xml.transform.stream.StreamSource;
import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.CommonLabels;
import org.allbinary.logic.string.CommonSeps;
import org.allbinary.logic.string.tokens.Tokenizer;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDLayoutsToAllBinaryLayoutGenerator
{
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();

    private final StreamUtil streamUtil = StreamUtil.getInstance();
    
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final XslHelper xslHelper = XslHelper.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    private final SharedBytes sharedBytes = SharedBytes.getInstance();
    private final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);
    
    private final String GD_CURRENT_LAYOUT_INDEX = "<GD_CURRENT_INDEX>";
    private final String GAME_START = "<game>";
    private final String GAME_END = "</game>";

    private final String RESULT = "result: ";
    
    private final String GENERATED_START_WITH_ROOT_PATH = gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas";
    private final String GENERATED_START_WITH_PATH = GENERATED_START_WITH_ROOT_PATH + "\\GD";
    private final String GDNODE_START_WITH_PATH = GENERATED_START_WITH_ROOT_PATH + "\\node\\GD";

    public GDLayoutsToAllBinaryLayoutGenerator()
    {
    }

    private void generateXMLAndGlobals(final String gameXmlAsString, final StringMaker stringMaker) throws Exception {
        
        final String[] xmlStringArray0 = {
            gameXmlAsString,
            gameXmlAsString,
            gameXmlAsString,
            gameXmlAsString,
            gameXmlAsString,};

        final String[] xslPathInputArray0
            = {
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDNonLayoutAsXml.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalsAnimation.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobals.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalsGDObjectsFactory.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalsGDResources.xsl",};

        final String[] START0 = {
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,};

        final String[] END0 = {
            "NonLayout.xml",
            "GlobalsSpecialAnimation.java",
            "GameGlobals.java",
            "GlobalsGDObjectsFactory.java",
            "GlobalsGDResources.java",};

        final int xslTotal0 = xslPathInputArray0.length;
        final String[] xslDocumentAsString0 = new String[xslTotal0];
        for (int index = 0; index < xslTotal0; index++) {
            sharedBytes.outputStream.reset();
            LogUtil.put(LogFactory.getInstance(xslPathInputArray0[index], this, commonStrings.PROCESS));
            xslDocumentAsString0[index] = new String(streamUtil.getByteArray(new FileInputStream(xslPathInputArray0[index]), sharedBytes.outputStream, sharedBytes.byteArray));
        }

        for (int index2 = 0; index2 < xslTotal0; index2++) {

            timeDelayHelper.setStartTime();

            //LogUtil.put(LogFactory.getInstance("xsl index: " + index2, this, commonStrings.PROCESS));
            stringMaker.delete(0, stringMaker.length());
            LogUtil.put(LogFactory.getInstance(stringMaker.append(this.gdToolStrings.FILENAME).append(xslPathInputArray0[index2]).toString(), this, commonStrings.PROCESS));

            final String updatedXslDocumentAsString = xslDocumentAsString0[index2];

            final String result = this.xslHelper.translate(new BasicUriResolver(),
                new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
                new StreamSource(new StringBufferInputStream(xmlStringArray0[index2])));

            stringMaker.delete(0, stringMaker.length());
            String fileName = fileName = stringMaker.append(START0[index2]).append(END0[index2]).toString();

            //LogUtil.put(LogFactory.getInstance(RESULT + result, this, commonStrings.PROCESS));
            stringMaker.delete(0, stringMaker.length());
            LogUtil.put(LogFactory.getInstance(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, commonStrings.PROCESS));

            if (index2 == 0) {
                LogUtil.put(LogFactory.getInstance(RESULT + result, this, commonStrings.PROCESS));
                stringMaker.delete(0, stringMaker.length());
                final String formattedXml = XmlDocumentHelper.getInstance().format(stringMaker.append(GAME_START).append(result).append(GAME_END).toString());
                this.bufferedWriterUtil.overwrite(fileName, formattedXml);
            } else {
                this.bufferedWriterUtil.overwrite(fileName, result);
            }

            stringMaker.delete(0, stringMaker.length());
            LogUtil.put(LogFactory.getInstance(stringMaker.append(index2).append(CommonLabels.getInstance().ELAPSED).append(this.timeDelayHelper.getElapsed()).toString(), this, commonStrings.PROCESS));
        }
    }

    public void generateLayouts(final int startIndex, final int size, final String gameXmlAsString, final String layoutGameXmlAsString, final StringMaker stringMaker) 
    throws Exception {
            
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
            layoutGameXmlAsString,
            gameXmlAsString,
            layoutGameXmlAsString,
            gameXmlAsString,
        };

        final String[] xslPathInputArray
            = {
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutAsXml.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayout.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutBuilder.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalEventGDNodes.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalActionGDNodes.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalConditionGDNodes.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalObjectEventGDNodes.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalOtherEventGDNodes.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutActionGDNodes.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutConditionGDNodes.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutObjectEventGDNodes.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutOtherEventGDNodes.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutGDResources.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutSceneAsSpecialAnimationGlobals.xsl",
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutGDObjectsFactory.xsl",
                gdToolStrings.ROOT_PATH + "platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\gd\\res\\GDGamePlaynResources.xsl",};

        final int xslTotal = xslPathInputArray.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        for (int index = 0; index < xslTotal; index++) {
            sharedBytes.outputStream.reset();
            LogUtil.put(LogFactory.getInstance(xslPathInputArray[index], this, commonStrings.PROCESS));
            xslDocumentAsString[index] = new String(streamUtil.getByteArray(new FileInputStream(xslPathInputArray[index]), sharedBytes.outputStream, sharedBytes.byteArray));
        }

        final String[] START = {
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            gdToolStrings.ROOT_PATH + "platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\gd\\res\\GD",};

        final String[] END = {
            "SpecialAnimation.xml",
            "SpecialAnimation.java",
            "SpecialAnimationBuilder.java",
            "SpecialAnimationExternalEventGDNodes.java",
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
            "GDObjectsFactory.java",
            "GamePlaynResources.java",};

        String indexAsString;
        for (int index = startIndex; index < size; index++) {
            //stringMaker.delete(0, stringMaker.length());
            //LogUtil.put(LogFactory.getInstance(stringMaker.append("layout:").append(index).toString(), this, commonStrings.PROCESS));

            indexAsString = Integer.toString(index);
            final Replace replace = new Replace(GD_CURRENT_LAYOUT_INDEX, indexAsString);

            for (int index2 = 0; index2 < xslTotal; index2++) {

                //stringMaker.delete(0, stringMaker.length());
                //LogUtil.put(LogFactory.getInstance(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS));
                timeDelayHelper.setStartTime();

                //LogUtil.put(LogFactory.getInstance("xsl index: " + index2, this, commonStrings.PROCESS));
                stringMaker.delete(0, stringMaker.length());
                LogUtil.put(LogFactory.getInstance(stringMaker.append(this.gdToolStrings.FILENAME).append(xslPathInputArray[index2]).toString(), this, commonStrings.PROCESS));

                final String updatedXslDocumentAsString = replace.all(xslDocumentAsString[index2]);

                final String result = this.xslHelper.translate(new BasicUriResolver(),
                    new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
                    new StreamSource(new StringBufferInputStream(xmlStringArray[index2])));

                stringMaker.delete(0, stringMaker.length());
                String fileName = stringMaker.append(START[index2]).append(indexAsString).append(END[index2]).toString();

                //LogUtil.put(LogFactory.getInstance(RESULT + result, this, commonStrings.PROCESS));
                stringMaker.delete(0, stringMaker.length());
                LogUtil.put(LogFactory.getInstance(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, commonStrings.PROCESS));

                if (index2 == 0) {
                    stringMaker.delete(0, stringMaker.length());
                    LogUtil.put(LogFactory.getInstance(stringMaker.append(RESULT).append(result).toString(), this, commonStrings.PROCESS));
                    stringMaker.delete(0, stringMaker.length());
                    final String formattedXml = XmlDocumentHelper.getInstance().format(stringMaker.append(GAME_START).append(result).append(GAME_END).toString());
                    this.bufferedWriterUtil.overwrite(fileName, formattedXml);
                } else {
                    this.bufferedWriterUtil.overwrite(fileName, result);
                }

                stringMaker.delete(0, stringMaker.length());
                LogUtil.put(LogFactory.getInstance(stringMaker.append(index).append(this.commonSeps.COMMA).append(index2).append(CommonLabels.getInstance().ELAPSED).append(this.timeDelayHelper.getElapsed()).toString(), this, commonStrings.PROCESS));
            }

        }
        
        stringMaker.delete(0, stringMaker.length());
        LogUtil.put(LogFactory.getInstance(stringMaker.append(CommonLabels.getInstance().ELAPSED).append("Finished").toString(), this, commonStrings.PROCESS));
        
    }

    private String getGDNodeList(final String gameXmlAsString) 
    throws Exception {
        
        final String[] xmlStringArray = {
            gameXmlAsString,
        };
        
        final String[] gdNodeXSLPathInputArray = 
        {
            gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDOtherEventGDNodeIdList.xsl"
        };
        
        final int xslTotal = gdNodeXSLPathInputArray.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        for (int index = 0; index < xslTotal; index++) {
            sharedBytes.outputStream.reset();
            LogUtil.put(LogFactory.getInstance(gdNodeXSLPathInputArray[index], this, commonStrings.PROCESS));
            xslDocumentAsString[index] = new String(streamUtil.getByteArray(new FileInputStream(gdNodeXSLPathInputArray[index]), sharedBytes.outputStream, sharedBytes.byteArray));
        }

        final String result = this.xslHelper.translate(new BasicUriResolver(),
            new StreamSource(new StringBufferInputStream(xslDocumentAsString[0])),
            new StreamSource(new StringBufferInputStream(xmlStringArray[0])));

        return result;
                
    }
    
    private void generateGDNodes(final String gameXmlAsString, final StringMaker stringMaker) 
    throws Exception {

        final String nodeListAsString = this.getGDNodeList(gameXmlAsString);

        final String PACKAGE = "package org.allbinary.game.canvas.node;";
        
        final String[] xmlStringArray = {
            gameXmlAsString,
        };
        
        final String[] gdNodeXSLPathInputArray = 
        {
            gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDOtherEventGDNodes.xsl"
        };

        final String[] END = {
            "GDNode.java",
        };
        
        final int xslTotal = gdNodeXSLPathInputArray.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        for (int index = 0; index < xslTotal; index++) {
            sharedBytes.outputStream.reset();
            LogUtil.put(LogFactory.getInstance(gdNodeXSLPathInputArray[index], this, commonStrings.PROCESS));
            xslDocumentAsString[index] = new String(streamUtil.getByteArray(new FileInputStream(gdNodeXSLPathInputArray[index]), sharedBytes.outputStream, sharedBytes.byteArray));
        }

        final String[] START = {
            GDNODE_START_WITH_PATH,
        };

        final Tokenizer tokenizer = new Tokenizer(commonSeps.SPACE);
        final BasicArrayList list = tokenizer.getTokens(nodeListAsString, new BasicArrayList());
        
        final int size = list.size();
        String indexAsString;
        for (int index = 0; index < size; index++) {

            indexAsString = (String) list.get(index);            
            final Replace replace = new Replace(GD_CURRENT_LAYOUT_INDEX, indexAsString);
            
//            stringMaker.delete(0, stringMaker.length());
//            LogUtil.put(LogFactory.getInstance(stringMaker.append("indexAsString:").append(indexAsString).toString(), this, commonStrings.PROCESS));
            
            for (int index2 = 0; index2 < xslTotal; index2++) {

                //stringMaker.delete(0, stringMaker.length());
                //LogUtil.put(LogFactory.getInstance(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS));
                timeDelayHelper.setStartTime();

                //LogUtil.put(LogFactory.getInstance("xsl index: " + index2, this, commonStrings.PROCESS));

                final String updatedXslDocumentAsString = replace.all(xslDocumentAsString[index2]);

                final String result = this.xslHelper.translate(new BasicUriResolver(),
                    new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
                    new StreamSource(new StringBufferInputStream(xmlStringArray[index2])));

                stringMaker.delete(0, stringMaker.length());
                String fileName = stringMaker.append(START[index2]).append(indexAsString).append(END[index2]).toString();

                if(result.indexOf(PACKAGE) < 0) {
                    stringMaker.delete(0, stringMaker.length());
                    LogUtil.put(LogFactory.getInstance(stringMaker.append("No GDNode: ").append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, commonStrings.PROCESS));
                    continue;
                }

                stringMaker.delete(0, stringMaker.length());
                LogUtil.put(LogFactory.getInstance(stringMaker.append(this.gdToolStrings.FILENAME).append(gdNodeXSLPathInputArray[index2]).toString(), this, commonStrings.PROCESS));
               
                //LogUtil.put(LogFactory.getInstance(RESULT + result, this, commonStrings.PROCESS));
                stringMaker.delete(0, stringMaker.length());
                LogUtil.put(LogFactory.getInstance(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, commonStrings.PROCESS));

                this.bufferedWriterUtil.overwrite(fileName, result);

                stringMaker.delete(0, stringMaker.length());
                LogUtil.put(LogFactory.getInstance(stringMaker.append(index).append(this.commonSeps.COMMA).append(index2).append(CommonLabels.getInstance().ELAPSED).append(this.timeDelayHelper.getElapsed()).toString(), this, commonStrings.PROCESS));
            }

        }
        
        stringMaker.delete(0, stringMaker.length());
        LogUtil.put(LogFactory.getInstance(stringMaker.append(CommonLabels.getInstance().ELAPSED).append("Finished").toString(), this, commonStrings.PROCESS));
        
    }
    
    private void generateResourcesLoadersSetup(final int startIndex, final int size, final String gameXmlAsString, final StringMaker stringMaker)
    throws Exception {

        final String[] xslPathInputArray2 = {
                gdToolStrings.ROOT_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalResources.xsl",
                gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalResources.xsl",
                gdToolStrings.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalImageResources.xsl",
                gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalImageResources.xsl",
                gdToolStrings.ROOT_PATH + "GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GameMusicFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GameSoundsFactory.xsl",
                gdToolStrings.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutResources.xsl",
                gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutResources.xsl",
                gdToolStrings.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutImageResources.xsl",
                gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutImageResources.xsl",
                gdToolStrings.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutTouchImageResources.xsl",
                gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutTouchImageResources.xsl",
                gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameThreedLevelLoader.xsl",
                gdToolStrings.ROOT_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\graphics\\threed\\min3d\\GDGameCameraSetup.xsl",
        };

        final String[] OUTPUT_FILE_PATHS = {
            gdToolStrings.ROOT_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            gdToolStrings.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            gdToolStrings.ROOT_PATH + "GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GD",
            gdToolStrings.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            gdToolStrings.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            gdToolStrings.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            gdToolStrings.ROOT_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\graphics\\threed\\min3d\\GD",
        };

        final String[] OUTPUT_FILE_PATH_END_ARRAY = {
            "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GlobalSpecialAnimationResources.java",
            "GlobalSpecialAnimationResources.java",
            "GlobalSpecialAnimationImageResources.java",
            "GlobalSpecialAnimationImageResources.java",
            "GameMusicFactory.java",
            "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameSoundsFactory.java",
            "SpecialAnimationResources.java",
            "SpecialAnimationResources.java",
            "SpecialAnimationImageResources.java",
            "SpecialAnimationImageResources.java",
            "SpecialAnimationTouchImageResources.java",
            "SpecialAnimationTouchImageResources.java",
            "GameThreedLevelBuilder.java",
            "GameCameraSetup.java"
        };

        final int xslTotal2 = OUTPUT_FILE_PATHS.length;
        final String[] xslDocumentAsString2 = new String[xslTotal2];
        for (int index = 0; index < xslTotal2; index++) {
            sharedBytes.outputStream.reset();
            LogUtil.put(LogFactory.getInstance(xslPathInputArray2[index], this, commonStrings.PROCESS));
            xslDocumentAsString2[index] = new String(streamUtil.getByteArray(new FileInputStream(xslPathInputArray2[index]), sharedBytes.outputStream, sharedBytes.byteArray));
        }

        //TWB - need to update to allow loading for every layout.
        String indexAsString;
        for (int index = startIndex; index < size; index++) {
            timeDelayHelper.setStartTime();

            indexAsString = Integer.toString(index);
            final Replace replace = new Replace(GD_CURRENT_LAYOUT_INDEX, indexAsString);

            for (int index2 = 0; index2 < xslTotal2; index2++) {

                //LogUtil.put(LogFactory.getInstance("xsl2 index: " + index2, this, commonStrings.PROCESS));
                final String updatedXslDocumentStr = replace.all(xslDocumentAsString2[index2]);

                final String result = this.xslHelper.translate(new BasicUriResolver(),
                    new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                    new StreamSource(new StringBufferInputStream(gameXmlAsString)));

                stringMaker.delete(0, stringMaker.length());
                String outputFilePath = stringMaker.append(OUTPUT_FILE_PATHS[index2]).append(index).append(OUTPUT_FILE_PATH_END_ARRAY[index2]).toString();
                if (index2 < 12) {
                    stringMaker.delete(0, stringMaker.length());
                    outputFilePath = stringMaker.append(OUTPUT_FILE_PATHS[index2]).append(OUTPUT_FILE_PATH_END_ARRAY[index2]).toString();
                }

                stringMaker.delete(0, stringMaker.length());
                LogUtil.put(LogFactory.getInstance(stringMaker.append(this.gdToolStrings.FILENAME).append(outputFilePath).toString(), this, commonStrings.PROCESS));

                this.bufferedWriterUtil.overwrite(outputFilePath, result);

                //LogUtil.put(LogFactory.getInstance(RESULT + result, this, commonStrings.PROCESS));
                stringMaker.delete(0, stringMaker.length());
                LogUtil.put(LogFactory.getInstance(stringMaker.append(index).append(this.commonSeps.COMMA).append(index2).append(CommonLabels.getInstance().ELAPSED).append(this.timeDelayHelper.getElapsed()).toString(), this, commonStrings.PROCESS));
            }
        }
    }
    
    public void process(final int startIndex, final int size)
    {
        try
        {
            final StringMaker stringMaker = new StringMaker();

            sharedBytes.outputStream.reset();
            
            final FileInputStream gameInputStream = new FileInputStream(gdToolStrings.GAME_XML_PATH);
            String gameXmlAsString = new String(streamUtil.getByteArray(gameInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
            //final Replace replace2 = new Replace(".Width()", ".Width(globals.graphics)");
            final Replace replace2 = new Replace(".Width()", ".Width(null)");
            gameXmlAsString = replace2.all(gameXmlAsString);
            //final Replace replace3 = new Replace(".Height()", ".Height(globals.graphics)");
            final Replace replace3 = new Replace(".Height()", ".Height(null)");
            gameXmlAsString = replace3.all(gameXmlAsString);
            final Replace replace4 = new Replace("GlobalVariable(", "GlobalVariable(gameGlobals.");
            gameXmlAsString = replace4.all(gameXmlAsString);
            final Replace replace5 = new Replace("GlobalVariableString(", "GlobalVariableString(gameGlobals.");
            gameXmlAsString = replace5.all(gameXmlAsString);
            final Replace replace6 = new Replace("GlobalVariableChildCount(", "GlobalVariableChildCount(gameGlobals.");
            gameXmlAsString = replace6.all(gameXmlAsString);
            final Replace replace9 = new Replace("Time(&quot;timestamp&quot;)", "gameTickTimeDelayHelper.startTime");
            gameXmlAsString = replace9.all(gameXmlAsString);
            final Replace replace10 = new Replace("GlobalVarToJSON(", "GlobalVarToJSON(gameGlobals.");
            gameXmlAsString = replace10.all(gameXmlAsString);
            
            
            String layoutGameXmlAsString = new String(gameXmlAsString);
            final String[] VARIABLE_ARRAY = {
                "Variable(",
                "VariableString(",
                "VariableChildCount("
            };
            final String GLOBALS = "globals.";
            final int size2 = VARIABLE_ARRAY.length;
            for(int index2 = 0; index2 < size2; index2++) {
                final String VARIABLE = VARIABLE_ARRAY[index2];
            for(int index = 0; index >= 0;) {
                index = layoutGameXmlAsString.indexOf(VARIABLE, index + VARIABLE.length());
                    //skip digits
                if(Character.isDigit(layoutGameXmlAsString.charAt(index + VARIABLE.length()))) {
                    //skip GObject
                } else if(index >= 1 && layoutGameXmlAsString.charAt(index - 1) == '.') {
                    //skip graphics
                } else if(layoutGameXmlAsString.charAt(index + VARIABLE.length()) == 'g') {
                   //skip max_scale
                //} else if(layoutGameXmlAsString.charAt(index + VARIABLE.length()) == 'm' && layoutGameXmlAsString.charAt(index + VARIABLE.length() + 1) == 'a') {
                    //skip angle
                //} else if(layoutGameXmlAsString.charAt(index + VARIABLE.length()) == 'a') {
                    //skip movement_angle
                //} else if(layoutGameXmlAsString.charAt(index + VARIABLE.length()) == 'm' && layoutGameXmlAsString.charAt(index + VARIABLE.length() + 1) == 'o') {
                    //opacity
                //} else if(layoutGameXmlAsString.charAt(index + VARIABLE.length()) == 'o') {
                } else {
                    stringMaker.delete(0, stringMaker.length());
                    layoutGameXmlAsString = stringMaker.append(layoutGameXmlAsString.substring(0, index + VARIABLE.length())).append(GLOBALS).append(layoutGameXmlAsString.substring(index + VARIABLE.length())).toString();
                }
            }
            }

            final Replace replace7 = new Replace("PointX(&quot;", "PointX(&quot;globals.");
            layoutGameXmlAsString = replace7.all(layoutGameXmlAsString);

            final Replace replace8 = new Replace("PointY(&quot;", "PointY(&quot;globals.");
            layoutGameXmlAsString = replace8.all(layoutGameXmlAsString);

            final String gameXmlAsString2 = gameXmlAsString;
            final String layoutGameXmlAsString2 = layoutGameXmlAsString;
            
//            final Runnable runnable = new Runnable() {
//                public void run() {
//                    try {
                        generateXMLAndGlobals(gameXmlAsString2, new StringMaker());
//                    } catch(Exception e) {
//                        LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.RUN, e));
//                    }
//                }
//            };
            
//            final Runnable runnable2 = new Runnable() {
//                public void run() {
//                    try {
                        generateLayouts(startIndex, size, gameXmlAsString2, layoutGameXmlAsString2, new StringMaker());
//                    } catch(Exception e) {
//                        LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.RUN, e));
//                    }
//                }
//            };
                        
//            final Runnable runnable3 = new Runnable() {
//                public void run() {
//                    try {
                        generateGDNodes(gameXmlAsString2, new StringMaker());
//                    } catch(Exception e) {
//                        LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.RUN, e));
//                    }
//                }
//            };

//            final Runnable runnable4 = new Runnable() {
//                public void run() {
//                    try {
                        generateResourcesLoadersSetup(startIndex, size, gameXmlAsString2, new StringMaker());
//                    } catch(Exception e) {
//                        LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.RUN, e));            runnable.run();
//            runnable2.run();
//            runnable3.run();
//            runnable4.run();

//                    }
//                }
//            };
            
////            new Thread(runnable).start();
//            new Thread(runnable2).start();
//            new Thread(runnable3).start();
//            new Thread(runnable4).start();

        } catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance("Is the game xml formatted when it is not we get an error from: gglobals.dVersion", this, commonStrings.PROCESS, e));
        }

    }

    public static void main(String[] args) throws Exception
    {
        //System.setProperty("jdk.xml.xpathExprGrpLimit", "0");
        //System.setProperty("jdk.xml.xpathExprOpLimit", "0");
        System.setProperty("jdk.xml.xpathTotalOpLimit", "0");

        //Generate Layout 1
        new GDLayoutsToAllBinaryLayoutGenerator().process(1, 2);
        
        //new GDLayoutsToAllBinaryLayoutGenerator().process(0, new GDGetTotalLayouts().process());
    }

}

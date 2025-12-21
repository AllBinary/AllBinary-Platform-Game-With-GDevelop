/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.loader;

import java.io.FileInputStream;
import java.io.StringBufferInputStream;
import javax.xml.transform.stream.StreamSource;
import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.directory.Directory;
import org.allbinary.logic.io.path.AbFilePath;
import org.allbinary.logic.math.PrimitiveLongSingleton;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.tokens.Tokenizer;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDLayoutsToAllBinaryLayoutGenerator
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();
    private final Directory directory = Directory.getInstance();
    
    private final SmallIntegerSingletonFactory smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
    private final StreamUtil streamUtil = StreamUtil.getInstance();
    
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final XslHelper xslHelper = XslHelper.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    private final SharedBytes sharedBytes = SharedBytes.getInstance();
    private final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);
    
    private final String GAME_START = "<game>";
    private final String GAME_END = "</game>";

    private final String RESULT = "result: ";
    
    private final String GENERATED_START_WITH_ROOT_PATH = gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas";
    private final String GENERATED_START_WITH_PATH = GENERATED_START_WITH_ROOT_PATH + "\\GD";
    private final String BUILTIN_GDNODE_START_WITH_PATH = GENERATED_START_WITH_ROOT_PATH + "\\node\\builtin\\GD";
    private final String ACTION_GDNODE_START_WITH_PATH = GENERATED_START_WITH_ROOT_PATH + "\\node\\action\\GD";

    private final String PACKAGE = "package org.allbinary.game.canvas.node.";
    private final String BUILT_IN = "BuiltIn";
    private final String END2 = "GDNodes.java";

    public GDLayoutsToAllBinaryLayoutGenerator()
    {
        smallIntegerSingletonFactory.init();
    }

    private void generateXMLAndGlobals(final String gameXmlAsString, final StringMaker stringMaker) throws Exception {
        
        final String[] xmlStringArray0 = {
            gameXmlAsString,
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
                gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalsGDResources.xsl",
                gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalGameThreedLevelLoader.xsl",
            };

        final String[] START0 = {
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            GENERATED_START_WITH_PATH,
            gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",};

        final String[] END0 = {
            "NonLayout.xml",
            "GlobalsSpecialAnimation.java",
            "GameGlobals.java",
            "GlobalsGDObjectsFactory.java",
            "GlobalsGDResources.java",
            "GlobalGameThreedLevelBuilder.java",};

        final int xslTotal0 = xslPathInputArray0.length;
        final String[] xslDocumentAsString0 = new String[xslTotal0];
        for (int index = 0; index < xslTotal0; index++) {
            sharedBytes.outputStream.reset();
            logUtil.put(xslPathInputArray0[index], this, commonStrings.PROCESS);
            xslDocumentAsString0[index] = new String(streamUtil.getByteArray(new FileInputStream(xslPathInputArray0[index]), sharedBytes.outputStream, sharedBytes.byteArray));
        }

        for (int index2 = 0; index2 < xslTotal0; index2++) {

            timeDelayHelper.setStartTime();

            //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
            stringMaker.delete(0, stringMaker.length());
            logUtil.put(stringMaker.append(this.gdToolStrings.FILENAME).append(xslPathInputArray0[index2]).toString(), this, commonStrings.PROCESS);

            final String updatedXslDocumentAsString = xslDocumentAsString0[index2];

            final String result = this.xslHelper.translate(new BasicUriResolver(),
                new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
                new StreamSource(new StringBufferInputStream(xmlStringArray0[index2])));

            stringMaker.delete(0, stringMaker.length());
            String fileName = fileName = stringMaker.append(START0[index2]).append(END0[index2]).toString();

            //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
            stringMaker.delete(0, stringMaker.length());
            logUtil.put(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, commonStrings.PROCESS);

            if (index2 == 0) {
                logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                final String formattedXml = XmlDocumentHelper.getInstance().format(stringMaker.append(GAME_START).append(result).append(GAME_END).toString());
                this.bufferedWriterUtil.overwrite(fileName, formattedXml);
            } else {
                this.bufferedWriterUtil.overwrite(fileName, result);
            }

            stringMaker.delete(0, stringMaker.length());
            logUtil.put(stringMaker.append(index2).append(CommonLabels.getInstance().ELAPSED).append(this.timeDelayHelper.getElapsed()).toString(), this, commonStrings.PROCESS);
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

        final String[] xslPathInputArray = {
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
                gdToolStrings.ROOT_PATH + "platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\gd\\GDGamePlaynResources.xsl",
        };

        final int xslTotal = xslPathInputArray.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        for (int index = 0; index < xslTotal; index++) {
            sharedBytes.outputStream.reset();
            logUtil.put(xslPathInputArray[index], this, commonStrings.PROCESS);
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
            gdToolStrings.ROOT_PATH + "platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\gd\\res\\GD",
        };

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
            //logUtil.put(stringMaker.append("layout:").append(index).toString(), this, commonStrings.PROCESS);

            indexAsString = Integer.toString(index);
            final Replace replace = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, indexAsString);

            for (int index2 = 0; index2 < xslTotal; index2++) {

                //stringMaker.delete(0, stringMaker.length());
                //logUtil.put(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS);
                timeDelayHelper.setStartTime();

                //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                logUtil.put(stringMaker.append(this.gdToolStrings.FILENAME).append(xslPathInputArray[index2]).toString(), this, commonStrings.PROCESS);

                final String updatedXslDocumentAsString = replace.all(xslDocumentAsString[index2]);

                final String result = this.xslHelper.translate(new BasicUriResolver(),
                    new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
                    new StreamSource(new StringBufferInputStream(xmlStringArray[index2])));

                stringMaker.delete(0, stringMaker.length());
                final String fileName = stringMaker.append(START[index2]).append(indexAsString).append(END[index2]).toString();
                directory.create(new AbFilePath(fileName));

                //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                logUtil.put(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, commonStrings.PROCESS);

                if (index2 == 0) {
                    stringMaker.delete(0, stringMaker.length());
                    logUtil.put(stringMaker.append(RESULT).append(result).toString(), this, commonStrings.PROCESS);
                    stringMaker.delete(0, stringMaker.length());
                    final String formattedXml = XmlDocumentHelper.getInstance().format(stringMaker.append(GAME_START).append(result).append(GAME_END).toString());
                    this.bufferedWriterUtil.overwrite(fileName, formattedXml);
                } else {
                    this.bufferedWriterUtil.overwrite(fileName, result);
                }

                stringMaker.delete(0, stringMaker.length());
                logUtil.put(stringMaker.append(index).append(this.commonSeps.COMMA).append(index2).append(CommonLabels.getInstance().ELAPSED).append(this.timeDelayHelper.getElapsed()).toString(), this, commonStrings.PROCESS);
            }

        }
        
        stringMaker.delete(0, stringMaker.length());
        logUtil.put(stringMaker.append(CommonLabels.getInstance().ELAPSED).append("Finished").toString(), this, commonStrings.PROCESS);
        
    }

    private String getIndexAsString(BasicArrayList list, int fileIndex) {

        final PrimitiveLongSingleton primitiveLongSingleton = PrimitiveLongSingleton.getInstance();
        
        int charIndex = 0;
        final int size = list.size();
        final StringMaker stringMaker = new StringMaker();
        String indexAsString;

        //Not very efficient, but better than creating a file for each and every GDNode.
        for (int index3 = 0; index3 < size; index3++) {
            indexAsString = (String) list.get(index3);
            if (fileIndex == 0) {
                charIndex = 0;
                while (charIndex <= 4) {
                    if (indexAsString.charAt(indexAsString.length() - 1) == primitiveLongSingleton.NUMBER_CHAR_ARRAY[charIndex]) {
                        stringMaker.append(commonSeps.COMMA).append(indexAsString).append(commonSeps.COMMA);
                        break;
                    }
                    charIndex++;
                }
            } else {
                charIndex = 5;
                while (charIndex < primitiveLongSingleton.NUMBER_CHAR_ARRAY.length) {
                    if (indexAsString.charAt(indexAsString.length() - 1) == primitiveLongSingleton.NUMBER_CHAR_ARRAY[charIndex]) {
                        stringMaker.append(commonSeps.COMMA).append(indexAsString).append(commonSeps.COMMA);
                        break;
                    }
                    charIndex++;
                }
            }
//                    if (indexAsString.charAt(indexAsString.length() - 1) == primitiveLongSingleton.NUMBER_CHAR_ARRAY[charIndex]) {
//                        nodeIdStringMaker.append(commonSeps.COMMA).append(indexAsString).append(commonSeps.COMMA);
//                    }
        }
        //charIndex++;

        return stringMaker.toString();
    }
    
    private String getBuiltInGDNodeListAsString(final String gameXmlAsString, final int layoutIndex) 
    throws Exception {
        
        final Replace replace = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, smallIntegerSingletonFactory.getString(layoutIndex));
        
        final String[] xmlStringArray = {
            gameXmlAsString,
        };
        
        final String[] gdNodeXSLPathInputArray = 
        {
            gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDOtherEventGDNodeIdList.xsl"
        };
        
        final int xslTotal = gdNodeXSLPathInputArray.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        String updatedXslDocumentAsString = null;
        for (int index = 0; index < xslTotal; index++) {
            sharedBytes.outputStream.reset();
            logUtil.put(gdNodeXSLPathInputArray[index], this, commonStrings.PROCESS);
            xslDocumentAsString[index] = new String(streamUtil.getByteArray(new FileInputStream(gdNodeXSLPathInputArray[index]), sharedBytes.outputStream, sharedBytes.byteArray));
            updatedXslDocumentAsString = replace.all(xslDocumentAsString[index]);
        }

        final String result = this.xslHelper.translate(new BasicUriResolver(),
            new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
            new StreamSource(new StringBufferInputStream(xmlStringArray[0])));

        return result;
                
    }
    
    private BasicArrayList getBuiltInGDNodeList(final String gameXmlAsString, final int layoutIndex) throws Exception {
        
        final String nodeListAsString = this.getBuiltInGDNodeListAsString(gameXmlAsString, layoutIndex);
        final Tokenizer tokenizer = new Tokenizer(commonSeps.SPACE);
        return tokenizer.getTokens(nodeListAsString, new BasicArrayList());

    }

    private void generateBuiltInGDNodes(final String gameXmlAsString, final String layoutGameXmlAsString2, final int layoutTotal, final StringMaker stringMaker) 
    throws Exception {

        for(int layoutIndex = 0; layoutIndex < layoutTotal; layoutIndex++) {

            final BasicArrayList list = this.getBuiltInGDNodeList(gameXmlAsString, layoutIndex);

            final String[] xmlStringArray = {
                layoutGameXmlAsString2,
            };

            final String[] gdNodeXSLPathInputArray = {
                    gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDOtherEventGDNodes.xsl",
            };
            
            final String[] END = {
                END2,
            };

            final int xslTotal = gdNodeXSLPathInputArray.length;
            final String[] xslDocumentAsString = new String[xslTotal];
            for (int index = 0; index < xslTotal; index++) {
                sharedBytes.outputStream.reset();
                logUtil.put(gdNodeXSLPathInputArray[index], this, commonStrings.PROCESS);
                xslDocumentAsString[index] = new String(streamUtil.getByteArray(new FileInputStream(gdNodeXSLPathInputArray[index]), sharedBytes.outputStream, sharedBytes.byteArray));
            }

            final String[] START = {
                BUILTIN_GDNODE_START_WITH_PATH,
            };

            final String[] MIDDLE = {
                BUILT_IN,
            };

            String indexAsString;
            //while (charIndex < primitiveLongSingleton.NUMBER_CHAR_ARRAY.length) {
            for(int fileIndex = 0; fileIndex < 2; fileIndex++) {

                indexAsString = this.getIndexAsString(list, fileIndex);
                                
                if(indexAsString.isEmpty()) {
                    stringMaker.delete(0, stringMaker.length());
                    logUtil.put(stringMaker.append("skipping indexAsString:").append(indexAsString).toString(), this, commonStrings.PROCESS);
                    continue;
                }

                final Replace replace = new Replace(this.gdToolStrings.GD_NODE_IDS, indexAsString);
                final Replace replace2 = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, smallIntegerSingletonFactory.getString(layoutIndex));

//            stringMaker.delete(0, stringMaker.length());
//            logUtil.put(stringMaker.append("indexAsString:").append(indexAsString).toString(), this, commonStrings.PROCESS);
                for (int index2 = 0; index2 < xslTotal; index2++) {

                    //stringMaker.delete(0, stringMaker.length());
                    //logUtil.put(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS);
                    timeDelayHelper.setStartTime();

                    //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
                    String updatedXslDocumentAsString = replace.all(xslDocumentAsString[index2]);
                    updatedXslDocumentAsString = replace2.all(updatedXslDocumentAsString);

                    //logUtil.put("updated xsl: " + updatedXslDocumentAsString, this, commonStrings.PROCESS);
                    final String result = this.xslHelper.translate(new BasicUriResolver(),
                        new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
                        new StreamSource(new StringBufferInputStream(xmlStringArray[index2])));

                    stringMaker.delete(0, stringMaker.length());
                    //String fileName = stringMaker.append(START[index2]).append(layoutIndex).append(MIDDLE[index2]).append(indexAsString.substring(indexAsString.length() - 2, indexAsString.length() - 1)).append(END[index2]).toString();
                    String fileName = stringMaker.append(START[index2]).append(layoutIndex).append(MIDDLE[index2]).append(fileIndex).append(END[index2]).toString();

                    if (result.indexOf(PACKAGE) < 0) {
                        stringMaker.delete(0, stringMaker.length());
                        logUtil.put(stringMaker.append("No GDNode: ").append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, commonStrings.PROCESS);
                        continue;
                    }

                    stringMaker.delete(0, stringMaker.length());
                    logUtil.put(stringMaker.append(this.gdToolStrings.FILENAME).append(gdNodeXSLPathInputArray[index2]).toString(), this, commonStrings.PROCESS);

                    //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                    stringMaker.delete(0, stringMaker.length());
                    logUtil.put(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, commonStrings.PROCESS);

                    this.bufferedWriterUtil.overwrite(fileName, result);

                    stringMaker.delete(0, stringMaker.length());
                    logUtil.put(stringMaker.append(fileIndex).append(this.commonSeps.COMMA).append(index2).append(CommonLabels.getInstance().ELAPSED).append(this.timeDelayHelper.getElapsed()).toString(), this, commonStrings.PROCESS);
                }

            }

            stringMaker.delete(0, stringMaker.length());
            logUtil.put(stringMaker.append(CommonLabels.getInstance().ELAPSED).append("Finished").toString(), this, commonStrings.PROCESS);

        }
    }

    private String getActionGDNodeListAsString(final String gameXmlAsString, final int layoutIndex) 
    throws Exception {
        
        final Replace replace = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, smallIntegerSingletonFactory.getString(layoutIndex));
        
        final String[] xmlStringArray = {
            gameXmlAsString,
        };
        
        final String[] gdNodeXSLPathInputArray = 
        {
            gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDActionGDNodeIdList.xsl"
        };
        
        final int xslTotal = gdNodeXSLPathInputArray.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        String updatedXslDocumentAsString = null;
        for (int index = 0; index < xslTotal; index++) {
            sharedBytes.outputStream.reset();
            logUtil.put(gdNodeXSLPathInputArray[index], this, commonStrings.PROCESS);
            xslDocumentAsString[index] = new String(streamUtil.getByteArray(new FileInputStream(gdNodeXSLPathInputArray[index]), sharedBytes.outputStream, sharedBytes.byteArray));
            updatedXslDocumentAsString = replace.all(xslDocumentAsString[index]);
        }

        final String result = this.xslHelper.translate(new BasicUriResolver(),
            new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
            new StreamSource(new StringBufferInputStream(xmlStringArray[0])));

        return result;
                
    }
    
    private BasicArrayList getActionGDNodeList(final String gameXmlAsString, final int layoutIndex) throws Exception {
        
        final String nodeListAsString = this.getActionGDNodeListAsString(gameXmlAsString, layoutIndex);
        final Tokenizer tokenizer = new Tokenizer(commonSeps.SPACE);
        return tokenizer.getTokens(nodeListAsString, new BasicArrayList());

    }
    
    private void generateActionGDNodes(final String gameXmlAsString, final String layoutGameXmlAsString2, final int layoutTotal, final StringMaker stringMaker) 
    throws Exception {

        for(int layoutIndex = 0; layoutIndex < layoutTotal; layoutIndex++) {

            final BasicArrayList list = this.getActionGDNodeList(gameXmlAsString, layoutIndex);
            
            stringMaker.delete(0, stringMaker.length());
            logUtil.put(stringMaker.append(layoutIndex).append(" action list:").append(list.size()).toString(), this, commonStrings.PROCESS);
            
            final String[] xmlStringArray = {
                layoutGameXmlAsString2,
                layoutGameXmlAsString2,
            };

            final String[] gdNodeXSLPathInputArray = {
                    gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutNExternalActionGDNodes.xsl",
                    gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutNActionGDNodes.xsl",
            };
            
            final String END2 = "GDNodes.java";
            final String[] END = {
                END2,
                END2,
            };

            final int xslTotal = gdNodeXSLPathInputArray.length;
            final String[] xslDocumentAsString = new String[xslTotal];
            for (int index = 0; index < xslTotal; index++) {
                sharedBytes.outputStream.reset();
                logUtil.put(gdNodeXSLPathInputArray[index], this, commonStrings.PROCESS);
                xslDocumentAsString[index] = new String(streamUtil.getByteArray(new FileInputStream(gdNodeXSLPathInputArray[index]), sharedBytes.outputStream, sharedBytes.byteArray));
            }

            final String[] START = {
                ACTION_GDNODE_START_WITH_PATH,
                ACTION_GDNODE_START_WITH_PATH,
            };

            final String[] MIDDLE = {
                "ExternalAction",
                "Action",
            };

            String indexAsString;
            //while (charIndex < primitiveLongSingleton.NUMBER_CHAR_ARRAY.length) {
            for(int fileIndex = 0; fileIndex < 2; fileIndex++) {

                indexAsString = this.getIndexAsString(list, fileIndex);
                                
                if(indexAsString.isEmpty()) {
                    stringMaker.delete(0, stringMaker.length());
                    logUtil.put(stringMaker.append("skipping indexAsString:").append(indexAsString).toString(), this, commonStrings.PROCESS);
                    continue;
                }

                final Replace replace = new Replace(this.gdToolStrings.GD_NODE_IDS, indexAsString);
                final Replace replace2 = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, smallIntegerSingletonFactory.getString(layoutIndex));

//            stringMaker.delete(0, stringMaker.length());
//            logUtil.put(stringMaker.append("indexAsString:").append(indexAsString).toString(), this, commonStrings.PROCESS);
                for (int index2 = 0; index2 < xslTotal; index2++) {

                    //stringMaker.delete(0, stringMaker.length());
                    //logUtil.put(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS);
                    timeDelayHelper.setStartTime();

                    //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
                    String updatedXslDocumentAsString = replace.all(xslDocumentAsString[index2]);
                    updatedXslDocumentAsString = replace2.all(updatedXslDocumentAsString);

                    //logUtil.put("updated xsl: " + updatedXslDocumentAsString, this, commonStrings.PROCESS);
                    final String result = this.xslHelper.translate(new BasicUriResolver(),
                        new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
                        new StreamSource(new StringBufferInputStream(xmlStringArray[index2])));

                    stringMaker.delete(0, stringMaker.length());
                    String fileName = stringMaker.append(START[index2]).append(layoutIndex).append(MIDDLE[index2]).append(fileIndex).append(END[index2]).toString();

                    if (result.indexOf(PACKAGE) < 0) {
                        stringMaker.delete(0, stringMaker.length());
                        logUtil.put(stringMaker.append("No GDNode: ").append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, commonStrings.PROCESS);
                        continue;
                    }

                    stringMaker.delete(0, stringMaker.length());
                    logUtil.put(stringMaker.append(this.gdToolStrings.FILENAME).append(gdNodeXSLPathInputArray[index2]).toString(), this, commonStrings.PROCESS);

                    //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                    stringMaker.delete(0, stringMaker.length());
                    logUtil.put(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, commonStrings.PROCESS);

                    this.bufferedWriterUtil.overwrite(fileName, result);

                    stringMaker.delete(0, stringMaker.length());
                    logUtil.put(stringMaker.append(fileIndex).append(this.commonSeps.COMMA).append(index2).append(CommonLabels.getInstance().ELAPSED).append(this.timeDelayHelper.getElapsed()).toString(), this, commonStrings.PROCESS);
                }

            }

            stringMaker.delete(0, stringMaker.length());
            logUtil.put(stringMaker.append(CommonLabels.getInstance().ELAPSED).append("Finished").toString(), this, commonStrings.PROCESS);

        }
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
                gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
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
                gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
                gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl",
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
                gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutGameThreedLevelLoader.xsl",
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
            gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
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
            gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
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
            "GameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
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
            "GameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
            "GameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
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
            logUtil.put(xslPathInputArray2[index], this, commonStrings.PROCESS);
            xslDocumentAsString2[index] = new String(streamUtil.getByteArray(new FileInputStream(xslPathInputArray2[index]), sharedBytes.outputStream, sharedBytes.byteArray));
        }

        //TWB - need to update to allow loading for every layout.
        String indexAsString;
        for (int index = startIndex; index < size; index++) {
            timeDelayHelper.setStartTime();

            indexAsString = Integer.toString(index);
            final Replace replace = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, indexAsString);

            for (int index2 = 0; index2 < xslTotal2; index2++) {

                //logUtil.put("xsl2 index: " + index2, this, commonStrings.PROCESS);
                final String updatedXslDocumentStr = replace.all(xslDocumentAsString2[index2]);

                final String result = this.xslHelper.translate(new BasicUriResolver(),
                    new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                    new StreamSource(new StringBufferInputStream(gameXmlAsString)));

                stringMaker.delete(0, stringMaker.length());
                String outputFilePath = stringMaker.append(OUTPUT_FILE_PATHS[index2]).append(index).append(OUTPUT_FILE_PATH_END_ARRAY[index2]).toString();
                if (index2 < 15) {
                    stringMaker.delete(0, stringMaker.length());
                    outputFilePath = stringMaker.append(OUTPUT_FILE_PATHS[index2]).append(OUTPUT_FILE_PATH_END_ARRAY[index2]).toString();
                }

                stringMaker.delete(0, stringMaker.length());
                logUtil.put(stringMaker.append(this.gdToolStrings.FILENAME).append(outputFilePath).toString(), this, commonStrings.PROCESS);

                this.bufferedWriterUtil.overwrite(outputFilePath, result);

                //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                logUtil.put(stringMaker.append(index).append(this.commonSeps.COMMA).append(index2).append(CommonLabels.getInstance().ELAPSED).append(this.timeDelayHelper.getElapsed()).toString(), this, commonStrings.PROCESS);
            }
        }
    }
    
    public void process(final int startIndex, final int layoutTotal)
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
            final Replace replace11 = new Replace("Text::Value()", "Text()");
            gameXmlAsString = replace11.all(gameXmlAsString);
            
            
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
            
            generateXMLAndGlobals(gameXmlAsString2, new StringMaker());
            generateLayouts(startIndex, layoutTotal, gameXmlAsString2, layoutGameXmlAsString2, new StringMaker());
            generateActionGDNodes(gameXmlAsString2, layoutGameXmlAsString2, layoutTotal, new StringMaker());
            generateBuiltInGDNodes(gameXmlAsString2, layoutGameXmlAsString2, layoutTotal, new StringMaker());
            generateResourcesLoadersSetup(startIndex, layoutTotal, gameXmlAsString2, new StringMaker());
            
//            final Runnable runnable = new Runnable() {
//                public void run() {
//                    try {
//                    } catch(Exception e) {
//                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
//                    }
//                }
//            };
                        
//            new Thread(runnable).start();

        } catch (Exception e)
        {
            logUtil.put("Is the game xml formatted when it is not we get an error from: gglobals.dVersion", this, commonStrings.PROCESS, e);
        }

    }

    public static void main(String[] args) throws Exception
    {
        //System.setProperty("jdk.xml.xpathExprGrpLimit", "0");
        //System.setProperty("jdk.xml.xpathExprOpLimit", "0");
        System.setProperty("jdk.xml.xpathTotalOpLimit", "0");

        //Generate Layout 1
        new GDLayoutsToAllBinaryLayoutGenerator().process(1, new GDGetTotalLayouts().process());
        
        //new GDLayoutsToAllBinaryLayoutGenerator().process(0, new GDGetTotalLayouts().process());
    }

}

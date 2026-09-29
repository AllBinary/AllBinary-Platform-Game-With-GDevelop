/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.loader;

import java.io.StringBufferInputStream;
import javax.xml.transform.stream.StreamSource;

import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.directory.Directory;
import org.allbinary.logic.io.path.AbFilePath;
import org.allbinary.logic.java.bool.BooleanUtil;
import org.allbinary.logic.math.PrimitiveLongSingleton;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.tokens.Tokenizer;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

/**
 *
 * @author User
 */
public class GDLayoutsToAllBinaryLayoutGenerator {

    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();
    private final Directory directory = Directory.getInstance();

    private final SmallIntegerSingletonFactory smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
    private final StreamUtil streamUtil = StreamUtil.getInstance();

    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final XslHelper xslHelper = XslHelper.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();
    private final GDData gdData = GDData.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    private final String GAME_START = "<game>";
    private final String GAME_END = "</game>";

    private final String RESULT = "result: ";

    private final String GENERATED_START_WITH_ROOT_PATH = this.gdPaths.GEN_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas";
    private final String GENERATED_START_WITH_PATH = this.GENERATED_START_WITH_ROOT_PATH + "\\GD";
    private final String BUILTIN_GDNODE_START_WITH_PATH = this.GENERATED_START_WITH_ROOT_PATH + "\\node\\builtin\\GD";
    private final String ACTION_GDNODE_START_WITH_PATH = this.GENERATED_START_WITH_ROOT_PATH + "\\node\\action\\GD";

    private final String PACKAGE = "package org.allbinary.game.canvas.node.";
    private final String BUILT_IN = "BuiltIn";
    private final String END2 = "GDNodes.java";

    public GDLayoutsToAllBinaryLayoutGenerator() {
        this.smallIntegerSingletonFactory.init();
    }

    private void generateXMLAndGlobals(final String gameXmlAsString, final boolean[] finished) throws Exception {

        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();

        final String[] xmlStringArray0 = {
            gameXmlAsString,
            gameXmlAsString,
            gameXmlAsString,
            gameXmlAsString,
            gameXmlAsString,
            gameXmlAsString,
            gameXmlAsString,};

        final String[] xslPathInputArray0 = {
            this.gdData.GD_NON_LAYOUT_AS_XML,
            this.gdData.GD_GLOBALS_ANIMATION,
            this.gdData.GD_GLOBALS,
            this.gdData.GD_GLOBALS_GD_OBJECTS_FACTORY,
            this.gdData.GD_GLOBALS_GD_RESOURCES,
            this.gdData.GD_EXTENSION_GD_NODES,
            this.gdData.GD_GLOBAL_GAME_THREED_LEVEL_LOADER,
        };

        final String[] START0 = {
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",};

        final String[] END0 = {
            "NonLayout.xml",
            "GlobalsSpecialAnimation.java",
            "GameGlobals.java",
            "GlobalsGDObjectsFactory.java",
            "GlobalsGDResources.java",
            "ExtensionGDNodes.java",
            "GlobalGameThreedLevelBuilder.java",};

        final int xslTotal0 = xslPathInputArray0.length;
        final String[] xslDocumentAsString0 = new String[xslTotal0];
        for (int index = 0; index < xslTotal0; index++) {
            xslDocumentAsString0[index] = this.gdData.getAsString(xslPathInputArray0[index], sharedBytes);
        }

        for (int index2 = 0; index2 < xslTotal0; index2++) {

            final int currentIndex = index2;
            final Runnable runnable = new Runnable() {
                public void run() {
                    try {
                        generateXMLAndGlobalsAt(xmlStringArray0, xslPathInputArray0, START0, END0, xslDocumentAsString0, currentIndex, new StringMaker());
                        finished[0] = true;
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable).start();
        }
    }

    private void generateXMLAndGlobalsAt(final String[] xmlStringArray0, final String[] xslPathInputArray0, final String[] START0, final String[] END0, final String[] xslDocumentAsString0, final int index2, final StringMaker stringMaker) throws Exception {
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);
        //timeDelayHelper.setStartTimeTNT();

        //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(xslPathInputArray0[index2]).toString(), this, this.commonStrings.PROCESS);

        final String updatedXslDocumentAsString = xslDocumentAsString0[index2];

        String result = this.xslHelper.translate(new BasicUriResolver(),
            new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
            new StreamSource(new StringBufferInputStream(xmlStringArray0[index2])));
        
        stringMaker.delete(0, stringMaker.length());
        String fileName = fileName = stringMaker.append(START0[index2]).append(END0[index2]).toString();

        //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);

        if (index2 == 0) {
            this.logUtil.putF(this.RESULT + result, this, this.commonStrings.PROCESS);
            stringMaker.delete(0, stringMaker.length());
            String formattedXml = XmlDocumentHelper.getInstance().format(stringMaker.append(this.GAME_START).append(result).append(this.GAME_END).toString());
            final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
            formattedXml = replaceLT.all(formattedXml);
            this.bufferedWriterUtil.overwrite(fileName, formattedXml);
        } else {
            final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
            result = replaceLT.all(result);
            this.bufferedWriterUtil.overwrite(fileName, result);
        }

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.appendint(index2).append(this.commonSeps.SPACE).append(xslPathInputArray0[index2]).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
    }

    public void generateExternalLinkLayouts(final int startIndex, final int size, final String gameXmlAsString, final String layoutGameXmlAsString, final GDGameInfo gdGameInfo, final StringMaker stringMaker)
        throws Exception {
        
        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

        final String[] xmlStringArray = {
            layoutGameXmlAsString
        };

        final String[] xslPathInputArray = {this.gdData.GD_EXTERNAL_LINK_LAYOUT_GD_NODE};

        final int xslTotal = xslPathInputArray.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        for (int index = 0; index < xslTotal; index++) {
            xslDocumentAsString[index] = this.gdData.getAsString(xslPathInputArray[index], sharedBytes);
        }

        final String[] START = {
            this.GENERATED_START_WITH_PATH,
        };

        final String[] MID = {
            "Game",
        };
        
        final String[] END = {
            "ExternalLinkLayoutGDNode.java"
        };

        String indexAsString;
        String index4AsString;
        int externalLayoutTotalForSceneLayout;
        for (int index = startIndex; index < size; index++) {
            //stringMaker.delete(0, stringMaker.length());
            //logUtil.put(stringMaker.append("layout:").appendint(index).toString(), this, commonStrings.PROCESS);

            externalLayoutTotalForSceneLayout = gdGameInfo.getExternalLayoutTotal(index);
            indexAsString = Integer.toString(index);
            
            final Replace replace = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, indexAsString);

            for (int index2 = 0; index2 < xslTotal; index2++) {

                for (int index4 = 0; index4 < externalLayoutTotalForSceneLayout; index4++) {

                index4AsString = Integer.toString(index4);
                final Replace replace3 = new Replace(this.gdToolStrings.GD_EXTERNAL_LAYOUT_INDEX, index4AsString);
                
                //stringMaker.delete(0, stringMaker.length());
                //logUtil.put(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS);
                timeDelayHelper.setStartTimeTNT();

                //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(xslPathInputArray[index2]).toString(), this, this.commonStrings.PROCESS);

                String updatedXslDocumentAsString = replace.all(xslDocumentAsString[index2]);
                updatedXslDocumentAsString = replace3.all(updatedXslDocumentAsString);

                String result = this.xslHelper.translate(new BasicUriResolver(),
                    new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
                    new StreamSource(new StringBufferInputStream(xmlStringArray[index2])));
                 
                stringMaker.delete(0, stringMaker.length());
                final String fileName = stringMaker.append(START[index2]).append(indexAsString).append(MID[index2]).appendint(index4).append(END[index2]).toString();
                this.directory.create(new AbFilePath(fileName));

                //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);

                    final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                    result = replaceLT.all(result);
                    this.bufferedWriterUtil.overwrite(fileName, result);

                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.appendint(index).append(this.commonSeps.COMMA).appendint(index2).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
                }
            }

        }

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().ELAPSED).append("Finished").toString(), this, this.commonStrings.PROCESS);

    }

    public void generateExternalCreateInstances(final int startIndex, final int size, final String gameXmlAsString, final String layoutGameXmlAsString, final GDGameInfo gdGameInfo, final StringMaker stringMaker)
        throws Exception {
        
        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

        final String[] xmlStringArray = {
            layoutGameXmlAsString
        };

        final String[] xslPathInputArray = {this.gdData.GD_EXTERNAL_CREATE_INSTANCE_GD_NODE};

        final int xslTotal = xslPathInputArray.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        for (int index = 0; index < xslTotal; index++) {
            xslDocumentAsString[index] = this.gdData.getAsString(xslPathInputArray[index], sharedBytes);
        }

        final String[] START = {
            this.GENERATED_START_WITH_PATH,
        };

        final String[] MID = {
            "GameExternal",
        };
        
        final String[] END = {
            "CreateInstance.java"
        };
        
        String indexAsString;
        String index4AsString;
        int externalCreateInstanceTotal;
        int externalLayoutTotalForSceneLayout;
        String createInstanceIndexAsString;
        for (int index = startIndex; index < size; index++) {
            //stringMaker.delete(0, stringMaker.length());
            //logUtil.put(stringMaker.append("layout:").appendint(index).toString(), this, commonStrings.PROCESS);

            externalLayoutTotalForSceneLayout = gdGameInfo.getExternalLayoutTotal(index);
            indexAsString = Integer.toString(index);
            
            final Replace replace = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, indexAsString);

            for (int index2 = 0; index2 < xslTotal; index2++) {

                for (int index4 = 0; index4 < externalLayoutTotalForSceneLayout; index4++) {

                externalCreateInstanceTotal = gdGameInfo.getExternalLayoutInstanceTotal(index4);
                index4AsString = Integer.toString(index4);
                final Replace replace3 = new Replace(this.gdToolStrings.GD_EXTERNAL_LAYOUT_INDEX, index4AsString);

                for (int index5 = 0; index5 < externalCreateInstanceTotal; index5++) {

                createInstanceIndexAsString = Integer.toString(index5);
                final Replace replace4 = new Replace(this.gdToolStrings.GD_CREATE_INSTANCE_INDEX, createInstanceIndexAsString);

                //stringMaker.delete(0, stringMaker.length());
                //logUtil.put(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS);
                timeDelayHelper.setStartTimeTNT();

                //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(xslPathInputArray[index2]).toString(), this, this.commonStrings.PROCESS);

                String updatedXslDocumentAsString = replace.all(xslDocumentAsString[index2]);
                updatedXslDocumentAsString = replace3.all(updatedXslDocumentAsString);
                updatedXslDocumentAsString = replace4.all(updatedXslDocumentAsString);

                String result = this.xslHelper.translate(new BasicUriResolver(),
                    new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
                    new StreamSource(new StringBufferInputStream(xmlStringArray[index2])));
                 
                stringMaker.delete(0, stringMaker.length());
                final String fileName = stringMaker.append(START[index2]).append(indexAsString).append(MID[index2]).appendint(index5).append(END[index2]).toString();
                this.directory.create(new AbFilePath(fileName));

                //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);

                    final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                    result = replaceLT.all(result);
                    this.bufferedWriterUtil.overwrite(fileName, result);

                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.appendint(index).append(this.commonSeps.COMMA).appendint(index2).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
                }
                }
            }

        }

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().ELAPSED).append("Finished").toString(), this, this.commonStrings.PROCESS);

    }

    public void generateCreateInstances(final int startIndex, final int size, final String gameXmlAsString, final String layoutGameXmlAsString, final GDGameInfo gdGameInfo, final StringMaker stringMaker)
        throws Exception {
        
        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

        final String[] xmlStringArray = {
            layoutGameXmlAsString
        };

        final String[] xslPathInputArray = {this.gdData.GD_CREATE_INSTANCE_GD_NODE};

        final int xslTotal = xslPathInputArray.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        for (int index = 0; index < xslTotal; index++) {
            xslDocumentAsString[index] = this.gdData.getAsString(xslPathInputArray[index], sharedBytes);
        }

        final String[] START = {
            this.GENERATED_START_WITH_PATH,
        };

        final String[] MID = {
            "Game",
        };
        
        final String[] END = {
            "CreateInstance.java"
        };
        
        String indexAsString;

        int createInstanceTotal;
        String createInstanceIndexAsString;
        for (int index = startIndex; index < size; index++) {
            //stringMaker.delete(0, stringMaker.length());
            //logUtil.put(stringMaker.append("layout:").appendint(index).toString(), this, commonStrings.PROCESS);
            
            createInstanceTotal = gdGameInfo.getLayoutInstanceTotal(index);
            indexAsString = Integer.toString(index);
            
            final Replace replace = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, indexAsString);

            for (int index2 = 0; index2 < xslTotal; index2++) {

                for (int index4 = 0; index4 < createInstanceTotal; index4++) {

                createInstanceIndexAsString = Integer.toString(index4);
                final Replace replace3 = new Replace(this.gdToolStrings.GD_CREATE_INSTANCE_INDEX, createInstanceIndexAsString);
                
                //stringMaker.delete(0, stringMaker.length());
                //logUtil.put(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS);
                timeDelayHelper.setStartTimeTNT();

                //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(xslPathInputArray[index2]).toString(), this, this.commonStrings.PROCESS);

                String updatedXslDocumentAsString = replace.all(xslDocumentAsString[index2]);
                updatedXslDocumentAsString = replace3.all(updatedXslDocumentAsString);
                
                //this.logUtil.putF(stringMaker.append("xslt:").append(updatedXslDocumentAsString).toString(), this, commonStrings.PROCESS);
                
                String result = this.xslHelper.translate(new BasicUriResolver(),
                    new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
                    new StreamSource(new StringBufferInputStream(xmlStringArray[index2])));
                 
                stringMaker.delete(0, stringMaker.length());
                final String fileName = stringMaker.append(START[index2]).append(indexAsString).append(MID[index2]).appendint(index4).append(END[index2]).toString();
                this.directory.create(new AbFilePath(fileName));

                //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);

                    final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                    result = replaceLT.all(result);
                    this.bufferedWriterUtil.overwrite(fileName, result);

                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.appendint(index).append(this.commonSeps.COMMA).appendint(index2).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
                }
            }

        }

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().ELAPSED).append("Finished").toString(), this, this.commonStrings.PROCESS);

    }
    
    public void generateLayouts(final int startIndex, final int size, final String gameXmlAsString, final String layoutGameXmlAsString, final StringMaker stringMaker)
        throws Exception {

        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

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
            layoutGameXmlAsString,
            gameXmlAsString,
            layoutGameXmlAsString,
            gameXmlAsString,};

        final String[] xslPathInputArray = {
            this.gdData.GD_LAYOUT_AS_XML,
            this.gdData.GD_LAYOUT,
            this.gdData.GD_LAYOUT_BUILDER,
            this.gdData.GD_LAYOUT_EXTERNAL_EVENT_GD_NODES,
            this.gdData.GD_LAYOUT_EXTERNAL_LAYOUT_GD_NODES,
            this.gdData.GD_LAYOUT_EXTERNAL_ACTION_GD_NODES,
            this.gdData.GD_LAYOUT_EXTERNAL_CONDITION_GD_NODES,
            this.gdData.GD_LAYOUT_EXTERNAL_OBJECT_EVENT_GD_NODES,
            this.gdData.GD_LAYOUT_EXTERNAL_OTHER_EVENT_GD_NODES,
            this.gdData.GD_LAYOUT_ACTION_GD_NODES,
            this.gdData.GD_LAYOUT_CONDITION_GD_NODES,
            this.gdData.GD_LAYOUT_OBJECT_EVENT_GD_NODES,
            this.gdData.GD_LAYOUT_OTHER_EVENT_GD_NODES,
            this.gdData.GD_LAYOUT_GD_RESOURCES,
            this.gdData.GD_LAYOUT_SCENE_AS_SPECIAL_ANIMATION_GLOBALS,
            this.gdData.GD_LAYOUT_GD_OBJECTS_FACTORY,
            this.gdData.GD_GAME_PLAYN_RESOURCES,
        };

        final int xslTotal = xslPathInputArray.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        for (int index = 0; index < xslTotal; index++) {
            xslDocumentAsString[index] = this.gdData.getAsString(xslPathInputArray[index], sharedBytes);
        }

        final String[] START = {
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.GENERATED_START_WITH_PATH,
            this.gdPaths.GEN_PATH + "platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\gd\\res\\GD",};

        final String[] END = {
            "SpecialAnimation.xml",
            "SpecialAnimation.java",
            "SpecialAnimationBuilder.java",
            "SpecialAnimationExternalEventGDNodes.java",
            "SpecialAnimationExternalLayoutGDNodes.java",
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
            //logUtil.put(stringMaker.append("layout:").appendint(index).toString(), this, commonStrings.PROCESS);

            indexAsString = Integer.toString(index);
            final Replace replace = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, indexAsString);

            for (int index2 = 0; index2 < xslTotal; index2++) {

                //stringMaker.delete(0, stringMaker.length());
                //logUtil.put(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS);
                timeDelayHelper.setStartTimeTNT();

                //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(xslPathInputArray[index2]).toString(), this, this.commonStrings.PROCESS);

                final String updatedXslDocumentAsString = replace.all(xslDocumentAsString[index2]);

                String result = this.xslHelper.translate(new BasicUriResolver(),
                    new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
                    new StreamSource(new StringBufferInputStream(xmlStringArray[index2])));
                 
                stringMaker.delete(0, stringMaker.length());
                final String fileName = stringMaker.append(START[index2]).append(indexAsString).append(END[index2]).toString();
                this.directory.create(new AbFilePath(fileName));

                //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);

                if (index2 == 0) {
                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append(this.RESULT).append(result).toString(), this, this.commonStrings.PROCESS);
                    stringMaker.delete(0, stringMaker.length());
                    String formattedXml = XmlDocumentHelper.getInstance().format(stringMaker.append(this.GAME_START).append(result).append(this.GAME_END).toString());
                    final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                    formattedXml = replaceLT.all(formattedXml);
                    this.bufferedWriterUtil.overwrite(fileName, formattedXml);
                } else {
                    final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                    result = replaceLT.all(result);
                    this.bufferedWriterUtil.overwrite(fileName, result);
                }

                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.appendint(index).append(this.commonSeps.COMMA).appendint(index2).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
            }

        }

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().ELAPSED).append("Finished").toString(), this, this.commonStrings.PROCESS);

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
                        stringMaker.append(this.commonSeps.COMMA).append(indexAsString).append(this.commonSeps.COMMA);
                        break;
                    }
                    charIndex++;
                }
            } else {
                charIndex = 5;
                while (charIndex < primitiveLongSingleton.NUMBER_CHAR_ARRAY.length) {
                    if (indexAsString.charAt(indexAsString.length() - 1) == primitiveLongSingleton.NUMBER_CHAR_ARRAY[charIndex]) {
                        stringMaker.append(this.commonSeps.COMMA).append(indexAsString).append(this.commonSeps.COMMA);
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

    private String getBuiltInGDNodeListAsString(final String gameXmlAsString, final int layoutIndex, final SharedBytes sharedBytes)
        throws Exception {
        final Replace replace = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, this.smallIntegerSingletonFactory.getString(layoutIndex));

        final String[] xmlStringArray = {
            gameXmlAsString,};

        final String[] gdNodeXSLPathInputArray = {this.gdData.GD_OTHER_EVENT_GD_NODE_ID_LIST};

        final int xslTotal = gdNodeXSLPathInputArray.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        String updatedXslDocumentAsString = null;
        for (int index = 0; index < xslTotal; index++) {
            xslDocumentAsString[index] = this.gdData.getAsString(gdNodeXSLPathInputArray[index], sharedBytes);
            updatedXslDocumentAsString = replace.all(xslDocumentAsString[index]);
        }

        String result = this.xslHelper.translate(new BasicUriResolver(),
            new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
            new StreamSource(new StringBufferInputStream(xmlStringArray[0])));

        final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
        result = replaceLT.all(result);
        
        return result;

    }

    private BasicArrayList getBuiltInGDNodeList(final String gameXmlAsString, final int layoutIndex, final SharedBytes sharedBytes) throws Exception {

        final String nodeListAsString = this.getBuiltInGDNodeListAsString(gameXmlAsString, layoutIndex, sharedBytes);
        final Tokenizer tokenizer = new Tokenizer(this.commonSeps.SPACE);
        return tokenizer.getTokensFromString(nodeListAsString, new BasicArrayListD());

    }

    private void generateBuiltInGDNodes(final String gameXmlAsString, final String layoutGameXmlAsString2, final int layoutTotal, final StringMaker stringMaker)
        throws Exception {

        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

        for (int layoutIndex = 0; layoutIndex < layoutTotal; layoutIndex++) {

            final BasicArrayList list = this.getBuiltInGDNodeList(gameXmlAsString, layoutIndex, sharedBytes);

            final String[] xmlStringArray = {
                layoutGameXmlAsString2,};

            final String[] gdNodeXSLPathInputArray = {this.gdData.GD_OTHER_EVENT_GD_NODES};

            final String[] END = {
                this.END2,};

            final int xslTotal = gdNodeXSLPathInputArray.length;
            final String[] xslDocumentAsString = new String[xslTotal];
            for (int index = 0; index < xslTotal; index++) {
                xslDocumentAsString[index] = this.gdData.getAsString(gdNodeXSLPathInputArray[index], sharedBytes);
            }

            final String[] START = {
                this.BUILTIN_GDNODE_START_WITH_PATH,};

            final String[] MIDDLE = {
                this.BUILT_IN,};

            String indexAsString;
            //while (charIndex < primitiveLongSingleton.NUMBER_CHAR_ARRAY.length) {
            for (int fileIndex = 0; fileIndex < 2; fileIndex++) {

                indexAsString = this.getIndexAsString(list, fileIndex);

                if (indexAsString.isEmpty()) {
                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append("skipping indexAsString:").append(indexAsString).toString(), this, this.commonStrings.PROCESS);
                    continue;
                }

                final Replace replace = new Replace(this.gdToolStrings.GD_NODE_IDS, indexAsString);
                final Replace replace2 = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, this.smallIntegerSingletonFactory.getString(layoutIndex));

//            stringMaker.delete(0, stringMaker.length());
//            logUtil.put(stringMaker.append("indexAsString:").append(indexAsString).toString(), this, commonStrings.PROCESS);
                for (int index2 = 0; index2 < xslTotal; index2++) {

                    //stringMaker.delete(0, stringMaker.length());
                    //logUtil.put(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS);
                    timeDelayHelper.setStartTimeTNT();

                    //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
                    String updatedXslDocumentAsString = replace.all(xslDocumentAsString[index2]);
                    updatedXslDocumentAsString = replace2.all(updatedXslDocumentAsString);

                    //logUtil.put("updated xsl: " + updatedXslDocumentAsString, this, commonStrings.PROCESS);
                    String result = this.xslHelper.translate(new BasicUriResolver(),
                        new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
                        new StreamSource(new StringBufferInputStream(xmlStringArray[index2])));

                    final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                    result = replaceLT.all(result);

                    stringMaker.delete(0, stringMaker.length());
                    //String fileName = stringMaker.append(START[index2]).append(layoutIndex).append(MIDDLE[index2]).append(indexAsString.substring(indexAsString.length() - 2, indexAsString.length() - 1)).append(END[index2]).toString();
                    String fileName = stringMaker.append(START[index2]).appendint(layoutIndex).append(MIDDLE[index2]).appendint(fileIndex).append(END[index2]).toString();

                    if (result.indexOf(this.PACKAGE) < 0) {
                        stringMaker.delete(0, stringMaker.length());
                        this.logUtil.putF(stringMaker.append("No GDNode: ").append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);
                        continue;
                    }

                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(gdNodeXSLPathInputArray[index2]).toString(), this, this.commonStrings.PROCESS);

                    //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);

                    this.bufferedWriterUtil.overwrite(fileName, result);

                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.appendint(fileIndex).append(this.commonSeps.COMMA).appendint(index2).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
                }

            }

            stringMaker.delete(0, stringMaker.length());
            this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().ELAPSED).append("Finished").toString(), this, this.commonStrings.PROCESS);

        }
    }

    private String getActionGDNodeListAsString(final String gameXmlAsString, final int layoutIndex, final SharedBytes sharedBytes)
        throws Exception {

        final Replace replace = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, this.smallIntegerSingletonFactory.getString(layoutIndex));

        final String[] xmlStringArray = {
            gameXmlAsString,};

        final String[] gdNodeXSLPathInputArray = {this.gdData.GD_ACTION_GD_NODE_ID_LIST};

        final int xslTotal = gdNodeXSLPathInputArray.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        String updatedXslDocumentAsString = null;
        for (int index = 0; index < xslTotal; index++) {
            xslDocumentAsString[index] = this.gdData.getAsString(gdNodeXSLPathInputArray[index], sharedBytes);
            updatedXslDocumentAsString = replace.all(xslDocumentAsString[index]);
        }

        String result = this.xslHelper.translate(new BasicUriResolver(),
            new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
            new StreamSource(new StringBufferInputStream(xmlStringArray[0])));

        final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
        result = replaceLT.all(result);

        return result;

    }

    private BasicArrayList getActionGDNodeList(final String gameXmlAsString, final int layoutIndex, final SharedBytes sharedBytes) throws Exception {

        final String nodeListAsString = this.getActionGDNodeListAsString(gameXmlAsString, layoutIndex, sharedBytes);
        final Tokenizer tokenizer = new Tokenizer(this.commonSeps.SPACE);
        return tokenizer.getTokensFromString(nodeListAsString, new BasicArrayListD());

    }

    private void generateActionGDNodes(final String gameXmlAsString, final String layoutGameXmlAsString2, final int layoutTotal, final StringMaker stringMaker)
        throws Exception {

        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

        for (int layoutIndex = 0; layoutIndex < layoutTotal; layoutIndex++) {

            final BasicArrayList list = this.getActionGDNodeList(gameXmlAsString, layoutIndex, sharedBytes);

            stringMaker.delete(0, stringMaker.length());
            this.logUtil.putF(stringMaker.appendint(layoutIndex).append(" action list:").appendint(list.size()).toString(), this, this.commonStrings.PROCESS);

            final String[] xmlStringArray = {
                layoutGameXmlAsString2,
                layoutGameXmlAsString2,};

            final String[] gdNodeXSLPathInputArray = {
                this.gdData.GD_LAYOUT_N_EXTERNAL_ACTION_GD_NODES,
                this.gdData.GD_LAYOUT_N_ACTION_GD_NODES,
            };

            final String END2 = "GDNodes.java";
            final String[] END = {
                END2,
                END2,};

            final int xslTotal = gdNodeXSLPathInputArray.length;
            final String[] xslDocumentAsString = new String[xslTotal];
            for (int index = 0; index < xslTotal; index++) {
                xslDocumentAsString[index] = this.gdData.getAsString(gdNodeXSLPathInputArray[index], sharedBytes);
            }

            final String[] START = {
                this.ACTION_GDNODE_START_WITH_PATH,
                this.ACTION_GDNODE_START_WITH_PATH,};

            final String[] MIDDLE = {
                "ExternalAction",
                "Action",};

            String indexAsString;
            //while (charIndex < primitiveLongSingleton.NUMBER_CHAR_ARRAY.length) {
            for (int fileIndex = 0; fileIndex < 2; fileIndex++) {

                indexAsString = this.getIndexAsString(list, fileIndex);

                if (indexAsString.isEmpty()) {
                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append("skipping indexAsString:").append(indexAsString).toString(), this, this.commonStrings.PROCESS);
                    continue;
                }

                final Replace replace = new Replace(this.gdToolStrings.GD_NODE_IDS, indexAsString);
                final Replace replace2 = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, this.smallIntegerSingletonFactory.getString(layoutIndex));

//            stringMaker.delete(0, stringMaker.length());
//            logUtil.put(stringMaker.append("indexAsString:").append(indexAsString).toString(), this, commonStrings.PROCESS);
                for (int index2 = 0; index2 < xslTotal; index2++) {

                    //stringMaker.delete(0, stringMaker.length());
                    //logUtil.put(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS);
                    timeDelayHelper.setStartTimeTNT();

                    //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
                    String updatedXslDocumentAsString = replace.all(xslDocumentAsString[index2]);
                    updatedXslDocumentAsString = replace2.all(updatedXslDocumentAsString);

                    //logUtil.put("updated xsl: " + updatedXslDocumentAsString, this, commonStrings.PROCESS);
                    String result = this.xslHelper.translate(new BasicUriResolver(),
                        new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
                        new StreamSource(new StringBufferInputStream(xmlStringArray[index2])));

                    final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                    result = replaceLT.all(result);

                    stringMaker.delete(0, stringMaker.length());
                    String fileName = stringMaker.append(START[index2]).appendint(layoutIndex).append(MIDDLE[index2]).appendint(fileIndex).append(END[index2]).toString();

                    if (result.indexOf(this.PACKAGE) < 0) {
                        stringMaker.delete(0, stringMaker.length());
                        this.logUtil.putF(stringMaker.append("No GDNode: ").append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);
                        continue;
                    }

                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(gdNodeXSLPathInputArray[index2]).toString(), this, this.commonStrings.PROCESS);

                    //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);

                    this.bufferedWriterUtil.overwrite(fileName, result);

                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.appendint(fileIndex).append(this.commonSeps.COMMA).appendint(index2).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
                }

            }

            stringMaker.delete(0, stringMaker.length());
            this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().ELAPSED).append("Finished").toString(), this, this.commonStrings.PROCESS);

        }
    }

    private void generateResourcesLoadersSetup(final int startIndex, final int size, final String gameXmlAsString, final StringMaker stringMaker)
        throws Exception {

        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

        final String[] xslPathInputArray2 = {
            this.gdData.GD_ANDROID_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_LAZY_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_HTML_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_LAZY_HTML_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_LAZY_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_OPENGL_TWO_D_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_OPENGL_TWO_D_LAZY_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_OPENGL_TWO_D_ANDROID_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_OPENGL_THREED_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_GLOBAL_RESOURCES,
            this.gdData.GD_THREED_GLOBAL_RESOURCES,
            this.gdData.GD_GLOBAL_IMAGE_RESOURCES,
            this.gdData.GD_THREED_GLOBAL_IMAGE_RESOURCES,
            this.gdData.GD_GAME_MUSIC_FACTORY,
            this.gdData.GD_ANDROID_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_LAZY_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_HTML_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_LAZY_HTML_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_LAZY_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_OPENGL_TWO_D_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_OPENGL_TWO_D_LAZY_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_OPENGL_TWO_D_ANDROID_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_OPENGL_THREED_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_ANDROID_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_J2SE_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_LAZY_J2SE_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_HTML_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_LAZY_HTML_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_LAZY_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_OPENGL_THREED_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
            this.gdData.GD_GAME_SOUNDS_FACTORY,
            this.gdData.GD_LAYOUT_RESOURCES,
            this.gdData.GD_THREED_LAYOUT_RESOURCES,
            this.gdData.GD_LAYOUT_IMAGE_RESOURCES,
            this.gdData.GD_THREED_LAYOUT_IMAGE_RESOURCES,
            this.gdData.GD_LAYOUT_TOUCH_IMAGE_RESOURCES,
            this.gdData.GD_THREED_LAYOUT_TOUCH_IMAGE_RESOURCES,
            this.gdData.GD_LAYOUT_GAME_THREED_LEVEL_LOADER,
            this.gdData.GD_GAME_CAMERA_SETUP,
            this.gdData.GD_LAYOUT_UTIL,
        };

        final String[] OUTPUT_FILE_PATHS = {
            this.gdPaths.GEN_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            this.gdPaths.GEN_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            this.gdPaths.GEN_PATH + "GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
            this.gdPaths.GEN_PATH + "GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GD",
            this.gdPaths.GEN_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            this.gdPaths.GEN_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            this.gdPaths.GEN_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
            this.gdPaths.GEN_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\graphics\\threed\\min3d\\GD",
            this.gdPaths.GEN_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
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
            "GameCameraSetup.java",
            "LayoutUtil.java",
        };

        final int xslTotal2 = OUTPUT_FILE_PATHS.length;
        final String[] xslDocumentAsString2 = new String[xslTotal2];
        for (int index = 0; index < xslTotal2; index++) {
            xslDocumentAsString2[index] = this.gdData.getAsString(xslPathInputArray2[index], sharedBytes);
        }

        //TWB - need to update to allow loading for every layout.
        String indexAsString;
        for (int index = startIndex; index < size; index++) {
            timeDelayHelper.setStartTimeTNT();

            indexAsString = Integer.toString(index);
            final Replace replace = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, indexAsString);

            for (int index2 = 0; index2 < xslTotal2; index2++) {

                //logUtil.put("xsl2 index: " + index2, this, commonStrings.PROCESS);
                final String updatedXslDocumentStr = replace.all(xslDocumentAsString2[index2]);

                String result = this.xslHelper.translate(new BasicUriResolver(),
                    new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                    new StreamSource(new StringBufferInputStream(gameXmlAsString)));

                final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                result = replaceLT.all(result);

                stringMaker.delete(0, stringMaker.length());
                String outputFilePath = stringMaker.append(OUTPUT_FILE_PATHS[index2]).appendint(index).append(OUTPUT_FILE_PATH_END_ARRAY[index2]).toString();
                if (index2 < 15) {
                    stringMaker.delete(0, stringMaker.length());
                    outputFilePath = stringMaker.append(OUTPUT_FILE_PATHS[index2]).append(OUTPUT_FILE_PATH_END_ARRAY[index2]).toString();
                }

                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(outputFilePath).toString(), this, this.commonStrings.PROCESS);

                this.bufferedWriterUtil.overwrite(outputFilePath, result);

                //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.appendint(index).append(this.commonSeps.COMMA).appendint(index2).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
            }
        }
    }

    public void process(final int startIndex, final GDGameInfo gdGameInfo, final boolean[] finished) {
        try {
            final int layoutTotal = gdGameInfo.layoutTotal;

            //final SharedBytes sharedBytes = SharedBytes.getInstance();
            final SharedBytes sharedBytes = new SharedBytes();
            final StringMaker stringMaker = new StringMaker();

            String gameXmlAsString = this.gdData.getAsString(this.gdPaths.GAME_XML_PATH, sharedBytes);

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
            final Replace replace1 = new Replace("FileSystem::", "FileSystem.");
            gameXmlAsString = replace1.all(gameXmlAsString);
            final Replace replaceRevert = new Replace("FileSystem.ReadDirectory", "FileSystem::ReadDirectory");
            gameXmlAsString = replaceRevert.all(gameXmlAsString);
            final Replace replaceHTTP = new Replace("AdvancedHTTP::ResponseStatusText", "AdvancedHTTP.ResponseStatusText");
            gameXmlAsString = replaceHTTP.all(gameXmlAsString);
            final Replace replaceText = new Replace(".Text()", "GDGameLayer.Text()");
            gameXmlAsString = replaceText.all(gameXmlAsString);

            String layoutGameXmlAsString = new String(gameXmlAsString);
            final String[] VARIABLE_ARRAY = {
                "ToJSON(",
                "Variable(",
                "VariableString(",
                "VariableChildCount("
            };
            final String GLOBALS = "globals.";
            final int size2 = VARIABLE_ARRAY.length;
            for (int index2 = 0; index2 < size2; index2++) {
                final String VARIABLE = VARIABLE_ARRAY[index2];
                for (int index = 0; index >= 0;) {
                    index = layoutGameXmlAsString.indexOf(VARIABLE, index + VARIABLE.length());
                    //skip digits
                    if (Character.isDigit(layoutGameXmlAsString.charAt(index + VARIABLE.length()))) {
                        //skip GObject
                    } else if (index >= 1 && layoutGameXmlAsString.charAt(index - 1) == '.') {
                        //skip graphics
                    } else if (layoutGameXmlAsString.charAt(index + VARIABLE.length()) == 'g') {
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

            final Replace replace12 = new Replace("MouseX(&quot;&quot;", "MouseX(EMPTY_STRING");
            layoutGameXmlAsString = replace12.all(layoutGameXmlAsString);
            final Replace replace13 = new Replace("MouseY(&quot;&quot;", "MouseY(EMPTY_STRING");
            layoutGameXmlAsString = replace13.all(layoutGameXmlAsString);

            final Replace replace14 = new Replace("CameraX(&quot;&quot;", "CameraX(EMPTY_STRING");
            layoutGameXmlAsString = replace14.all(layoutGameXmlAsString);
            final Replace replace15 = new Replace("CameraY(&quot;&quot;", "CameraY(EMPTY_STRING");
            layoutGameXmlAsString = replace15.all(layoutGameXmlAsString);
            final Replace replace16 = new Replace("CameraWidth(&quot;&quot;", "CameraWidth(EMPTY_STRING");
            layoutGameXmlAsString = replace16.all(layoutGameXmlAsString);

            final Replace replace17 = new Replace("\"value\": \" V\"", "\"value\": \" &#8595;\"");
            layoutGameXmlAsString = replace17.all(layoutGameXmlAsString);
            final Replace replace18 = new Replace("\"value\": \"V \"", "\"value\": \"&#8595; \"");
            layoutGameXmlAsString = replace18.all(layoutGameXmlAsString);

            final String gameXmlAsString2 = gameXmlAsString;
            final String layoutGameXmlAsString2 = layoutGameXmlAsString;

            final Runnable runnable = new Runnable() {
                public void run() {
                    try {
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateXMLAndGlobals(gameXmlAsString2, finished);
                        System.out.println(new StringMaker().append("generateXMLAndGlobals (Takes a long time and has little output) ElapsedTime: ").appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[1] = true;
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            final String ELAPSED_TIME = "ElapsedTime: ";
            final String CURRENT_STATE_ELAPSED_TIME = "Current State ElapsedTime: ";
            
            new Thread(runnable).start();

            final Runnable runnable2a = new Runnable() {
                public void run() {
                    try {
                        final StringMaker stringMaker = new StringMaker();
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateLayouts(startIndex, layoutTotal, gameXmlAsString2, layoutGameXmlAsString2, stringMaker);
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append("generateLayouts ").append(ELAPSED_TIME).appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[2] = true;
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(CURRENT_STATE_ELAPSED_TIME).append(BooleanUtil.getInstance().toStringFromBooleanArray(finished)).toString());
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable2a).start();

            final Runnable runnable2b = new Runnable() {
                public void run() {
                    try {
                        final StringMaker stringMaker = new StringMaker();
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateCreateInstances(startIndex, layoutTotal, gameXmlAsString2, layoutGameXmlAsString2, gdGameInfo, new StringMaker());
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append("generateCreateInstances ").append(ELAPSED_TIME).appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[3] = true;
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(CURRENT_STATE_ELAPSED_TIME).append(BooleanUtil.getInstance().toStringFromBooleanArray(finished)).toString());
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable2b).start();

            final Runnable runnable2c = new Runnable() {
                public void run() {
                    try {
                        final StringMaker stringMaker = new StringMaker();
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateExternalLinkLayouts(startIndex, layoutTotal, gameXmlAsString2, layoutGameXmlAsString2, gdGameInfo, new StringMaker());
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append("generateExternalLinkLayouts ").append(ELAPSED_TIME).appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[4] = true;
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(CURRENT_STATE_ELAPSED_TIME).append(BooleanUtil.getInstance().toStringFromBooleanArray(finished)).toString());
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable2c).start();

            final Runnable runnable2d = new Runnable() {
                public void run() {
                    try {
                        final StringMaker stringMaker = new StringMaker();
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateExternalCreateInstances(startIndex, layoutTotal, gameXmlAsString2, layoutGameXmlAsString2, gdGameInfo, new StringMaker());
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append("generateExternalCreateInstances ").append(ELAPSED_TIME).appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[5] = true;
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(CURRENT_STATE_ELAPSED_TIME).append(BooleanUtil.getInstance().toStringFromBooleanArray(finished)).toString());
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable2d).start();
            
            final Runnable runnable3 = new Runnable() {
                public void run() {
                    try {
                        final StringMaker stringMaker = new StringMaker();
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateActionGDNodes(gameXmlAsString2, layoutGameXmlAsString2, layoutTotal, new StringMaker());
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append("generateActionGDNodes ").append(ELAPSED_TIME).appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[6] = true;
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(CURRENT_STATE_ELAPSED_TIME).append(BooleanUtil.getInstance().toStringFromBooleanArray(finished)).toString());
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable3).start();

            final Runnable runnable4 = new Runnable() {
                public void run() {
                    try {
                        final StringMaker stringMaker = new StringMaker();
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateBuiltInGDNodes(gameXmlAsString2, layoutGameXmlAsString2, layoutTotal, new StringMaker());
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append("generateBuiltInGDNodes ").append(ELAPSED_TIME).appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[7] = true;
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(CURRENT_STATE_ELAPSED_TIME).append(BooleanUtil.getInstance().toStringFromBooleanArray(finished)).toString());
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable4).start();

            final Runnable runnable5 = new Runnable() {
                public void run() {
                    try {
                        final StringMaker stringMaker = new StringMaker();
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateResourcesLoadersSetup(startIndex, layoutTotal, gameXmlAsString2, new StringMaker());
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append("generateResourcesLoadersSetup ").append(ELAPSED_TIME).appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[8] = true;
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(CURRENT_STATE_ELAPSED_TIME).append(BooleanUtil.getInstance().toStringFromBooleanArray(finished)).toString());
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable5).start();

        } catch (Exception e) {
            this.logUtil.put("Is the game xml formatted when it is not we get an error from: gglobals.dVersion", this, this.commonStrings.PROCESS, e);
        }

    }

    public static void main(String[] args) throws Exception {
        DomDocumentHelper.init();
        GDPaths.init();

        //Generate Layout 1
        final boolean[] finished = new boolean[6];
        final GDGameInfo gdGameInfo = new GDGenerateGDGameInfo().process();
        new GDLayoutsToAllBinaryLayoutGenerator().process(1, gdGameInfo, finished);

        //new GDLayoutsToAllBinaryLayoutGenerator().process(0, gdGameInfo);
    }

}

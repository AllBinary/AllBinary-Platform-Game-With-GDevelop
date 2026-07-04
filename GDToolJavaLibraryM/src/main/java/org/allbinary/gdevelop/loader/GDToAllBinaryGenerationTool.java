/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.loader;

import org.allbinary.canvas.Processor;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.gdevelop.json.GDLayout;
import org.allbinary.gdevelop.json.GDProject;
import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.gdevelop.json.GDResourcesManager;
import org.allbinary.gdevelop.json.event.GDEvent;
import org.allbinary.gdevelop.json.event.GDExpression;
import org.allbinary.gdevelop.json.event.GDInstruction;
import org.allbinary.gdevelop.json.event.builtin.GDEventTypeFactory;
import org.allbinary.gdevelop.json.event.builtin.GDGroupEvent;
import org.allbinary.gdevelop.json.event.builtin.GDLinkEvent;
import org.allbinary.gdevelop.json.event.builtin.GDStandardEvent;
import org.allbinary.gdevelop.json.resource.GDResource;
import org.allbinary.gdevelop.loader.utils.XmlUnicodeReplacer;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.FileListFetcher;
import org.allbinary.string.CommonLabels;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

/**
 *
 * @author User
 */
public class GDToAllBinaryGenerationTool
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();

    private final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

    private final BasicArrayList duplicateCheckList = new BasicArrayListD();

    private final GDNameGenerator[] gdNameFileGeneratorArray = {
        new GDToAndroidManifestGenerator(),
        new GDToAndroidManifestGradleGenerator(),
        new GDToThreedAndroidManifestGenerator(),
        new GDToThreedAndroidManifestGradleGenerator(),
        new GDToAndroidResourcesGenerator(),
        new GDToThreedAndroidResourcesGenerator(),
        new GDToAndroidGameActivityGenerator(),
        new GDToThreedAndroidGameActivityGenerator(),
        new GDToAndroidGameActivityGenerator(),
        new GDToAndroidResourceStringsXmlGenerator(),
        new GDToAndroidResourceStringsXmlGradleGenerator(),
        new GDToThreedAndroidResourceStringsXmlGenerator(),
        new GDToThreedAndroidResourceStringsXmlGradleGenerator(),
        new GDToAndroidBuildGradleGenerator(),
        new GDToThreedAndroidBuildGradleGenerator(),
    };
    
    private final GDToAndroidRClassGenerator androidRClassGenerator = new GDToAndroidRClassGenerator();
    private final GDToThreedAndroidRClassGenerator threedAndroidRClassGenerator = new GDToThreedAndroidRClassGenerator();
    private final GDToAllBinaryResourcesGenerator allBinaryResourcesGenerator = new GDToAllBinaryResourcesGenerator();
    private final GDToAndroidResourcesGradleGenerator allBinaryAndroidResourcesGenerator = new GDToAndroidResourcesGradleGenerator();
    private final GDToThreedAndroidResourcesGradleGenerator allBinaryThreedAndroidResourcesGenerator = new GDToThreedAndroidResourcesGradleGenerator();
    private final GDToAllBinarySoundsGenerator soundsGenerator = new GDToAllBinarySoundsGenerator();
    private final GDToAllBinaryEarlyResourceInitializationGenerator earlyResourceInitializationGenerator = new GDToAllBinaryEarlyResourceInitializationGenerator();
    private final GDToThreedAllBinaryEarlyResourceInitializationGenerator threedEarlyResourceInitializationGenerator = new GDToThreedAllBinaryEarlyResourceInitializationGenerator();
    private final GDToThreedAllBinarySceneAndroidResourcesGradleGenerator threedSceneEarlyResourceInitializationGenerator = new GDToThreedAllBinarySceneAndroidResourcesGradleGenerator();
    private final GDToAllBinaryRotationGenerator allBinaryRotationGenerator = new GDToAllBinaryRotationGenerator();

    private final GDToAllBinaryGlobalGenerator midletGenerator = new GDToAllBinaryGlobalGenerator();
    private final GDLayoutsToAllBinaryGenerator levelBuilderGenerator = new GDLayoutsToAllBinaryGenerator(
            "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\level\\GDGameLevelBuilder.xsl", 
            "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\level\\GDGame", "LevelBuilder.java");
    private final GDLayoutsToAllBinaryGenerator runnableGenerator = new GDLayoutsToAllBinaryGenerator(
            "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\midlet\\GDLayoutRunnable.xsl", 
            "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\midlet\\GDGame", "CanvasRunnable.java");
    private final GDLayoutsToAllBinaryGenerator levelBuilderThreedGenerator = new GDLayoutsToAllBinaryGenerator(
            "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\level\\GDGameLevelBuilder.xsl", 
            "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\level\\GDGame", "LevelBuilder.java");
    private final GDLayoutsToAllBinaryGenerator runnableThreedGenerator = new GDLayoutsToAllBinaryGenerator(
            "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\midlet\\GDLayoutRunnable.xsl",
            "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\midlet\\GDGame", "CanvasRunnable.java");
    //private final GDLayoutsToAllBinaryGenerator startRunnableGenerator = new GDLayoutsToAllBinaryGenerator(
            //"GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDLayoutStartRunnable.xsl", 
            //"GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameStart", "CanvasRunnable.java");
    //private final GDLayoutsToAllBinaryGenerator startRunnableThreedGenerator = new GDLayoutsToAllBinaryGenerator(
            //"GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDLayoutStartRunnable.xsl"
            //"GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameStart", "CanvasRunnable.java");
    private final BasicArrayList layoutList = new BasicArrayListD();

    private final String LOAD_STANDARD_EVENT = "loadStandardEvent";
    
    private final String LOAD_ACTIONS = "loadActions";
    private final String ACTION_LIST_SIZE = "actionList size: ";
    private final String INSTRUCTION_TYPE_VALUE = "instruction.typeValue: ";
    private final String LAYOUT_TOTAL = "Layout Total: ";
    private final String OBJECTS = "Objects: ";
    private final String CONTENT_REMOVE = "Contentx remove: ";
    private final String X = "x";
    private final String PARAMETERS_EXPRESSION_LIST = "parametersExpressionList size: ";
    private final String LOAD_EXPRESSION = "loadExpressions";
    private final String PARAMETERS_EXPRESSION = "loadExpression: ";
    
    private final String PRELOAD_SOUND = "PreloadSound";
    private final String PLAY_SOUND = "PlaySound";
    private final String PLAY_MUSIC = "PlayMusic";

    private final String SCALE = "scale";
    private final String SCALE1 = "scale1";
    private final String SCALE_TOUCH = "scaletouch";
    private final String ANDROID = "android";
    private final String HTML = "html";
    private final String J2SE = "j2se";
    private final String ONEX = "1.0f";
    private final String TWOX = "2.0f";
    private final String HALFX = "0.5f";
    
    public GDToAllBinaryGenerationTool()
    {
    }

    public void process() throws Exception
    {
        this.timeDelayHelper.setStartTimeTNT();

        final GDJSONPersistence gdJSONPersistence = GDJSONPersistence.getInstance();
        final JSONObject gameAsConfigurationJSONObject = gdJSONPersistence.load();
        
        //new UpdateEnemyExclusionRatio().process(gameAsConfigurationJSONObject);
        //new ReduceObjectsForTesting().process(gameAsConfigurationJSONObject);
        //gdJSONPersistence.save(gameAsConfigurationJSONObject);
        
        this.process(gameAsConfigurationJSONObject);
    }

    public void process(final JSONObject gameAsConfigurationJSONObject) throws Exception 
    {
    
        final StringMaker stringMaker = new StringMaker();
        final GDProject gdProject = new GDProject();
        gdProject.load(gameAsConfigurationJSONObject);
        this.xmlConversionHack(gameAsConfigurationJSONObject);

        stringMaker.delete(0, stringMaker.length());
        final String xml = stringMaker.append("<game>").append(XML.toString(gameAsConfigurationJSONObject)).append("<variables><value>movement_angle</value><value>angle</value></variables></game>\n").toString();
        final String formattedXml = XmlUnicodeReplacer.sanitize(XmlDocumentHelper.getInstance().format(xml));
        final String QUOTE = "\"";
        final Replace replace = new Replace(QUOTE, "&quot;");
        final Replace replace2 = new Replace("'", "&apos;");
        final Replace replace3 = new Replace("contentx>", "content>");
        final String TAG_END = ">";
        final Replace replace4 = new Replace(">assets\\", TAG_END);
        final Replace replace5 = new Replace(">assets/", TAG_END);
        final Replace replace6 = new Replace("°", "deg");
        String fixQuotes = replace.all(formattedXml);
        fixQuotes = replace2.all(fixQuotes);
        fixQuotes = replace3.all(fixQuotes);
        fixQuotes = replace4.all(fixQuotes);
        fixQuotes = replace5.all(fixQuotes);
        fixQuotes = replace6.all(fixQuotes);

        final String fileName = this.gdPaths.GAME_XML_PATH;
        this.logUtil.putF(this.gdToolStrings.FILENAME + fileName, this, this.commonStrings.PROCESS);

        this.bufferedWriterUtil.overwrite(fileName, fixQuotes);
        //this.bufferedWriterUtil.overwrite(fileName, xml);
        
        this.allBinaryRotationGenerator.process();

        this.load(gdProject);

        final int size2 = this.gdNameFileGeneratorArray.length;
        for(int index = 0; index < size2; index++) {
            this.gdNameFileGeneratorArray[index].process();
        }

        final FileListFetcher fileListFetcher = FileListFetcher.getInstance();
        final BasicArrayList twoDFileList = fileListFetcher.getFiles(this.gdPaths.TWOD_RESOURCES_PATH);    
        final BasicArrayList threedDFileList = fileListFetcher.getFiles(this.gdPaths.THREED_RESOURCES_PATH);
        
        this.androidRClassGenerator.process();
        this.threedAndroidRClassGenerator.process(threedDFileList);
        this.allBinaryAndroidResourcesGenerator.process();
        this.allBinaryThreedAndroidResourcesGenerator.process(threedDFileList);
        this.soundsGenerator.process();
        this.earlyResourceInitializationGenerator.process(this.soundsGenerator);
        this.threedEarlyResourceInitializationGenerator.process(this.soundsGenerator);
        this.threedSceneEarlyResourceInitializationGenerator.process(threedDFileList);
        this.midletGenerator.process();
        this.allBinaryResourcesGenerator.process(twoDFileList);
        this.levelBuilderGenerator.process();
        this.runnableGenerator.process();
        this.levelBuilderThreedGenerator.process();
        this.runnableThreedGenerator.process();

        final int size = this.layoutList.size();
        for (int index = 0; index < size; index++)
        {
            ((Processor) this.layoutList.get(index)).process();
        }

        //"GDGameAndroidEarlyResourceInitialization"
        
        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().ELAPSED).appendlong(this.timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
    }

    public void xmlConversionHack(JSONObject gameAsConfigurationJSONObject) {
        
        final JSONObject properties = gameAsConfigurationJSONObject.getJSONObject(this.gdProjectStrings.PROPERTIES);
        if(!properties.has(this.SCALE)) {
            final JSONObject scaleJSONObject = new JSONObject();
            scaleJSONObject.put(this.ANDROID, this.ONEX);
            scaleJSONObject.put(this.HTML, this.ONEX);
            scaleJSONObject.put(this.J2SE, this.ONEX);
            properties.put(this.SCALE, scaleJSONObject);
        }
        if(!properties.has(this.SCALE1)) {
            final JSONObject scaleJSONObject = new JSONObject();
            scaleJSONObject.put(this.ANDROID, this.ONEX);
            scaleJSONObject.put(this.HTML, this.ONEX);
            scaleJSONObject.put(this.J2SE, this.ONEX);
            properties.put(this.SCALE1, scaleJSONObject);
        }
        if(!properties.has(this.SCALE_TOUCH)) {
            final JSONObject scaleJSONObject = new JSONObject();
            scaleJSONObject.put(this.ANDROID, this.HALFX);
            scaleJSONObject.put(this.HTML, this.HALFX);
            scaleJSONObject.put(this.J2SE, this.HALFX);
            properties.put(this.SCALE_TOUCH, scaleJSONObject);
        }
        
        

        final JSONArray layoutJSONArray = gameAsConfigurationJSONObject.getJSONArray(this.gdProjectStrings.LAYOUTS);
        final int size4 = layoutJSONArray.length();
        this.logUtil.putF(this.LAYOUT_TOTAL + size4, this, this.commonStrings.PROCESS);
        for(int index2 = 0; index2 < size4; index2++) {

            final JSONObject layoutJSONObject = layoutJSONArray.getJSONObject(index2);
            final JSONArray jsonArray = layoutJSONObject.getJSONArray(this.gdProjectStrings.OBJECTS);
            final int size3 = jsonArray.length();
            this.logUtil.putF(this.OBJECTS + size3, this, this.commonStrings.PROCESS);
            for (int index = 0; index < size3; index++) {

                JSONObject jsonObject = jsonArray.getJSONObject(index);
                if(jsonObject.has(this.gdProjectStrings.CONTENT)) {
                    this.logUtil.putF(this.CONTENT_REMOVE + index, this, this.commonStrings.PROCESS);
                    Object object = jsonObject.remove(this.gdProjectStrings.CONTENT);
                    jsonObject.put(this.gdProjectStrings.CONTENT + this.X, object);
                }
            }
        }
    }
    
    private void load(final GDProject gdProject) throws Exception
    {
        final int size2 = this.gdNameFileGeneratorArray.length;
        for(int index = 0; index < size2; index++) {
            this.gdNameFileGeneratorArray[index].process(gdProject);
        }
        
        this.allBinaryAndroidResourcesGenerator.process(gdProject);
        this.allBinaryThreedAndroidResourcesGenerator.process(gdProject);
        
        //final BasicArrayList objectList = gdProject.objectList;
        //int size = objectList.size();
        //GDObject object;
        //for(int index = 0; index < size; index++) {
        //object = (GDObject) objectList.get(index);
        //object.
        //}
        final BasicArrayList layoutList = gdProject.layoutList;
        int size = layoutList.size();
        GDLayout layout;
        for (int index = 0; index < size; index++)
        {
            layout = (GDLayout) layoutList.get(index);
            this.loadLayout(layout, index, size);
        }

        //final GDResourceFactory resourceFactory = GDResourceFactory.getInstance();
        final GDResourcesManager resourcesManager = gdProject.resourcesManager;
        final BasicArrayList resourceList = resourcesManager.resourceList;
        size = resourceList.size();
        GDResource resource;
        String fileAsString;
        String resourceString;
        int startIndex;
        int endIndex;
        for (int index = 0; index < size; index++)
        {
            resource = (GDResource) resourceList.get(index);
            fileAsString = resource.fileAsString;

            startIndex = fileAsString.lastIndexOf('/');
            if(startIndex < 0) {
                startIndex = 0;
            } else {
                startIndex++;
            }
            endIndex = fileAsString.lastIndexOf('.');
            resourceString = fileAsString.substring(startIndex);
            fileAsString = fileAsString.substring(startIndex, endIndex);
            fileAsString = fileAsString.toLowerCase();

            if (!this.duplicateCheckList.contains(fileAsString))
            {
                this.duplicateCheckList.add(fileAsString);

                this.androidRClassGenerator.processResource(fileAsString);
                this.threedAndroidRClassGenerator.processResource(fileAsString);
                this.allBinaryResourcesGenerator.processResource(fileAsString, resourceString);
                this.allBinaryAndroidResourcesGenerator.processResource(fileAsString, resourceString);
                this.allBinaryThreedAndroidResourcesGenerator.processResource(fileAsString, resourceString);
            }

            //if(resource.kind == resourceFactory.AUDIO) {
            //}                
        }

    }

    public void loadLayout(final GDLayout layout, final int index, final int size) throws Exception
    {
        this.midletGenerator.loadLayout(layout, index, size);
        this.levelBuilderGenerator.loadLayout(layout, index, size);
        this.runnableGenerator.loadLayout(layout, index, size);
        this.levelBuilderThreedGenerator.loadLayout(layout, index, size);
        this.runnableThreedGenerator.loadLayout(layout, index, size);

        final GDToAllBinaryCanvasGenerator canvasGenerator = new GDToAllBinaryCanvasGenerator(
                "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameGDLayoutCanvas.xsl",
                "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\");
        final GDToAllBinaryCanvasGenerator threedCanvasGenerator = new GDToAllBinaryCanvasGenerator(
                "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameGDLayoutCanvas.xsl",
                "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\");
        canvasGenerator.loadLayout(layout, index, size);
        threedCanvasGenerator.loadLayout(layout, index, size);
        this.layoutList.add(canvasGenerator);
        this.layoutList.add(threedCanvasGenerator);

        this.loadEvents(layout.eventList);
    }

    private void loadEvents(final BasicArrayList eventList)
    {

        this.logUtil.putF(StringUtil.getInstance().EMPTY_STRING, this, "loadEvents");

        final GDEventTypeFactory eventTypeFactory = GDEventTypeFactory.getInstance();
        final int size = eventList.size();
        GDEvent event;
        GDGroupEvent groupEvent;
        GDLinkEvent linkEvent;
        GDStandardEvent standardEvent;
        for (int index = 0; index < size; index++)
        {
            event = (GDEvent) eventList.get(index);
            if (event.type == eventTypeFactory.GROUP)
            {
                groupEvent = (GDGroupEvent) event;
                this.loadEvents(groupEvent.eventList);
            } else if (!(event.type == eventTypeFactory.COMMENT || event.type == eventTypeFactory.LINK))
            {
                standardEvent = (GDStandardEvent) event;
                this.loadStandardEvent(standardEvent);
            }
        }
    }

    private void loadStandardEvent(final GDStandardEvent standardEvent)
    {
        this.logUtil.putF(StringUtil.getInstance().EMPTY_STRING, this, this.LOAD_STANDARD_EVENT);
        this.loadEvents(standardEvent.eventList);
        this.loadActions(standardEvent.actionList);
    }
    
    private void loadActions(final BasicArrayList actionList)
    {
        final int size = actionList.size();
        
        this.logUtil.putF(this.ACTION_LIST_SIZE + size, this, this.LOAD_ACTIONS);
        
        GDInstruction instruction;
        for (int index = 0; index < size; index++)
        {
            instruction = (GDInstruction) actionList.get(index);

            this.logUtil.putF(this.INSTRUCTION_TYPE_VALUE + instruction.typeValue, this, this.LOAD_ACTIONS);

            if (instruction.typeValue.indexOf(this.PRELOAD_SOUND) >= 0)
            {
                this.loadExpressions(instruction.parametersExpressionList);
                
            } else if (instruction.typeValue.indexOf(this.PLAY_SOUND) >= 0)
            {
                this.loadExpressions(instruction.parametersExpressionList);
            } else if (instruction.typeValue.indexOf(this.PLAY_MUSIC) >= 0)
            {
                this.loadExpressions(instruction.parametersExpressionList);
            }
        }
    }

    private void loadExpressions(final BasicArrayList parametersExpressionList)
    {
        final int size = parametersExpressionList.size();
        
        this.logUtil.putF(this.PARAMETERS_EXPRESSION_LIST + size, this, this.LOAD_EXPRESSION);
        
        GDExpression expression;
        String param;
        String resourceString;
        //for(int index = 0; index < size; index++) {
        if (size >= 2)
        {
            expression = (GDExpression) parametersExpressionList.get(1);

            this.logUtil.putF(this.PARAMETERS_EXPRESSION + expression, this, this.LOAD_EXPRESSION);
            
            param = expression.plainString;
            
            int startIndex = param.lastIndexOf('/');
            if (startIndex < 0) {
                startIndex = param.lastIndexOf('\\');
            }
            
            if(startIndex < 0) {
                startIndex = 0;
            } else {
                startIndex++;
            }
            final int endIndex = param.lastIndexOf('.');
            resourceString = param.substring(startIndex);
            param = param.substring(startIndex, endIndex);
            param = param.toLowerCase();

            if (!this.duplicateCheckList.contains(param))
            {
                this.duplicateCheckList.add(param);

                this.androidRClassGenerator.processExpressionParam(param);
                this.threedAndroidRClassGenerator.processExpressionParam(param);
                this.soundsGenerator.processExpressionParam(param, resourceString);
            }

        }
    }

    private void load(final BasicArrayList layerList)
    {

        //final ResourceUtil resourceUtil = ResourceUtil.getInstance();
        //final AndroidResources androidResources = AndroidResources.getInstance();
        /*
        GDLayer layer;
        final int size = layerList.size();
        for(int index = 0; index < size; index++) {
            layer = (GDLayer) layerList.get(index);
            layer.
        }
         */
    }

    //resourceUtil.addResource(TestSound.getInstance().getResource(), Integer
    //.valueOf(androidResources.raw.test));
    //public static final int game = 0x7f040017;
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception
    {
        GDPaths.init();
        System.setProperty("jdk.xml.xpathTotalOpLimit", "0");
        new GDToAllBinaryGenerationTool().process();
    }

}

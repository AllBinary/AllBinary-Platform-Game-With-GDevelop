/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.loader;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import org.allbinary.canvas.Processor;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.gdevelop.json.GDLayout;
import org.allbinary.gdevelop.json.GDProject;
import org.allbinary.gdevelop.json.GDResourcesManager;
import org.allbinary.gdevelop.json.event.GDEvent;
import org.allbinary.gdevelop.json.event.GDExpression;
import org.allbinary.gdevelop.json.event.GDInstruction;
import org.allbinary.gdevelop.json.event.builtin.GDEventTypeFactory;
import org.allbinary.gdevelop.json.event.builtin.GDGroupEvent;
import org.allbinary.gdevelop.json.event.builtin.GDStandardEvent;
import org.allbinary.gdevelop.json.resource.GDResource;
import org.allbinary.logic.basic.io.BufferedWriterUtil;
import org.allbinary.logic.basic.io.StreamUtil;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.basic.string.StringUtil;
import org.allbinary.logic.basic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.json.XML;

/**
 *
 * @author User
 */
public class GDToAllBinaryGenerationTool
{
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    
    private final BasicArrayList duplicateCheckList = new BasicArrayList();

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
    private final GDToAllBinaryResourcesGenerator allBinaryResourcesGenerator = new GDToAllBinaryResourcesGenerator();
    private final GDToAndroidResourcesGradleGenerator allBinaryAndroidResourcesGenerator = new GDToAndroidResourcesGradleGenerator();
    private final GDToThreedAndroidResourcesGradleGenerator allBinaryThreedAndroidResourcesGenerator = new GDToThreedAndroidResourcesGradleGenerator();
    private final GDToAllBinarySoundsGenerator soundsGenerator = new GDToAllBinarySoundsGenerator();
    private final GDToAllBinaryEarlyResourceInitializationGenerator earlyResourceInitializationGenerator = new GDToAllBinaryEarlyResourceInitializationGenerator();
    private final GDToThreedAllBinaryEarlyResourceInitializationGenerator threedEarlyResourceInitializationGenerator = new GDToThreedAllBinaryEarlyResourceInitializationGenerator();
    private final GDToThreedAllBinarySceneAndroidResourcesGradleGenerator threedSceneEarlyResourceInitializationGenerator = new GDToThreedAllBinarySceneAndroidResourcesGradleGenerator();

    private final GDToAllBinaryMIDletGenerator midletGenerator = new GDToAllBinaryMIDletGenerator();
    private final GDLayoutsToAllBinaryRunnableGenerator runnableGenerator = new GDLayoutsToAllBinaryRunnableGenerator();
    private final GDLayoutsToAllBinaryThreedRunnableGenerator runnableThreedGenerator = new GDLayoutsToAllBinaryThreedRunnableGenerator();
    private final BasicArrayList layoutList = new BasicArrayList();

    private final String PLAY_SOUND = "PlaySound";

    public GDToAllBinaryGenerationTool()
    {
    }

    public void process() throws Exception
    {

        final StreamUtil streamUtil = StreamUtil.getInstance();
        final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
        final byte[] byteArray = new byte[16384];

        //final FileInputStream inputStream = new FileInputStream(gdToolStrings.ROOT_PATH + "platform\\android\\GDGameAndroidApplicationM\\src\\main\\res\\raw\\game.json");        
        final FileInputStream inputStream = new FileInputStream(gdToolStrings.ROOT_PATH + "game.json");        
        final String gameAsConfiguration = new String(streamUtil.getByteArray(inputStream, outputStream, byteArray));

        final JSONTokener jsonTokener = new JSONTokener(gameAsConfiguration);
        final JSONObject gameAsConfigurationJSONObject = (JSONObject) jsonTokener.nextValue();

        final String xml = "<game>" + XML.toString(gameAsConfigurationJSONObject) + "<variables><value>movement_angle</value><value>angle</value></variables></game>\n";
        final String formattedXml = XmlDocumentHelper.getInstance().format(xml);
        final Replace replace = new Replace("\"", "&quot;");
        final Replace replace2 = new Replace("'", "&apos;");
        String fixQuotes = replace.all(formattedXml);
        fixQuotes = replace2.all(fixQuotes);

        final String fileName = gdToolStrings.ROOT_PATH + "game.xml";
        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + fileName, this, CommonStrings.getInstance().CONSTRUCTOR));

        this.bufferedWriterUtil.overwrite(fileName, fixQuotes);
        //this.bufferedWriterUtil.overwrite(fileName, xml);

        final GDProject gdProject = new GDProject();
        gdProject.load(gameAsConfigurationJSONObject);

        this.load(gdProject);

        final int size2 = gdNameFileGeneratorArray.length;
        for(int index = 0; index < size2; index++) {
            gdNameFileGeneratorArray[index].process();
        }

        this.androidRClassGenerator.process();
        this.allBinaryResourcesGenerator.process();
        this.allBinaryAndroidResourcesGenerator.process();
        this.allBinaryThreedAndroidResourcesGenerator.process();
        this.soundsGenerator.process();
        this.earlyResourceInitializationGenerator.process(soundsGenerator);
        this.threedEarlyResourceInitializationGenerator.process(soundsGenerator);
        this.threedSceneEarlyResourceInitializationGenerator.process();
        this.midletGenerator.process();
        this.runnableGenerator.process();
        this.runnableThreedGenerator.process();

        final int size = this.layoutList.size();
        for (int index = 0; index < size; index++)
        {
            ((Processor) this.layoutList.get(index)).process();
        }

        //"GDGameAndroidEarlyResourceInitialization"
    }

    private void load(final GDProject gdProject) throws Exception
    {
        final int size2 = gdNameFileGeneratorArray.length;
        for(int index = 0; index < size2; index++) {
            gdNameFileGeneratorArray[index].process(gdProject);
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
            this.loadLayout(layout, index);
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
            }
            endIndex = fileAsString.lastIndexOf('.');
            resourceString = fileAsString.substring(startIndex);
            fileAsString = fileAsString.substring(startIndex + 1, endIndex);
            fileAsString = fileAsString.toLowerCase();

            if (!duplicateCheckList.contains(fileAsString))
            {
                duplicateCheckList.add(fileAsString);

                this.androidRClassGenerator.processResource(fileAsString);
                this.allBinaryResourcesGenerator.processResource(fileAsString, resourceString);
                this.allBinaryAndroidResourcesGenerator.processResource(fileAsString, resourceString);
                this.allBinaryThreedAndroidResourcesGenerator.processResource(fileAsString, resourceString);
            }

            //if(resource.kind == resourceFactory.AUDIO) {
            //}                
        }

    }

    public void loadLayout(final GDLayout layout, final int index) throws Exception
    {
        this.midletGenerator.loadLayout(layout, index);
        this.runnableGenerator.loadLayout(layout, index);
        this.runnableThreedGenerator.loadLayout(layout, index);

        final GDToAllBinaryCanvasGenerator canvasGenerator = new GDToAllBinaryCanvasGenerator();
        final GDToThreedAllBinaryCanvasGenerator canvasThreedGenerator = new GDToThreedAllBinaryCanvasGenerator();
        canvasGenerator.loadLayout(layout, index);
        canvasThreedGenerator.loadLayout(layout, index);
        this.layoutList.add(canvasGenerator);
        this.layoutList.add(canvasThreedGenerator);

        this.loadEvents(layout.eventList);
    }

    private void loadEvents(final BasicArrayList eventList)
    {

        LogUtil.put(LogFactory.getInstance(StringUtil.getInstance().EMPTY_STRING, this, "loadEvents"));

        final GDEventTypeFactory eventTypeFactory = GDEventTypeFactory.getInstance();
        final int size = eventList.size();
        GDEvent event;
        GDGroupEvent groupEvent;
        GDStandardEvent standardEvent;
        for (int index = 0; index < size; index++)
        {
            event = (GDEvent) eventList.get(index);
            if (event.type == eventTypeFactory.GROUP)
            {
                groupEvent = (GDGroupEvent) event;
                this.loadEvents(groupEvent.eventList);
            } else if (event.type == eventTypeFactory.STANDARD)
            {
                standardEvent = (GDStandardEvent) event;
                this.loadStandardEvent(standardEvent);
            }
        }
    }

    private void loadStandardEvent(final GDStandardEvent standardEvent)
    {
        LogUtil.put(LogFactory.getInstance(StringUtil.getInstance().EMPTY_STRING, this, "loadStandardEvent"));
        this.loadEvents(standardEvent.eventList);
        this.loadActions(standardEvent.actionList);
    }

    private void loadActions(final BasicArrayList actionList)
    {
        final int size = actionList.size();
        
        LogUtil.put(LogFactory.getInstance("actionList size: " + size, this, "loadActions"));
        
        GDInstruction instruction;
        for (int index = 0; index < size; index++)
        {
            instruction = (GDInstruction) actionList.get(index);

            LogUtil.put(LogFactory.getInstance("instruction.typeValue: " + instruction.typeValue, this, "loadActions"));

            if (instruction.typeValue.indexOf(this.PLAY_SOUND) >= 0)
            {
                this.loadExpressions(instruction.parametersExpressionList);
            }
        }
    }

    private void loadExpressions(final BasicArrayList parametersExpressionList)
    {
        final int size = parametersExpressionList.size();
        
        LogUtil.put(LogFactory.getInstance("parametersExpressionList size: ", this, "loadExpressions"));
        
        GDExpression expression;
        String param;
        String resourceString;
        //for(int index = 0; index < size; index++) {
        if (size >= 2)
        {
            expression = (GDExpression) parametersExpressionList.get(1);
            param = expression.plainString;
            final int startIndex = param.lastIndexOf('/');
            final int endIndex = param.lastIndexOf('.');
            resourceString = param.substring(startIndex);
            param = param.substring(startIndex + 1, endIndex);
            param = param.toLowerCase();

            if (!duplicateCheckList.contains(param))
            {
                duplicateCheckList.add(param);

                this.androidRClassGenerator.processExpressionParam(param);
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
        new GDToAllBinaryGenerationTool().process();
    }

}

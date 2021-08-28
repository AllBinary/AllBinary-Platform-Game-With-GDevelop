/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.FileInputStream;
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
import org.allbinary.logic.basic.io.file.AbFile;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.basic.string.StringUtil;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.json.XML;

/**
 *
 * @author User
 */
public class GDToAllBinaryGenerationTool
{

    private final BasicArrayList duplicateCheckList = new BasicArrayList();

    private final GDToAndroidRClassGenerator androidRClassGenerator = new GDToAndroidRClassGenerator();
    private final GDToAllBinaryResourcesGenerator allBinaryResourcesGenerator = new GDToAllBinaryResourcesGenerator();
    private final GDToAllBinarySoundsGenerator soundsGenerator = new GDToAllBinarySoundsGenerator();
    private final GDToAllBinaryEarlyResourceInitializationGenerator earlyResourceInitializationGenerator = new GDToAllBinaryEarlyResourceInitializationGenerator();

    private final String PLAY_SOUND = "PlaySound";

    private GDToAllBinaryGenerationTool()
    {
    }

    public void process() throws Exception
    {

        final StreamUtil streamUtil = StreamUtil.getInstance();

        final FileInputStream inputStream = new FileInputStream("G:\\mnt\\bc\\mydev\\GDGamesP\\platform\\android\\GDGameAndroidApplicationM\\src\\main\\res\\raw\\game.json");
        final String gameAsConfiguration = streamUtil.getAsString(inputStream);

        final JSONTokener jsonTokener = new JSONTokener(gameAsConfiguration);
        final JSONObject gameAsConfigurationJSONObject = (JSONObject) jsonTokener.nextValue();

        String xml = "<game>" + XML.toString(gameAsConfigurationJSONObject) + "</game>";

        final AbFile abFile = new AbFile("G:\\mnt\\bc\\mydev\\GDGamesP\\game.xml");
        if (abFile.exists())
        {
            abFile.delete();
        }
        BufferedWriterUtil.write(abFile, xml);

        final GDProject gdProject = new GDProject();
        gdProject.load(gameAsConfigurationJSONObject);

        this.load(gdProject);

        this.androidRClassGenerator.process();
        this.allBinaryResourcesGenerator.process();
        this.soundsGenerator.process();
        this.earlyResourceInitializationGenerator.process(soundsGenerator, allBinaryResourcesGenerator);

        //"GDGameAndroidEarlyResourceInitialization"
    }

    private void load(GDProject gdProject)
    {

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
            this.loadEvents(layout.eventList);
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
            endIndex = fileAsString.lastIndexOf('.');
            resourceString = fileAsString.substring(startIndex);
            fileAsString = fileAsString.substring(startIndex + 1, endIndex);
            fileAsString = fileAsString.toLowerCase();

            if (!duplicateCheckList.contains(fileAsString))
            {
                duplicateCheckList.add(fileAsString);

                this.androidRClassGenerator.processResource(fileAsString);
                this.allBinaryResourcesGenerator.processResource(fileAsString, resourceString);
            }

            //if(resource.kind == resourceFactory.AUDIO) {
            //}                
        }

        /*
        final BasicArrayList layoutList = gdProject.layoutList;
        final int size = layoutList.size();
        GDLayout layout;
        for(int index = 0; index < size; index++) {
            layout = (GDLayout) layoutList.get(index);
            this.load(layout.layerList);
        }
         */
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

        LogUtil.put(LogFactory.getInstance(StringUtil.getInstance().EMPTY_STRING, this, "loadActions"));

        final int size = actionList.size();
        GDInstruction instruction;
        for (int index = 0; index < size; index++)
        {
            instruction = (GDInstruction) actionList.get(index);

            if (instruction.typeValue.indexOf(this.PLAY_SOUND) >= 0)
            {
                this.loadExpressions(instruction.parametersExpressionList);
            }
        }
    }

    private void loadExpressions(final BasicArrayList parametersExpressionList)
    {

        LogUtil.put(LogFactory.getInstance(StringUtil.getInstance().EMPTY_STRING, this, "loadExpressions"));

        final int size = parametersExpressionList.size();
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

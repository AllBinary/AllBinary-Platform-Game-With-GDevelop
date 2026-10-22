/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDToThreedAllBinaryEarlyResourceInitializationGenerator
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();

    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final GDResources gdResources = GDResources.getInstance();

    //The template writes each sound
    private final String SOUND = "sound";
    private final String[] SOUND_ATTRIBUTE_NAME_ARRAY = {"className", "androidResource"};

    public GDToThreedAllBinaryEarlyResourceInitializationGenerator()
    {

    }

    public void process(final GDToAllBinarySoundsGenerator soundsGenerator) throws Exception
    {
        final String RESOURCE_INITIALIZATION_ORIGINAL = this.gdPaths.getTemplatePath(this.gdPaths.ROOT_PATH + "platform\\android\\GDGameThreedAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDGameAndroidEarlyResourceInitialization.xsl");
        final String RESOURCE_INITIALIZATION = this.gdPaths.getOutputPath(this.gdPaths.GEN_PATH + "platform\\android\\GDGameThreedAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDGameAndroidEarlyResourceInitialization.java");

        final GDTemplateData templateData = new GDTemplateData();

        this.appendSounds(soundsGenerator, templateData);

        final String newFileAsString = GDTemplateUtil.getInstance().process(RESOURCE_INITIALIZATION_ORIGINAL, templateData);

        this.logUtil.putF(this.gdToolStrings.FILENAME + RESOURCE_INITIALIZATION, this, this.commonStrings.PROCESS);

        this.bufferedWriterUtil.overwrite(RESOURCE_INITIALIZATION, newFileAsString);

    }

    public void appendSounds(final GDToAllBinarySoundsGenerator soundsGenerator, final GDTemplateData templateData) {

        final StringUtil stringUtil = StringUtil.getInstance();

        final BasicArrayList playSoundResourceClassNameList = soundsGenerator.playSoundResourceClassNameList;
        final BasicArrayList playSoundAndroidResourceNameList = this.gdResources.playSoundAndroidResourceNameList;

        int size = playSoundResourceClassNameList.size();
        for(int index = 0; index < size; index++) {
            templateData.add(this.SOUND, this.SOUND_ATTRIBUTE_NAME_ARRAY, new String[] {
                stringUtil.toString(playSoundResourceClassNameList.get(index)),
                stringUtil.toString(playSoundAndroidResourceNameList.get(index))});
        }
    }

}

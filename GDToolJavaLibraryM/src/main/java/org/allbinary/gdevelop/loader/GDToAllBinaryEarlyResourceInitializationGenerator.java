/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import org.allbinary.logic.basic.io.BufferedWriterUtil;
import org.allbinary.logic.basic.io.StreamUtil;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.basic.string.StringMaker;
import org.allbinary.logic.basic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDToAllBinaryEarlyResourceInitializationGenerator
{
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final GDResources gdResources = GDResources.getInstance();
    
    private final String RESOURCE_0 = "\n        resourceUtil.addResource(";
    
    private final String SOUND_RESOURCE = ".getInstance().getResource(), ";

    private final String GD_RESOURCE = "GDResources.getInstance().";
    private final String _RESOURCE = ", ";
    
    private final String RESOURCE_1 = "Integer.valueOf(androidResources.raw.";
    private final String RESOURCE_2 = "));";

    public GDToAllBinaryEarlyResourceInitializationGenerator()
    {

    }

    public void process(final GDToAllBinarySoundsGenerator soundsGenerator) throws Exception
    {
        final String GD_KEY = "//GD";
        
        final String RESOURCE_INITIALIZATION_ORIGINAL = "G:\\mnt\\bc\\mydev\\GDGamesP\\platform\\android\\GDGameAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDGameAndroidEarlyResourceInitialization.origin";
        final String RESOURCE_INITIALIZATION = "G:\\mnt\\bc\\mydev\\GDGamesP\\platform\\android\\GDGameAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDGameAndroidEarlyResourceInitialization.java";
        
        final StringMaker stringBuilder = new StringMaker();

        this.appendSounds(soundsGenerator, stringBuilder);
        this.appendMedia(stringBuilder);

        final StreamUtil streamUtil = StreamUtil.getInstance();
        final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
        final byte[] byteArray = new byte[16384];

        final FileInputStream fileInputStream = new FileInputStream(RESOURCE_INITIALIZATION_ORIGINAL);
        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, outputStream, byteArray));

        final Replace replace = new Replace(GD_KEY, stringBuilder.toString());
        final String newFileAsString = replace.all(androidRFileAsString);

        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + RESOURCE_INITIALIZATION, this, CommonStrings.getInstance().CONSTRUCTOR));

        this.bufferedWriterUtil.overwrite(RESOURCE_INITIALIZATION, newFileAsString);

    }

    public void appendSounds(final GDToAllBinarySoundsGenerator soundsGenerator, final StringMaker stringBuilder) {
        final BasicArrayList playSoundResourceClassNameList = soundsGenerator.playSoundResourceClassNameList;
        final BasicArrayList playSoundAndroidResourceNameList = this.gdResources.playSoundAndroidResourceNameList;
        
        int size = playSoundResourceClassNameList.size();
        for(int index = 0; index < size; index++) {
            stringBuilder.append(RESOURCE_0);
            stringBuilder.append(playSoundResourceClassNameList.get(index));
            stringBuilder.append(SOUND_RESOURCE);
            stringBuilder.append(RESOURCE_1);
            stringBuilder.append(playSoundAndroidResourceNameList.get(index));
            stringBuilder.append(RESOURCE_2);
            stringBuilder.append('\n');
        }        
    }

    public void appendMedia(final StringMaker stringBuilder) {
        final BasicArrayList resourceList = this.gdResources.resourceList;
        final BasicArrayList androidResourceList = this.gdResources.androidResourceList;
        
        int size = resourceList.size();
        for(int index = 0; index < size; index++) {
            stringBuilder.append(RESOURCE_0);
            stringBuilder.append(GD_RESOURCE);
            stringBuilder.append(resourceList.get(index));
            stringBuilder.append(_RESOURCE);
            stringBuilder.append(RESOURCE_1);
            stringBuilder.append(androidResourceList.get(index));
            stringBuilder.append(RESOURCE_2);
            stringBuilder.append('\n');
        }        
    }
    
}

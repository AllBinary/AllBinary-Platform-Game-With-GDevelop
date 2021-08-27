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
package org.allbinary.gdevelop.json;

import java.io.FileInputStream;
import org.allbinary.logic.basic.io.BufferedWriterUtil;
import org.allbinary.logic.basic.io.StreamUtil;
import org.allbinary.logic.basic.io.file.AbFile;
import org.allbinary.logic.basic.string.regex.replace.Replace;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDToAllBinaryEarlyResourceInitializationGenerator
{
    private final String RESOURCE_0 = "\n        resourceUtil.addResource(";
    
    private final String SOUND_RESOURCE = ".getInstance().getResource(), ";

    private final String GD_RESOURCE = "GDResources.getInstance().";
    private final String _RESOURCE = ", ";
    
    private final String RESOURCE_1 = "Integer.valueOf(androidResources.raw.";
    private final String RESOURCE_2 = "));";

    public GDToAllBinaryEarlyResourceInitializationGenerator()
    {

    }

    public void process(final GDToAllBinarySoundsGenerator soundsGenerator, final GDToAllBinaryResourcesGenerator allBinaryResourcesGenerator) throws Exception
    {
        final String GD_KEY = "//GD";
        
        final String RESOURCE_INITIALIZATION_ORIGINAL = "G:\\mnt\\bc\\mydev\\GDGamesP\\platform\\android\\GDGameAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDGameAndroidEarlyResourceInitialization.origin";
        final String RESOURCE_INITIALIZATION = "G:\\mnt\\bc\\mydev\\GDGamesP\\platform\\android\\GDGameAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDGameAndroidEarlyResourceInitialization.java";
        
        final StringBuilder stringBuilder = new StringBuilder();

        this.appendSounds(soundsGenerator, stringBuilder);
        this.appendMedia(allBinaryResourcesGenerator, stringBuilder);

        final StreamUtil streamUtil = StreamUtil.getInstance();

        final FileInputStream fileInputStream = new FileInputStream(RESOURCE_INITIALIZATION_ORIGINAL);
        final String androidRFileAsString = streamUtil.getAsString(fileInputStream);
        final Replace replace = new Replace(GD_KEY, stringBuilder.toString());
        final String newFileAsString = replace.all(androidRFileAsString);

        final AbFile abFile = new AbFile(RESOURCE_INITIALIZATION);
        if (abFile.exists())
        {
            abFile.delete();
        }
        BufferedWriterUtil.write(abFile, newFileAsString);

    }

    public void appendSounds(final GDToAllBinarySoundsGenerator soundsGenerator, final StringBuilder stringBuilder) {
        final BasicArrayList playSoundResourceClassNameList = soundsGenerator.playSoundResourceClassNameList;
        final BasicArrayList playSoundAndroidResourceNameList = soundsGenerator.playSoundAndroidResourceNameList;
        
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

    public void appendMedia(final GDToAllBinaryResourcesGenerator allBinaryResourcesGenerator, final StringBuilder stringBuilder) {
        final BasicArrayList resourceList = allBinaryResourcesGenerator.resourceList;
        final BasicArrayList androidResourceList = allBinaryResourcesGenerator.androidResourceList;
        
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

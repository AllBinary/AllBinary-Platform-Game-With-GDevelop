/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDToThreedAllBinaryEarlyResourceInitializationGenerator
{
    private final CommonStrings commonStrings = CommonStrings.getInstance();

    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final GDResources gdResources = GDResources.getInstance();
    
    private final String RESOURCE_0 = "\n        resourceUtil.addResource(";
    
    private final String SOUND_RESOURCE = ".getInstance().getResource(), ";

    private final String GD_RESOURCE = "gdResources.";
    private final String _RESOURCE = ", ";
    
    private final String RESOURCE_1 = "Integer.valueOf(androidResources.raw.";
    private final String RESOURCE_2 = "));";

    private final String _OBJ = "_obj";
    
    public GDToThreedAllBinaryEarlyResourceInitializationGenerator()
    {

    }

    public void process(final GDToAllBinarySoundsGenerator soundsGenerator) throws Exception
    {
        final String GD_KEY = "//GD";
        
        final String RESOURCE_INITIALIZATION_ORIGINAL = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameThreedAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDGameAndroidEarlyResourceInitialization.origin";
        final String RESOURCE_INITIALIZATION = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameThreedAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDGameAndroidEarlyResourceInitialization.java";
        
        final StringMaker stringMaker = new StringMaker();

        this.appendSounds(soundsGenerator, stringMaker);

        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();

        final FileInputStream fileInputStream = new FileInputStream(RESOURCE_INITIALIZATION_ORIGINAL);
        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));

        final Replace replace = new Replace(GD_KEY, stringMaker.toString());
        final String newFileAsString = replace.all(androidRFileAsString);

        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + RESOURCE_INITIALIZATION, this, commonStrings.PROCESS));

        this.bufferedWriterUtil.overwrite(RESOURCE_INITIALIZATION, newFileAsString);

    }
    
    public void appendSounds(final GDToAllBinarySoundsGenerator soundsGenerator, final StringMaker stringMaker) {
        final BasicArrayList playSoundResourceClassNameList = soundsGenerator.playSoundResourceClassNameList;
        final BasicArrayList playSoundAndroidResourceNameList = this.gdResources.playSoundAndroidResourceNameList;
        
        int size = playSoundResourceClassNameList.size();
        for(int index = 0; index < size; index++) {
            stringMaker.append(RESOURCE_0);
            stringMaker.append(playSoundResourceClassNameList.get(index));
            stringMaker.append(SOUND_RESOURCE);
            stringMaker.append(RESOURCE_1);
            stringMaker.append(playSoundAndroidResourceNameList.get(index));
            stringMaker.append(RESOURCE_2);
            stringMaker.append('\n');
        }        
    }
    
}

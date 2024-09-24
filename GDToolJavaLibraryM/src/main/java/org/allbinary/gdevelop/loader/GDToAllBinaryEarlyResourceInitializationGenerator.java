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
import org.allbinary.logic.string.CommonSeps;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDToAllBinaryEarlyResourceInitializationGenerator
{
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();

    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final GDResources gdResources = GDResources.getInstance();
    
    private final String COMMENT = "//";
    private final String TOUCH = "TOUCH";
    private final String UNDERSCORE_0 = commonSeps.UNDERSCORE + "0";
    
    private final String RESOURCE_0 = "        resourceUtil.addResource(";
    
    private final String SOUND_RESOURCE = ".getInstance().getResource(), ";

    private final String GD_RESOURCE = "gdResources.";
    private final String _RESOURCE = ", ";
    
    private final String RESOURCE_1 = "Integer.valueOf(androidResources.raw.";
    private final String RESOURCE_2 = "));";

    public GDToAllBinaryEarlyResourceInitializationGenerator()
    {

    }

    public void process(final GDToAllBinarySoundsGenerator soundsGenerator) throws Exception
    {
        final String GD_KEY = "//GD";
        
        final String RESOURCE_INITIALIZATION_ORIGINAL = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDGameAndroidEarlyResourceInitialization.origin";
        final String RESOURCE_INITIALIZATION = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDGameAndroidEarlyResourceInitialization.java";
        
        final StringMaker stringMaker = new StringMaker();

        this.appendSounds(soundsGenerator, stringMaker);
        this.appendMedia(stringMaker);

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
            stringMaker.append(this.commonSeps.NEW_LINE);
        }        
    }

    public void appendMedia(final StringMaker stringMaker) {
        final CommonSeps commonSeps = CommonSeps.getInstance();

        final BasicArrayList resourceList = this.gdResources.resourceNameList;
        final BasicArrayList androidResourceList = this.gdResources.androidResourceList;
        
        final int size = resourceList.size();
        final int size2 = 100;
        String resource;
        for(int index = 0; index < size; index++) {
            
            resource = (String) resourceList.get(index);

            stringMaker.append(this.commonSeps.NEW_LINE);
            
            if (resource.endsWith(UNDERSCORE_0) && resource.indexOf(TOUCH) < 0) {
                stringMaker.append(COMMENT);
            }
            
            for(int index2 = 2; index2 < size2; index2++) {
                if(resource.endsWith(commonSeps.UNDERSCORE + index2) && resource.indexOf(TOUCH) < 0) {
                    stringMaker.append(COMMENT);
                }
            }            
                        
            stringMaker.append(RESOURCE_0);
            
            stringMaker.append(GD_RESOURCE);
            stringMaker.append(resource);
            stringMaker.append(_RESOURCE);
            stringMaker.append(RESOURCE_1);
            stringMaker.append(androidResourceList.get(index));
            stringMaker.append(RESOURCE_2);
            stringMaker.append(this.commonSeps.NEW_LINE);
        }        
    }
    
}

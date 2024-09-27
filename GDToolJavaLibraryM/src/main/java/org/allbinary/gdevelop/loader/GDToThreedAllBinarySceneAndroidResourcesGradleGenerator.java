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
public class GDToThreedAllBinarySceneAndroidResourcesGradleGenerator
{
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();
    
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final GDResources gdResources = GDResources.getInstance();

    private final String UNDERSCORE_0 = commonSeps.UNDERSCORE + "0";
    
    private final String RESOURCE_0 = "        resourceUtil.addResource(";
    
    //private final String SOUND_RESOURCE = ".getInstance().getResource(), ";

    private final String GD_RESOURCE = "gdResources.";
    private final String _RESOURCE = ", ";
    
    private final String RESOURCE_1 = "Integer.valueOf(androidResources.raw.";
    private final String RESOURCE_2 = "));";

    private final String _OBJ = "_obj";
    
    private final String _TOUCH = "TOUCH";
    private final String TOUCH = "touch";
    private final String _BLANK = "BLANK";
    private final String BLANK = "blank";
    
    public GDToThreedAllBinarySceneAndroidResourcesGradleGenerator()
    {

    }

    public void process() throws Exception
    {
        final String GD_KEY = "//GD";
        
        final String RESOURCE_INITIALIZATION_ORIGINAL = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameThreedAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDGameThreedAndroidEarlyResourceInitialization.origin";
        final String RESOURCE_INITIALIZATION = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameThreedAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDGameThreedAndroidEarlyResourceInitialization.java";
        
        final StringMaker stringMaker = new StringMaker();

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
    
    public void appendMedia(final StringMaker stringMaker) {
        final BasicArrayList resourceList = this.gdResources.resourceNameList;
        final BasicArrayList androidResourceList = this.gdResources.androidResourceList;
        
        final int size = resourceList.size();
        final int size2 = 100;
        String resource;
        for(int index = 0; index < size; index++) {

            resource = (String) resourceList.get(index);

            stringMaker.append(this.commonSeps.NEW_LINE);
            
            if (resource.endsWith(UNDERSCORE_0) && 
                    (resource.indexOf(_TOUCH) < 0 || resource.indexOf(_BLANK) < 0)) {
                stringMaker.append(this.commonSeps.COMMENT);
            }
            
            for(int index2 = 2; index2 < size2; index2++) {
                if(resource.endsWith(commonSeps.UNDERSCORE + index2) && 
                        (resource.indexOf(_TOUCH) < 0 || resource.indexOf(_BLANK) < 0)) {
                    stringMaker.append(this.commonSeps.COMMENT);
                }
            }            
            
            stringMaker.append(RESOURCE_0);
            stringMaker.append(GD_RESOURCE);
            stringMaker.append(resource);
            stringMaker.append(_RESOURCE);
            stringMaker.append(RESOURCE_1);
            stringMaker.append(androidResourceList.get(index));
            if(((String) androidResourceList.get(index)).indexOf(TOUCH) < 0 && 
                    ((String) androidResourceList.get(index)).indexOf(BLANK) < 0) {
                stringMaker.append(_OBJ);
            }
            stringMaker.append(RESOURCE_2);
        }        
    }
    
}

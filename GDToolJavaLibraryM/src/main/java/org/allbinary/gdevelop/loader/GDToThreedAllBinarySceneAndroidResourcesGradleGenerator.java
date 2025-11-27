/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.FileInputStream;

import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDToThreedAllBinarySceneAndroidResourcesGradleGenerator
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();
    
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final GDResources gdResources = GDResources.getInstance();

    private final GDResourceSelection gdResourceSelection = GDResourceSelection.getInstance();
    
    //private final String TOUCH = "touch";
    
    public GDToThreedAllBinarySceneAndroidResourcesGradleGenerator()
    {

    }

    public void process(final BasicArrayList threedFileList) throws Exception
    {
        final String GD_KEY = "//GD";
        
        final String RESOURCE_INITIALIZATION_ORIGINAL = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameThreedAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDGameThreedAndroidEarlyResourceInitialization.origin";
        final String RESOURCE_INITIALIZATION = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameThreedAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDGameThreedAndroidEarlyResourceInitialization.java";
        
        final StringMaker stringMaker = new StringMaker();

        this.appendMedia(threedFileList, stringMaker);

        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();

        final FileInputStream fileInputStream = new FileInputStream(RESOURCE_INITIALIZATION_ORIGINAL);
        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));

        final Replace replace = new Replace(GD_KEY, stringMaker.toString());
        final String newFileAsString = replace.all(androidRFileAsString);

        logUtil.put(this.gdToolStrings.FILENAME + RESOURCE_INITIALIZATION, this, commonStrings.PROCESS);

        this.bufferedWriterUtil.overwrite(RESOURCE_INITIALIZATION, newFileAsString);

    }
    
    public void appendMedia(final BasicArrayList threedFileList, final StringMaker stringMaker) {
        
        final StringUtil stringUtil = StringUtil.getInstance();
        
        final BasicArrayList resourceList = this.gdResources.resourceNameList;
        final BasicArrayList androidResourceList = this.gdResources.androidResourceList;
        
        final boolean hasRotationImages = this.gdResourceSelection.hasRotationImages();
        
        final int size = resourceList.size();
        final int size2 = 100;
        String resource;
        for(int index = 0; index < size; index++) {

            resource = (String) resourceList.get(index);

            final String extension = this.gdToolStrings.getExtension(threedFileList, resource);
            
            stringMaker.append(this.commonSeps.NEW_LINE);
            
            if(extension == stringUtil.NULL_STRING) {
                stringMaker.append(this.commonSeps.COMMENT);
                stringMaker.append(this.gdToolStrings.NOT_USED_FOR_THREED_GAMES);
            }

            if (resource.endsWith(gdToolStrings.UNDERSCORE_0) && 
                    (resource.indexOf(gdToolStrings._TOUCH_) < 0 || resource.indexOf(gdToolStrings._BLANK_) < 0)) {
                stringMaker.append(this.commonSeps.COMMENT);
            }
            
            //hasRotationImages?
            if (!hasRotationImages) {
                for (int index2 = 2; index2 < size2; index2++) {
                    if (resource.endsWith(commonSeps.UNDERSCORE + index2)
                        && (resource.indexOf(gdToolStrings._TOUCH_) < 0 || resource.indexOf(gdToolStrings._BLANK_) < 0)) {
                        stringMaker.append(this.commonSeps.COMMENT);
                    }
                }
            }
            
            stringMaker.append(gdToolStrings.RESOURCE_0);
            stringMaker.append(gdToolStrings.GD_RESOURCE);
            stringMaker.append(resource);
            stringMaker.append(gdToolStrings._RESOURCE);
            stringMaker.append(gdToolStrings.RESOURCE_1);
            final String androidResource = ((String) androidResourceList.get(index));
            stringMaker.append(androidResource);
            stringMaker.append(extension);
            stringMaker.append(gdToolStrings.RESOURCE_2);
        }        
    }
    
}

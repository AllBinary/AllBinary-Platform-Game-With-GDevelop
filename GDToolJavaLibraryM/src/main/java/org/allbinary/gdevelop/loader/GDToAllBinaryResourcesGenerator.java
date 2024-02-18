/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.FileUtil;
import org.allbinary.logic.string.CommonLabels;
import org.allbinary.logic.string.CommonSeps;
import org.allbinary.time.TimeDelayHelper;

/**
 *
 * @author User
 */
public class GDToAllBinaryResourcesGenerator
{
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final GDResources gdResources = GDResources.getInstance();

    private final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);
    
    private final StringMaker resourceStringBuilder = new StringMaker();
    
    private final String GD_KEY = "//GD";
    private final String TOUCH = "TOUCH";
    private final String COMMENT = "//";
    private final String UNDERSCORE_0 = commonSeps.UNDERSCORE + "0";
    private final String BLANK = "BLANK";
            
    private final int size2 = 100;
    
    private final String PUBLIC_FINAL_STRING = "    public final String ";
    private final String VALUE_RESOURCE_START = " = \"";
    private final String VALUE_RESOURCE_END = "\";\n";
    
    private final boolean hasRotationImages;
    public GDToAllBinaryResourcesGenerator() {
        hasRotationImages = this.hasRotationImages();
        resourceStringBuilder.append(GD_KEY);
        resourceStringBuilder.append('\n');
    }
    
    public boolean hasRotationImages() {
        final FileUtil fileUtil = FileUtil.getInstance();
        final String filePath = gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\animation\\GDRotationAnimation.txt";
        final String fileAsString = fileUtil.readAsString(filePath);
        if(fileAsString.indexOf("found") >= 0) {
            return true;
        }
        return false;
    }
    
    public void processResource(final String nameAsString, final String resourceString) {
        this.gdResources.androidResourceList.add(nameAsString);
        final String name = nameAsString.toUpperCase();
        this.gdResources.resourceNameList.add(name);
        final String resource = resourceString.toLowerCase();
        this.gdResources.resourceList.add(resource);
        
        if(name.indexOf(BLANK) >= 0) {
            resourceStringBuilder.append(COMMENT);
        }
        
        if (name.endsWith(UNDERSCORE_0) && name.indexOf(TOUCH) < 0) {
            resourceStringBuilder.append(COMMENT);
        }

        //if(!this.hasRotationImages) {
            for (int index2 = 2; index2 < size2; index2++) {
                if (name.endsWith(commonSeps.UNDERSCORE + index2) && name.indexOf(TOUCH) < 0) {
                    resourceStringBuilder.append(COMMENT);
                }
            }
        //}
        
        resourceStringBuilder.append(this.PUBLIC_FINAL_STRING);
        resourceStringBuilder.append(name);
        resourceStringBuilder.append(this.VALUE_RESOURCE_START);
        resourceStringBuilder.append(resource);
        resourceStringBuilder.append(this.VALUE_RESOURCE_END);
    }
    
    public void process() throws Exception {
    
        timeDelayHelper.setStartTime();
        
        final String RESOURCE_ORIGINAL = gdToolStrings.ROOT_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDResources.origin";
        final String RESOURCE = gdToolStrings.ROOT_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDResources.java";
        
        final StringMaker stringBuilder = new StringMaker();
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
        final byte[] byteArray = new byte[16384];
        
        final FileInputStream fileInputStream = new FileInputStream(RESOURCE_ORIGINAL);        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, outputStream, byteArray));
        
        final String INDENT = "        ";
        final String JSON = ".json";
        final String T = ".t";
        resourceStringBuilder.append('\n');
        resourceStringBuilder.append("    public final String[] resourceStringArray = {\nBLANK,\n");
        final int size = this.gdResources.resourceNameList.size();
        String name;
        String resource;
        for(int index = 0; index < size; index++) {
            name = (String) this.gdResources.resourceNameList.get(index);
            resource = (String) this.gdResources.resourceList.get(index);
            resourceStringBuilder.append(INDENT);
            if(resource.indexOf(JSON) >= 0 || resource.indexOf(T) >= 0) {
                resourceStringBuilder.append(COMMENT);
            }

            if(resource.toUpperCase().indexOf(BLANK) >= 0) {
                resourceStringBuilder.append(COMMENT);
            }
            
            if (name.endsWith(UNDERSCORE_0) && name.indexOf(TOUCH) < 0) {
                resourceStringBuilder.append(COMMENT);
            }
            
            //if(!this.hasRotationImages) {
                for (int index2 = 2; index2 < size2; index2++) {
                    if (name.endsWith(commonSeps.UNDERSCORE + index2) && name.indexOf(TOUCH) < 0) {
                        resourceStringBuilder.append(COMMENT);
                    }
                }
            //}
            
            resourceStringBuilder.append(name);
            resourceStringBuilder.append(',');
            resourceStringBuilder.append('\n');
        }
        
        resourceStringBuilder.append("    ");
        resourceStringBuilder.append('}');
        resourceStringBuilder.append(';');
        resourceStringBuilder.append('\n');
        
        final Replace replace = new Replace(GD_KEY, this.resourceStringBuilder.toString());
        final String newFileAsString = replace.all(androidRFileAsString);

        stringBuilder.delete(0, stringBuilder.length());
        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + RESOURCE, this, CommonStrings.getInstance().CONSTRUCTOR));
        
        this.bufferedWriterUtil.overwrite(RESOURCE, newFileAsString);        
        
        stringBuilder.delete(0, stringBuilder.length());
        LogUtil.put(LogFactory.getInstance(stringBuilder.append(CommonLabels.getInstance().ELAPSED).append(this.timeDelayHelper.getElapsed()).toString(), this, commonStrings.PROCESS));
    }
    
}

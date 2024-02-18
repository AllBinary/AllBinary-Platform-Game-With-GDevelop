/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import org.allbinary.data.CamelCaseUtil;
import org.allbinary.gdevelop.json.GDProject;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDToThreedAndroidResourcesGradleGenerator
{
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final GDResources gdResources = GDResources.getInstance();
    
    private final StringMaker resourceStringBuilder = new StringMaker();
    
    private final String GD_KEY = "//GD";
            
    private final String PUBLIC_FINAL_STRING = "    public final int ";
    private final String VALUE_RESOURCE_START = " = R.raw.";
    private final String VALUE_RESOURCE_END = ";\n";
    
    private final String GD_KEY_NAME = "<name>";
    
    private final String _OBJ = "_obj";
    private final String BUTTON = "button";
    
    private String packageName;
    
    public GDToThreedAndroidResourcesGradleGenerator() {
        resourceStringBuilder.append(GD_KEY);
        resourceStringBuilder.append('\n');
    }
    
    public void process(final GDProject gdProject) {
        if(gdProject.packageName != null) {
            this.packageName = gdProject.packageName;
        } else {
            this.packageName = gdProject.name;
        }
    }
    
    public void processResource(final String fileAsString, final String resourceString) {
        final String resource = resourceString.substring(1, resourceString.length() - 4).toLowerCase();

        //Hack - the generation needs to break 3d objects from images.
        boolean isThreed = true;        
        if(resource.indexOf(BUTTON) >= 0) {
            isThreed = false;
        }
        
        resourceStringBuilder.append(this.PUBLIC_FINAL_STRING);
        resourceStringBuilder.append(resource);
        
        if(isThreed) {
            resourceStringBuilder.append(this._OBJ);
        }
        
        resourceStringBuilder.append(this.VALUE_RESOURCE_START);
        resourceStringBuilder.append(resource);
        
        if(isThreed) {
            resourceStringBuilder.append(this._OBJ);
        }
        
        resourceStringBuilder.append(this.VALUE_RESOURCE_END);
    }
    
    public void process() throws Exception {

        final String RESOURCE_ORIGINAL = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameThreedAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.original";
        final String RESOURCE = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameThreedAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.java";
        
        final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
        final StringMaker stringMaker = new StringMaker();        
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
        final byte[] byteArray = new byte[16384];
        
        final FileInputStream fileInputStream = new FileInputStream(RESOURCE_ORIGINAL);        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, outputStream, byteArray));

        final Replace replace2 = new Replace(GD_KEY_NAME, camelCaseUtil.getAsCamelCase(this.packageName, stringMaker).toLowerCase());
        final String newFileAsString2 = replace2.all(androidRFileAsString);

        final int size = this.gdResources.playSoundAndroidResourceNameList.size();
        String resource;
        for(int index = 0; index < size; index++) {
            
            resource = (String) this.gdResources.playSoundAndroidResourceNameList.get(index);
            
            resourceStringBuilder.append('\n');
            resourceStringBuilder.append(this.PUBLIC_FINAL_STRING);
            resourceStringBuilder.append(resource);
            resourceStringBuilder.append(this.VALUE_RESOURCE_START);
            resourceStringBuilder.append(resource);
            resourceStringBuilder.append(this.VALUE_RESOURCE_END);
        }

        final Replace replace = new Replace(GD_KEY, this.resourceStringBuilder.toString());
        final String newFileAsString = replace.all(newFileAsString2);

        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + RESOURCE, this, commonStrings.PROCESS));
        
        this.bufferedWriterUtil.overwrite(RESOURCE, newFileAsString);        
    }
    
}

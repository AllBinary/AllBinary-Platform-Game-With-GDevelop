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
public class GDToAllBinaryResourcesGenerator
{
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final GDResources gdResources = GDResources.getInstance();
        
    private final StringMaker resourceStringBuilder = new StringMaker();
    
    private final String GD_KEY = "//GD";
            
    private final String PUBLIC_FINAL_STRING = "    public final String ";
    private final String VALUE_RESOURCE_START = " = \"";
    private final String VALUE_RESOURCE_END = "\";\n";
    
    public GDToAllBinaryResourcesGenerator() {
        resourceStringBuilder.append(GD_KEY);
        resourceStringBuilder.append('\n');
    }
    
    public void processResource(final String nameAsString, final String resourceString) {
        this.gdResources.androidResourceList.add(nameAsString);
        final String name = nameAsString.toUpperCase();
        this.gdResources.resourceNameList.add(name);
        final String resource = resourceString.toLowerCase();
        this.gdResources.resourceList.add(resource);
        resourceStringBuilder.append(this.PUBLIC_FINAL_STRING);
        resourceStringBuilder.append(name);
        resourceStringBuilder.append(this.VALUE_RESOURCE_START);
        resourceStringBuilder.append(resource);
        resourceStringBuilder.append(this.VALUE_RESOURCE_END);
    }
    
    public void process() throws Exception {

        final CommonSeps commonSeps = CommonSeps.getInstance();
        final String TOUCH = "TOUCH";
        
        final String RESOURCE_ORIGINAL = gdToolStrings.ROOT_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDResources.origin";
        final String RESOURCE = gdToolStrings.ROOT_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDResources.java";
        
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
        final byte[] byteArray = new byte[16384];
        
        final FileInputStream fileInputStream = new FileInputStream(RESOURCE_ORIGINAL);        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, outputStream, byteArray));
        
        final String INDENT = "        ";
        resourceStringBuilder.append('\n');
        resourceStringBuilder.append("    public final String[] resourceStringArray = {\n");
        final int size = this.gdResources.resourceNameList.size();
        String name;
        String resource;
        final int size2 = 100;
        for(int index = 0; index < size; index++) {
            name = (String) this.gdResources.resourceNameList.get(index);
            resource = (String) this.gdResources.resourceList.get(index);
            resourceStringBuilder.append(INDENT);
            if(resource.indexOf(".json") >= 0 || resource.indexOf(".t") >= 0) {
                resourceStringBuilder.append("//");
            }
            for(int index2 = 2; index2 < size2; index2++) {
                if(name.endsWith(commonSeps.UNDERSCORE + index2) && name.indexOf(TOUCH) < 0) {
                    resourceStringBuilder.append("//");
                }
            }
            
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

        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + RESOURCE, this, CommonStrings.getInstance().CONSTRUCTOR));
        
        this.bufferedWriterUtil.overwrite(RESOURCE, newFileAsString);        
    }
    
}

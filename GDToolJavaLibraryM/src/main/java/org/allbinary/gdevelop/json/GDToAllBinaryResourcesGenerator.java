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
public class GDToAllBinaryResourcesGenerator
{
    public final BasicArrayList androidResourceList = new BasicArrayList();
    public final BasicArrayList resourceList = new BasicArrayList();
    
    private final StringBuilder resourceStringBuilder = new StringBuilder();
    
    private final String GD_KEY = "//GD";
            
    private final String PUBLIC_FINAL_STRING = "    public final String ";
    private final String VALUE_RESOURCE_START = " = \"";
    private final String VALUE_RESOURCE_END = "\";\n";
    
    public GDToAllBinaryResourcesGenerator() {
        resourceStringBuilder.append(GD_KEY);
        resourceStringBuilder.append('\n');
    }
    
    public void processResource(final String fileAsString, final String resourceString) {
        this.androidResourceList.add(fileAsString);
        final String name = fileAsString.toUpperCase();
        this.resourceList.add(name);
        resourceStringBuilder.append(this.PUBLIC_FINAL_STRING);
        resourceStringBuilder.append(name);
        resourceStringBuilder.append(this.VALUE_RESOURCE_START);
        resourceStringBuilder.append(resourceString);
        resourceStringBuilder.append(this.VALUE_RESOURCE_END);
    }

    public void process() throws Exception {

        final String RESOURCE_ORIGINAL = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDResources.origin";
        final String RESOURCE = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDResources.java";
        
        final StreamUtil streamUtil = StreamUtil.getInstance();
        
        final FileInputStream fileInputStream = new FileInputStream(RESOURCE_ORIGINAL);
        final String androidRFileAsString = streamUtil.getAsString(fileInputStream);
        final Replace replace = new Replace(GD_KEY, this.resourceStringBuilder.toString());
        final String newFileAsString = replace.all(androidRFileAsString);

        final AbFile abFile = new AbFile(RESOURCE);
        if(abFile.exists()) {
            abFile.delete();
        }
        BufferedWriterUtil.write(abFile, newFileAsString);        
    }
    
}

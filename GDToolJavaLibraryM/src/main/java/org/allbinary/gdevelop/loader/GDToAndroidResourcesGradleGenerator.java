/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;


import org.allbinary.data.CamelCaseUtil;
import org.allbinary.gdevelop.json.GDProject;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonSeps;

/**
 *
 * @author User
 */
public class GDToAndroidResourcesGradleGenerator
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();
    
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final GDResources gdResources = GDResources.getInstance();

    private final GDResourceSelection gdResourceSelection = GDResourceSelection.getInstance();

    private final StringMaker resourceStringMaker = new StringMaker();
    
    private final String GD_KEY = "//GD";
    //xsl template parameter for GD_KEY
    private final String GD_PARAMETER = "GD";
            
    private final String PUBLIC_FINAL_STRING = "    public final int ";
    private final String VALUE_RESOURCE_START = " = R.raw.";
    private final String VALUE_RESOURCE_END = ";\n";
    private final String BLANK_LINE = "public final int blank = R.raw.blank;\n";
    private final String BLANK = "blank";

    private final String GD_KEY_NAME = "<name>";
    //xsl template parameter for GD_KEY_NAME
    private final String GD_KEY_NAME_PARAMETER = "name";
    
    private String packageName;
    private boolean isBlank;

    public GDToAndroidResourcesGradleGenerator() {
        this.resourceStringMaker.append(this.GD_KEY);
        this.resourceStringMaker.append(this.commonSeps.NEW_LINE);
    }
    
    public void process(final GDProject gdProject) {
        if(gdProject.packageName != null) {
            this.packageName = gdProject.packageName;
        } else {
            this.packageName = gdProject.name;
        }
    }
    
    public void processResource(final String fileAsString, final String resourceString) {
        final String resource = resourceString.substring(0, resourceString.length() - 4).toLowerCase();
        
        if(resource.indexOf(this.BLANK) >= 0) {
            this.isBlank = true;
        }
        
        final boolean hasRotationImages = this.gdResourceSelection.hasRotationImages();
        
        this.gdResourceSelection.appendCommentIfNeeded2(resource.toUpperCase(), resource, this.resourceStringMaker, hasRotationImages);
        
        this.resourceStringMaker.append(this.PUBLIC_FINAL_STRING);
        this.resourceStringMaker.append(resource);
        this.resourceStringMaker.append(this.VALUE_RESOURCE_START);
        this.resourceStringMaker.append(resource);
        this.resourceStringMaker.append(this.VALUE_RESOURCE_END);
    }
    
    public void process() throws Exception {

        final String RESOURCE_ORIGINAL = this.gdPaths.getTemplatePath(this.gdPaths.ROOT_PATH + "platform\\android\\GDGameAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.xsl");
        final String RESOURCE = this.gdPaths.getOutputPath(this.gdPaths.GEN_PATH + "platform\\android\\GDGameAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.java");
        
        final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
        final StringMaker stringMaker = new StringMaker();        

        final String name = camelCaseUtil.getAsCamelCase(this.packageName, stringMaker).toLowerCase();

        final int size = this.gdResources.playSoundAndroidResourceNameList.size();
        String resource;
        for(int index = 0; index < size; index++) {
            
            resource = (String) this.gdResources.playSoundAndroidResourceNameList.get(index);
            
            this.resourceStringMaker.append(this.commonSeps.NEW_LINE);
            this.resourceStringMaker.append(this.PUBLIC_FINAL_STRING);
            this.resourceStringMaker.append(resource);
            this.resourceStringMaker.append(this.VALUE_RESOURCE_START);
            this.resourceStringMaker.append(resource);
            this.resourceStringMaker.append(this.VALUE_RESOURCE_END);
        }

        if(!this.isBlank) {
            this.resourceStringMaker.append(this.commonSeps.NEW_LINE);
            this.resourceStringMaker.append(this.BLANK_LINE);
        }
        
        final String newFileAsString = GDTemplateUtil.getInstance().process(RESOURCE_ORIGINAL,
            new String[] {this.GD_KEY_NAME, this.GD_KEY}, new String[] {this.GD_KEY_NAME_PARAMETER, this.GD_PARAMETER}, new String[] {name, this.resourceStringMaker.toString()});

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(RESOURCE).toString(), this, this.commonStrings.PROCESS);
        
        this.bufferedWriterUtil.overwrite(RESOURCE, newFileAsString);        
    }
    
}

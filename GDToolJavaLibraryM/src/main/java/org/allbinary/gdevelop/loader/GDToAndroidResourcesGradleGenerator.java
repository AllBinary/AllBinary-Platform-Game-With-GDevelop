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

    //The template writes each resource, each sound and the blank resource when it is not one of the resources
    private final GDTemplateData templateData = new GDTemplateData();
    private final String RESOURCE = "resource";
    private final String SOUND = "sound";
    private final String BLANK_RESOURCE = "blank";
    private final String[] NAME_ARRAY = {"name"};
    private final String[] RESOURCE_ATTRIBUTE_NAME_ARRAY = {"name", "prefix"};
    private final String[] NO_ATTRIBUTE_ARRAY = {};
    
    private final String BLANK = "blank";

    //xsl template parameter for the package name
    private final String NAME = "name";
    
    private String packageName;
    private boolean isBlank;

    public GDToAndroidResourcesGradleGenerator() {
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
        
        final StringMaker prefixStringMaker = new StringMaker();
        this.gdResourceSelection.appendCommentIfNeeded2(resource.toUpperCase(), resource, prefixStringMaker, hasRotationImages);
        
        this.templateData.add(this.RESOURCE, this.RESOURCE_ATTRIBUTE_NAME_ARRAY, new String[] {resource, prefixStringMaker.toString()});
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
            this.templateData.add(this.SOUND, this.NAME_ARRAY, new String[] {resource});
        }

        if(!this.isBlank) {
            this.templateData.add(this.BLANK_RESOURCE, this.NO_ATTRIBUTE_ARRAY, this.NO_ATTRIBUTE_ARRAY);
        }
        
        final String newFileAsString = GDTemplateUtil.getInstance().process(RESOURCE_ORIGINAL, this.templateData, new String[] {this.NAME}, new String[] {name});

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(RESOURCE).toString(), this, this.commonStrings.PROCESS);
        
        this.bufferedWriterUtil.overwrite(RESOURCE, newFileAsString);        
    }
    
}

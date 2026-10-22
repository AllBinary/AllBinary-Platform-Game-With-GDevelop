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
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

/**
 *
 * @author User
 */
public class GDToThreedAndroidResourcesGradleGenerator
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();
    
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final GDResources gdResources = GDResources.getInstance();
    
    //The template writes each resource (one for each extension), each sound and the blank resource when it is not one of the resources
    private final String RESOURCE = "resource";
    private final String SOUND = "sound";
    private final String BLANK_RESOURCE = "blank";
    private final String[] NAME_ARRAY = {"name"};
    private final String[] RESOURCE_ATTRIBUTE_NAME_ARRAY = {"name", "prefix"};
    private final String[] NO_ATTRIBUTE_ARRAY = {};
    
    //xsl template parameter for the package name
    private final String NAME = "name";

    private final BasicArrayList resourceList = new BasicArrayListD();
    
    private String packageName;
    private boolean isBlank;
    
    public GDToThreedAndroidResourcesGradleGenerator() {
    }
    
    public void process(final GDProject gdProject) {
        if(gdProject.packageName != null) {
            this.packageName = gdProject.packageName;
        } else {
            this.packageName = gdProject.name;
        }
    }
    
    public void processResource(final String fileAsString, final String resourceString) {
        this.resourceList.add(resourceString);
    }

    public void processResource(final BasicArrayList threedFileList, final GDTemplateData templateData) {
        
        final StringUtil stringUtil = StringUtil.getInstance();
        
        final int size = this.resourceList.size();
        String resourceString;
        for(int index = 0; index < size; index++) {
            resourceString = (String) this.resourceList.get(index);
            final int beginIndex = Character.isAlphabetic(resourceString.charAt(0)) ? 0 : 1;
            //logUtil.put("resourceString: " + resourceString, this, commonStrings.PROCESS);
            final String resource = resourceString.substring(beginIndex, resourceString.length() - 4).toLowerCase();

            //Hack - the generation needs to break 3d objects from images.
            final BasicArrayList extensionList = this.gdToolStrings.getExtensions(threedFileList, resource);
            final int size3 = extensionList.size();
            String extension;
            for(int index3 = 0; index3 < size3; index3++) {
                extension = (String) extensionList.get(index3);

                final String prefix = extension == stringUtil.NULL_STRING ? this.commonSeps.COMMENT + this.gdToolStrings.NOT_USED_FOR_THREED_GAMES : stringUtil.EMPTY_STRING;
            
//            if (resource.indexOf(this.gdToolStrings.BUTTON) >= 0 || resource.indexOf(this.gdToolStrings.BLANK) >= 0) {
//                extension = this.stringUtil.EMPTY_STRING;
//            }
//            if(androidResource.indexOf(TOUCH) < 0 && androidResource.indexOf(this.gdToolStrings.BLANK) < 0 && androidResource.indexOf(this.gdToolStrings.BUTTON) < 0) {
//                
//            }

                if (resource.indexOf(this.gdToolStrings.BLANK) >= 0) {
                    this.isBlank = true;
                }

                templateData.add(this.RESOURCE, this.RESOURCE_ATTRIBUTE_NAME_ARRAY, new String[] {resource + extension, prefix});
            }
        }
    }
    
    public void process(final BasicArrayList threedFileList) throws Exception {

        final GDTemplateData templateData = new GDTemplateData();

        this.processResource(threedFileList, templateData);

        final String RESOURCE_ORIGINAL = this.gdPaths.getTemplatePath(this.gdPaths.ROOT_PATH + "platform\\android\\GDGameThreedAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.xsl");
        final String RESOURCE = this.gdPaths.getOutputPath(this.gdPaths.GEN_PATH + "platform\\android\\GDGameThreedAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.java");
        
        final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
        final StringMaker stringMaker = new StringMaker();        

        final String name = camelCaseUtil.getAsCamelCase(this.packageName, stringMaker).toLowerCase();

        final int size = this.gdResources.playSoundAndroidResourceNameList.size();
        String resource;
        for(int index = 0; index < size; index++) {
            resource = (String) this.gdResources.playSoundAndroidResourceNameList.get(index);
            templateData.add(this.SOUND, this.NAME_ARRAY, new String[] {resource});
        }

        if(!this.isBlank) {
            templateData.add(this.BLANK_RESOURCE, this.NO_ATTRIBUTE_ARRAY, this.NO_ATTRIBUTE_ARRAY);
        }

        final String newFileAsString = GDTemplateUtil.getInstance().process(RESOURCE_ORIGINAL, templateData, new String[] {this.NAME}, new String[] {name});

        this.logUtil.putF(this.gdToolStrings.FILENAME + RESOURCE, this, this.commonStrings.PROCESS);
        
        this.bufferedWriterUtil.overwrite(RESOURCE, newFileAsString);        
    }

}

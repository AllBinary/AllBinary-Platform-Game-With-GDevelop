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
    
    private final String GD_KEY = "//GD";
    //xsl template parameter for GD_KEY
    private final String GD_PARAMETER = "GD";
            
    private final String PUBLIC_FINAL_STRING = "    public final int ";
    private final String VALUE_RESOURCE_START = " = R.raw.";
    private final String VALUE_RESOURCE_END = ";\n";
    
    private final String GD_KEY_NAME = "<name>";
    //xsl template parameter for GD_KEY_NAME
    private final String GD_KEY_NAME_PARAMETER = "name";
    
    private final String BLANK_LINE = "public final int blank = R.raw.blank;\n";

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

    public void processResource(final BasicArrayList threedFileList, final StringMaker stringMaker) {
        
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

                if (extension == stringUtil.NULL_STRING) {
                    stringMaker.append(this.commonSeps.COMMENT);
                    stringMaker.append(this.gdToolStrings.NOT_USED_FOR_THREED_GAMES);
                }
            
//            if (resource.indexOf(this.gdToolStrings.BUTTON) >= 0 || resource.indexOf(this.gdToolStrings.BLANK) >= 0) {
//                extension = this.stringUtil.EMPTY_STRING;
//            }
//            if(androidResource.indexOf(TOUCH) < 0 && androidResource.indexOf(this.gdToolStrings.BLANK) < 0 && androidResource.indexOf(this.gdToolStrings.BUTTON) < 0) {
//                
//            }

                if (resource.indexOf(this.gdToolStrings.BLANK) >= 0) {
                    this.isBlank = true;
                }

                stringMaker.append(this.PUBLIC_FINAL_STRING);
                stringMaker.append(resource);

                stringMaker.append(extension);

                stringMaker.append(this.VALUE_RESOURCE_START);
                stringMaker.append(resource);

                stringMaker.append(extension);

                stringMaker.append(this.VALUE_RESOURCE_END);
            }
        }
    }
    
    public void process(final BasicArrayList threedFileList) throws Exception {

        final StringMaker resourceStringMaker = new StringMaker();

        resourceStringMaker.append(this.GD_KEY);
        resourceStringMaker.append(this.commonSeps.NEW_LINE);
        
        this.processResource(threedFileList, resourceStringMaker);

        final String RESOURCE_ORIGINAL = this.gdPaths.getTemplatePath(this.gdPaths.ROOT_PATH + "platform\\android\\GDGameThreedAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.xsl");
        final String RESOURCE = this.gdPaths.getOutputPath(this.gdPaths.GEN_PATH + "platform\\android\\GDGameThreedAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.java");
        
        final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
        final StringMaker stringMaker = new StringMaker();        

        final String name = camelCaseUtil.getAsCamelCase(this.packageName, stringMaker).toLowerCase();

        final int size = this.gdResources.playSoundAndroidResourceNameList.size();
        String resource;
        for(int index = 0; index < size; index++) {
            
            resource = (String) this.gdResources.playSoundAndroidResourceNameList.get(index);
            
            resourceStringMaker.append(this.commonSeps.NEW_LINE);
            resourceStringMaker.append(this.PUBLIC_FINAL_STRING);
            resourceStringMaker.append(resource);
            resourceStringMaker.append(this.VALUE_RESOURCE_START);
            resourceStringMaker.append(resource);
            resourceStringMaker.append(this.VALUE_RESOURCE_END);
        }

        if(!this.isBlank) {
            resourceStringMaker.append(this.commonSeps.NEW_LINE);
            resourceStringMaker.append(this.BLANK_LINE);
        }

        final String newFileAsString = GDTemplateUtil.getInstance().process(RESOURCE_ORIGINAL,
            new String[] {this.GD_KEY_NAME, this.GD_KEY}, new String[] {this.GD_KEY_NAME_PARAMETER, this.GD_PARAMETER}, new String[] {name, resourceStringMaker.toString()});

        this.logUtil.putF(this.gdToolStrings.FILENAME + RESOURCE, this, this.commonStrings.PROCESS);
        
        this.bufferedWriterUtil.overwrite(RESOURCE, newFileAsString);        
    }

}

/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.FileInputStream;

import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.CommonLabels;
import org.allbinary.logic.string.CommonSeps;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;

import org.json.JSONObject;
import org.json.JSONTokener;

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
    
    private final StringMaker resourceStringMaker = new StringMaker();
    
    private final GDResourceSelection gdResourceSelection = GDResourceSelection.getInstance();
    
    private final String GD_KEY = "//GD";
    private final String INDENT = "        ";
    private final String SPACING = "    ";
    
    private final String PUBLIC_FINAL_STRING = "    public final String ";
    private final String VALUE_RESOURCE_START = " = \"";
    private final String VALUE_RESOURCE_END = "\";\n";

    private final String TSJ = ".tsj";
    private final String IMAGE = "image";
    
    public GDToAllBinaryResourcesGenerator() {
        resourceStringMaker.append(GD_KEY);
        resourceStringMaker.append(this.commonSeps.NEW_LINE);
    }
        
    public void processResource(final String nameAsString, final String resourceString) {
        this.gdResources.androidResourceList.add(nameAsString);
        final String name = nameAsString.toUpperCase();
        this.gdResources.resourceNameList.add(name);
        final String resource = resourceString.toLowerCase();
        this.gdResources.resourceList.add(resource);
    }

    public void appendResource(final boolean hasRotationImages, final String name, final String resource) {
        
        this.gdResourceSelection.appendCommentIfNeeded0(name, resource, resourceStringMaker, hasRotationImages);
        
        resourceStringMaker.append(this.PUBLIC_FINAL_STRING);
        resourceStringMaker.append(name);
        resourceStringMaker.append(this.VALUE_RESOURCE_START);
        resourceStringMaker.append(resource);
        resourceStringMaker.append(this.VALUE_RESOURCE_END);
    }
    
    public void appendResources(final boolean hasRotationImages) {

        final int size = this.gdResources.resourceNameList.size();
        for(int index = 0; index < size; index++) {
            this.appendResource(hasRotationImages, (String) this.gdResources.resourceNameList.get(index), (String) this.gdResources.resourceList.get(index));
        }

    }

    private void appendResourceStringArray(final boolean hasRotationImages, final BasicArrayList usedList) {
        resourceStringMaker.append(this.commonSeps.NEW_LINE);
        resourceStringMaker.append("    public final String[] resourceStringArray = {\nBLANK,\n");
        final int size = this.gdResources.resourceNameList.size();
        String name;
        String resource;
        int arrayIndex = 1;
        boolean used;
        for(int index = 0; index < size; index++) {
            name = (String) this.gdResources.resourceNameList.get(index);
            resource = (String) this.gdResources.resourceList.get(index);
            resourceStringMaker.append(INDENT);
            
            used = this.gdResourceSelection.appendCommentIfNeeded(name, resource, resourceStringMaker, hasRotationImages);
            
            resourceStringMaker.append(name);
            resourceStringMaker.append(',');
            
            resourceStringMaker.append(commonSeps.SPACE);
            resourceStringMaker.append(this.commonSeps.COMMENT);

            resourceStringMaker.append(arrayIndex);
            
            resourceStringMaker.append(this.commonSeps.NEW_LINE);
            if(used) {
                usedList.add(name);
                arrayIndex++;
            }
        }
        
        resourceStringMaker.append(SPACING);
        resourceStringMaker.append('}');
        resourceStringMaker.append(';');
        resourceStringMaker.append(this.commonSeps.NEW_LINE);
        resourceStringMaker.append(this.commonSeps.NEW_LINE);
    }

    private void appendResourceWidthArray(final BasicArrayList gdResourceList, final BasicArrayList usedList) {
        resourceStringMaker.append("    public final int[] imageResourceWidthArray = {\n32,\n");
        
        final int size = usedList.size();
        String name;
        GDResource gdResource;
        
        int arrayIndex = 1;
        for(int index = 0; index < size; index++) {
            name = (String) usedList.get(index);
                        
            gdResource = this.getGDResourceForName(name, gdResourceList);
            
            if(gdResource != null) {
                resourceStringMaker.append(INDENT);
                resourceStringMaker.append(gdResource.width);
                resourceStringMaker.append(',');
                resourceStringMaker.append(commonSeps.SPACE);
                resourceStringMaker.append(this.commonSeps.COMMENT);
                resourceStringMaker.append(name);                
                resourceStringMaker.append(commonSeps.SPACE);
                resourceStringMaker.append(arrayIndex);
                resourceStringMaker.append(this.commonSeps.NEW_LINE);
            } else {
                resourceStringMaker.append(-1);
                resourceStringMaker.append(',');
                resourceStringMaker.append(this.commonSeps.COMMENT);
                resourceStringMaker.append(name);
                resourceStringMaker.append(this.commonSeps.NEW_LINE);
            }
            
        }
        
        resourceStringMaker.append(SPACING);
        resourceStringMaker.append('}');
        resourceStringMaker.append(';');
        resourceStringMaker.append(this.commonSeps.NEW_LINE);
        resourceStringMaker.append(this.commonSeps.NEW_LINE);
        arrayIndex++;
    }

    private void appendResourceHeightArray(final BasicArrayList gdResourceList, final BasicArrayList usedList) {
        resourceStringMaker.append("    public final int[] imageResourceHeightArray = {\n32,\n");
        
        final int size = usedList.size();
        String name;
        GDResource gdResource;
        
        int arrayIndex = 1;
        for(int index = 0; index < size; index++) {
            name = (String) usedList.get(index);
                        
            gdResource = this.getGDResourceForName(name, gdResourceList);
            
            if(gdResource != null) {
                resourceStringMaker.append(INDENT);
                resourceStringMaker.append(gdResource.height);
                resourceStringMaker.append(',');
                resourceStringMaker.append(commonSeps.SPACE);
                resourceStringMaker.append(this.commonSeps.COMMENT);
                resourceStringMaker.append(name);                
                resourceStringMaker.append(commonSeps.SPACE);
                resourceStringMaker.append(arrayIndex);
                resourceStringMaker.append(this.commonSeps.NEW_LINE);
            } else {
                resourceStringMaker.append(-1);
                resourceStringMaker.append(',');
                resourceStringMaker.append(this.commonSeps.COMMENT);
                resourceStringMaker.append(name);
                resourceStringMaker.append(this.commonSeps.NEW_LINE);
            }
            
            arrayIndex++;
        }
        
        resourceStringMaker.append(SPACING);
        resourceStringMaker.append('}');
        resourceStringMaker.append(';');
        resourceStringMaker.append(this.commonSeps.NEW_LINE);
        resourceStringMaker.append(this.commonSeps.NEW_LINE);
    }
    
    private GDResource getGDResourceForName(final String name, final BasicArrayList gdResourceList) {
        final int size = gdResourceList.size();
        GDResource gdResource;
        for(int index = 0; index < size; index++) {
            gdResource = (GDResource) gdResourceList.get(index);
            
            if(name.compareTo(gdResource.name) == 0) {
                return gdResource;
            }
        }
        
        return null;
    }

    private final String SLIDER = "_slider_";
    private final String BATTERY = "battery_";
    private final String HEART = "heart_";
    private final String _1 = "_1.";
    private void appendImmediatelyLoadedImages() throws Exception {
        
        resourceStringMaker.append("    public final String[] requiredResourcesBeforeLoadingArray = {\n");
        
        final int size = this.gdResources.resourceNameList.size();
        String resource;
        for(int index = 0; index < size; index++) {
            resource = (String) this.gdResources.resourceList.get(index);
            if(resource.endsWith(TSJ)) {
                
                LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.gdToolStrings.FILENAME).append(resource).toString(), this, commonStrings.PROCESS));
                this.appendImmediatelyLoadedImages(resource);
                
            //PanelSpriteSlider::PanelSpriteSlider -> texture must not lazy load textures                
            } else if(resource.indexOf(SLIDER) >= 0) {
                this.appendImmediatelyLoadedImage(resource);
            } else if(resource.indexOf(BATTERY) >= 0 && resource.contains(_1)) {
                this.appendImmediatelyLoadedImage(resource);
            } else if(resource.indexOf(HEART) >= 0 && resource.contains(_1)) {
                this.appendImmediatelyLoadedImage(resource);
            }
        }
        
        resourceStringMaker.append("    };\n");
    }
    
    private void appendImmediatelyLoadedImages(final String path) throws Exception {
        
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();
        
        final FileInputStream inputStream = new FileInputStream(this.gdToolStrings.RESOURCES_PATH + path);
        sharedBytes.outputStream.reset();
        final String gameAsConfiguration = new String(streamUtil.getByteArray(inputStream, sharedBytes.outputStream, sharedBytes.byteArray));

        final JSONTokener jsonTokener = new JSONTokener(gameAsConfiguration);
        final JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
        final String imagePath = jsonObject.getString(IMAGE);
        
        LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.gdToolStrings.FILENAME).append(imagePath).toString(), this, commonStrings.PROCESS));
        
        this.appendImmediatelyLoadedImage(imagePath);
        
//        final PlatformAssetManager platformAssetManager = PlatformAssetManager.getInstance();
//        final InputStream tileMapInputStream = platformAssetManager.getResourceAsStream(tmj);
//        final int size = tileMapInputStream.available();
//        final InputStream[] tileSetInputStreamArray = {
//
//            platformAssetManager.getResourceAsStream(tsj),
//
//        };
//
//        final int[] sizeArray2 = new int[tileSetInputStreamArray.length];
//        
//        final TiledMap map = TiledMapLoaderFromJSONFactory.getInstance().process(new GDJSONMapReader(), tileMapInputStream, tileSetInputStreamArray, size, sizeArray2, new Image[] {tileSetImage});
//        ((TileSet) map.getTileSets().get(0)).getImageData().path

    }

    private void appendImmediatelyLoadedImage(final String imagePath) {
        final int endIndex = imagePath.lastIndexOf('.');
        final String imageName = imagePath.substring(0, endIndex);
        final String name = imageName.toUpperCase();
        resourceStringMaker.append("gdResources.");
        resourceStringMaker.append(name);
        resourceStringMaker.append(this.commonSeps.COMMA);
        resourceStringMaker.append(this.commonSeps.NEW_LINE);
    }
    
    public BasicArrayList process1() throws Exception {
    
        final boolean hasRotationImages = this.gdResourceSelection.hasRotationImages();
        this.appendResources(hasRotationImages);
        
        timeDelayHelper.setStartTime();
        
        final String RESOURCE_ORIGINAL = gdToolStrings.ROOT_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDResources.origin";
        final String RESOURCE = gdToolStrings.ROOT_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDResources.java";
        
        final StringMaker stringMaker = new StringMaker();
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();
        
        final FileInputStream fileInputStream = new FileInputStream(RESOURCE_ORIGINAL);        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
        
        final BasicArrayList usedList = new BasicArrayList();
        this.appendResourceStringArray(hasRotationImages, usedList);
        
        final Replace replace = new Replace(GD_KEY, this.resourceStringMaker.toString());
        final String newFileAsString = replace.all(androidRFileAsString);

        stringMaker.delete(0, stringMaker.length());
        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + RESOURCE, this, commonStrings.PROCESS));
        
        this.bufferedWriterUtil.overwrite(RESOURCE, newFileAsString);        
        
        stringMaker.delete(0, stringMaker.length());
        LogUtil.put(LogFactory.getInstance(stringMaker.append(CommonLabels.getInstance().ELAPSED).append(this.timeDelayHelper.getElapsed()).toString(), this, commonStrings.PROCESS));
        
        return usedList;
    }

    public void process2(final BasicArrayList usedList) throws Exception {
    
        this.resourceStringMaker.delete(0, this.resourceStringMaker.length());
        resourceStringMaker.append(GD_KEY);
        resourceStringMaker.append(this.commonSeps.NEW_LINE);
        resourceStringMaker.append("final GDResources gdResources = GDResources.getInstance();");
        resourceStringMaker.append(this.commonSeps.NEW_LINE);
        resourceStringMaker.append(this.commonSeps.NEW_LINE);
        
        final GDImageSizeGenerator gdImageSizeGenerator = new GDImageSizeGenerator();
        final BasicArrayList gdResourceList = gdImageSizeGenerator.process();
        
        timeDelayHelper.setStartTime();
        
        final String LAZY_RESOURCE_ORIGINAL = gdToolStrings.ROOT_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDLazyResources.origin";
        final String LAZY_RESOURCE = gdToolStrings.ROOT_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDLazyResources.java";
        
        final StringMaker stringMaker = new StringMaker();
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();
        
        final FileInputStream fileInputStream = new FileInputStream(LAZY_RESOURCE_ORIGINAL);        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
        
        this.appendResourceWidthArray(gdResourceList, usedList);
        this.appendResourceHeightArray(gdResourceList, usedList);
        this.appendImmediatelyLoadedImages();
        
        final Replace replace = new Replace(GD_KEY, this.resourceStringMaker.toString());
        final String newFileAsString = replace.all(androidRFileAsString);

        stringMaker.delete(0, stringMaker.length());
        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + LAZY_RESOURCE, this, commonStrings.PROCESS));
        
        this.bufferedWriterUtil.overwrite(LAZY_RESOURCE, newFileAsString);        
        
        stringMaker.delete(0, stringMaker.length());
        LogUtil.put(LogFactory.getInstance(stringMaker.append(CommonLabels.getInstance().ELAPSED).append(this.timeDelayHelper.getElapsed()).toString(), this, commonStrings.PROCESS));
        
    }
    
    public void process() throws Exception {
        final BasicArrayList usedList = this.process1();
        this.process2(usedList);
    }
}

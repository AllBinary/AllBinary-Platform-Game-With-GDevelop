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
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

import org.json.JSONObject;
import org.json.JSONTokener;

/**
 *
 * @author User
 */
public class GDToAllBinaryResourcesGenerator
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final GDResources gdResources = GDResources.getInstance();

    private final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

    private final GDResourceSelection gdResourceSelection = GDResourceSelection.getInstance();

    //The GDResources template writes each resource and each resource in the array
    private final String RESOURCE = "resource";
    private final String[] RESOURCE_ATTRIBUTE_NAME_ARRAY = {"name", "value", "prefix", "icon"};
    private final String TRUE = "true";
    private final String ARRAY_RESOURCE = "arrayResource";
    private final String[] ARRAY_RESOURCE_ATTRIBUTE_NAME_ARRAY = {"name", "prefix", "index"};

    //The GDLazyResources template writes each image width, image height and required resource
    private final String WIDTH = "width";
    private final String HEIGHT = "height";
    private final String[] SIZE_ATTRIBUTE_NAME_ARRAY = {"name", "value", "index"};
    private final String REQUIRED = "required";
    private final String[] NAME_ARRAY = {"name"};

    private final String TSJ = ".tsj";
    private final String IMAGE = "image";

    private final String DASH_ICON_DASH = "-icon-";
    private final String WINDOWS_ICON = "windowsplashscreenanimatedicon";

    public GDToAllBinaryResourcesGenerator() {
    }

    public void processResource(final String nameAsString, final String resourceString) {
        this.gdResources.androidResourceList.add(nameAsString);
        final String name = nameAsString.toUpperCase();
        this.gdResources.resourceNameList.add(name);
        final String resource = resourceString.toLowerCase();
        this.gdResources.resourceList.add(resource);
    }

    private boolean isIcon(final String resource) {
        return resource.indexOf(this.DASH_ICON_DASH) >= 0 || resource.indexOf(this.WINDOWS_ICON) >= 0;
    }

    public void appendResource(final boolean hasRotationImages, final String name, final String resource, final GDTemplateData templateData) {

        final StringMaker prefixStringMaker = new StringMaker();
        this.gdResourceSelection.appendCommentIfNeeded0(name, resource, prefixStringMaker, hasRotationImages);

        final String icon = this.isIcon(resource) ? this.TRUE : StringUtil.getInstance().EMPTY_STRING;
        templateData.add(this.RESOURCE, this.RESOURCE_ATTRIBUTE_NAME_ARRAY, new String[] {name, resource, prefixStringMaker.toString(), icon});

    }

    public void appendResources(final boolean hasRotationImages, final GDTemplateData templateData) {

        final int size = this.gdResources.resourceNameList.size();
        for(int index = 0; index < size; index++) {
            this.appendResource(hasRotationImages, (String) this.gdResources.resourceNameList.get(index), (String) this.gdResources.resourceList.get(index), templateData);
        }

    }

    private void appendResourceStringArray(final boolean hasRotationImages, final BasicArrayList usedList, final GDTemplateData templateData) {
        final int size = this.gdResources.resourceNameList.size();
        String name;
        String resource;
        int arrayIndex = 1;
        boolean used;
        for(int index = 0; index < size; index++) {
            name = (String) this.gdResources.resourceNameList.get(index);
            resource = (String) this.gdResources.resourceList.get(index);

            if(this.isIcon(resource)) {
            } else {
                final StringMaker prefixStringMaker = new StringMaker();
                used = this.gdResourceSelection.appendCommentIfNeeded(name, resource, prefixStringMaker, hasRotationImages);

                templateData.add(this.ARRAY_RESOURCE, this.ARRAY_RESOURCE_ATTRIBUTE_NAME_ARRAY, new String[] {name, prefixStringMaker.toString(), Integer.toString(arrayIndex)});

                if (used) {
                    usedList.add(name);
                    arrayIndex++;
                }
            }
        }
    }

    private void appendResourceWidthArray(final BasicArrayList gdResourceList, final BasicArrayList usedList, final GDTemplateData templateData) {

        final int size = usedList.size();
        String name;
        GDResource gdResource;

        //The index does not increment for the width array
        final int arrayIndex = 1;
        for(int index = 0; index < size; index++) {
            name = (String) usedList.get(index);

            gdResource = this.getGDResourceForName(name, gdResourceList);

            if(gdResource != null) {
                templateData.add(this.WIDTH, this.SIZE_ATTRIBUTE_NAME_ARRAY, new String[] {name, Integer.toString(gdResource.width), Integer.toString(arrayIndex)});
            } else {
                throw new RuntimeException(name + " not in " + this.listGDResources(gdResourceList));
            }

        }
    }

    private void appendResourceHeightArray(final BasicArrayList gdResourceList, final BasicArrayList usedList, final GDTemplateData templateData) {

        final int size = usedList.size();
        String name;
        GDResource gdResource;

        int arrayIndex = 1;
        for(int index = 0; index < size; index++) {
            name = (String) usedList.get(index);

            gdResource = this.getGDResourceForName(name, gdResourceList);

            if(gdResource != null) {
                templateData.add(this.HEIGHT, this.SIZE_ATTRIBUTE_NAME_ARRAY, new String[] {name, Integer.toString(gdResource.height), Integer.toString(arrayIndex)});
            } else {
                throw new RuntimeException(name);
            }

            arrayIndex++;
        }
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

    private String listGDResources(final BasicArrayList gdResourceList) {
        final StringMaker stringMaker = new StringMaker();
        final int size = gdResourceList.size();
        stringMaker.appendint(size).append(this.commonSeps.COLON);
        GDResource gdResource;
        for(int index = 0; index < size; index++) {
            gdResource = (GDResource) gdResourceList.get(index);

            stringMaker.append(gdResource.name).append(this.commonSeps.COMMA);
        }

        return stringMaker.toString();
    }

    private final String SLIDER = "_slider_";
    private final String BATTERY = "battery_";
    private final String HEART = "heart_";
    private final String _1 = "_1.";
    private final String BUTTON = "button";
    private void appendImmediatelyLoadedImages(final GDTemplateData templateData) throws Exception {

        final int size = this.gdResources.resourceNameList.size();
        String resource;
        for(int index = 0; index < size; index++) {
            resource = (String) this.gdResources.resourceList.get(index);
            if(resource.endsWith(this.TSJ)) {

                this.logUtil.putF(new StringMaker().append(this.gdToolStrings.FILENAME).append(resource).toString(), this, this.commonStrings.PROCESS);
                this.appendImmediatelyLoadedImages(resource, templateData);

            //PanelSpriteSlider::PanelSpriteSlider -> texture must not lazy load textures
            } else if(resource.indexOf(this.BUTTON) >= 0) {
                this.appendImmediatelyLoadedImage(resource, templateData);
            } else if(resource.indexOf(this.SLIDER) >= 0) {
                this.appendImmediatelyLoadedImage(resource, templateData);
            } else if(resource.indexOf(this.BATTERY) >= 0 && resource.contains(this._1)) {
                this.appendImmediatelyLoadedImage(resource, templateData);
            } else if(resource.indexOf(this.HEART) >= 0 && resource.contains(this._1)) {
                this.appendImmediatelyLoadedImage(resource, templateData);
            }
        }
    }

    private void appendImmediatelyLoadedImages(final String path, final GDTemplateData templateData) throws Exception {

        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();

        final FileInputStream inputStream = new FileInputStream(this.gdPaths.TWOD_RESOURCES_PATH + path);
        sharedBytes.outputStream.reset();
        final String gameAsConfiguration = new String(streamUtil.getByteArray(inputStream, sharedBytes.outputStream, sharedBytes.byteArray));

        final JSONTokener jsonTokener = new JSONTokener(gameAsConfiguration);
        final JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
        final String imagePath = jsonObject.getString(this.IMAGE);

        this.logUtil.putF(new StringMaker().append(this.gdToolStrings.FILENAME).append(imagePath).toString(), this, this.commonStrings.PROCESS);

        this.appendImmediatelyLoadedImage(imagePath, templateData);

    }

    private void appendImmediatelyLoadedImage(final String imagePath, final GDTemplateData templateData) {
        final int endIndex = imagePath.lastIndexOf('.');
        final String imageName = imagePath.substring(0, endIndex);
        final String name = imageName.toUpperCase();
        templateData.add(this.REQUIRED, this.NAME_ARRAY, new String[] {name});
    }

    public BasicArrayList process1() throws Exception {

        final StringMaker stringMaker = new StringMaker();

        final GDTemplateData templateData = new GDTemplateData();

        final boolean hasRotationImages = this.gdResourceSelection.hasRotationImages();
        this.appendResources(hasRotationImages, templateData);

        this.timeDelayHelper.setStartTimeTNT();

        final String RESOURCE_ORIGINAL = this.gdPaths.getTemplatePath(this.gdPaths.ROOT_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDResources.xsl");
        final String RESOURCE = this.gdPaths.getOutputPath(this.gdPaths.GEN_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDResources.java");


        final BasicArrayList usedList = new BasicArrayListD();
        this.appendResourceStringArray(hasRotationImages, usedList, templateData);
        final String newFileAsString = GDTemplateUtil.getInstance().process(RESOURCE_ORIGINAL, templateData);

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(RESOURCE).toString(), this, this.commonStrings.PROCESS);

        this.bufferedWriterUtil.overwrite(RESOURCE, newFileAsString);

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().ELAPSED).appendlong(this.timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);

        return usedList;
    }

    public void process2(final BasicArrayList files, final BasicArrayList usedList) throws Exception {

        final StringMaker stringMaker = new StringMaker();
        //this.logUtil.putF(stringMaker.append(this.gdPaths.TWOD_RESOURCES_PATH).appendint(files.size()).toString(), this, this.commonStrings.PROCESS);

        final GDTemplateData templateData = new GDTemplateData();

        final GDImageSizeGenerator gdImageSizeGenerator = new GDImageSizeGenerator();
        final BasicArrayList gdResourceList = gdImageSizeGenerator.process(files);

        this.timeDelayHelper.setStartTimeTNT();

        final String LAZY_RESOURCE_ORIGINAL = this.gdPaths.getTemplatePath(this.gdPaths.ROOT_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDLazyResources.xsl");
        final String LAZY_RESOURCE = this.gdPaths.getOutputPath(this.gdPaths.GEN_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDLazyResources.java");

        stringMaker.delete(0, stringMaker.length());

        this.appendResourceWidthArray(gdResourceList, usedList, templateData);
        this.appendResourceHeightArray(gdResourceList, usedList, templateData);
        this.appendImmediatelyLoadedImages(templateData);
        final String newFileAsString = GDTemplateUtil.getInstance().process(LAZY_RESOURCE_ORIGINAL, templateData);

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(this.gdToolStrings.FILENAME + LAZY_RESOURCE, this, this.commonStrings.PROCESS);

        this.bufferedWriterUtil.overwrite(LAZY_RESOURCE, newFileAsString);

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().ELAPSED).appendlong(this.timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);

    }

    public void process(final BasicArrayList twoDFileList) throws Exception {
        final BasicArrayList usedList = this.process1();
        this.process2(twoDFileList, usedList);
    }
}

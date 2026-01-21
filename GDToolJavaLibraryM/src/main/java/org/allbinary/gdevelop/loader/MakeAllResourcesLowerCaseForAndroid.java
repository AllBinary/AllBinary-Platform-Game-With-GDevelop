/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
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
package org.allbinary.gdevelop.loader;

import org.allbinary.logic.io.file.FileUnamedUtil;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class MakeAllResourcesLowerCaseForAndroid extends GDJSONGeneratorBase {

    private final FileUnamedUtil fileUnamedUtil = FileUnamedUtil.getInstance();

    public MakeAllResourcesLowerCaseForAndroid() {
    }

    private final String TEXTURE = "Texture: ";
    private final String IMAGE = "Image: ";
    
    public void process(final JSONObject gameAsConfigurationJSONObject) throws Exception {
        final JSONObject jsonObject = gameAsConfigurationJSONObject.getJSONObject(this.gdProjectStrings.RESOURCES);
        final JSONArray jsonArray = jsonObject.getJSONArray(this.gdProjectStrings.RESOURCES);
        this.processResources(jsonArray);
        super.process(gameAsConfigurationJSONObject);
    }

    private void processResources(final JSONArray jsonArray) {
        System.out.println("Resource Total: " + jsonArray.length());

        //final int size = jsonArray.length();
        JSONObject jsonObject;
        String value;
        for(int index = 0; index < jsonArray.length(); index++) {
            jsonObject = jsonArray.getJSONObject(index);
            value = jsonObject.getString(this.gdProjectStrings.FILE);
            jsonObject.put(this.gdProjectStrings.FILE, fileUnamedUtil.process(value));
            value = jsonObject.getString(this.gdProjectStrings.NAME);
            jsonObject.put(this.gdProjectStrings.NAME, fileUnamedUtil.process(value));
        }

    }

    private void processObjects(final JSONObject layoutJSONObject) throws Exception {

        final JSONArray jsonArray = layoutJSONObject.getJSONArray(this.gdProjectStrings.OBJECTS);

        System.out.println("Object Total: " + jsonArray.length());
        
        final int size = jsonArray.length();
        JSONObject jsonObject;
        for(int index = 0; index < size; index++) {
            jsonObject = jsonArray.getJSONObject(index);
            //System.out.println(jsonObject.get(this.gdProjectStrings.NAME));
            this.processObject(jsonObject);
        }
    }
    
    public void processObject(final JSONObject jsonObject) throws Exception {
        if (jsonObject.has(this.gdProjectStrings.TEXTURE)) {
            String texture = jsonObject.getString(this.gdProjectStrings.TEXTURE);
            texture = fileUnamedUtil.process(texture);
            System.out.println(this.TEXTURE + texture);
            jsonObject.put(this.gdProjectStrings.TEXTURE, texture);
        }

        if(jsonObject.has(this.gdProjectStrings.ANIMATIONS)) {
            final JSONArray jsonArray = jsonObject.getJSONArray(this.gdProjectStrings.ANIMATIONS);
            this.processAnimations(jsonArray);
        }
    }    
    
    public void processAnimations(final JSONArray jsonArray) throws Exception {
        final int size = jsonArray.length();
        JSONObject jsonObject;
        JSONArray animationsJSONArray;
        for(int index = 0; index < size; index++) {
            jsonObject = jsonArray.getJSONObject(index);
            animationsJSONArray = jsonObject.getJSONArray(this.gdProjectStrings.DIRECTIONS);
            this.processDirections(animationsJSONArray);
        }
    }
    
    public void processDirections(final JSONArray jsonArray) throws Exception {
        final int size = jsonArray.length();
        JSONObject jsonObject;
        JSONArray spritesJSONArray;
        for(int index = 0; index < size; index++) {
            jsonObject = jsonArray.getJSONObject(index);
            spritesJSONArray = jsonObject.getJSONArray(this.gdProjectStrings.SPRITES);
            this.processSprites(spritesJSONArray);
        }
        
    }
        
    public void processSprites(final JSONArray jsonArray) throws Exception {
        final int size = jsonArray.length();
        JSONObject jsonObject;
        for(int index = 0; index < size; index++) {
            jsonObject = jsonArray.getJSONObject(index);
            this.makeResourcesLowercaseForLayout(jsonObject);
        }   
    }

    public void makeResourcesLowercaseForLayout(final JSONObject jsonObject) {
        
        String image = jsonObject.getString(this.gdProjectStrings.IMAGE);
        image = fileUnamedUtil.process(image);
        System.out.println(IMAGE + image);
        jsonObject.put(this.gdProjectStrings.IMAGE, image);
    }

    public void processLayout(final JSONObject jsonObject) throws Exception {
        this.processObjects(jsonObject);
    }
    
    public static void main(String[] args) throws Exception
    {
        final GDJSONPersistence gdJSONPersistence = GDJSONPersistence.getInstance();
        final JSONObject gameAsConfigurationJSONObject = gdJSONPersistence.load();
        
        new MakeAllResourcesLowerCaseForAndroid().process(gameAsConfigurationJSONObject);
        final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
        gdJSONPersistence.save(gdToolStrings.ROOT_PATH + "game_updated.json", gameAsConfigurationJSONObject);
    }
    
}

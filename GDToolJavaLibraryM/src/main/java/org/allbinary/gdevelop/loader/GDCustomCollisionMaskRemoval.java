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

import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDCustomCollisionMaskRemoval extends GDJSONGeneratorBase {
    
    protected final String[] inclusionExclusionArray = {
        "BloodSplatter"
    };
    
    //private final CommonSeps commonSeps = CommonSeps.getInstance();
    
    private final String UPDATE_SPRITE = "Update Sprite: ";
    
    public void process() throws Exception {
        final JSONObject gameAsConfigurationJSONObject = GDJSONPersistence.getInstance().load();
        this.process(gameAsConfigurationJSONObject);
        
        final GDJSONPersistence gdJSONPersistence = GDJSONPersistence.getInstance();
        final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
        gdJSONPersistence.save(gdToolStrings.ROOT_PATH + "game_updated.json", gameAsConfigurationJSONObject);
    }

    public void processLayout(final JSONObject jsonObject) throws Exception {
        final String value = jsonObject.getString(this.gdProjectStrings.NAME);
        if(value.indexOf(LEVEL) >= 0) {
            System.out.println(PROCESSING_LAYOUT + value);
            this.processObjects(jsonObject);
        }
    }
    
    public boolean processObjects(final String name) {
        
        final int size = inclusionExclusionArray.length;
        for(int index = 0; index < size; index++) {
            if(inclusionExclusionArray[index].compareTo(name) == 0) {
                return true;
            }
        }
        return false;
    }
    
    private void processObjects(final JSONObject layoutJSONObject) throws Exception {

        final JSONArray jsonArray = layoutJSONObject.getJSONArray(this.gdProjectStrings.OBJECTS);

        System.out.println("Object Total: " + jsonArray.length());
        
        final int size = jsonArray.length();
        JSONObject jsonObject;
        String type;
        String name;
        for(int index = 0; index < size; index++) {
            jsonObject = jsonArray.getJSONObject(index);
            type = jsonObject.getString(this.gdProjectStrings.TYPE);
            //System.out.println("Type: " + type);
            if(type.compareTo(this.gdProjectStrings.SPRITE) == 0) {
                name = jsonObject.getString(this.gdProjectStrings.NAME);
                if(this.processObjects(name)) {
                    System.out.println(UPDATE_SPRITE + name);
                    this.processSprite(jsonObject);
                }
            } 
//            else {
//                System.out.println("Other Type: " + type);
//            }
        }

//        for(int index = 0; index < jsonArray.length(); index++) {
//            jsonObject = jsonArray.getJSONObject(index);
//            value = jsonObject.getString(this.gdProjectStrings.NAME);
//            System.out.println(value);
//        }
    }
    
    public void processSprite(final JSONObject jsonObject) throws Exception {
        final JSONArray jsonArray = jsonObject.getJSONArray(this.gdProjectStrings.ANIMATIONS);
        this.processAnimations(jsonArray);            
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
        
        //this.gdProjectStrings.CUSTOM_COLLISION_MASK
    }

    public void processSprites(final JSONArray jsonArray) throws Exception {
        final int size = jsonArray.length();
        JSONObject jsonObject;
        for(int index = 0; index < size; index++) {
            jsonObject = jsonArray.getJSONObject(index);
            this.updateSprite(jsonObject);
        }   
    }

    public void updateSprite(final JSONObject jsonObject) throws Exception {
        System.out.println("Remove Mask");
        jsonObject.remove(this.gdProjectStrings.HAS_CUSTOM_COLLISION_MASK);
        jsonObject.remove(this.gdProjectStrings.CUSTOM_COLLISION_MASK);
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        final GDCustomCollisionMaskRemoval gdCustomCollisionMaskRemoval = new GDCustomCollisionMaskRemoval();
        
        gdCustomCollisionMaskRemoval.process();
    }
        
}

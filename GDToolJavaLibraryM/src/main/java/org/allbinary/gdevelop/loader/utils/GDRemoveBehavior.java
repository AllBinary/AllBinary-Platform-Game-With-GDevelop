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
package org.allbinary.gdevelop.loader.utils;

import org.allbinary.gdevelop.json.GDBehavior;
import org.allbinary.gdevelop.json.GDObject;
import org.allbinary.gdevelop.json.GDObjectFactory;
import org.allbinary.gdevelop.loader.GDJSONGeneratorBase;
import org.allbinary.gdevelop.loader.GDJSONPersistence;
import org.allbinary.gdevelop.loader.GDToolStrings;
import org.allbinary.logic.io.file.FileUnamedUtil;
import org.allbinary.util.BasicArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDRemoveBehavior extends GDJSONGeneratorBase {

    private final FileUnamedUtil fileUnamedUtil = FileUnamedUtil.getInstance();

    private final String FIND_BEHAVIOR = "Physics3D::Physics3DBehavior";
        //"PathfindingBehavior::PathfindingBehavior";

    public GDRemoveBehavior() {
    }
    
    public void process(final JSONObject gameAsConfigurationJSONObject) throws Exception {
        final JSONObject jsonObject = gameAsConfigurationJSONObject.getJSONObject(this.gdProjectStrings.RESOURCES);
        super.process(gameAsConfigurationJSONObject);
    }

    private void processObjects(final JSONObject layoutJSONObject) throws Exception {

        final JSONArray jsonArray = layoutJSONObject.getJSONArray(this.gdProjectStrings.OBJECTS);

        System.out.println("Object Total: " + jsonArray.length());
        
        final int size = jsonArray.length();
        JSONObject jsonObject;
        for(int index = 0; index < size; index++) {
            jsonObject = jsonArray.getJSONObject(index);
            //System.out.println(jsonObject.get(this.gdProjectStrings.NAME));
            final GDObject gdObject = GDObjectFactory.getInstance().create(jsonObject);
            if(gdObject.name.indexOf("zombie") >= 0) {
                this.process(gdObject);
            }
        }
    }    

    private void process(final GDObject gdObject) {
        
        final JSONArray behaviorsJSONArray = gdObject.jsonObject.getJSONArray(gdProjectStrings.BEHAVIORS);
        final BasicArrayList behaviorList = gdObject.behaviorContentList;
        final int size = behaviorList.size();
        System.out.println("Behavior Total: " + size);
        boolean found = false;
        for(int index = 0; index < size; index++) {
            GDBehavior gdBehaviorContent = (GDBehavior) behaviorList.get(index);
            //System.out.println("Behavior: " + gdBehaviorContent.jsonObject);
            if(gdBehaviorContent.type.compareTo(FIND_BEHAVIOR) == 0) {
                found = true;
                behaviorsJSONArray.remove(index);
                break;
            } 
        }
        
        if(found) {
            System.out.println("GDObject - Removed Behavior: " + gdObject.name);
        } else {
            
        }
    }

    public void processLayout(final JSONObject jsonObject) throws Exception {
        this.processObjects(jsonObject);
    }
    
    public static void main(String[] args) throws Exception
    {
        final GDJSONPersistence gdJSONPersistence = GDJSONPersistence.getInstance();
        final JSONObject gameAsConfigurationJSONObject = gdJSONPersistence.load();
        
        new GDRemoveBehavior().process(gameAsConfigurationJSONObject);
        final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
        gdJSONPersistence.save(gdToolStrings.ROOT_PATH + "game_updated.json", gameAsConfigurationJSONObject);
    }
    
}

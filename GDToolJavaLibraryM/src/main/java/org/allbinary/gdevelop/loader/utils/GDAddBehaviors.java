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
public class GDAddBehaviors extends GDJSONGeneratorBase {

    private final FileUnamedUtil fileUnamedUtil = FileUnamedUtil.getInstance();

    private final String FIND_BEHAVIOR = "Physics3D::Physics3DBehavior";
    private final String FIND_BEHAVIOR2 = "PathfindingBehavior::PathfindingObstacleBehavior";
        //"PathfindingBehavior::PathfindingBehavior";

    private final String BEHAVIOR2 = "{\n" +
"              \"name\": \"PathfindingObstacle\",\n" +
"              \"type\": \"PathfindingBehavior::PathfindingObstacleBehavior\",\n" +
"              \"cost\": 2,\n" +
"              \"impassable\": true\n" +
"            }";
    private final JSONObject behavior2JSONObject = new JSONObject(BEHAVIOR2);

    private final String BEHAVIOR = "{\n" +
"              \"name\": \"Physics3D\",\n" +
"              \"type\": \"Physics3D::Physics3DBehavior\",\n" +
"              \"object3D\": \"Object3D\",\n" +
"              \"bodyType\": \"Static\",\n" +
"              \"bullet\": false,\n" +
"              \"fixedRotation\": false,\n" +
"              \"shape\": \"Box\",\n" +
"              \"meshShapeResourceName\": \"\",\n" +
"              \"shapeOrientation\": \"Z\",\n" +
"              \"shapeDimensionA\": 0,\n" +
"              \"shapeDimensionB\": 0,\n" +
"              \"shapeDimensionC\": 0,\n" +
"              \"shapeOffsetX\": 0,\n" +
"              \"shapeOffsetY\": 0,\n" +
"              \"shapeOffsetZ\": 0,\n" +
"              \"massCenterOffsetX\": 0,\n" +
"              \"massCenterOffsetY\": 0,\n" +
"              \"massCenterOffsetZ\": 0,\n" +
"              \"massOverride\": 0,\n" +
"              \"density\": 1,\n" +
"              \"friction\": 0.3,\n" +
"              \"restitution\": 0.1,\n" +
"              \"linearDamping\": 0.1,\n" +
"              \"angularDamping\": 0.1,\n" +
"              \"gravityScale\": 1,\n" +
"              \"layers\": 17,\n" +
"              \"masks\": 17\n" +
"            }";
    private final JSONObject behaviorJSONObject = new JSONObject(BEHAVIOR);

    public GDAddBehaviors() {
    }
    
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
            final GDObject gdObject = GDObjectFactory.getInstance().create(jsonObject);
            if(gdObject.name.indexOf("sm_env") >= 0) {
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
        boolean found2 = false;
        for(int index = 0; index < size; index++) {
            GDBehavior gdBehaviorContent = (GDBehavior) behaviorList.get(index);
            //System.out.println("Behavior: " + gdBehaviorContent.jsonObject);
            if(gdBehaviorContent.type.compareTo(FIND_BEHAVIOR) == 0) {
                found = true;
            }
            if(gdBehaviorContent.type.compareTo(FIND_BEHAVIOR2) == 0) {
                found = true;
            }
        }
        
        if(found && found2) {
            //System.out.println("GDObject - Already had the needed Behaviors: " + gdObject.name);
        } else {
            System.out.println("GDObject -Adding Behaviors: " + gdObject.name);
            behaviorsJSONArray.put(behavior2JSONObject);
            behaviorsJSONArray.put(behaviorJSONObject);
        }
    }

    public void processLayout(final JSONObject jsonObject) throws Exception {
        this.processObjects(jsonObject);
    }
    
    public static void main(String[] args) throws Exception
    {
        final GDJSONPersistence gdJSONPersistence = GDJSONPersistence.getInstance();
        final JSONObject gameAsConfigurationJSONObject = gdJSONPersistence.load();
        
        new GDAddBehaviors().process(gameAsConfigurationJSONObject);
        final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
        gdJSONPersistence.save(gdToolStrings.ROOT_PATH + "game_updated.json", gameAsConfigurationJSONObject);
    }
    
}

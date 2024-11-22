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

import org.allbinary.util.BasicArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class ReduceObjectsForTesting extends GDJSONGeneratorBase {
    
    private final BasicArrayList list = new BasicArrayList();
    
    private final String ENEMY = "Enemy";
    private final String ATTACK = "Attack";
    
    private final String ENEMIES = "Enemies";
    private final String PROJECTILES = "Projectiles";

    private final String ENEMY_ARRAY = "enemyArray";
    private final String ENEMY_SIZE2_ARRAY = "enemySize2Array";
    private final String ENEMY_SIZE3_ARRAY = "enemySize3Array";
    
    private final String REMOVING_FROM_OBJECT_GROUP = "Removing from ObjectGroup: ";
    private final String REMOVING_FROM_OBJECTS = "Removing from Objects: ";
    private final String REMOVING_FROM_VARIABLE_ARRAY = "Removing from Variable Array: ";

    public ReduceObjectsForTesting() {
        list.add("AdultRedDragon");
        list.add("Bat");
        list.add("SkeletonWarriorEnemy");
    }

    private boolean contains(final String value) {
        
        final int size = this.list.size();
        for(int index = 0; index < size; index++) {
            if(value.indexOf((String) this.list.get(index)) >= 0) {
                return true;
            }
        }
        
        return false;
    }

    private void reduceObjectsInObjectGroups(final JSONArray jsonArray, final String inclusion) {
        System.out.println("Object Total: " + jsonArray.length());

        //final int size = jsonArray.length();
        JSONObject jsonObject;
        String value;
        for(int index = 0; index < jsonArray.length(); index++) {
            jsonObject = jsonArray.getJSONObject(index);
            value = jsonObject.getString(this.gdProjectStrings.NAME);
            if(this.contains(value)) {
                
            } else if(value.indexOf(inclusion) >= 0) {
                System.out.println(REMOVING_FROM_OBJECT_GROUP + value);
                jsonArray.remove(index);
                index--;
            }
        }
        
//        for(int index = 0; index < jsonArray.length(); index++) {
//            jsonObject = jsonArray.getJSONObject(index);
//            value = jsonObject.getString(this.gdProjectStrings.NAME);
//            System.out.println(value);
//        }
    }
    
    private void reduceObjectGroups(final JSONObject layoutJSONObject) {
        final JSONArray jsonArray = layoutJSONObject.getJSONArray(this.gdProjectStrings.OBJECT_GROUPS);

        final int size = jsonArray.length();
        JSONObject jsonObject;
        for(int index = 0; index < size; index++) {
            jsonObject = jsonArray.getJSONObject(index);
            if(jsonObject.getString(gdProjectStrings.NAME).compareTo(ENEMIES) == 0) {
                this.reduceObjectsInObjectGroups(jsonObject.getJSONArray(this.gdProjectStrings.OBJECTS), ENEMY);
            } else if(jsonObject.getString(gdProjectStrings.NAME).compareTo(PROJECTILES) == 0) {
                this.reduceObjectsInObjectGroups(jsonObject.getJSONArray(this.gdProjectStrings.OBJECTS), ATTACK);
            }
        }
    }

    private void reduceVariableArray(final JSONArray jsonArray) {
//        System.out.println(jsonArray.length());
        //final int size = jsonArray.length();
        JSONObject jsonObject;
        String value;
        for(int index = 0; index < jsonArray.length(); index++) {
            jsonObject = jsonArray.getJSONObject(index);
            value = jsonObject.getString(this.gdProjectStrings.VALUE);
            if(this.contains(value)) {

            } else {
                System.out.println(REMOVING_FROM_VARIABLE_ARRAY + value);
                jsonArray.remove(index);
                index--;
            }
        }
        System.out.println(jsonArray.length());
//        for(int index = 0; index < jsonArray.length(); index++) {
//            jsonObject = jsonArray.getJSONObject(index);
//            value = jsonObject.getString(this.gdProjectStrings.NAME);
//            System.out.println(value);
//        }
    }
        
    private void reduceObjects(final JSONObject layoutJSONObject) {

        final JSONArray jsonArray = layoutJSONObject.getJSONArray(this.gdProjectStrings.OBJECTS);

//        System.out.println(jsonArray.length());
        
        //final int size = jsonArray.length();
        JSONObject jsonObject;
        String value;
        for(int index = 0; index < jsonArray.length(); index++) {
            jsonObject = jsonArray.getJSONObject(index);
            value = jsonObject.getString(this.gdProjectStrings.NAME);
            if(this.contains(value)) {
                
            } else if(value.indexOf(ENEMY) >= 0 || value.indexOf(ATTACK) >= 0) {
                System.out.println(REMOVING_FROM_OBJECTS + value);
                jsonArray.remove(index);
                index--;
            }
        }
        System.out.println(jsonArray.length());
//        for(int index = 0; index < jsonArray.length(); index++) {
//            jsonObject = jsonArray.getJSONObject(index);
//            value = jsonObject.getString(this.gdProjectStrings.NAME);
//            System.out.println(value);
//        }
    }

    private void reduceVariables(final JSONObject layoutJSONObject) {
        final JSONArray jsonArray = layoutJSONObject.getJSONArray(this.gdProjectStrings.VARIABLES);

        final int size = jsonArray.length();
        JSONObject jsonObject;
        for(int index = 0; index < size; index++) {
            jsonObject = jsonArray.getJSONObject(index);
            if(jsonObject.getString(gdProjectStrings.NAME).compareTo(this.ENEMY_ARRAY) == 0) {
                this.reduceVariableArray(jsonObject.getJSONArray(this.gdProjectStrings.CHILDREN));
            } else if(jsonObject.getString(gdProjectStrings.NAME).compareTo(this.ENEMY_SIZE2_ARRAY) == 0) {
                this.reduceVariableArray(jsonObject.getJSONArray(this.gdProjectStrings.CHILDREN));
            } else if(jsonObject.getString(gdProjectStrings.NAME).compareTo(this.ENEMY_SIZE3_ARRAY) == 0) {
                this.reduceVariableArray(jsonObject.getJSONArray(this.gdProjectStrings.CHILDREN));
            }
        }
    }

    public void processLayout(final JSONObject jsonObject) {
        this.reduceObjectGroups(jsonObject);
        this.reduceObjects(jsonObject);
        this.reduceVariables(jsonObject);
    }

}

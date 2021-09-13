/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json;

import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDObject
{
    public final String type;
    public final String name;
    public final String tags;
    
    public final BasicArrayList variableList = new BasicArrayList();
    
    public final BasicArrayList effectsList = new BasicArrayList();
    public final BasicArrayList behaviorContentList = new BasicArrayList();
    
    public GDObject(final String type, final JSONObject jsonObject) {
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();

        this.type = type;
        this.name = jsonObject.getString(gdProjectStrings.NAME);
        this.tags = jsonObject.getString(gdProjectStrings.TAGS);
        
        final JSONArray variableJSONArray = jsonObject.getJSONArray(gdProjectStrings.VARIABLES);
        int size = variableJSONArray.length();
        for(int index = 0; index < size; index++) {
            this.variableList.add(new GDVariable(variableJSONArray.getJSONObject(index)));
        }        
        
        final JSONArray effectsJSONArray = jsonObject.getJSONArray(gdProjectStrings.EFFECTS);
        size = effectsJSONArray.length();
        for(int index = 0; index < size; index++) {
            this.effectsList.add(new GDEffect(effectsJSONArray.getJSONObject(index)));
        }        

        final JSONArray behaviorsJSONArray = jsonObject.getJSONArray(gdProjectStrings.BEHAVIORS);
        size = behaviorsJSONArray.length();
        for(int index = 0; index < size; index++) {
            this.behaviorContentList.add(new GDBehaviorContent(behaviorsJSONArray.getJSONObject(index)));
        }        
        
    }
    
}

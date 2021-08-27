/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
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
    
    public GDObject(final JSONObject jsonObject) {
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        this.type = jsonObject.getString(gdProjectStrings.TYPE);
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

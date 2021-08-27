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
package org.allbinary.gdevelop.json.event.builtin;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.gdevelop.json.event.GDEvent;
import org.allbinary.gdevelop.json.event.GDInstruction;
import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDStandardEvent extends GDEvent
{
    public final BasicArrayList conditionList = new BasicArrayList();
    public final BasicArrayList actionList = new BasicArrayList();
    public final BasicArrayList eventList = new BasicArrayList();
    
    public GDStandardEvent(final String type, final JSONObject jsonObject) {
        super(type, jsonObject);
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        final GDEventFactory eventFactory = GDEventFactory.getInstance();
 
        final JSONArray conditionJSONArray = jsonObject.getJSONArray(gdProjectStrings.CONDITIIONS);
        int size = conditionJSONArray.length();
        JSONObject nextJSONObject;
        for(int index = 0; index < size; index++) {
            nextJSONObject = conditionJSONArray.getJSONObject(index);
            this.conditionList.add(new GDInstruction(nextJSONObject));
        }

        final JSONArray actionJSONArray = jsonObject.getJSONArray(gdProjectStrings.ACTIONS);
        size = actionJSONArray.length();
        for(int index = 0; index < size; index++) {
            nextJSONObject = actionJSONArray.getJSONObject(index);
            this.actionList.add(new GDInstruction(nextJSONObject));
        }

        final JSONArray eventJSONArray = jsonObject.getJSONArray(gdProjectStrings.EVENTS);
        size = eventJSONArray.length();
        for(int index = 0; index < size; index++) {
            nextJSONObject = eventJSONArray.getJSONObject(index);
            this.eventList.add(eventFactory.create(nextJSONObject));
        }        
        
    }
}

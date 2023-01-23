/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json.event.builtin;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.gdevelop.json.event.GDEvent;
import org.allbinary.gdevelop.json.event.GDInstruction;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
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

        //Optional
        if(jsonObject.has(gdProjectStrings.EVENTS)) {            
            final JSONArray eventJSONArray = jsonObject.getJSONArray(gdProjectStrings.EVENTS);
            size = eventJSONArray.length();
            for (int index = 0; index < size; index++) {
                nextJSONObject = eventJSONArray.getJSONObject(index);
                this.eventList.add(eventFactory.create(nextJSONObject));
            }
        }
        
    }
}

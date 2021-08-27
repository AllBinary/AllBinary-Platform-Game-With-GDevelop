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
import org.allbinary.gdevelop.json.event.GDExpression;
import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDGroupEvent extends GDEvent
{
    public final String name;
    public final String source;
    
    public final int creationTime; // = 0;
    
    public final int colorR; // = 74;
    public final int colorG; // = 176;
    public final int colorB; // = 228;
    
    public final BasicArrayList parametersExpressionList = new BasicArrayList();
    public final BasicArrayList eventList = new BasicArrayList();
    
    public GDGroupEvent(final String type, final JSONObject jsonObject) {
        super(type, jsonObject);
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        final GDEventFactory eventFactory = GDEventFactory.getInstance();

        this.name = jsonObject.getString(gdProjectStrings.NAME);
        this.source = jsonObject.getString(gdProjectStrings.SOURCE);
        this.creationTime = jsonObject.getInt(gdProjectStrings.CREATION_TIME);
        this.colorR = jsonObject.getInt(gdProjectStrings.COLOR_R);
        this.colorG = jsonObject.getInt(gdProjectStrings.COLOR_G);
        this.colorB = jsonObject.getInt(gdProjectStrings.COLOR_B);
        
        final JSONArray expressionJSONArray = jsonObject.getJSONArray(gdProjectStrings.PARAMETERS);
        int size = expressionJSONArray.length();
        JSONObject nextJSONObject;
        for(int index = 0; index < size; index++) {
            this.parametersExpressionList.add(new GDExpression(expressionJSONArray.getString(index)));
        }        
  
        final JSONArray eventJSONArray = jsonObject.getJSONArray(gdProjectStrings.EVENTS);
        size = eventJSONArray.length();
        for(int index = 0; index < size; index++) {
            nextJSONObject = eventJSONArray.getJSONObject(index);
            this.eventList.add(eventFactory.create(nextJSONObject));
        }        
        
    }
}

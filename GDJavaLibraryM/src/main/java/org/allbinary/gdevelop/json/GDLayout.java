/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json;

import org.allbinary.gdevelop.json.event.GDEvent;
import org.allbinary.gdevelop.json.event.builtin.GDEventFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorUtil;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.basic.string.StringUtil;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDLayout
{
    public final String name;
    public final BasicColor basicColor;
    public final String title;

    public final double oglFOV;
    public final double oglZNear;
    public final double oglZFar;

    public final boolean standardSortMethod;
    public final boolean stopSoundsOnStartup;
    public final boolean disableInputWhenNotFocused;

    public final BasicArrayList objectList = new BasicArrayList();
    public final BasicArrayList initialInstanceList = new BasicArrayList();
    public final BasicArrayList layerList = new BasicArrayList();
    
    private final BasicArrayList variableList = new BasicArrayList();
    
    public final BasicArrayList behaviorContentList = new BasicArrayList();
    
    public final BasicArrayList eventList = new BasicArrayList();
    
    public GDLayout(final JSONObject jsonObject) {
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        this.name = jsonObject.getString(gdProjectStrings.NAME);
        
        this.basicColor = new BasicColor(BasicColorUtil.getInstance().ALPHA, 
                jsonObject.getInt(gdProjectStrings.R),
                jsonObject.getInt(gdProjectStrings.G_V),
                jsonObject.getInt(gdProjectStrings.B),
                        this.name);

        if(jsonObject.has(gdProjectStrings.TITLE)) {
            this.title = jsonObject.getString(gdProjectStrings.TITLE);
        } else {
            this.title = StringUtil.getInstance().EMPTY_STRING;
        }
        
        
        this.oglFOV = jsonObject.getDouble(gdProjectStrings.OGL_FOV);
        this.oglZFar = jsonObject.getDouble(gdProjectStrings.OGL_Z_FAR);
        this.oglZNear = jsonObject.getDouble(gdProjectStrings.OGL_Z_NEAR);

        this.standardSortMethod = jsonObject.getBoolean(gdProjectStrings.STANDARD_SORT_METHOD);
        this.stopSoundsOnStartup = jsonObject.getBoolean(gdProjectStrings.STOP_SOUNDS_ON_STARTUP);
        this.disableInputWhenNotFocused = jsonObject.getBoolean(gdProjectStrings.DISABLE_INPUT_WHEN_NOT_FOCUSED);
        
        final GDObjectFactory objectFactory = GDObjectFactory.getInstance();
        
        final JSONArray objectJSONArray = jsonObject.getJSONArray(gdProjectStrings.OBJECTS);
        int size = objectJSONArray.length();
        JSONObject nextJSONObject;
        for(int index = 0; index < size; index++) {
            nextJSONObject = objectJSONArray.getJSONObject(index);
            this.objectList.add(objectFactory.create(nextJSONObject));
        }
        
        final JSONArray initialInstancesJSONArray = jsonObject.getJSONArray(gdProjectStrings.INSTANCES);
        size = initialInstancesJSONArray.length();
        for(int index = 0; index < size; index++) {
            nextJSONObject = initialInstancesJSONArray.getJSONObject(index);
            this.initialInstanceList.add(new GDInitialInstance(nextJSONObject));
        }
        
        final JSONArray variableJSONArray = jsonObject.getJSONArray(gdProjectStrings.VARIABLES);
        size = variableJSONArray.length();
        for(int index = 0; index < size; index++) {
            this.variableList.add(new GDVariable(variableJSONArray.getJSONObject(index)));
        }

        final JSONArray layersJSONArray = jsonObject.getJSONArray(gdProjectStrings.LAYERS);
        size = layersJSONArray.length();
        for(int index = 0; index < size; index++) {
            nextJSONObject = layersJSONArray.getJSONObject(index);
            this.layerList.add(new GDLayer(nextJSONObject));
        }

        final JSONArray behaviorsJSONArray = jsonObject.getJSONArray(gdProjectStrings.BEHAVIORS_SHARED_DATA);
        size = behaviorsJSONArray.length();
        for(int index = 0; index < size; index++) {
            nextJSONObject = behaviorsJSONArray.getJSONObject(index);
            this.behaviorContentList.add(new GDBehaviorContent(nextJSONObject));
        }
        
        final GDEventFactory eventFactory = GDEventFactory.getInstance();
        final JSONArray eventJSONArray = jsonObject.getJSONArray(gdProjectStrings.EVENTS);
        size = eventJSONArray.length();
        GDEvent event;
        for(int index = 0; index < size; index++) {
            event = eventFactory.create(eventJSONArray.getJSONObject(index));
            if(event != null) {
                this.eventList.add(event);
            } else {
                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, new Exception()));
            }
        }        
        
    }
}

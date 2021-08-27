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

import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorUtil;
import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDLayer
{
    public final String name;
    
    public final boolean isVisible;
    public final boolean isLightingLayer;
    public final boolean followBaseLayerCamera;

    public final BasicColor ambientLightBasicColor;

    public final BasicArrayList cameraList = new BasicArrayList();
    public final BasicArrayList effectsList = new BasicArrayList();
    
    public GDLayer(final JSONObject jsonObject) {
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        if(jsonObject.has(gdProjectStrings.NAME)) {
            this.name = jsonObject.getString(gdProjectStrings.NAME);
        } else {
            this.name = Integer.toHexString(hashCode());
        }
        
        if(jsonObject.has(gdProjectStrings.VISIBILITY)) {
            this.isVisible = jsonObject.getBoolean(gdProjectStrings.VISIBILITY);
        } else {
            this.isVisible = false;
        }
        
        if(jsonObject.has(gdProjectStrings.VISIBILITY)) {
            this.isLightingLayer = jsonObject.getBoolean(gdProjectStrings.IS_LIGHTING_LAYER);
        } else {
            this.isLightingLayer = false;
        }
        
        if(jsonObject.has(gdProjectStrings.FOLLOW_BASE_LAYER_CAMERA)) {
            this.followBaseLayerCamera = jsonObject.getBoolean(gdProjectStrings.FOLLOW_BASE_LAYER_CAMERA);
        } else {
            this.followBaseLayerCamera = false;
        }

        if(jsonObject.has(gdProjectStrings.AMBIENT_LIGHT_COLOR_R)) {
            this.ambientLightBasicColor = new BasicColor(BasicColorUtil.getInstance().ALPHA, 
                jsonObject.getInt(gdProjectStrings.AMBIENT_LIGHT_COLOR_R),
                jsonObject.getInt(gdProjectStrings.AMBIENT_LIGHT_COLOR_G),
                jsonObject.getInt(gdProjectStrings.AMBIENT_LIGHT_COLOR_B),
                        this.name);
        } else {
            this.ambientLightBasicColor = null;
        }
       
        if(jsonObject.has(gdProjectStrings.CAMERAS)) {
            final JSONArray camerasJSONArray = jsonObject.getJSONArray(gdProjectStrings.CAMERAS);
            int size = camerasJSONArray.length();
            JSONObject nextJSONObject;
            for (int index = 0; index < size; index++)
            {
                nextJSONObject = camerasJSONArray.getJSONObject(index);
                this.cameraList.add(new GDLayer(nextJSONObject));
            }
        }
    }
}

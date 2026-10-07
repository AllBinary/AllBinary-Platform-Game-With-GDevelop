/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json;

import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.BasicColorUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
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

    public final BasicArrayList cameraList = new BasicArrayListD();
    public final BasicArrayList effectsList = new BasicArrayListD();
    
    public GDLayer(final JSONObject jsonObject) {
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        String name;
        if(jsonObject.has(gdProjectStrings.NAME)) {
            name = jsonObject.getString(gdProjectStrings.NAME);
        } else {
            name = Integer.toHexString(this.hashCode());
        }
        this.name = name;
        
        boolean isVisible;
        if(jsonObject.has(gdProjectStrings.VISIBILITY)) {
            isVisible = jsonObject.getBoolean(gdProjectStrings.VISIBILITY);
        } else {
            isVisible = false;
        }
        this.isVisible = isVisible;
        
        boolean isLightingLayer;
        if(jsonObject.has(gdProjectStrings.VISIBILITY)) {
            isLightingLayer = jsonObject.getBoolean(gdProjectStrings.IS_LIGHTING_LAYER);
        } else {
            isLightingLayer = false;
        }
        this.isLightingLayer = isLightingLayer;
        
        boolean followBaseLayerCamera;
        if (jsonObject.has(gdProjectStrings.FOLLOW_BASE_LAYER_CAMERA)) {
            followBaseLayerCamera = jsonObject.getBoolean(gdProjectStrings.FOLLOW_BASE_LAYER_CAMERA);
        } else {
            followBaseLayerCamera = false;
        }
        this.followBaseLayerCamera = followBaseLayerCamera;

        final BasicColor ambientLightBasicColor;
        if (jsonObject.has(gdProjectStrings.AMBIENT_LIGHT_COLOR_R)) {
            ambientLightBasicColor = BasicColorFactory.getInstance().createInstanceARGB(BasicColorUtil.getInstance().ALPHA,
                jsonObject.getInt(gdProjectStrings.AMBIENT_LIGHT_COLOR_R),
                jsonObject.getInt(gdProjectStrings.AMBIENT_LIGHT_COLOR_G),
                jsonObject.getInt(gdProjectStrings.AMBIENT_LIGHT_COLOR_B),
                this.name);
        } else {
            ambientLightBasicColor = BasicColorFactory.getInstance().BLACK;
        }
        this.ambientLightBasicColor = ambientLightBasicColor;
           
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

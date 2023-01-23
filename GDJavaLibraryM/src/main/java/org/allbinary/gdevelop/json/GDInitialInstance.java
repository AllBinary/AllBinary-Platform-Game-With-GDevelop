/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json;

import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDInitialInstance
{

    public final HashMap<String, Double> numberPropertiesMap = new HashMap();
    public final HashMap<String, String> stringPropertiesMap = new HashMap();

    public final String name;
    public final double x;
    public final double y;
    public final double angle;
    public final int zOrder;
    public final String layer;
    public final boolean personalizedSize;
    public final double width;
    public final double height;

    public final BasicArrayList initialVariableList = new BasicArrayList();
    //public final boolean locked;
    public final String persistentUuid;

    public GDInitialInstance(final JSONObject jsonObject)
    {
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        this.name = jsonObject.getString(gdProjectStrings.NAME);

        this.x = jsonObject.getDouble(gdProjectStrings.X);
        this.y = jsonObject.getDouble(gdProjectStrings.Y);
        
        this.angle = jsonObject.getDouble(gdProjectStrings.ANGLE);
        
        this.zOrder = jsonObject.getInt(gdProjectStrings.Z_ORDER);

        this.personalizedSize = jsonObject.getBoolean(gdProjectStrings.CUSTOM_SIZE);
        
        this.layer = jsonObject.getString(gdProjectStrings.LAYER);
        
        this.width = jsonObject.getDouble(gdProjectStrings.WIDTH);
        this.height = jsonObject.getDouble(gdProjectStrings.HEIGHT);
        
        //this.locked = jsonObject.getBoolean(gdProjectStrings.LOCKED);
        
        this.persistentUuid = jsonObject.getString(gdProjectStrings.PERSISTED_UUID);
        
        final JSONArray numberPropertiesJSONArray = jsonObject.getJSONArray(gdProjectStrings.NUMBER_PROPERTIES);
        int size = numberPropertiesJSONArray.length();
        JSONObject nextJSONObject;
        String name;
        Double valueAsDouble;
        for(int index = 0; index < size; index++) {
            nextJSONObject = numberPropertiesJSONArray.getJSONObject(index);
            name = nextJSONObject.getString(gdProjectStrings.NAME);
            valueAsDouble = nextJSONObject.getDouble(gdProjectStrings.VALUE);
            this.numberPropertiesMap.put(name, valueAsDouble);
        }

        final JSONArray stringPropertiesJSONArray = jsonObject.getJSONArray(gdProjectStrings.STRING_PROPERTIES);
        size = stringPropertiesJSONArray.length();
        String value;
        for(int index = 0; index < size; index++) {
            nextJSONObject = stringPropertiesJSONArray.getJSONObject(index);
            name = nextJSONObject.getString(gdProjectStrings.NAME);
            value = nextJSONObject.getString(gdProjectStrings.VALUE);
            this.stringPropertiesMap.put(name, value);
        }
                
        final JSONArray variableJSONArray = jsonObject.getJSONArray(gdProjectStrings.INITIAL_VARIABLE);        
        size = variableJSONArray.length();
        for(int index = 0; index < size; index++) {
            this.initialVariableList.add(new GDVariable(variableJSONArray.getJSONObject(index)));
        }
    }
}

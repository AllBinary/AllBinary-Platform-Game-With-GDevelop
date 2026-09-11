/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json;

import org.allbinary.util.ABHashMap;

import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDEffect
{
    public final String name;
    
    public final String effectType;
    
    public final ABHashMap<String, Double> doubleParameterMap = new ABHashMap<String, Double>();
    public final ABHashMap<String, String> stringParameterMap = new ABHashMap<String, String>();
    public final ABHashMap<String, Boolean> booleanParameterMap = new ABHashMap<String, Boolean>();
    
    public GDEffect(final JSONObject jsonObject) {
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        this.name = jsonObject.getString(gdProjectStrings.NAME);
        
        this.effectType = jsonObject.getString(gdProjectStrings.EFFECT_TYPE);
        
        //final JSONObject doubleParameterJSONObject = jsonObject.getJSONObject(gdProjectStrings.DOUBLE_PARAMETERS);
        //this.doubleParameterMap.put();
        
        //final JSONObject stringParameterJSONObject = jsonObject.getJSONObject(gdProjectStrings.STRING_PARAMETERS);
        //this.stringParameterMap.put();
        
        //final JSONObject booleanParameterJSONObject = jsonObject.getJSONObject(gdProjectStrings.BOOLEAN_PARAMETERS);
        //this.booleanParameterMap.put();
    }

}

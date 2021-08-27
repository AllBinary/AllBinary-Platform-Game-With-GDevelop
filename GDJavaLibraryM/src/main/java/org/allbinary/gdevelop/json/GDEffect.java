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

import java.util.HashMap;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDEffect
{
    public final String name;
    
    public final String effectType;
    
    public final HashMap<String, Double> doubleParameterMap = new HashMap();
    public final HashMap<String, String> stringParameterMap = new HashMap();
    public final HashMap<String, Boolean> booleanParameterMap = new HashMap();
    
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

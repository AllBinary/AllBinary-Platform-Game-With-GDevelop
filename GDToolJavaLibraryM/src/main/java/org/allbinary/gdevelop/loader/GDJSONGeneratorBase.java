/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
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
package org.allbinary.gdevelop.loader;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDJSONGeneratorBase {
    
    protected final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
    
    private final String LEVEL = "Level";
    
    private final String LAYOUT = "Layout: ";
    
    private final String REMOVING_FROM_LAYOUT = "Removing from Layout: ";
    
    public void processLayout(final JSONObject jsonObject) {
        
    }
    
    public void process(final JSONObject gameAsConfigurationJSONObject) {
        
        final JSONArray jsonArray = gameAsConfigurationJSONObject.getJSONArray(gdProjectStrings.LAYOUTS);
        
        final int size = jsonArray.length();
        JSONObject jsonObject;
        String value;
        for(int index = 0; index < size; index++) {
            jsonObject = jsonArray.getJSONObject(index);
            value = jsonObject.getString(this.gdProjectStrings.NAME);
            System.out.println(LAYOUT + value);
            if(value.indexOf(LEVEL) >= 0) {
                System.out.println(REMOVING_FROM_LAYOUT + value);
                this.processLayout(jsonObject);
            }
        }
        
    }
    
}

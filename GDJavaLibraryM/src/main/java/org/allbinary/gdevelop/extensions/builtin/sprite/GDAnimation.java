/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.extensions.builtin.sprite;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDAnimation
{
    public final String name;
    public final boolean useMultipleDirections;
    
    public final BasicArrayList directionList = new BasicArrayList();
    
    public GDAnimation(final JSONObject jsonObject) {
     
        final GDProjectStrings projectStrings = GDProjectStrings.getInstance();
        
        this.name = jsonObject.getString(projectStrings.NAME);
        this.useMultipleDirections = jsonObject.getBoolean(projectStrings.USE_MULTIPLE_DIRECTIONS);
        
        final JSONArray jsonArray = jsonObject.getJSONArray(projectStrings.DIRECTIONS);
        final int size = jsonArray.length();
        for(int index = 0; index < size; index++) {
            this.directionList.add(new GDDirection(jsonArray.getJSONObject(index)));
        }
    }

}

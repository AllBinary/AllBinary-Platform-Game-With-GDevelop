/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.extensions.builtin.sprite;

import org.allbinary.gdevelop.json.GDObject;
import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDSpriteObject extends GDObject
{
    private final BasicArrayList animationList = new BasicArrayList();
    
    public GDSpriteObject(final String type, final JSONObject jsonObject) {
        super(type, jsonObject);
        
        final GDProjectStrings projectStrings = GDProjectStrings.getInstance();
        
        final JSONArray jsonArray = jsonObject.getJSONArray(projectStrings.ANIMATIONS);
        final int size = jsonArray.length();
        for(int index = 0; index < size; index++) {
            this.animationList.add(new GDAnimation(jsonArray.getJSONObject(index)));
        }        
    }
}

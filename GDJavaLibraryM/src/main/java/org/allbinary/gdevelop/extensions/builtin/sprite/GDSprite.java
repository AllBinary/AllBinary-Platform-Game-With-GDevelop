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
public class GDSprite
{
    public final boolean hasCustomCollisionMask;
    public final String imageAsString;

    public final BasicArrayList pointList = new BasicArrayList();
    public final GDPoint originPoint;
    public final GDPoint centerPoint;
    
    public final BasicArrayList polygon2dList = new BasicArrayList();
    
    public GDSprite(final JSONObject jsonObject) {
        final GDProjectStrings projectStrings = GDProjectStrings.getInstance();
        
        this.hasCustomCollisionMask = jsonObject.getBoolean(projectStrings.HAS_CUSTOM_COLLISION_MASK);
        this.imageAsString = jsonObject.getString(projectStrings.IMAGE);
        
        final JSONArray jsonArray = jsonObject.getJSONArray(projectStrings.POINTS);
        final int size = jsonArray.length();
        for(int index = 0; index < size; index++) {
            this.pointList.add(new GDPoint(jsonArray.getJSONObject(index)));
        }

        this.originPoint = new GDPoint(jsonObject.getJSONObject(projectStrings.ORIGIN_POINTS));
        
        this.centerPoint = new GDPoint(jsonObject.getJSONObject(projectStrings.CENTER_POINTS));
        
        final JSONArray polygon2dJSONArray = jsonObject.getJSONArray(projectStrings.CUSTOM_COLLISION_MASK);
        final int size2 = polygon2dJSONArray.length();
        for(int index = 0; index < size2; index++) {
            this.polygon2dList.add(new GDPolygon2d(polygon2dJSONArray.getJSONArray(index)));
        }        
    }
    
}

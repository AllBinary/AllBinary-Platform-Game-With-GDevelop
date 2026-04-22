/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.extensions.builtin.sprite;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.graphics.PointFactory;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDPolygon2d
{
    public final BasicArrayList pointList = new BasicArrayListD();
    
    public GDPolygon2d(final JSONArray jsonArray) {
        
        final PointFactory pointFactory = PointFactory.getInstance();
        final GDProjectStrings projectStrings = GDProjectStrings.getInstance();
        
        final int size = jsonArray.length();
        JSONObject jsonObject;
        for(int index = 0; index < size; index++) {
            jsonObject = jsonArray.getJSONObject(index);
            this.pointList.add(pointFactory.getInstance0(jsonObject.getInt(projectStrings.X), jsonObject.getInt(projectStrings.Y)));
        }        
    }
}

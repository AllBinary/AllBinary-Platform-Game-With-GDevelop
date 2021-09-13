/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.extensions.builtin.sprite;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDPoint
{
    public final String name;
    
    public final boolean automatic;
    
    public final int x;
    public final int y;
    
    public GDPoint(final JSONObject jsonObject) {
        final GDProjectStrings projectStrings = GDProjectStrings.getInstance();
        
        this.name = jsonObject.getString(projectStrings.NAME);
        
        this.automatic = jsonObject.getBoolean(projectStrings.AUTOMATIC);
        
        this.x = jsonObject.getInt(projectStrings.X);
        this.y = jsonObject.getInt(projectStrings.Y);
    }
}

/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json.resource;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDImageResource extends GDResource
{
    public final boolean smooth;
    //Removed in GD 5.4.29
    //public final boolean alwaysLoaded;
    
    public GDImageResource(final String kind, final JSONObject jsonObject) {
        super(kind, jsonObject);
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        //this.alwaysLoaded = jsonObject.getBoolean(gdProjectStrings.ALWAYS_LOADED);
        this.smooth = jsonObject.getBoolean(gdProjectStrings.SMOOTHED);
    }
}

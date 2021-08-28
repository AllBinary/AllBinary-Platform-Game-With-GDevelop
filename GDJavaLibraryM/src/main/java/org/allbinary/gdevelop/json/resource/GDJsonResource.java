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
public class GDJsonResource extends GDResource
{
    public final boolean disablePreload;
    
    public GDJsonResource(final String kind, final JSONObject jsonObject) {
        super(kind, jsonObject);
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        this.disablePreload = jsonObject.getBoolean(gdProjectStrings.DISABLE_PRELOAD);
        
    }
}

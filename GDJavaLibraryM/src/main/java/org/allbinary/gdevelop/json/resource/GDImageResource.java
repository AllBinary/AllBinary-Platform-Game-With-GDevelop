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
    public final boolean alwaysLoaded;
    
    public GDImageResource(final String kind, final JSONObject jsonObject) {
        super(kind, jsonObject);
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        this.alwaysLoaded = jsonObject.getBoolean(gdProjectStrings.ALWAYS_LOADED);
        this.smooth = jsonObject.getBoolean(gdProjectStrings.SMOOTHED);
    }
}

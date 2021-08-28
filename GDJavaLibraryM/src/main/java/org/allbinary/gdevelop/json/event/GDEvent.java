/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json.event;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDEvent
{
    public final String type;
    
    public final boolean folded;
    public final boolean disabled;

    public GDEvent(final String type, final JSONObject jsonObject)
    {
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        this.type = type;
        this.folded = jsonObject.getBoolean(gdProjectStrings.FOLDED);
        this.disabled = jsonObject.getBoolean(gdProjectStrings.DISABLED);
    }
}

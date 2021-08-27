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

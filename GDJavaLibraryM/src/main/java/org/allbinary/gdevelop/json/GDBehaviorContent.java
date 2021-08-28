/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json;

import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDBehaviorContent
{
    public final String name;
    public final String type;
    public final JSONObject contentJSONObject;
    
    public GDBehaviorContent(final JSONObject jsonObject) {
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        this.type = jsonObject.getString(gdProjectStrings.TYPE);
        this.name = jsonObject.getString(gdProjectStrings.NAME);
        this.contentJSONObject = jsonObject;        
    }
}

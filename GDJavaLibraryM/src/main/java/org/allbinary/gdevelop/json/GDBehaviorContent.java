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

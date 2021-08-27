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
public class GDResource
{
    public final String kind;
    public final String name;
    public final String metadata;
    public final String originName;
    public final String originIdentifier;
    public final boolean userAdded;

    public final String fileAsString;
    
    public GDResource(final String kind, final JSONObject jsonObject)
    {
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();

        this.kind = kind;        
        this.name = jsonObject.getString(gdProjectStrings.NAME);
        this.metadata = jsonObject.getString(gdProjectStrings.METADATA);
        
        this.userAdded = jsonObject.getBoolean(gdProjectStrings.USER_ADDED);
        
        if(jsonObject.has(gdProjectStrings.ORIGIN)) {
            final JSONObject originJSONObject = jsonObject.getJSONObject(gdProjectStrings.ORIGIN);

            this.originName = originJSONObject.getString(gdProjectStrings.NAME);
            this.originIdentifier = originJSONObject.getString(gdProjectStrings.IDENTIFIER);
        } else {
            this.originName = null;
            this.originIdentifier = null;
        }
        
        this.fileAsString = jsonObject.getString(gdProjectStrings.FILE);
    }

}

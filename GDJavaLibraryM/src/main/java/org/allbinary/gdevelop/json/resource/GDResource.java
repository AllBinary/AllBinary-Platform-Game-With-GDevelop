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

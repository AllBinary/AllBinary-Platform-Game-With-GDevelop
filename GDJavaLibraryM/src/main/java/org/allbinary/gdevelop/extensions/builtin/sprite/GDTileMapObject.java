/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.extensions.builtin.sprite;

import org.allbinary.gdevelop.json.GDObject;
import org.allbinary.gdevelop.json.GDProjectStrings;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDTileMapObject extends GDObject
{
    private final GDContent content;
    
    public GDTileMapObject(final String type, final JSONObject jsonObject) {
        super(type, jsonObject);
        
        final GDProjectStrings projectStrings = GDProjectStrings.getInstance();
        
        final JSONObject contentJSONObject = jsonObject.getJSONObject(projectStrings.CONTENT);
        this.content = new GDContent(contentJSONObject);
    }
}

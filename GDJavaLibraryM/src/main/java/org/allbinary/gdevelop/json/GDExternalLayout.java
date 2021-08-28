/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json;

import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDExternalLayout
{
    public final String name;
    public final BasicArrayList initialInstanceList = new BasicArrayList();
    //public final EditorSettings editorSettings;
    public final String associatedLayout;
    
    public GDExternalLayout(final JSONObject jsonObject) {

        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        this.name = jsonObject.getString(gdProjectStrings.NAME);
        
        final JSONArray initialInstancesJSONArray = jsonObject.getJSONArray(gdProjectStrings.INSTANCES);
        final int size = initialInstancesJSONArray.length();
        JSONObject nextJSONObject;
        for(int index = 0; index < size; index++) {
            nextJSONObject = initialInstancesJSONArray.getJSONObject(index);
            this.initialInstanceList.add(new GDInitialInstance(nextJSONObject));
        }
        
        this.associatedLayout = jsonObject.getString(gdProjectStrings.ASSOCIATED_LAYOUT);
    }
    
}

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

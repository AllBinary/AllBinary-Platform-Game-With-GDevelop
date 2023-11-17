/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json;

import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDResourceFolder
{
    private static final String RESOURCES = "Resources: ";
    
    public final String name;
    public final BasicArrayList resourceList = new BasicArrayList();
    
    public GDResourceFolder(final JSONObject jsonObject) {
     
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();

        this.name = jsonObject.getString(gdProjectStrings.NAME);
        
        final JSONArray jsonArray = jsonObject.getJSONArray(gdProjectStrings.RESOURCES);
        final int size = jsonArray.length();
        JSONObject nextJSONObject;
        for(int index = 0; index < size; index++) {
            nextJSONObject = jsonArray.getJSONObject(index);
            this.resourceList.add(nextJSONObject.getString(gdProjectStrings.NAME));
        }
        
        LogUtil.put(LogFactory.getInstance(RESOURCES + this.resourceList.size(), this, CommonStrings.getInstance().CONSTRUCTOR));
    }
}

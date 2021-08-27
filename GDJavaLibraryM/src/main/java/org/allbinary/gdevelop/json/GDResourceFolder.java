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

import org.allbinary.logic.basic.string.CommonStrings;
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

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

import org.allbinary.gdevelop.json.resource.GDResourceFactory;
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
public class GDResourcesManager
{
    private final String RESOURCES = "GDResources: ";
    private final String RESOURCE_FOLDERS = "GDResourceFolders: ";
    
    public final BasicArrayList resourceList = new BasicArrayList();
    public final BasicArrayList resourceFolderList = new BasicArrayList();
    
    public GDResourcesManager(final JSONObject jsonObject) {
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        final GDResourceFactory resourceFactory = GDResourceFactory.getInstance();
        
        final JSONArray conditionJSONArray = jsonObject.getJSONArray(gdProjectStrings.RESOURCES);
        int size = conditionJSONArray.length();
        JSONObject nextJSONObject;
        for(int index = 0; index < size; index++) {
            nextJSONObject = conditionJSONArray.getJSONObject(index);
            this.resourceList.add(resourceFactory.create(nextJSONObject));
        }

        LogUtil.put(LogFactory.getInstance(RESOURCES + this.resourceList.size(), this, CommonStrings.getInstance().CONSTRUCTOR));

        final JSONArray resourceFoldersJSONArray = jsonObject.getJSONArray(gdProjectStrings.RESOURCE_FOLDERS);
        size = resourceFoldersJSONArray.length();
        for(int index = 0; index < size; index++) {
            nextJSONObject = resourceFoldersJSONArray.getJSONObject(index);
            this.resourceFolderList.add(new GDResourceFolder(nextJSONObject));
        }
    
        LogUtil.put(LogFactory.getInstance(RESOURCE_FOLDERS + this.resourceFolderList.size(), this, CommonStrings.getInstance().CONSTRUCTOR));
    }
}

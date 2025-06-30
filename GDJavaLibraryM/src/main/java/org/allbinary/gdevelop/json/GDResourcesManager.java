/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json;

import org.allbinary.gdevelop.json.resource.GDResourceFactory;
import org.allbinary.string.CommonStrings;
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
        
        final CommonStrings commonStrings = CommonStrings.getInstance();
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        final GDResourceFactory resourceFactory = GDResourceFactory.getInstance();
        
        final JSONArray conditionJSONArray = jsonObject.getJSONArray(gdProjectStrings.RESOURCES);
        int size = conditionJSONArray.length();
        JSONObject nextJSONObject;
        for(int index = 0; index < size; index++) {
            nextJSONObject = conditionJSONArray.getJSONObject(index);
            this.resourceList.add(resourceFactory.create(nextJSONObject));
        }

        LogUtil.put(LogFactory.getInstance(RESOURCES + this.resourceList.size(), this, commonStrings.CONSTRUCTOR));

        final JSONArray resourceFoldersJSONArray = jsonObject.getJSONArray(gdProjectStrings.RESOURCE_FOLDERS);
        size = resourceFoldersJSONArray.length();
        for(int index = 0; index < size; index++) {
            nextJSONObject = resourceFoldersJSONArray.getJSONObject(index);
            this.resourceFolderList.add(new GDResourceFolder(nextJSONObject));
        }
    
        LogUtil.put(LogFactory.getInstance(RESOURCE_FOLDERS + this.resourceFolderList.size(), this, commonStrings.CONSTRUCTOR));
    }
}

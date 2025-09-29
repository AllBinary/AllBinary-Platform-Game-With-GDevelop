/*
 * AllBinary Open License Version 1
 * Copyright (c) 2025 AllBinary
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
package org.allbinary.gdevelop.loader;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class UpdateEnemyExclusionRatio {
 
    protected final LogUtil logUtil = LogUtil.getInstance();
    
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
    
    public void process(final JSONObject gameAsConfigurationJSONObject) {
        //enemyExclusionRatio = 1
        final String ENEMY_EXCLUSION_RATIO = "enemyExclusionRatio";
        //final String VAR = "variable: ";
        final JSONArray jsonArray = gameAsConfigurationJSONObject.getJSONArray("layouts");
        JSONObject jsonObject = jsonArray.getJSONObject(1);
        final JSONArray variablesJSONArray = jsonObject.getJSONArray("variables");
        final int size = variablesJSONArray.length();
        
        //logUtil.put("total variables: " + size, this, commonStrings.PROCESS);
        
        for(int index = 0; index < size; index++) {
            jsonObject = variablesJSONArray.getJSONObject(index);
            //logUtil.put(VAR + jsonObject, this, commonStrings.PROCESS);
            if(jsonObject.getString(this.gdProjectStrings.NAME).compareTo(ENEMY_EXCLUSION_RATIO) == 0) {
                //logUtil.put("Setting Value", this, commonStrings.PROCESS);
                jsonObject.put(this.gdProjectStrings.VALUE, 1);
            }
        }        
    }
}

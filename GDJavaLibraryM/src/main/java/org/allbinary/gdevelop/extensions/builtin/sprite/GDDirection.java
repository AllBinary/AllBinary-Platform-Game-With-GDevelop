/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.extensions.builtin.sprite;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDDirection
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    public final boolean looping;
    public final int timeBetweenFrames;
    
    public final BasicArrayList spriteList = new BasicArrayList();
    
    public GDDirection(final JSONObject jsonObject) {
        
        final GDProjectStrings projectStrings = GDProjectStrings.getInstance();
        
        this.looping = jsonObject.getBoolean(projectStrings.LOOPING);
        this.timeBetweenFrames = jsonObject.getInt(projectStrings.TIME_BETWEEN_FRAMES);
        
        //logUtil.put(jsonObject.toString(3), this, "GDirection");
        
        final JSONArray jsonArray = jsonObject.getJSONArray(projectStrings.SPRITES);
        final int size = jsonArray.length();
        for(int index = 0; index < size; index++) {
            this.spriteList.add(new GDSprite(jsonArray.getJSONObject(index)));
        }

    }
    
}

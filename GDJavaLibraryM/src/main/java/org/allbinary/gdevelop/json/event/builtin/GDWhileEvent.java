/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json.event.builtin;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.gdevelop.json.event.GDExpression;
import org.allbinary.gdevelop.json.event.GDInstruction;
import org.allbinary.util.BasicArrayList;
import org.json.JSONObject;
import org.json.JSONArray;

/**
 *
 * @author User
 */
public class GDWhileEvent extends GDStandardEvent
{
    public final BasicArrayList whileConditionInstructionList = new BasicArrayList();

    public final boolean infiniteLoopWarning;
    public final boolean justCreatedByTheUser;
        
    public GDWhileEvent(final String type, final JSONObject jsonObject) {
        super(type, jsonObject);
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        this.justCreatedByTheUser = false;
        this.infiniteLoopWarning = jsonObject.getBoolean(gdProjectStrings.INFINITE_LOOP_WARNING);

        final JSONArray whileConditionJSONArray = jsonObject.getJSONArray(gdProjectStrings.WHILE_CONDITIONS);
        
        int size = whileConditionJSONArray.length();
        JSONObject nextJSONObject;
        for(int index = 0; index < size; index++) {
            nextJSONObject = whileConditionJSONArray.getJSONObject(index);
            this.whileConditionInstructionList.add(new GDInstruction(nextJSONObject));
        }
        
    }
}

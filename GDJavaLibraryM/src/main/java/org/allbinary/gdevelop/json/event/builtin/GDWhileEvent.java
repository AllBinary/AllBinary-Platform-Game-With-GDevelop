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

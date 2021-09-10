/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json.event;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDInstruction
{
    public final String typeValue;
    public final boolean inverted;
    
    public final BasicArrayList parametersExpressionList = new BasicArrayList();
    public final BasicArrayList subInstructionList = new BasicArrayList();
    
    //originalInstruction?
    
    public GDInstruction(final JSONObject jsonObject) {

        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        final JSONObject typeJSONObject = jsonObject.getJSONObject(gdProjectStrings.TYPE);
        
        this.typeValue = typeJSONObject.getString(gdProjectStrings.VALUE);
        this.inverted = typeJSONObject.getBoolean(gdProjectStrings.INVERTED);

        final JSONArray expressionJSONArray = jsonObject.getJSONArray(gdProjectStrings.PARAMETERS);
        int size = expressionJSONArray.length();
        for(int index = 0; index < size; index++) {
            this.parametersExpressionList.add(new GDExpression(expressionJSONArray.getString(index)));
        }

        final JSONArray subInstructionJSONArray = jsonObject.getJSONArray(gdProjectStrings.SUB_INSTRUCTIONS);
        size = subInstructionJSONArray.length();
        for(int index = 0; index < size; index++) {
            this.subInstructionList.add(new GDInstruction(subInstructionJSONArray.getJSONObject(index)));
        }
    }
    
}


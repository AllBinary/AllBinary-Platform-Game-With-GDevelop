/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json;

import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.ABHashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDVariable
{
    public final String type;
    public final String string;
    public final double value;
    public final boolean boolValue;
    
    public final ABHashMap<String, GDVariable> childVariableMap = new ABHashMap<String, GDVariable>();
    public final BasicArrayList childVariableList = new BasicArrayListD();
    
    public GDVariable(final JSONObject jsonObject) {

        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();

        final GDTypeFactory typeFactory = GDTypeFactory.getInstance();

        this.type = typeFactory.get(jsonObject.getString(gdProjectStrings.TYPE));
        
        String string;
        double value;
        boolean boolValue;        
        if (typeFactory.isPrimitive(this.type))
        {
            if (this.type == typeFactory.STRING)
            {
                string = jsonObject.getString(gdProjectStrings.VALUE);
                value = (double) 0;
                boolValue = false;
            } else if (this.type == typeFactory.NUMBER)
            {
                string = StringUtil.getInstance().EMPTY_STRING;
                value = jsonObject.getDouble(gdProjectStrings.VALUE);
                boolValue = false;

            } else if (this.type == typeFactory.BOOLEAN)
            {
                string = StringUtil.getInstance().EMPTY_STRING;
                value = (double) 0;
                boolValue = jsonObject.getBoolean(gdProjectStrings.VALUE);
            } else {
                string = StringUtil.getInstance().EMPTY_STRING;
                value = (double) 0;
                boolValue = false;
            }
        } else
        {
            string = StringUtil.getInstance().EMPTY_STRING;
            value = (double) 0;
            boolValue = false;
            
            if(jsonObject.has(gdProjectStrings.CHILDREN)) {
                final JSONArray variableJSONArray = jsonObject.getJSONArray(gdProjectStrings.CHILDREN);
                final int size = variableJSONArray.length();
                JSONObject childJSONObject;
                for (int index = 0; index < size; index++) {
                    childJSONObject = variableJSONArray.getJSONObject(index);
                    if (this.type == typeFactory.STRUCTURE) {
                        this.childVariableMap.put(childJSONObject.getString(gdProjectStrings.NAME), new GDVariable(childJSONObject));
                    } else if (this.type == typeFactory.ARRAY) {
                        this.childVariableList.add(new GDVariable(childJSONObject));
                    }
                }
            }
        }
        this.string = string;
        this.value = value;
        this.boolValue = boolValue;
    }

}

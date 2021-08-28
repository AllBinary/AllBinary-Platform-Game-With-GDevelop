/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json;

import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
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
    
    public final HashMap<String, GDVariable> childVariableMap = new HashMap();
    public final BasicArrayList childVariableList = new BasicArrayList();
    
    public GDVariable(final JSONObject jsonObject) {

        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();

        final GDTypeFactory typeFactory = GDTypeFactory.getInstance();

        this.type = typeFactory.get(jsonObject.getString(gdProjectStrings.TYPE));
        
        if (typeFactory.isPrimitive(type))
        {
            if (type == typeFactory.STRING)
            {
                this.string = jsonObject.getString(gdProjectStrings.VALUE);
                this.value = 0;
                this.boolValue = false;
            } else if (type == typeFactory.NUMBER)
            {
                this.string = null;
                this.value = jsonObject.getDouble(gdProjectStrings.VALUE);
                this.boolValue = false;

            } else if (type == typeFactory.BOOLEAN)
            {
                this.string = null;
                this.value = 0;
                this.boolValue = jsonObject.getBoolean(gdProjectStrings.VALUE);
            } else {
                this.string = null;
                this.value = 0;
                this.boolValue = false;
            }
        } else
        {
            this.string = null;
            this.value = 0;
            this.boolValue = false;
            
            final JSONArray variableJSONArray = jsonObject.getJSONArray(gdProjectStrings.CHILDREN);
            final int size = variableJSONArray.length();
            JSONObject childJSONObject;
            for (int index = 0; index < size; index++)
            {
                childJSONObject = variableJSONArray.getJSONObject(index);
                if (type == typeFactory.STRUCTURE)
                {
                    this.childVariableMap.put(childJSONObject.getString(gdProjectStrings.NAME), new GDVariable(childJSONObject));
                } else if (type == typeFactory.ARRAY)
                {
                    this.childVariableList.add(new GDVariable(childJSONObject));
                }
            }
        }
    }

}

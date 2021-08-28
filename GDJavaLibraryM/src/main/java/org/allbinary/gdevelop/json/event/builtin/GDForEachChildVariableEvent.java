/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json.event.builtin;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.gdevelop.json.event.GDEvent;
import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDForEachChildVariableEvent extends GDStandardEvent
{
    public final String valueIteratorVariableName;
    public final String keyIteratorVariableName;
    public final String iterableVariableName;
    
    public GDForEachChildVariableEvent(final String type, final JSONObject jsonObject) {
        super(type, jsonObject);
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        this.valueIteratorVariableName = jsonObject.getString(gdProjectStrings.VALUE_ITERATOR_VARIABLE_NAME);
        this.keyIteratorVariableName = jsonObject.getString(gdProjectStrings.KEY_ITERATOR_VARIABLE_NAME);
        this.iterableVariableName = jsonObject.getString(gdProjectStrings.ITERABLE_VARIABLE_NAME);
        
    }
    
}

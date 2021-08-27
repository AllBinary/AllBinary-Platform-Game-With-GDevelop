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

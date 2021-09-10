/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json.event.builtin;

import org.allbinary.gdevelop.json.event.GDExpression;
import org.allbinary.logic.basic.string.StringUtil;
import org.json.JSONObject;

/**
 * Looks like the child events are what the ForEach type is for.
 * @author User
 */
public class GDForEachEvent extends GDStandardEvent
{
    public final GDExpression objectsToPickExpression;
    public final boolean objectsToPickSelected;    
    
    public GDForEachEvent(final String type, final JSONObject jsonObject) {
        super(type, jsonObject);
        
        //final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        this.objectsToPickExpression = new GDExpression(StringUtil.getInstance().EMPTY_STRING);
        this.objectsToPickSelected = false;
    }
}

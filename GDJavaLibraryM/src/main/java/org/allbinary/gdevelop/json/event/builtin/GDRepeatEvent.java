/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json.event.builtin;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.gdevelop.json.event.GDExpression;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDRepeatEvent extends GDStandardEvent
{

    public final GDExpression repeatNumberExpression;
    public final boolean repeatNumberExpressionSelected = false;

    public GDRepeatEvent(final String type, final JSONObject jsonObject)
    {
        super(type, jsonObject);
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        this.repeatNumberExpression = new GDExpression(jsonObject.getString(gdProjectStrings.REPEAT_EXPRESSION));        
    }
}

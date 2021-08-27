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
import org.allbinary.gdevelop.json.event.GDExpression;
import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
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

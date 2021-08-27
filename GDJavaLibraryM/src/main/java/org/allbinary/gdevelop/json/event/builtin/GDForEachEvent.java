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

import org.allbinary.gdevelop.json.event.GDExpression;
import org.allbinary.logic.basic.string.StringUtil;
import org.json.JSONObject;

/**
 *
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

/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json.event.builtin;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.gdevelop.json.event.GDEvent;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDEventFactory
{
    private static final GDEventFactory instance = new GDEventFactory();

    /**
     * @return the instance
     */
    public static GDEventFactory getInstance()
    {
        return instance;
    }
    
    public GDEvent create(final JSONObject jsonObject) {
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        final GDEventTypeFactory eventTypeFactory = GDEventTypeFactory.getInstance();
        String type = jsonObject.getString(gdProjectStrings.TYPE);
        type = eventTypeFactory.get(type);
        
        if(type == eventTypeFactory.COMMENT) {
            return new GDCommentEvent(type, jsonObject);
        } else if(type == eventTypeFactory.FOR_EACH) {
            return new GDForEachEvent(type, jsonObject);
        } else if(type == eventTypeFactory.FOR_EACH_CHILD) {
            return new GDForEachChildVariableEvent(type, jsonObject);
        } else if(type == eventTypeFactory.GROUP) {
            return new GDGroupEvent(type, jsonObject);
        } else if(type == eventTypeFactory.LINK) {
            return new GDLinkEvent(type, jsonObject);
        } else if(type == eventTypeFactory.REPEAT) {
            return new GDRepeatEvent(type, jsonObject);
        } else if(type == eventTypeFactory.STANDARD) {
            return new GDStandardEvent(type, jsonObject);
        } else if(type == eventTypeFactory.WHILE) {
            return new GDWhileEvent(type, jsonObject);
        }
        
        return null;
    }
}

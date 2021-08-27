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
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDLinkEvent extends GDEvent
{
    public final String target;

    public final int includeConfig;

    public final String eventsGroupName;

    public final int includeStart;

    public final int includeEnd;

    public final boolean linkWasInvalid;

    public GDLinkEvent(final String type, final JSONObject jsonObject)
    {
        super(type, jsonObject);
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        final GDIncludeConfigFactory includeConfigFactory = GDIncludeConfigFactory.getInstance();
        
        final JSONObject includeJSONObject = jsonObject.getJSONObject(gdProjectStrings.INCLUDE);
        this.includeConfig = includeJSONObject.getInt(gdProjectStrings.INCLUDE_CONFIG);

        this.target = jsonObject.getString(gdProjectStrings.TARGET);
        
        if (this.includeConfig == includeConfigFactory.INCLUDE_ALL) {
            this.eventsGroupName = null;
        } else if (this.includeConfig == includeConfigFactory.INCLUDE_EVENTS_GROUP)
        {
            this.eventsGroupName = includeJSONObject.getString(gdProjectStrings.EVENTS_GROUP);
        } else
        {
            this.eventsGroupName = null;
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, new Exception()));
        }

        this.includeStart = 0;
        this.includeEnd = 0;
        this.linkWasInvalid = false;

    }
}

/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json.event.builtin;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.gdevelop.json.event.GDEvent;
import org.allbinary.string.CommonStrings;
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
            final CommonStrings commonStrings = CommonStrings.getInstance();
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, new Exception()));
        }

        this.includeStart = 0;
        this.includeEnd = 0;
        this.linkWasInvalid = false;

    }
}

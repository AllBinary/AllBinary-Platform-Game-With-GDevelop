/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Exception } from '../../../../../../java/lang/Exception.js';
import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings
import { GDEvent } from '../../../../../../org/allbinary/gdevelop/json/event/GDEvent.js';
//not GWT import const GDEvent
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDIncludeConfigFactory } from './GDIncludeConfigFactory.js';
//not GWT import - same folder const GDIncludeConfigFactory
export class GDLinkEvent extends GDEvent {
    constructor(type, jsonObject) {
        super(type, jsonObject);
        this.logUtil = LogUtil.getInstance();
        //For kotlin this is before the body of the constructor.
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        var includeConfigFactory = GDIncludeConfigFactory.getInstance();
        ;
        var includeJSONObject = jsonObject.getJSONObject(gdProjectStrings.INCLUDE);
        ;
        this.includeConfig = includeJSONObject.getInt(gdProjectStrings.INCLUDE_CONFIG);
        this.target = jsonObject.getString(gdProjectStrings.TARGET);
        if (this.includeConfig == includeConfigFactory.INCLUDE_ALL) {
            this.eventsGroupName =
                null;
        }
        else if (this.includeConfig == includeConfigFactory.INCLUDE_EVENTS_GROUP) {
            this.eventsGroupName = includeJSONObject.getString(gdProjectStrings.EVENTS_GROUP);
        }
        else {
            this.eventsGroupName =
                null;
            var commonStrings = CommonStrings.getInstance();
            ;
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, new Exception());
        }
        this.includeStart = 0;
        this.includeEnd = 0;
        this.linkWasInvalid = false;
    }
}

/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { GDBehaviorMetadata } from '../../../../org/allbinary/gdevelop/extensions/builtin/metadata/GDBehaviorMetadata.js';
//not GWT import const GDBehaviorMetadata
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDPlatformExtension extends GDBehaviorMetadata {
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDPlatformExtension.instance;
    }
    constructor() {
        super(StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, StringUtil.getInstance().EMPTY_STRING, null, null);
        this.NAMESPACE_SEP = "::";
        //For kotlin this is before the body of the constructor.
    }
}
GDPlatformExtension.instance = new GDPlatformExtension();

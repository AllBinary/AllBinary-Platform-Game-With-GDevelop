/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../../../java/lang/Object.js';
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDParameterMetadata extends Object {
    constructor(type, supplementaryInformation, optional, description, codeOnly) {
        super();
        this.longDescription = StringUtil.getInstance().EMPTY_STRING;
        this.defaultValue = StringUtil.getInstance().EMPTY_STRING;
        this.name = StringUtil.getInstance().EMPTY_STRING;
        this.type = type;
        this.supplementaryInformation = supplementaryInformation;
        this.optional = optional;
        this.description = description;
        this.codeOnly = codeOnly;
    }
    setLongDescription(longDescription) {
        this.longDescription = longDescription;
        //if statement needs to be on the same line and ternary does not work the same way.
        return this;
    }
    setDefaultValue(defaultValue) {
        this.defaultValue = defaultValue;
        //if statement needs to be on the same line and ternary does not work the same way.
        return this;
    }
}

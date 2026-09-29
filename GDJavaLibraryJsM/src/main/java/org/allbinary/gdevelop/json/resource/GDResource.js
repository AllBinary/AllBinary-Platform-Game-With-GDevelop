/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../../java/lang/Object.js';
import { GDProjectStrings } from '../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDResource extends Object {
    constructor(kind, jsonObject) {
        super();
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        this.kind = kind;
        this.name = jsonObject.getString(gdProjectStrings.NAME);
        this.metadata = jsonObject.getString(gdProjectStrings.METADATA);
        this.userAdded = jsonObject.getBoolean(gdProjectStrings.USER_ADDED);
        if (jsonObject.has(gdProjectStrings.ORIGIN)) {
            var originJSONObject = jsonObject.getJSONObject(gdProjectStrings.ORIGIN);
            ;
            this.originName = originJSONObject.getString(gdProjectStrings.NAME);
            this.originIdentifier = originJSONObject.getString(gdProjectStrings.IDENTIFIER);
        }
        else {
            this.originName =
                null;
            this.originIdentifier =
                null;
        }
        this.fileAsString = jsonObject.getString(gdProjectStrings.FILE);
    }
}

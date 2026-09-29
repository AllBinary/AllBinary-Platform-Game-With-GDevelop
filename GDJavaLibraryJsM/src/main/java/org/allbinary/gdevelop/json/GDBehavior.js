/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings
export class GDBehavior extends Object {
    constructor(jsonObject) {
        super();
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        this.type = jsonObject.getString(gdProjectStrings.TYPE);
        this.name = jsonObject.getString(gdProjectStrings.NAME);
        this.jsonObject = jsonObject;
    }
}

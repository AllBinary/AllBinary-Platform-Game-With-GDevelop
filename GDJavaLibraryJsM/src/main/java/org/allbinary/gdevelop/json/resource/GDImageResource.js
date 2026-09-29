/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { GDProjectStrings } from '../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDResource } from './GDResource.js';
//not GWT import - same folder const GDResource
export class GDImageResource extends GDResource {
    constructor(kind, jsonObject) {
        super(kind, jsonObject);
        //For kotlin this is before the body of the constructor.
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        this.smooth = jsonObject.getBoolean(gdProjectStrings.SMOOTHED);
    }
}

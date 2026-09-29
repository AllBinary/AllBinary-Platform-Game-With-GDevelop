/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { GDObject } from '../../../../../../org/allbinary/gdevelop/json/GDObject.js';
//not GWT import const GDObject
import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDContent } from './GDContent.js';
//not GWT import - same folder const GDContent
export class GDTileMapObject extends GDObject {
    constructor(type, jsonObject) {
        super(type, jsonObject);
        //For kotlin this is before the body of the constructor.
        var projectStrings = GDProjectStrings.getInstance();
        ;
        var contentJSONObject = jsonObject.getJSONObject(projectStrings.CONTENT);
        ;
        this.content = new GDContent(contentJSONObject);
    }
}

/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../../../java/lang/Object.js';
import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDDirection } from './GDDirection.js';
//not GWT import - same folder const GDDirection
export class GDAnimation extends Object {
    constructor(jsonObject) {
        super();
        this.directionList = new BasicArrayListD();
        var projectStrings = GDProjectStrings.getInstance();
        ;
        this.name = jsonObject.getString(projectStrings.NAME);
        this.useMultipleDirections = jsonObject.getBoolean(projectStrings.USE_MULTIPLE_DIRECTIONS);
        var jsonArray = jsonObject.getJSONArray(projectStrings.DIRECTIONS);
        ;
        var size = jsonArray.length();
        ;
        for (var index = 0; index < size; index++) {
            this.directionList.add(new GDDirection(jsonArray.getJSONObject(index)));
        }
    }
}

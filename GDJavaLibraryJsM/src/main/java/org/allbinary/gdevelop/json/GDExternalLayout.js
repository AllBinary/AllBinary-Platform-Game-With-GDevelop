/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings
import { GDInitialInstance } from './GDInitialInstance.js';
//not GWT import - same folder const GDInitialInstance
export class GDExternalLayout extends Object {
    constructor(jsonObject) {
        super();
        this.initialInstanceList = new BasicArrayListD();
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        this.name = jsonObject.getString(gdProjectStrings.NAME);
        var initialInstancesJSONArray = jsonObject.getJSONArray(gdProjectStrings.INSTANCES);
        ;
        var size = initialInstancesJSONArray.length();
        ;
        var nextJSONObject;
        ;
        for (var index = 0; index < size; index++) {
            nextJSONObject = initialInstancesJSONArray.getJSONObject(index);
            this.initialInstanceList.add(new GDInitialInstance(nextJSONObject));
        }
        this.associatedLayout = jsonObject.getString(gdProjectStrings.ASSOCIATED_LAYOUT);
    }
}

/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
//not plain js import { ABHashMap } 
const ABHashMap = globalThis.org.allbinary.util.ABHashMap;
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings
export class GDEffect extends Object {
    constructor(jsonObject) {
        super();
        this.doubleParameterMap = new ABHashMap();
        this.stringParameterMap = new ABHashMap();
        this.booleanParameterMap = new ABHashMap();
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        this.name = jsonObject.getString(gdProjectStrings.NAME);
        this.effectType = jsonObject.getString(gdProjectStrings.EFFECT_TYPE);
    }
}

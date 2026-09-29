/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDEvent
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDStandardEvent } from './GDStandardEvent.js';
//not GWT import - same folder const GDStandardEvent
export class GDForEachChildVariableEvent extends GDStandardEvent {
    constructor(type, jsonObject) {
        super(type, jsonObject);
        //For kotlin this is before the body of the constructor.
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        this.valueIteratorVariableName = jsonObject.getString(gdProjectStrings.VALUE_ITERATOR_VARIABLE_NAME);
        this.keyIteratorVariableName = jsonObject.getString(gdProjectStrings.KEY_ITERATOR_VARIABLE_NAME);
        this.iterableVariableName = jsonObject.getString(gdProjectStrings.ITERABLE_VARIABLE_NAME);
    }
}

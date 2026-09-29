/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDExpression
import { GDInstruction } from '../../../../../../org/allbinary/gdevelop/json/event/GDInstruction.js';
//not GWT import const GDInstruction
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not GWT import const JSONArray
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDStandardEvent } from './GDStandardEvent.js';
//not GWT import - same folder const GDStandardEvent
export class GDWhileEvent extends GDStandardEvent {
    constructor(type, jsonObject) {
        super(type, jsonObject);
        this.whileConditionInstructionList = new BasicArrayListD();
        //For kotlin this is before the body of the constructor.
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        this.justCreatedByTheUser = false;
        this.infiniteLoopWarning = jsonObject.getBoolean(gdProjectStrings.INFINITE_LOOP_WARNING);
        var whileConditionJSONArray = jsonObject.getJSONArray(gdProjectStrings.WHILE_CONDITIONS);
        ;
        var size = whileConditionJSONArray.length();
        ;
        var nextJSONObject;
        ;
        for (var index = 0; index < size; index++) {
            nextJSONObject = whileConditionJSONArray.getJSONObject(index);
            this.whileConditionInstructionList.add(new GDInstruction(nextJSONObject));
        }
    }
}

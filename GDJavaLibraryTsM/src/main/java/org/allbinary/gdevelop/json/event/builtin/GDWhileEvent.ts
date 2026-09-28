
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings

import { GDExpression } from '../../../../../../org/allbinary/gdevelop/json/event/GDExpression.js';
//not GWT import const GDExpression

import { GDInstruction } from '../../../../../../org/allbinary/gdevelop/json/event/GDInstruction.js';
//not GWT import const GDInstruction

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

import { JSONObject } from '../../../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

import { JSONArray } from '../../../../../../org/json/JSONArray.js';
//not GWT import const JSONArray

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDStandardEvent } from './GDStandardEvent.js';
//not GWT import - same folder const GDStandardEvent

export class GDWhileEvent extends GDStandardEvent {
        

    public readonly whileConditionInstructionList: BasicArrayList = new BasicArrayListD();

    public readonly infiniteLoopWarning: boolean;

    public readonly justCreatedByTheUser: boolean;

public constructor (type: string, jsonObject: JSONObject){
            super(type, jsonObject);
                    

                            //For kotlin this is before the body of the constructor.
                    

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.justCreatedByTheUser= false;
    
this.infiniteLoopWarning= jsonObject!.getBoolean(gdProjectStrings!.INFINITE_LOOP_WARNING);
    

    var whileConditionJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.WHILE_CONDITIONS)!;;
    

    var size: number = whileConditionJSONArray!.length()!;;
    

    var nextJSONObject: JSONObject;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
nextJSONObject= whileConditionJSONArray!.getJSONObject(index);
    
this.whileConditionInstructionList!.add(new GDInstruction(nextJSONObject));
    
}

}


}




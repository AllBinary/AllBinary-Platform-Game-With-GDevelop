
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
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
type BasicArrayListD<T = any, U = any> = typeof BasicArrayListD extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListD;

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
                    

    let gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.justCreatedByTheUser= false;
    
this.infiniteLoopWarning= jsonObject!.getBoolean(gdProjectStrings!.INFINITE_LOOP_WARNING);
    

    let whileConditionJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.WHILE_CONDITIONS)!;;
    

    let size: number = whileConditionJSONArray!.length()!;;
    

    let nextJSONObject: JSONObject;;
    




                        for (
    let index: number = 0;index < size; index++)
        {
nextJSONObject= whileConditionJSONArray!.getJSONObject(index);
    
this.whileConditionInstructionList!.add(new GDInstruction(nextJSONObject));
    
}

}


}


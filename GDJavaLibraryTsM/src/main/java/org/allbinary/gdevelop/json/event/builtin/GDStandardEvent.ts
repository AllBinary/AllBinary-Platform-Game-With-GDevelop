
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings

import { GDEvent } from '../../../../../../org/allbinary/gdevelop/json/event/GDEvent.js';
//not GWT import const GDEvent

import { GDInstruction } from '../../../../../../org/allbinary/gdevelop/json/event/GDInstruction.js';
//not GWT import const GDInstruction

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

import { JSONArray } from '../../../../../../org/json/JSONArray.js';
//not GWT import const JSONArray

import { JSONObject } from '../../../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDEventFactory } from './GDEventFactory.js';
//not GWT import - same folder const GDEventFactory

export class GDStandardEvent extends GDEvent {
        

    public readonly conditionList: BasicArrayList = new BasicArrayListD();

    public readonly actionList: BasicArrayList = new BasicArrayListD();

    public readonly eventList: BasicArrayList = new BasicArrayListD();

public constructor (type: string, jsonObject: JSONObject){
            super(type, jsonObject);
                    

                            //For kotlin this is before the body of the constructor.
                    

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    var eventFactory: GDEventFactory = GDEventFactory.getInstance()!;;
    

    var conditionJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.CONDITIIONS)!;;
    

    var size: number = conditionJSONArray!.length()!;;
    

    var nextJSONObject: JSONObject;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
nextJSONObject= conditionJSONArray!.getJSONObject(index);
    
this.conditionList!.add(new GDInstruction(nextJSONObject));
    
}


    var actionJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.ACTIONS)!;;
    
size= actionJSONArray!.length();
    




                        for (
    var index: number = 0;index < size; index++)
        {
nextJSONObject= actionJSONArray!.getJSONObject(index);
    
this.actionList!.add(new GDInstruction(nextJSONObject));
    
}


                        if(jsonObject!.has(gdProjectStrings!.EVENTS))
                        
                                    {
                                    
    var eventJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.EVENTS)!;;
    
size= eventJSONArray!.length();
    




                        for (
    var index: number = 0;index < size; index++)
        {
nextJSONObject= eventJSONArray!.getJSONObject(index);
    
this.eventList!.add(eventFactory!.create(nextJSONObject));
    
}


                                    }
                                
}


}




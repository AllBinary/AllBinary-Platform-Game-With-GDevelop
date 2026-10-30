
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
type CommonStrings<T = any, U = any> = typeof CommonStrings extends abstract new (...args: any[]) => infer Instance ? Instance : typeof CommonStrings;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
type LogUtil<T = any, U = any> = typeof LogUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof LogUtil;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
type BasicArrayListD<T = any, U = any> = typeof BasicArrayListD extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListD;

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
                    

    let gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    let eventFactory: GDEventFactory = GDEventFactory.getInstance()!;;
    

    let conditionJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.CONDITIIONS)!;;
    

    let size: number = conditionJSONArray!.length()!;;
    

    let nextJSONObject: JSONObject;;
    




                        for (
    let index: number = 0;index < size; index++)
        {
nextJSONObject= conditionJSONArray!.getJSONObject(index);
    
this.conditionList!.add(new GDInstruction(nextJSONObject));
    
}


    let actionJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.ACTIONS)!;;
    
size= actionJSONArray!.length();
    




                        for (
    let index: number = 0;index < size; index++)
        {
nextJSONObject= actionJSONArray!.getJSONObject(index);
    
this.actionList!.add(new GDInstruction(nextJSONObject));
    
}


                        if(jsonObject!.has(gdProjectStrings!.EVENTS))
                        
                                    {
                                    
    let eventJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.EVENTS)!;;
    
size= eventJSONArray!.length();
    




                        for (
    let index: number = 0;index < size; index++)
        {
nextJSONObject= eventJSONArray!.getJSONObject(index);
    
this.eventList!.add(eventFactory!.create(nextJSONObject));
    
}


                                    }
                                
}


}


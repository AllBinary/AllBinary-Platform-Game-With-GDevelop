
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

import { GDExpression } from '../../../../../../org/allbinary/gdevelop/json/event/GDExpression.js';
//not GWT import const GDExpression

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

export class GDGroupEvent extends GDEvent {
        

    public readonly name: string;

    public readonly source: string;

    public readonly creationTime: number;

    public readonly colorR: number;

    public readonly colorG: number;

    public readonly colorB: number;

    public readonly parametersExpressionList: BasicArrayList = new BasicArrayListD();

    public readonly eventList: BasicArrayList = new BasicArrayListD();

public constructor (type: string, jsonObject: JSONObject){
            super(type, jsonObject);
                    

                            //For kotlin this is before the body of the constructor.
                    

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    var eventFactory: GDEventFactory = GDEventFactory.getInstance()!;;
    
this.name= jsonObject!.getString(gdProjectStrings!.NAME);
    
this.source= jsonObject!.getString(gdProjectStrings!.SOURCE);
    
this.creationTime= jsonObject!.getInt(gdProjectStrings!.CREATION_TIME);
    
this.colorR= jsonObject!.getInt(gdProjectStrings!.COLOR_R);
    
this.colorG= jsonObject!.getInt(gdProjectStrings!.COLOR_G);
    
this.colorB= jsonObject!.getInt(gdProjectStrings!.COLOR_B);
    

    var expressionJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.PARAMETERS)!;;
    

    var size: number = expressionJSONArray!.length()!;;
    

    var nextJSONObject: JSONObject;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
this.parametersExpressionList!.add(new GDExpression(expressionJSONArray!.getString(index)));
    
}


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




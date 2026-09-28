
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
            import { Exception } from '../../../../java/lang/Exception.js';
        
import { GDEvent } from '../../../../org/allbinary/gdevelop/json/event/GDEvent.js';
//not GWT import const GDEvent

import { GDEventFactory } from '../../../../org/allbinary/gdevelop/json/event/builtin/GDEventFactory.js';
//not GWT import const GDEventFactory

import { BasicColor } from '../../../../org/allbinary/graphics/color/BasicColor.js';
//not GWT import const BasicColor

import { BasicColorFactory } from '../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory

import { BasicColorUtil } from '../../../../org/allbinary/graphics/color/BasicColorUtil.js';
//not GWT import const BasicColorUtil

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

import { JSONArray } from '../../../../org/json/JSONArray.js';
//not GWT import const JSONArray

import { JSONObject } from '../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings
import { GDObjectFactory } from './GDObjectFactory.js';
//not GWT import - same folder const GDObjectFactory
import { GDInitialInstance } from './GDInitialInstance.js';
//not GWT import - same folder const GDInitialInstance
import { GDVariable } from './GDVariable.js';
//not GWT import - same folder const GDVariable
import { GDLayer } from './GDLayer.js';
//not GWT import - same folder const GDLayer
import { GDBehavior } from './GDBehavior.js';
//not GWT import - same folder const GDBehavior

export class GDLayout
            extends Object
         {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    public readonly name: string;

    public readonly basicColor: BasicColor;

    public readonly title: string;

    public readonly standardSortMethod: boolean;

    public readonly stopSoundsOnStartup: boolean;

    public readonly disableInputWhenNotFocused: boolean;

    public readonly objectList: BasicArrayList = new BasicArrayListD();

    public readonly initialInstanceList: BasicArrayList = new BasicArrayListD();

    public readonly layerList: BasicArrayList = new BasicArrayListD();

    private readonly variableList: BasicArrayList = new BasicArrayListD();

    public readonly behaviorContentList: BasicArrayList = new BasicArrayListD();

    public readonly eventList: BasicArrayList = new BasicArrayListD();

public constructor (jsonObject: JSONObject){

            super();
        
    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.name= jsonObject!.getString(gdProjectStrings!.NAME);
    
this.basicColor= BasicColorFactory.getInstance()!.createInstanceARGB(BasicColorUtil.getInstance()!.ALPHA, jsonObject!.getInt(gdProjectStrings!.R), jsonObject!.getInt(gdProjectStrings!.G_V), jsonObject!.getInt(gdProjectStrings!.B), this.name);
    

                        if(jsonObject!.has(gdProjectStrings!.TITLE))
                        
                                    {
                                    this.title= jsonObject!.getString(gdProjectStrings!.TITLE);
    

                                    }
                                
                        else {
                            this.title= StringUtil.getInstance()!.EMPTY_STRING;
    

                        }
                            
this.standardSortMethod= jsonObject!.getBoolean(gdProjectStrings!.STANDARD_SORT_METHOD);
    
this.stopSoundsOnStartup= jsonObject!.getBoolean(gdProjectStrings!.STOP_SOUNDS_ON_STARTUP);
    
this.disableInputWhenNotFocused= jsonObject!.getBoolean(gdProjectStrings!.DISABLE_INPUT_WHEN_NOT_FOCUSED);
    

    var objectFactory: GDObjectFactory = GDObjectFactory.getInstance()!;;
    

    var objectJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.OBJECTS)!;;
    

    var size: number = objectJSONArray!.length()!;;
    

    var nextJSONObject: JSONObject;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
nextJSONObject= objectJSONArray!.getJSONObject(index);
    
this.objectList!.add(objectFactory!.create(nextJSONObject));
    
}


    var initialInstancesJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.INSTANCES)!;;
    
size= initialInstancesJSONArray!.length();
    




                        for (
    var index: number = 0;index < size; index++)
        {
nextJSONObject= initialInstancesJSONArray!.getJSONObject(index);
    
this.initialInstanceList!.add(new GDInitialInstance(nextJSONObject));
    
}


    var variableJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.VARIABLES)!;;
    
size= variableJSONArray!.length();
    




                        for (
    var index: number = 0;index < size; index++)
        {
this.variableList!.add(new GDVariable(variableJSONArray!.getJSONObject(index)));
    
}


    var layersJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.LAYERS)!;;
    
size= layersJSONArray!.length();
    




                        for (
    var index: number = 0;index < size; index++)
        {
nextJSONObject= layersJSONArray!.getJSONObject(index);
    
this.layerList!.add(new GDLayer(nextJSONObject));
    
}


    var behaviorsJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.BEHAVIORS_SHARED_DATA)!;;
    
size= behaviorsJSONArray!.length();
    




                        for (
    var index: number = 0;index < size; index++)
        {
nextJSONObject= behaviorsJSONArray!.getJSONObject(index);
    
this.behaviorContentList!.add(new GDBehavior(nextJSONObject));
    
}


    var eventFactory: GDEventFactory = GDEventFactory.getInstance()!;;
    

    var eventJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.EVENTS)!;;
    
size= eventJSONArray!.length();
    

    var event: GDEvent;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
event= eventFactory!.create(eventJSONArray!.getJSONObject(index));
    

                        if(event != 
                                    null
                                )
                        
                                    {
                                    this.eventList!.add(event);
    

                                    }
                                
                        else {
                            
    var commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    
this.logUtil!.put(commonStrings!.EXCEPTION, this, commonStrings!.CONSTRUCTOR, new Exception());
    

                        }
                            
}

}


}





        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
            import { Double } from '../../../../java/lang/Double.js';
        
//not plain js import { ABHashMap } 
const ABHashMap = globalThis.org.allbinary.util.ABHashMap;
type ABHashMap<T = any, U = any> = typeof ABHashMap extends abstract new (...args: any[]) => infer Instance ? Instance : typeof ABHashMap;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
type BasicArrayListD<T = any, U = any> = typeof BasicArrayListD extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListD;

import { JSONArray } from '../../../../org/json/JSONArray.js';
//not GWT import const JSONArray

import { JSONObject } from '../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings
import { GDVariable } from './GDVariable.js';
//not GWT import - same folder const GDVariable

export class GDInitialInstance
            extends Object
         {
        

    public readonly numberPropertiesMap: ABHashMap<string, Double> = new ABHashMap<string, Double>();

    public readonly stringPropertiesMap: ABHashMap<string, string> = new ABHashMap<string, string>();

    public readonly name: string;

    public readonly x: number;

    public readonly y: number;

    public readonly angle: number;

    public readonly zOrder: number;

    public readonly layer: string;

    public readonly personalizedSize: boolean;

    public readonly width: number;

    public readonly height: number;

    public readonly initialVariableList: BasicArrayList = new BasicArrayListD();

    public readonly persistentUuid: string;

public constructor (jsonObject: JSONObject){

            super();
        
    let gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.name= jsonObject!.getString(gdProjectStrings!.NAME);
    
this.x= jsonObject!.getDouble(gdProjectStrings!.X);
    
this.y= jsonObject!.getDouble(gdProjectStrings!.Y);
    
this.angle= jsonObject!.getDouble(gdProjectStrings!.ANGLE);
    
this.zOrder= jsonObject!.getInt(gdProjectStrings!.Z_ORDER);
    
this.personalizedSize= jsonObject!.getBoolean(gdProjectStrings!.CUSTOM_SIZE);
    
this.layer= jsonObject!.getString(gdProjectStrings!.LAYER);
    
this.width= jsonObject!.getDouble(gdProjectStrings!.WIDTH);
    
this.height= jsonObject!.getDouble(gdProjectStrings!.HEIGHT);
    
this.persistentUuid= jsonObject!.getString(gdProjectStrings!.PERSISTED_UUID);
    

    let numberPropertiesJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.NUMBER_PROPERTIES)!;;
    

    let size: number = numberPropertiesJSONArray!.length()!;;
    

    let nextJSONObject: JSONObject;;
    

    let name: string;;
    

    let valueAsDouble: number;;
    




                        for (
    let index: number = 0;index < size; index++)
        {
nextJSONObject= numberPropertiesJSONArray!.getJSONObject(index);
    
name= nextJSONObject!.getString(gdProjectStrings!.NAME);
    
valueAsDouble= nextJSONObject!.getDouble(gdProjectStrings!.VALUE);
    
this.numberPropertiesMap!.put(name, valueAsDouble);
    
}


    let stringPropertiesJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.STRING_PROPERTIES)!;;
    
size= stringPropertiesJSONArray!.length();
    

    let value: string;;
    




                        for (
    let index: number = 0;index < size; index++)
        {
nextJSONObject= stringPropertiesJSONArray!.getJSONObject(index);
    
name= nextJSONObject!.getString(gdProjectStrings!.NAME);
    
value= nextJSONObject!.getString(gdProjectStrings!.VALUE);
    
this.stringPropertiesMap!.put(name, value);
    
}


    let variableJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.INITIAL_VARIABLE)!;;
    
size= variableJSONArray!.length();
    




                        for (
    let index: number = 0;index < size; index++)
        {
this.initialVariableList!.add(new GDVariable(variableJSONArray!.getJSONObject(index)));
    
}

}


}


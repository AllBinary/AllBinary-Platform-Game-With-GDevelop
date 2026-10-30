
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
type StringUtil<T = any, U = any> = typeof StringUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringUtil;

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
import { GDTypeFactory } from './GDTypeFactory.js';
//not GWT import - same folder const GDTypeFactory

export class GDVariable
            extends Object
         {
        

    public readonly type: string;

    public readonly string: string;

    public readonly value: number;

    public readonly boolValue: boolean;

    public readonly childVariableMap: ABHashMap<string, GDVariable> = new ABHashMap<string, GDVariable>();

    public readonly childVariableList: BasicArrayList = new BasicArrayListD();

public constructor (jsonObject: JSONObject){

            super();
        
    let gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    let typeFactory: GDTypeFactory = GDTypeFactory.getInstance()!;;
    
this.type= typeFactory!.get(jsonObject!.getString(gdProjectStrings!.TYPE));
    

    let string: string;;
    

    let value: number;;
    

    let boolValue: boolean;;
    

                        if(typeFactory!.isPrimitive(this.type))
                        
                                    {
                                    
                        if(this.type == typeFactory!.STRING)
                        
                                    {
                                    string= jsonObject!.getString(gdProjectStrings!.VALUE);
    
value= 0;
    
boolValue= false;
    

                                    }
                                
                             else 
                        if(this.type == typeFactory!.NUMBER)
                        
                                    {
                                    string= StringUtil.getInstance()!.EMPTY_STRING;
    
value= jsonObject!.getDouble(gdProjectStrings!.VALUE);
    
boolValue= false;
    

                                    }
                                
                             else 
                        if(this.type == typeFactory!.BOOLEAN)
                        
                                    {
                                    string= StringUtil.getInstance()!.EMPTY_STRING;
    
value= 0;
    
boolValue= jsonObject!.getBoolean(gdProjectStrings!.VALUE);
    

                                    }
                                
                        else {
                            string= StringUtil.getInstance()!.EMPTY_STRING;
    
value= 0;
    
boolValue= false;
    

                        }
                            

                                    }
                                
                        else {
                            string= StringUtil.getInstance()!.EMPTY_STRING;
    
value= 0;
    
boolValue= false;
    

                        if(jsonObject!.has(gdProjectStrings!.CHILDREN))
                        
                                    {
                                    
    let variableJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.CHILDREN)!;;
    

    let size: number = variableJSONArray!.length()!;;
    

    let childJSONObject: JSONObject;;
    




                        for (
    let index: number = 0;index < size; index++)
        {
childJSONObject= variableJSONArray!.getJSONObject(index);
    

                        if(this.type == typeFactory!.STRUCTURE)
                        
                                    {
                                    this.childVariableMap!.put(childJSONObject!.getString(gdProjectStrings!.NAME), new GDVariable(childJSONObject));
    

                                    }
                                
                             else 
                        if(this.type == typeFactory!.ARRAY)
                        
                                    {
                                    this.childVariableList!.add(new GDVariable(childJSONObject));
    

                                    }
                                
}


                                    }
                                

                        }
                            
this.string= string;
    
this.value= value;
    
this.boolValue= boolValue;
    
}


}


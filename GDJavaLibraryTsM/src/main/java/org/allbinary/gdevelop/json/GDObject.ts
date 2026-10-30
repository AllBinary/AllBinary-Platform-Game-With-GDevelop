
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
import { GDEffect } from './GDEffect.js';
//not GWT import - same folder const GDEffect
import { GDBehavior } from './GDBehavior.js';
//not GWT import - same folder const GDBehavior

export class GDObject
            extends Object
         {
        

    public readonly jsonObject: JSONObject;

    public readonly type: string;

    public readonly name: string;

    public readonly tags: string;

    public readonly variableList: BasicArrayList = new BasicArrayListD();

    public readonly effectsList: BasicArrayList = new BasicArrayListD();

    public readonly behaviorContentList: BasicArrayList = new BasicArrayListD();

public constructor (type: string, jsonObject: Object){

            super();
        this.jsonObject= jsonObject;
    

    let gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.type= type;
    
this.name= jsonObject!.getString(gdProjectStrings!.NAME);
    

                        if(jsonObject!.has(gdProjectStrings!.TAGS))
                        
                                    {
                                    this.tags= jsonObject!.getString(gdProjectStrings!.TAGS);
    

                                    }
                                
                        else {
                            this.tags= StringUtil.getInstance()!.EMPTY_STRING;
    

                        }
                            

    let variableJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.VARIABLES)!;;
    

    let size: number = variableJSONArray!.length()!;;
    




                        for (
    let index: number = 0;index < size; index++)
        {
this.variableList!.add(new GDVariable(variableJSONArray!.getJSONObject(index)));
    
}


                        if(jsonObject!.has(gdProjectStrings!.EFFECTS))
                        
                                    {
                                    
    let effectsJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.EFFECTS)!;;
    
size= effectsJSONArray!.length();
    




                        for (
    let index: number = 0;index < size; index++)
        {
this.effectsList!.add(new GDEffect(effectsJSONArray!.getJSONObject(index)));
    
}


                                    }
                                

    let behaviorsJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.BEHAVIORS)!;;
    
size= behaviorsJSONArray!.length();
    




                        for (
    let index: number = 0;index < size; index++)
        {
this.behaviorContentList!.add(new GDBehavior(behaviorsJSONArray!.getJSONObject(index)));
    
}

}


}



        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
//not plain js import { ABHashMap } 
const ABHashMap = globalThis.org.allbinary.util.ABHashMap;

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
import { GDTypeFactory } from './GDTypeFactory.js';
//not GWT import - same folder const GDTypeFactory

export class GDVariable
            extends Object
         {
        

    public readonly type: string;

    public readonly string: string;

    public readonly value: number= 0.0;

    public readonly boolValue: boolean= false;

    public readonly childVariableMap: ABHashMap<string, GDVariable> = new ABHashMap<string, GDVariable>();

    public readonly childVariableList: BasicArrayList = new BasicArrayListD();

public constructor (jsonObject: JSONObject){

            super();
        
    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    var typeFactory: GDTypeFactory = GDTypeFactory.getInstance()!;;
    
this.type= typeFactory!.get(jsonObject!.getString(gdProjectStrings!.TYPE));
    

                        if(typeFactory!.isPrimitive(this.type))
                        
                                    {
                                    
                        if(this.type == typeFactory!.STRING)
                        
                                    {
                                    this.string= jsonObject!.getString(gdProjectStrings!.VALUE);
    
this.value= 0;
    
this.boolValue= false;
    

                                    }
                                
                             else 
                        if(this.type == typeFactory!.NUMBER)
                        
                                    {
                                    this.string= 
                                        null
                                    ;
    
this.value= jsonObject!.getDouble(gdProjectStrings!.VALUE);
    
this.boolValue= false;
    

                                    }
                                
                             else 
                        if(this.type == typeFactory!.BOOLEAN)
                        
                                    {
                                    this.string= 
                                        null
                                    ;
    
this.value= 0;
    
this.boolValue= jsonObject!.getBoolean(gdProjectStrings!.VALUE);
    

                                    }
                                
                        else {
                            this.string= 
                                        null
                                    ;
    
this.value= 0;
    
this.boolValue= false;
    

                        }
                            

                                    }
                                
                        else {
                            this.string= 
                                        null
                                    ;
    
this.value= 0;
    
this.boolValue= false;
    

                        if(jsonObject!.has(gdProjectStrings!.CHILDREN))
                        
                                    {
                                    
    var variableJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.CHILDREN)!;;
    

    var size: number = variableJSONArray!.length()!;;
    

    var childJSONObject: JSONObject;;
    




                        for (
    var index: number = 0;index < size; index++)
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
                            
}


}




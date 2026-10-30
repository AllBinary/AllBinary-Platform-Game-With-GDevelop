
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
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
import { GDInitialInstance } from './GDInitialInstance.js';
//not GWT import - same folder const GDInitialInstance

export class GDExternalLayout
            extends Object
         {
        

    public readonly name: string;

    public readonly initialInstanceList: BasicArrayList = new BasicArrayListD();

    public readonly associatedLayout: string;

public constructor (jsonObject: JSONObject){

            super();
        
    let gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.name= jsonObject!.getString(gdProjectStrings!.NAME);
    

    let initialInstancesJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.INSTANCES)!;;
    

    let size: number = initialInstancesJSONArray!.length()!;;
    

    let nextJSONObject: JSONObject;;
    




                        for (
    let index: number = 0;index < size; index++)
        {
nextJSONObject= initialInstancesJSONArray!.getJSONObject(index);
    
this.initialInstanceList!.add(new GDInitialInstance(nextJSONObject));
    
}

this.associatedLayout= jsonObject!.getString(gdProjectStrings!.ASSOCIATED_LAYOUT);
    
}


}


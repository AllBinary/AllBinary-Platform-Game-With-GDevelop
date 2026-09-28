
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
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
        
    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.name= jsonObject!.getString(gdProjectStrings!.NAME);
    

    var initialInstancesJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.INSTANCES)!;;
    

    var size: number = initialInstancesJSONArray!.length()!;;
    

    var nextJSONObject: JSONObject;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
nextJSONObject= initialInstancesJSONArray!.getJSONObject(index);
    
this.initialInstanceList!.add(new GDInitialInstance(nextJSONObject));
    
}

this.associatedLayout= jsonObject!.getString(gdProjectStrings!.ASSOCIATED_LAYOUT);
    
}


}




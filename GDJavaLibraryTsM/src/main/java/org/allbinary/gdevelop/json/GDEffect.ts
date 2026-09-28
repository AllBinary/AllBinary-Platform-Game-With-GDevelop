
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

import { JSONObject } from '../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings

export class GDEffect
            extends Object
         {
        

    public readonly name: string;

    public readonly effectType: string;

    public readonly doubleParameterMap: ABHashMap<string, Double> = new ABHashMap<string, Double>();

    public readonly stringParameterMap: ABHashMap<string, string> = new ABHashMap<string, string>();

    public readonly booleanParameterMap: ABHashMap<string, Boolean> = new ABHashMap<string, Boolean>();

public constructor (jsonObject: JSONObject){

            super();
        
    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.name= jsonObject!.getString(gdProjectStrings!.NAME);
    
this.effectType= jsonObject!.getString(gdProjectStrings!.EFFECT_TYPE);
    
}


}




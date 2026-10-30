
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../java/lang/Object.js';
        
import { GDProjectStrings } from '../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings

//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
type StringUtil<T = any, U = any> = typeof StringUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringUtil;

import { JSONObject } from '../../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDEvent
            extends Object
         {
        

    public static readonly NULL_GDEVENT: GDEvent = new GDEvent(StringUtil.getInstance()!.NULL_STRING, JSONObject.NULL_JSONOBJECT);

    public readonly type: string;

public constructor (type: string, jsonObject: JSONObject){

            super();
        
    let gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.type= type;
    
}


}



        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


import { GDExpression } from '../../../../../../org/allbinary/gdevelop/json/event/GDExpression.js';
//not GWT import const GDExpression

//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;

import { JSONObject } from '../../../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDStandardEvent } from './GDStandardEvent.js';
//not GWT import - same folder const GDStandardEvent

export class GDForEachEvent extends GDStandardEvent {
        

    public readonly objectsToPickExpression: GDExpression;

    public readonly objectsToPickSelected: boolean;

public constructor (type: string, jsonObject: JSONObject){
            super(type, jsonObject);
                    

                            //For kotlin this is before the body of the constructor.
                    
this.objectsToPickExpression= new GDExpression(StringUtil.getInstance()!.EMPTY_STRING);
    
this.objectsToPickSelected= false;
    
}


}





        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings

import { GDExpression } from '../../../../../../org/allbinary/gdevelop/json/event/GDExpression.js';
//not GWT import const GDExpression

import { JSONObject } from '../../../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDStandardEvent } from './GDStandardEvent.js';
//not GWT import - same folder const GDStandardEvent

export class GDRepeatEvent extends GDStandardEvent {
        

    public readonly repeatNumberExpression: GDExpression;

    public readonly repeatNumberExpressionSelected: boolean = false;

public constructor (type: string, jsonObject: JSONObject){
            super(type, jsonObject);
                    

                            //For kotlin this is before the body of the constructor.
                    

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.repeatNumberExpression= new GDExpression(jsonObject!.getString(gdProjectStrings!.REPEAT_EXPRESSION));
    
}


}




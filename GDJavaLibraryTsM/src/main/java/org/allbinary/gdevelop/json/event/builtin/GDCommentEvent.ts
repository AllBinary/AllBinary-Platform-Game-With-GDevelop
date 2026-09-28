
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings

import { GDEvent } from '../../../../../../org/allbinary/gdevelop/json/event/GDEvent.js';
//not GWT import const GDEvent

import { JSONObject } from '../../../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDCommentEvent extends GDEvent {
        

    public readonly r: number;

    public readonly g: number;

    public readonly b: number;

    public readonly textR: number;

    public readonly textG: number;

    public readonly textB: number;

    public readonly comment1: string;

    public readonly comment2: string;

public constructor (type: string, jsonObject: JSONObject){
            super(type, jsonObject);
                    

                            //For kotlin this is before the body of the constructor.
                    

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    var colorJSONObject: JSONObject = jsonObject!.getJSONObject(gdProjectStrings!.COLOR)!;;
    
this.r= colorJSONObject!.getInt(gdProjectStrings!.R);
    
this.g= colorJSONObject!.getInt(gdProjectStrings!.G);
    
this.b= colorJSONObject!.getInt(gdProjectStrings!.B);
    
this.textR= colorJSONObject!.getInt(gdProjectStrings!.TEXT_R);
    
this.textG= colorJSONObject!.getInt(gdProjectStrings!.TEXT_G);
    
this.textB= colorJSONObject!.getInt(gdProjectStrings!.TEXT_B);
    
this.comment1= jsonObject!.getString(gdProjectStrings!.COMMENT);
    

                        if(jsonObject!.has(gdProjectStrings!.COMMENT2))
                        
                                    {
                                    this.comment2= jsonObject!.getString(gdProjectStrings!.COMMENT2);
    

                                    }
                                
                        else {
                            this.comment2= 
                                        null
                                    ;
    

                        }
                            
}


}




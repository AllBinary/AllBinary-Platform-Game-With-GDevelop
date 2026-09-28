
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../../java/lang/Object.js';
        
import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { JSONObject } from '../../../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDPoint
            extends Object
         {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    public readonly name: string;

    public readonly automatic: boolean= false;

    public readonly x: number;

    public readonly y: number;

public constructor (jsonObject: JSONObject){

            super();
        
    var projectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.name= jsonObject!.getString(projectStrings!.NAME);
    

                        if(jsonObject!.has(projectStrings!.AUTOMATIC))
                        
                                    {
                                    this.automatic= jsonObject!.getBoolean(projectStrings!.AUTOMATIC);
    

                                    }
                                
                        else {
                            this.automatic= false;
    

                        }
                            
this.x= jsonObject!.getInt(projectStrings!.X);
    
this.y= jsonObject!.getInt(projectStrings!.Y);
    
}


}





        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
import { JSONObject } from '../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings

export class GDCamera
            extends Object
         {
        

    public readonly defaultSize: boolean;

    public readonly defaultViewport: boolean;

    public readonly x1: number;

    public readonly y1: number;

    public readonly x2: number;

    public readonly y2: number;

    public readonly width: number;

    public readonly height: number;

public constructor (jsonObject: JSONObject){

            super();
        
    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.defaultSize= jsonObject!.getBoolean(gdProjectStrings!.DEFAULT_SIZE);
    
this.defaultViewport= jsonObject!.getBoolean(gdProjectStrings!.DEFAULT_VIEWPORT);
    
this.width= jsonObject!.getDouble(gdProjectStrings!.WIDTH);
    
this.height= jsonObject!.getDouble(gdProjectStrings!.HEIGHT);
    
this.x1= jsonObject!.getDouble(gdProjectStrings!.VIEWPORT_LEFT);
    
this.y1= jsonObject!.getDouble(gdProjectStrings!.VIEWPORT_TOP);
    
this.x2= jsonObject!.getDouble(gdProjectStrings!.VIEWPORT_RIGHT);
    
this.y2= jsonObject!.getDouble(gdProjectStrings!.VIEWPORT_BOTTOM);
    
}


}




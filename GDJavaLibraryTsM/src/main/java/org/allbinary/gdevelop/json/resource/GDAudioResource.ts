
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


import { GDProjectStrings } from '../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings

import { JSONObject } from '../../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDResource } from './GDResource.js';
//not GWT import - same folder const GDResource

export class GDAudioResource extends GDResource {
        

    public readonly preloadAsSound: boolean;

    public readonly preloadAsMusic: boolean;

public constructor (kind: string, jsonObject: JSONObject){
            super(kind, jsonObject);
                    

                            //For kotlin this is before the body of the constructor.
                    

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.preloadAsSound= jsonObject!.getBoolean(gdProjectStrings!.PRELOAD_AS_SOUND);
    
this.preloadAsMusic= jsonObject!.getBoolean(gdProjectStrings!.PRELOAD_AS_MUSIC);
    
}


}




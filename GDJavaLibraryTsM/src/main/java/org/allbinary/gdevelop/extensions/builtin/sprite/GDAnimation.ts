
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../../java/lang/Object.js';
        
import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

import { JSONArray } from '../../../../../../org/json/JSONArray.js';
//not GWT import const JSONArray

import { JSONObject } from '../../../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDDirection } from './GDDirection.js';
//not GWT import - same folder const GDDirection

export class GDAnimation
            extends Object
         {
        

    public readonly name: string;

    public readonly useMultipleDirections: boolean;

    public readonly directionList: BasicArrayList = new BasicArrayListD();

public constructor (jsonObject: JSONObject){

            super();
        
    var projectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.name= jsonObject!.getString(projectStrings!.NAME);
    
this.useMultipleDirections= jsonObject!.getBoolean(projectStrings!.USE_MULTIPLE_DIRECTIONS);
    

    var jsonArray: JSONArray = jsonObject!.getJSONArray(projectStrings!.DIRECTIONS)!;;
    

    var size: number = jsonArray!.length()!;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
this.directionList!.add(new GDDirection(jsonArray!.getJSONObject(index)));
    
}

}


}




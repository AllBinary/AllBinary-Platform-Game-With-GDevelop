
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


import { GDObject } from '../../../../../../org/allbinary/gdevelop/json/GDObject.js';
//not GWT import const GDObject

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
        import { GDAnimation } from './GDAnimation.js';
//not GWT import - same folder const GDAnimation

export class GDSpriteObject extends GDObject {
        

    private readonly animationList: BasicArrayList = new BasicArrayListD();

public constructor (type: string, jsonObject: Object){
            super(type, jsonObject);
                    

                            //For kotlin this is before the body of the constructor.
                    

    var projectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    var jsonArray: JSONArray = jsonObject!.getJSONArray(projectStrings!.ANIMATIONS)!;;
    

    var size: number = jsonArray!.length()!;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
this.animationList!.add(new GDAnimation(jsonArray!.getJSONObject(index)));
    
}

}


}




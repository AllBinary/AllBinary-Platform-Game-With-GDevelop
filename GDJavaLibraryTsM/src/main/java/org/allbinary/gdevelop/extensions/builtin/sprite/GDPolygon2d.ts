
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../../java/lang/Object.js';
        
import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings

import { PointFactory } from '../../../../../../org/allbinary/graphics/PointFactory.js';
//not GWT import const PointFactory

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

import { JSONArray } from '../../../../../../org/json/JSONArray.js';
//not GWT import const JSONArray

import { JSONObject } from '../../../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDPolygon2d
            extends Object
         {
        

    public readonly pointList: BasicArrayList = new BasicArrayListD();

public constructor (jsonArray: JSONArray){

            super();
        
    var pointFactory: PointFactory = PointFactory.getInstance()!;;
    

    var projectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    var size: number = jsonArray!.length()!;;
    

    var jsonObject: JSONObject;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
jsonObject= jsonArray!.getJSONObject(index);
    
this.pointList!.add(pointFactory!.createXY(jsonObject!.getInt(projectStrings!.X), jsonObject!.getInt(projectStrings!.Y)));
    
}

}


}




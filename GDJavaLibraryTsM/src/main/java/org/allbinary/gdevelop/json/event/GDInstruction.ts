
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../java/lang/Object.js';
        
import { GDProjectStrings } from '../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

import { JSONArray } from '../../../../../org/json/JSONArray.js';
//not GWT import const JSONArray

import { JSONObject } from '../../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDExpression } from './GDExpression.js';
//not GWT import - same folder const GDExpression

export class GDInstruction
            extends Object
         {
        

    public readonly typeValue: string;

    public readonly parametersExpressionList: BasicArrayList = new BasicArrayListD();

public constructor (jsonObject: JSONObject){

            super();
        
    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    var typeJSONObject: JSONObject = jsonObject!.getJSONObject(gdProjectStrings!.TYPE)!;;
    
this.typeValue= typeJSONObject!.getString(gdProjectStrings!.VALUE);
    

    var expressionJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.PARAMETERS)!;;
    

    var size: number = expressionJSONArray!.length()!;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
this.parametersExpressionList!.add(new GDExpression(expressionJSONArray!.getString(index)));
    
}

}


}





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
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
type BasicArrayListD<T = any, U = any> = typeof BasicArrayListD extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListD;

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
        
    let gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    let typeJSONObject: JSONObject = jsonObject!.getJSONObject(gdProjectStrings!.TYPE)!;;
    
this.typeValue= typeJSONObject!.getString(gdProjectStrings!.VALUE);
    

    let expressionJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.PARAMETERS)!;;
    

    let size: number = expressionJSONArray!.length()!;;
    




                        for (
    let index: number = 0;index < size; index++)
        {
this.parametersExpressionList!.add(new GDExpression(expressionJSONArray!.getString(index)));
    
}

}


}


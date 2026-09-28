
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

import { JSONArray } from '../../../../org/json/JSONArray.js';
//not GWT import const JSONArray

import { JSONObject } from '../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings

export class GDResourceFolder
            extends Object
         {
        

    private static readonly RESOURCES: string = "Resources: ";

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    public readonly name: string;

    public readonly resourceList: BasicArrayList = new BasicArrayListD();

public constructor (jsonObject: JSONObject){

            super();
        
    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.name= jsonObject!.getString(gdProjectStrings!.NAME);
    

    var jsonArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.RESOURCES)!;;
    

    var size: number = jsonArray!.length()!;;
    

    var nextJSONObject: JSONObject;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
nextJSONObject= jsonArray!.getJSONObject(index);
    
this.resourceList!.add(nextJSONObject!.getString(gdProjectStrings!.NAME));
    
}


    var commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    
this.logUtil!.putF(GDResourceFolder.RESOURCES +this.resourceList!.size(), this, commonStrings!.CONSTRUCTOR);
    
}


}




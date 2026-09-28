
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
import { GDResourceFactory } from '../../../../org/allbinary/gdevelop/json/resource/GDResourceFactory.js';
//not GWT import const GDResourceFactory

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

export class GDResourcesManager
            extends Object
         {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly RESOURCES: string = "GDResources: ";

    public readonly resourceList: BasicArrayList = new BasicArrayListD();

public constructor (jsonObject: JSONObject){

            super();
        
    var commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    var resourceFactory: GDResourceFactory = GDResourceFactory.getInstance()!;;
    

    var conditionJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.RESOURCES)!;;
    

    var size: number = conditionJSONArray!.length()!;;
    

    var nextJSONObject: JSONObject;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
nextJSONObject= conditionJSONArray!.getJSONObject(index);
    
this.resourceList!.add(resourceFactory!.create(nextJSONObject));
    
}

this.logUtil!.putF(this.RESOURCES +this.resourceList!.size(), this, commonStrings!.CONSTRUCTOR);
    
}


}




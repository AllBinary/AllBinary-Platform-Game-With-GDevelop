
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
type CommonStrings<T = any, U = any> = typeof CommonStrings extends abstract new (...args: any[]) => infer Instance ? Instance : typeof CommonStrings;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
type LogUtil<T = any, U = any> = typeof LogUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof LogUtil;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
type BasicArrayListD<T = any, U = any> = typeof BasicArrayListD extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListD;

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
        

    public static readonly NULL_GDRESOURCEMANAGER: GDResourcesManager = new GDResourcesManager(JSONObject.NULL_JSONOBJECT);

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly RESOURCES: string = "GDResources: ";

    public readonly resourceList: BasicArrayList = new BasicArrayListD();

public constructor (jsonObject: JSONObject){

            super();
        
                        if(jsonObject == JSONObject.NULL_JSONOBJECT)
                        
                                    {
                                    
                                    }
                                
                        else {
                            
    let commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    

    let gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    let resourceFactory: GDResourceFactory = GDResourceFactory.getInstance()!;;
    

    let conditionJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.RESOURCES)!;;
    

    let size: number = conditionJSONArray!.length()!;;
    

    let nextJSONObject: JSONObject;;
    




                        for (
    let index: number = 0;index < size; index++)
        {
nextJSONObject= conditionJSONArray!.getJSONObject(index);
    
this.resourceList!.add(resourceFactory!.create(nextJSONObject));
    
}

this.logUtil!.putF(this.RESOURCES +this.resourceList!.size(), this, commonStrings!.CONSTRUCTOR);
    

                        }
                            
}


}



        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../../java/lang/Object.js';
        
import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
type LogUtil<T = any, U = any> = typeof LogUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof LogUtil;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
type BasicArrayListD<T = any, U = any> = typeof BasicArrayListD extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListD;

import { JSONArray } from '../../../../../../org/json/JSONArray.js';
//not GWT import const JSONArray

import { JSONObject } from '../../../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDSprite } from './GDSprite.js';
//not GWT import - same folder const GDSprite

export class GDDirection
            extends Object
         {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    public readonly looping: boolean;

    public readonly timeBetweenFrames: number;

    public readonly spriteList: BasicArrayList = new BasicArrayListD();

public constructor (jsonObject: JSONObject){

            super();
        
    let projectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.looping= jsonObject!.getBoolean(projectStrings!.LOOPING);
    
this.timeBetweenFrames= jsonObject!.getInt(projectStrings!.TIME_BETWEEN_FRAMES);
    

    let jsonArray: JSONArray = jsonObject!.getJSONArray(projectStrings!.SPRITES)!;;
    

    let size: number = jsonArray!.length()!;;
    




                        for (
    let index: number = 0;index < size; index++)
        {
this.spriteList!.add(new GDSprite(jsonArray!.getJSONObject(index)));
    
}

}


}


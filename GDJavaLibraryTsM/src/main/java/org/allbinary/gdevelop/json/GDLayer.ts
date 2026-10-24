
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
            import { Integer } from '../../../../java/lang/Integer.js';
        
import { BasicColor } from '../../../../org/allbinary/graphics/color/BasicColor.js';
//not GWT import const BasicColor

import { BasicColorFactory } from '../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory

import { BasicColorUtil } from '../../../../org/allbinary/graphics/color/BasicColorUtil.js';
//not GWT import const BasicColorUtil

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

export class GDLayer
            extends Object
         {
        

    public readonly name: string;

    public readonly isVisible: boolean;

    public readonly isLightingLayer: boolean;

    public readonly followBaseLayerCamera: boolean;

    public readonly ambientLightBasicColor: BasicColor;

    public readonly cameraList: BasicArrayList = new BasicArrayListD();

    public readonly effectsList: BasicArrayList = new BasicArrayListD();

public constructor (jsonObject: JSONObject){

            super();
        
    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    var name: string;;
    

                        if(jsonObject!.has(gdProjectStrings!.NAME))
                        
                                    {
                                    name= jsonObject!.getString(gdProjectStrings!.NAME);
    

                                    }
                                
                        else {
                            name= Integer.toHexString(this.hashCode());
    

                        }
                            
this.name= name;
    

    var isVisible: boolean;;
    

                        if(jsonObject!.has(gdProjectStrings!.VISIBILITY))
                        
                                    {
                                    isVisible= jsonObject!.getBoolean(gdProjectStrings!.VISIBILITY);
    

                                    }
                                
                        else {
                            isVisible= false;
    

                        }
                            
this.isVisible= isVisible;
    

    var isLightingLayer: boolean;;
    

                        if(jsonObject!.has(gdProjectStrings!.VISIBILITY))
                        
                                    {
                                    isLightingLayer= jsonObject!.getBoolean(gdProjectStrings!.IS_LIGHTING_LAYER);
    

                                    }
                                
                        else {
                            isLightingLayer= false;
    

                        }
                            
this.isLightingLayer= isLightingLayer;
    

    var followBaseLayerCamera: boolean;;
    

                        if(jsonObject!.has(gdProjectStrings!.FOLLOW_BASE_LAYER_CAMERA))
                        
                                    {
                                    followBaseLayerCamera= jsonObject!.getBoolean(gdProjectStrings!.FOLLOW_BASE_LAYER_CAMERA);
    

                                    }
                                
                        else {
                            followBaseLayerCamera= false;
    

                        }
                            
this.followBaseLayerCamera= followBaseLayerCamera;
    

    var ambientLightBasicColor: BasicColor;;
    

                        if(jsonObject!.has(gdProjectStrings!.AMBIENT_LIGHT_COLOR_R))
                        
                                    {
                                    ambientLightBasicColor= BasicColorFactory.getInstance()!.createInstanceARGB(BasicColorUtil.getInstance()!.ALPHA, jsonObject!.getInt(gdProjectStrings!.AMBIENT_LIGHT_COLOR_R), jsonObject!.getInt(gdProjectStrings!.AMBIENT_LIGHT_COLOR_G), jsonObject!.getInt(gdProjectStrings!.AMBIENT_LIGHT_COLOR_B), this.name);
    

                                    }
                                
                        else {
                            ambientLightBasicColor= BasicColorFactory.getInstance()!.BLACK;
    

                        }
                            
this.ambientLightBasicColor= ambientLightBasicColor;
    

                        if(jsonObject!.has(gdProjectStrings!.CAMERAS))
                        
                                    {
                                    
    var camerasJSONArray: JSONArray = jsonObject!.getJSONArray(gdProjectStrings!.CAMERAS)!;;
    

    var size: number = camerasJSONArray!.length()!;;
    

    var nextJSONObject: JSONObject;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
nextJSONObject= camerasJSONArray!.getJSONObject(index);
    
this.cameraList!.add(new GDLayer(nextJSONObject));
    
}


                                    }
                                
}


}




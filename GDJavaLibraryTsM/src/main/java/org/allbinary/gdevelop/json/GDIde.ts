
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
type StringUtil<T = any, U = any> = typeof StringUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringUtil;

import { JSONArray } from '../../../../org/json/JSONArray.js';
//not GWT import const JSONArray

import { JSONException } from '../../../../org/json/JSONException.js';
//not GWT import const JSONException

import { JSONObject } from '../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings

export class GDIde
            extends Object
         {
        

    public major: number= 0;

    public minor: number= 0;

    public build: number= 0;

    public revision: number= 0;

    public author: string = StringUtil.getInstance()!.EMPTY_STRING;

    public packageName: string = StringUtil.getInstance()!.EMPTY_STRING;

    public orientation: string = StringUtil.getInstance()!.EMPTY_STRING;

    public folderProject: boolean= false;

    public latestCompilationDirectory: string = StringUtil.getInstance()!.EMPTY_STRING;

    public platformSpecificAssets: JSONObject = JSONObject.NULL_JSONOBJECT;

    public loadingScreen: JSONObject = JSONObject.NULL_JSONOBJECT;

    public extensionProperties: JSONArray = JSONArray.NULL_JSONARRAY;

    public currentPlatformName: string = StringUtil.getInstance()!.EMPTY_STRING;

    public platforms: JSONArray = JSONArray.NULL_JSONARRAY;

    public objectsGroups: JSONArray = JSONArray.NULL_JSONARRAY;

    public externalEvents: JSONArray = JSONArray.NULL_JSONARRAY;

    public eventsFunctionsExtensions: JSONArray = JSONArray.NULL_JSONARRAY;

                //@Throws(JSONException.constructor)
            
    public load(gameAsConfiguration: JSONObject){

    let gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    let versionJSONObject: JSONObject = gameAsConfiguration!.getJSONObject(gdProjectStrings!.GD_VERSION)!;;
    
this.major= versionJSONObject!.getInt(gdProjectStrings!.MAJOR);
    
this.minor= versionJSONObject!.getInt(gdProjectStrings!.MINOR);
    
this.build= versionJSONObject!.getInt(gdProjectStrings!.BUILD);
    
this.revision= versionJSONObject!.getInt(gdProjectStrings!.REVISION);
    

    let propertiesJSONObject: JSONObject = gameAsConfiguration!.getJSONObject(gdProjectStrings!.PROPERTIES)!;;
    
this.author= propertiesJSONObject!.getString(gdProjectStrings!.AUTHOR);
    
this.packageName= propertiesJSONObject!.getString(gdProjectStrings!.PACKAGE_NAME);
    
this.orientation= propertiesJSONObject!.getString(gdProjectStrings!.ORIENTATION);
    
this.folderProject= propertiesJSONObject!.getBoolean(gdProjectStrings!.FOLDER_PROJECT);
    
this.latestCompilationDirectory= propertiesJSONObject!.getString(gdProjectStrings!.LATEST_COMPILATION_DIRECTORY);
    
this.platformSpecificAssets= propertiesJSONObject!.getJSONObject(gdProjectStrings!.PLATFORM_SPECIFIC_ASSETS);
    
this.loadingScreen= propertiesJSONObject!.getJSONObject(gdProjectStrings!.LOADING_SCREEN);
    
this.extensionProperties= propertiesJSONObject!.getJSONArray(gdProjectStrings!.EXTENSION_PROPERTIES);
    
this.currentPlatformName= propertiesJSONObject!.getString(gdProjectStrings!.CURRENT_PLATFORM);
    
this.platforms= propertiesJSONObject!.getJSONArray(gdProjectStrings!.PLATFORMS);
    
this.objectsGroups= gameAsConfiguration!.getJSONArray(gdProjectStrings!.OBJECT_GROUPS);
    
this.externalEvents= gameAsConfiguration!.getJSONArray(gdProjectStrings!.EXTERNAL_EVENTS);
    
this.eventsFunctionsExtensions= gameAsConfiguration!.getJSONArray(gdProjectStrings!.EVENTS_FUNCTIONS_EXTENSIONS);
    
}


}


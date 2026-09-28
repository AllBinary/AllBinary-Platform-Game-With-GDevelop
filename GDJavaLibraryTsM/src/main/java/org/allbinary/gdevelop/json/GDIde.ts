
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
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

    public author: string;

    public packageName: string;

    public orientation: string;

    public folderProject: boolean= false;

    public latestCompilationDirectory: string;

    public platformSpecificAssets: JSONObject;

    public loadingScreen: JSONObject;

    public extensionProperties: JSONArray;

    public currentPlatformName: string;

    public platforms: JSONArray;

    public objectsGroups: JSONArray;

    public externalEvents: JSONArray;

    public eventsFunctionsExtensions: JSONArray;

                //@Throws(JSONException.constructor)
            
    public load(gameAsConfiguration: JSONObject){

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    

    var versionJSONObject: JSONObject = gameAsConfiguration!.getJSONObject(gdProjectStrings!.GD_VERSION)!;;
    
this.major= versionJSONObject!.getInt(gdProjectStrings!.MAJOR);
    
this.minor= versionJSONObject!.getInt(gdProjectStrings!.MINOR);
    
this.build= versionJSONObject!.getInt(gdProjectStrings!.BUILD);
    
this.revision= versionJSONObject!.getInt(gdProjectStrings!.REVISION);
    

    var propertiesJSONObject: JSONObject = gameAsConfiguration!.getJSONObject(gdProjectStrings!.PROPERTIES)!;;
    
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




/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
import { JSONArray } from '../../../../org/json/JSONArray.js';
//not GWT import const JSONException
import { JSONObject } from '../../../../org/json/JSONObject.js';
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings
export class GDIde extends Object {
    constructor() {
        super(...arguments);
        this.major = 0;
        this.minor = 0;
        this.build = 0;
        this.revision = 0;
        this.author = StringUtil.getInstance().EMPTY_STRING;
        this.packageName = StringUtil.getInstance().EMPTY_STRING;
        this.orientation = StringUtil.getInstance().EMPTY_STRING;
        this.folderProject = false;
        this.latestCompilationDirectory = StringUtil.getInstance().EMPTY_STRING;
        this.platformSpecificAssets = JSONObject.NULL_JSONOBJECT;
        this.loadingScreen = JSONObject.NULL_JSONOBJECT;
        this.extensionProperties = JSONArray.NULL_JSONARRAY;
        this.currentPlatformName = StringUtil.getInstance().EMPTY_STRING;
        this.platforms = JSONArray.NULL_JSONARRAY;
        this.objectsGroups = JSONArray.NULL_JSONARRAY;
        this.externalEvents = JSONArray.NULL_JSONARRAY;
        this.eventsFunctionsExtensions = JSONArray.NULL_JSONARRAY;
    }
    //@Throws(JSONException.constructor)
    load(gameAsConfiguration) {
        let gdProjectStrings = GDProjectStrings.getInstance();
        ;
        let versionJSONObject = gameAsConfiguration.getJSONObject(gdProjectStrings.GD_VERSION);
        ;
        this.major = versionJSONObject.getInt(gdProjectStrings.MAJOR);
        this.minor = versionJSONObject.getInt(gdProjectStrings.MINOR);
        this.build = versionJSONObject.getInt(gdProjectStrings.BUILD);
        this.revision = versionJSONObject.getInt(gdProjectStrings.REVISION);
        let propertiesJSONObject = gameAsConfiguration.getJSONObject(gdProjectStrings.PROPERTIES);
        ;
        this.author = propertiesJSONObject.getString(gdProjectStrings.AUTHOR);
        this.packageName = propertiesJSONObject.getString(gdProjectStrings.PACKAGE_NAME);
        this.orientation = propertiesJSONObject.getString(gdProjectStrings.ORIENTATION);
        this.folderProject = propertiesJSONObject.getBoolean(gdProjectStrings.FOLDER_PROJECT);
        this.latestCompilationDirectory = propertiesJSONObject.getString(gdProjectStrings.LATEST_COMPILATION_DIRECTORY);
        this.platformSpecificAssets = propertiesJSONObject.getJSONObject(gdProjectStrings.PLATFORM_SPECIFIC_ASSETS);
        this.loadingScreen = propertiesJSONObject.getJSONObject(gdProjectStrings.LOADING_SCREEN);
        this.extensionProperties = propertiesJSONObject.getJSONArray(gdProjectStrings.EXTENSION_PROPERTIES);
        this.currentPlatformName = propertiesJSONObject.getString(gdProjectStrings.CURRENT_PLATFORM);
        this.platforms = propertiesJSONObject.getJSONArray(gdProjectStrings.PLATFORMS);
        this.objectsGroups = gameAsConfiguration.getJSONArray(gdProjectStrings.OBJECT_GROUPS);
        this.externalEvents = gameAsConfiguration.getJSONArray(gdProjectStrings.EXTERNAL_EVENTS);
        this.eventsFunctionsExtensions = gameAsConfiguration.getJSONArray(gdProjectStrings.EVENTS_FUNCTIONS_EXTENSIONS);
    }
}

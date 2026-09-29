/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
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
        this.folderProject = false;
    }
    //@Throws(JSONException.constructor)
    load(gameAsConfiguration) {
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        var versionJSONObject = gameAsConfiguration.getJSONObject(gdProjectStrings.GD_VERSION);
        ;
        this.major = versionJSONObject.getInt(gdProjectStrings.MAJOR);
        this.minor = versionJSONObject.getInt(gdProjectStrings.MINOR);
        this.build = versionJSONObject.getInt(gdProjectStrings.BUILD);
        this.revision = versionJSONObject.getInt(gdProjectStrings.REVISION);
        var propertiesJSONObject = gameAsConfiguration.getJSONObject(gdProjectStrings.PROPERTIES);
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

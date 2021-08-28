/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDIde
{
    public int major;
    public int minor;
    public int build;
    public int revision;
    
    public String author;
    public String packageName;
    public String orientation;
    public boolean folderProject;
    public String latestCompilationDirectory;    
    
    public JSONObject platformSpecificAssets;
    public JSONObject loadingScreen;

    public boolean useExternalSourceFiles;
    
    public JSONArray extensionProperties;
    
    public String currentPlatformName;
    
    public JSONArray platforms;
    
    public JSONArray objectsGroups;
    public JSONArray externalEvents;
    public JSONArray eventsFunctionsExtensions;
    public JSONArray externalSourceFiles;
    
    public void load(JSONObject gameAsConfiguration) throws JSONException {
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        final JSONObject versionJSONObject = gameAsConfiguration.getJSONObject(gdProjectStrings.GD_VERSION);
        
        this.major = versionJSONObject.getInt(gdProjectStrings.MAJOR);
        this.minor = versionJSONObject.getInt(gdProjectStrings.MINOR);
        this.build = versionJSONObject.getInt(gdProjectStrings.BUILD);
        this.revision = versionJSONObject.getInt(gdProjectStrings.REVISION);
        
        final JSONObject propertiesJSONObject = gameAsConfiguration.getJSONObject(gdProjectStrings.PROPERTIES);
        
        this.author = propertiesJSONObject.getString(gdProjectStrings.AUTHOR);
        this.packageName = propertiesJSONObject.getString(gdProjectStrings.PACKAGE_NAME);
        this.orientation = propertiesJSONObject.getString(gdProjectStrings.ORIENTATION);
        this.folderProject = propertiesJSONObject.getBoolean(gdProjectStrings.FOLDER_PROJECT);
        this.latestCompilationDirectory = propertiesJSONObject.getString(gdProjectStrings.LATEST_COMPILATION_DIRECTORY);
        
        this.platformSpecificAssets = propertiesJSONObject.getJSONObject(gdProjectStrings.PLATFORM_SPECIFIC_ASSETS);
        
        this.loadingScreen = propertiesJSONObject.getJSONObject(gdProjectStrings.LOADING_SCREEN);
        
        this.useExternalSourceFiles = propertiesJSONObject.getBoolean(gdProjectStrings.USE_EXTERNAL_SOURCE_FILES);

        this.extensionProperties = propertiesJSONObject.getJSONArray(gdProjectStrings.EXTENSION_PROPERTIES);

        //useDeprecatedZeroAsDefaultZOrder
        //adMobAppId

        this.currentPlatformName = propertiesJSONObject.getString(gdProjectStrings.CURRENT_PLATFORM);
        
        this.platforms = propertiesJSONObject.getJSONArray(gdProjectStrings.PLATFORMS);
        
        this.objectsGroups = gameAsConfiguration.getJSONArray(gdProjectStrings.OBJECT_GROUPS);
        this.externalEvents = gameAsConfiguration.getJSONArray(gdProjectStrings.EXTERNAL_EVENTS);
    //gd::ExternalEvents& externalEvents = InsertNewExternalEvents(
        //externalEventElement.GetStringAttribute("name", "", "Name"),
        //GetExternalEventsCount());

        this.eventsFunctionsExtensions = gameAsConfiguration.getJSONArray(gdProjectStrings.EVENTS_FUNCTIONS_EXTENSIONS);
        
        this.externalSourceFiles = gameAsConfiguration.getJSONArray(gdProjectStrings.EXTERNAL_SOURCE_FILES);
    }
    
}


        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.json




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.json.JSONArray
import org.json.JSONException
import org.json.JSONObject

open public class GDIde
            : Object
         {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    var major: Int= 0

    var minor: Int= 0

    var build: Int= 0

    var revision: Int= 0

    var author: String

    var packageName: String

    var orientation: String

    var folderProject: Boolean= false

    var latestCompilationDirectory: String

    var platformSpecificAssets: JSONObject

    var loadingScreen: JSONObject

    var extensionProperties: JSONArray

    var currentPlatformName: String

    var platforms: JSONArray

    var objectsGroups: JSONArray

    var externalEvents: JSONArray

    var eventsFunctionsExtensions: JSONArray

                @Throws(JSONException::class)
            
    open fun load(gameAsConfiguration: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
var gameAsConfiguration = gameAsConfiguration

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!


    var versionJSONObject: JSONObject = gameAsConfiguration!!.getJSONObject(gdProjectStrings!!.GD_VERSION)!!

this.major= versionJSONObject!!.getInt(gdProjectStrings!!.MAJOR)
this.minor= versionJSONObject!!.getInt(gdProjectStrings!!.MINOR)
this.build= versionJSONObject!!.getInt(gdProjectStrings!!.BUILD)
this.revision= versionJSONObject!!.getInt(gdProjectStrings!!.REVISION)

    var propertiesJSONObject: JSONObject = gameAsConfiguration!!.getJSONObject(gdProjectStrings!!.PROPERTIES)!!

this.author= propertiesJSONObject!!.getString(gdProjectStrings!!.AUTHOR)
this.packageName= propertiesJSONObject!!.getString(gdProjectStrings!!.PACKAGE_NAME)
this.orientation= propertiesJSONObject!!.getString(gdProjectStrings!!.ORIENTATION)
this.folderProject= propertiesJSONObject!!.getBoolean(gdProjectStrings!!.FOLDER_PROJECT)
this.latestCompilationDirectory= propertiesJSONObject!!.getString(gdProjectStrings!!.LATEST_COMPILATION_DIRECTORY)
this.platformSpecificAssets= propertiesJSONObject!!.getJSONObject(gdProjectStrings!!.PLATFORM_SPECIFIC_ASSETS)
this.loadingScreen= propertiesJSONObject!!.getJSONObject(gdProjectStrings!!.LOADING_SCREEN)
this.extensionProperties= propertiesJSONObject!!.getJSONArray(gdProjectStrings!!.EXTENSION_PROPERTIES)
this.currentPlatformName= propertiesJSONObject!!.getString(gdProjectStrings!!.CURRENT_PLATFORM)
this.platforms= propertiesJSONObject!!.getJSONArray(gdProjectStrings!!.PLATFORMS)
this.objectsGroups= gameAsConfiguration!!.getJSONArray(gdProjectStrings!!.OBJECT_GROUPS)
this.externalEvents= gameAsConfiguration!!.getJSONArray(gdProjectStrings!!.EXTERNAL_EVENTS)
this.eventsFunctionsExtensions= gameAsConfiguration!!.getJSONArray(gdProjectStrings!!.EVENTS_FUNCTIONS_EXTENSIONS)
}


}
                
            



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
        
import org.allbinary.graphics.PointFactory
import org.allbinary.graphics.Rectangle
import org.allbinary.graphics.RectangleFactory
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringUtil
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONException
import org.json.JSONObject

open public class GDProject
            : Object
         {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val LOAD: String = "load"

    private val OBJECTS: String = "GDObjects: "

    private val VARIABLES: String = "GDVariables: "

    private val LAYOUTS: String = "GDLayouts: "

    private val EXTERNAL_LAYOUT: String = "GDExternalLayouts: "

    val gdIde: GDIde = GDIde()

    var packageName: String = StringUtil.getInstance()!!.EMPTY_STRING

    var name: String = StringUtil.getInstance()!!.EMPTY_STRING

    var version: String = StringUtil.getInstance()!!.EMPTY_STRING

    var gameResolutionSize: Rectangle = RectangleFactory.SINGLETON

    var maxFPS: Int= 0

    var minFPS: Int= 0

    var verticalSyncActivatedByDefault: Boolean= false

    var scaleMode: String = StringUtil.getInstance()!!.EMPTY_STRING

    var adaptGameResolutionAtRuntime: Boolean= false

    var sizeOnStartupMode: String = StringUtil.getInstance()!!.EMPTY_STRING

    var projectUuid: String = StringUtil.getInstance()!!.EMPTY_STRING

    var resourcesManager: GDResourcesManager = GDResourcesManager.NULL_GDRESOURCEMANAGER

    val objectList: BasicArrayList = BasicArrayListD()

    val variableList: BasicArrayList = BasicArrayListD()

    val layoutList: BasicArrayList = BasicArrayListD()

    val externalLayoutList: BasicArrayList = BasicArrayListD()

                @Throws(JSONException::class)
            
    open fun load(gameAsConfiguration: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameAsConfiguration = gameAsConfiguration

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.gdIde!!.load(gameAsConfiguration)

    var properties: JSONObject = gameAsConfiguration!!.getJSONObject(gdProjectStrings!!.PROPERTIES)!!

this.packageName= properties.getString(gdProjectStrings!!.PACKAGE_NAME)
this.name= properties.getString(gdProjectStrings!!.NAME)
this.version= properties.getString(gdProjectStrings!!.VERSION)

    var width: Int = properties.getInt(gdProjectStrings!!.WINDOW_WIDTH)


    var height: Int = properties.getInt(gdProjectStrings!!.WINDOW_HEIGHT)

this.gameResolutionSize= Rectangle(PointFactory.getInstance()!!.ZERO_ZERO, width, height)
this.maxFPS= properties.getInt(gdProjectStrings!!.MAX_FPS)
this.minFPS= properties.getInt(gdProjectStrings!!.MIN_FPS)
this.verticalSyncActivatedByDefault= properties.getBoolean(gdProjectStrings!!.VERTICAL_SYNC)
this.scaleMode= properties.getString(gdProjectStrings!!.SCALE_MODE)
this.adaptGameResolutionAtRuntime= properties.getBoolean(gdProjectStrings!!.ADAPT_GAME_RESOLUTION_AT_RUNTIME)
this.sizeOnStartupMode= properties.getString(gdProjectStrings!!.SIZE_ON_STARTUP_MODE)
this.projectUuid= properties.getString(gdProjectStrings!!.PROJECT_UUID)

    var resourceJSONObject: JSONObject = gameAsConfiguration!!.getJSONObject(gdProjectStrings!!.RESOURCES)!!

this.resourcesManager= GDResourcesManager(resourceJSONObject)

    var objectFactory: GDObjectFactory = GDObjectFactory.getInstance()!!


    var objectJSONArray: JSONArray = gameAsConfiguration!!.getJSONArray(gdProjectStrings!!.OBJECTS)!!


    var size: Int = objectJSONArray!!.length()


    var objectJSONObject: JSONObject





                        for (index in 0 until size)

        {
objectJSONObject= objectJSONArray!!.getJSONObject(index)
this.objectList!!.add(objectFactory!!.create(objectJSONObject))
}

this.logUtil!!.putF(this.OBJECTS +this.objectList!!.size(), this, this.LOAD)

    var variableJSONArray: JSONArray = gameAsConfiguration!!.getJSONArray(gdProjectStrings!!.VARIABLES)!!

size= variableJSONArray!!.length()




                        for (index in 0 until size)

        {
this.variableList!!.add(GDVariable(variableJSONArray!!.getJSONObject(index)))
}

this.logUtil!!.putF(this.VARIABLES +this.variableList!!.size(), this, this.LOAD)

    var layoutsJSONArray: JSONArray = gameAsConfiguration!!.getJSONArray(gdProjectStrings!!.LAYOUTS)!!

size= layoutsJSONArray!!.length()




                        for (index in 0 until size)

        {
objectJSONObject= layoutsJSONArray!!.getJSONObject(index)
this.layoutList!!.add(GDLayout(objectJSONObject))
}

this.logUtil!!.putF(this.LAYOUTS +this.layoutList!!.size(), this, this.LOAD)

    var externalLayoutsJSONArray: JSONArray = gameAsConfiguration!!.getJSONArray(gdProjectStrings!!.EXTERNAL_LAYOUTS)!!

size= externalLayoutsJSONArray!!.length()




                        for (index in 0 until size)

        {
objectJSONObject= externalLayoutsJSONArray!!.getJSONObject(index)
this.externalLayoutList!!.add(GDExternalLayout(objectJSONObject))
}

this.logUtil!!.putF(this.EXTERNAL_LAYOUT +this.externalLayoutList!!.size(), this, this.LOAD)
}


}
                
            


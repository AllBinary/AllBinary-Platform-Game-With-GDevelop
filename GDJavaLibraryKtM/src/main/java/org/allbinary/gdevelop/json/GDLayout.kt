
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
        
import org.allbinary.gdevelop.json.event.GDEvent
import org.allbinary.gdevelop.json.event.builtin.GDEventFactory
import org.allbinary.graphics.color.BasicColor
import org.allbinary.graphics.color.BasicColorFactory
import org.allbinary.graphics.color.BasicColorUtil
import org.allbinary.string.CommonStrings
import org.allbinary.logic.string.StringUtil
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONObject

open public class GDLayout
            : Object
         {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    val name: String

    val basicColor: BasicColor

    val title: String

    val standardSortMethod: Boolean

    val stopSoundsOnStartup: Boolean

    val disableInputWhenNotFocused: Boolean

    val objectList: BasicArrayList = BasicArrayListD()

    val initialInstanceList: BasicArrayList = BasicArrayListD()

    val layerList: BasicArrayList = BasicArrayListD()

    private val variableList: BasicArrayList = BasicArrayListD()

    val behaviorContentList: BasicArrayList = BasicArrayListD()

    val eventList: BasicArrayList = BasicArrayListD()
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.name= jsonObject!!.getString(gdProjectStrings!!.NAME)
this.basicColor= BasicColorFactory.getInstance()!!.createInstanceARGB(BasicColorUtil.getInstance()!!.ALPHA, jsonObject!!.getInt(gdProjectStrings!!.R), jsonObject!!.getInt(gdProjectStrings!!.G_V), jsonObject!!.getInt(gdProjectStrings!!.B), this.name)

    
                        if(jsonObject!!.has(gdProjectStrings!!.TITLE))
                        
                                    {
                                    this.title= jsonObject!!.getString(gdProjectStrings!!.TITLE)

                                    }
                                
                        else {
                            this.title= StringUtil.getInstance()!!.EMPTY_STRING

                        }
                            
this.standardSortMethod= jsonObject!!.getBoolean(gdProjectStrings!!.STANDARD_SORT_METHOD)
this.stopSoundsOnStartup= jsonObject!!.getBoolean(gdProjectStrings!!.STOP_SOUNDS_ON_STARTUP)
this.disableInputWhenNotFocused= jsonObject!!.getBoolean(gdProjectStrings!!.DISABLE_INPUT_WHEN_NOT_FOCUSED)

    var objectFactory: GDObjectFactory = GDObjectFactory.getInstance()!!


    var objectJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.OBJECTS)!!


    var size: Int = objectJSONArray!!.length()!!


    var nextJSONObject: JSONObject





                        for (index in 0 until size)

        {
nextJSONObject= objectJSONArray!!.getJSONObject(index)
this.objectList!!.add(objectFactory!!.create(nextJSONObject))
}


    var initialInstancesJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.INSTANCES)!!

size= initialInstancesJSONArray!!.length()




                        for (index in 0 until size)

        {
nextJSONObject= initialInstancesJSONArray!!.getJSONObject(index)
this.initialInstanceList!!.add(GDInitialInstance(nextJSONObject))
}


    var variableJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.VARIABLES)!!

size= variableJSONArray!!.length()




                        for (index in 0 until size)

        {
this.variableList!!.add(GDVariable(variableJSONArray!!.getJSONObject(index)))
}


    var layersJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.LAYERS)!!

size= layersJSONArray!!.length()




                        for (index in 0 until size)

        {
nextJSONObject= layersJSONArray!!.getJSONObject(index)
this.layerList!!.add(GDLayer(nextJSONObject))
}


    var behaviorsJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.BEHAVIORS_SHARED_DATA)!!

size= behaviorsJSONArray!!.length()




                        for (index in 0 until size)

        {
nextJSONObject= behaviorsJSONArray!!.getJSONObject(index)
this.behaviorContentList!!.add(GDBehavior(nextJSONObject))
}


    var eventFactory: GDEventFactory = GDEventFactory.getInstance()!!


    var eventJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.EVENTS)!!

size= eventJSONArray!!.length()

    var event: GDEvent





                        for (index in 0 until size)

        {
event= eventFactory!!.create(eventJSONArray!!.getJSONObject(index))

    
                        if(event != 
                                    null
                                )
                        
                                    {
                                    this.eventList!!.add(event)

                                    }
                                
                        else {
                            
    var commonStrings: CommonStrings = CommonStrings.getInstance()!!

this.logUtil!!.put(commonStrings!!.EXCEPTION, this, commonStrings!!.CONSTRUCTOR, Exception())

                        }
                            
}

}


}
                
            


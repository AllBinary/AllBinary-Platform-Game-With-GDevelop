
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
        
import org.allbinary.util.ABHashMap
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONObject

open public class GDInitialInstance
            : Object
         {
        

    val numberPropertiesMap: ABHashMap<String, Double> = ABHashMap<String, Double>()

    val stringPropertiesMap: ABHashMap<String, String> = ABHashMap<String, String>()

    val name: String

    val x: Double

    val y: Double

    val angle: Double

    val zOrder: Int

    val layer: String

    val personalizedSize: Boolean

    val width: Double

    val height: Double

    val initialVariableList: BasicArrayList = BasicArrayListD()

    val persistentUuid: String
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.name= jsonObject!!.getString(gdProjectStrings!!.NAME)
this.x= jsonObject!!.getDouble(gdProjectStrings!!.X)
this.y= jsonObject!!.getDouble(gdProjectStrings!!.Y)
this.angle= jsonObject!!.getDouble(gdProjectStrings!!.ANGLE)
this.zOrder= jsonObject!!.getInt(gdProjectStrings!!.Z_ORDER)
this.personalizedSize= jsonObject!!.getBoolean(gdProjectStrings!!.CUSTOM_SIZE)
this.layer= jsonObject!!.getString(gdProjectStrings!!.LAYER)
this.width= jsonObject!!.getDouble(gdProjectStrings!!.WIDTH)
this.height= jsonObject!!.getDouble(gdProjectStrings!!.HEIGHT)
this.persistentUuid= jsonObject!!.getString(gdProjectStrings!!.PERSISTED_UUID)

    var numberPropertiesJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.NUMBER_PROPERTIES)!!


    var size: Int = numberPropertiesJSONArray!!.length()!!


    var nextJSONObject: JSONObject


    var name: String


    var valueAsDouble: Double





                        for (index in 0 until size)

        {
nextJSONObject= numberPropertiesJSONArray!!.getJSONObject(index)
name= nextJSONObject!!.getString(gdProjectStrings!!.NAME)
valueAsDouble= nextJSONObject!!.getDouble(gdProjectStrings!!.VALUE)
this.numberPropertiesMap!!.put(name, valueAsDouble)
}


    var stringPropertiesJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.STRING_PROPERTIES)!!

size= stringPropertiesJSONArray!!.length()

    var value: String





                        for (index in 0 until size)

        {
nextJSONObject= stringPropertiesJSONArray!!.getJSONObject(index)
name= nextJSONObject!!.getString(gdProjectStrings!!.NAME)
value= nextJSONObject!!.getString(gdProjectStrings!!.VALUE)
this.stringPropertiesMap!!.put(name, value)
}


    var variableJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.INITIAL_VARIABLE)!!

size= variableJSONArray!!.length()




                        for (index in 0 until size)

        {
this.initialVariableList!!.add(GDVariable(variableJSONArray!!.getJSONObject(index)))
}

}


}
                
            



        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.json.event.builtin




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.json.GDProjectStrings
import org.allbinary.gdevelop.json.event.GDEvent
import org.allbinary.gdevelop.json.event.GDExpression
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONObject

open public class GDGroupEvent : GDEvent {
        

    val name: String

    val source: String

    val creationTime: Int

    val colorR: Int

    val colorG: Int

    val colorB: Int

    val parametersExpressionList: BasicArrayList = BasicArrayListD()

    val eventList: BasicArrayList = BasicArrayListD()
public constructor (type: String, jsonObject: JSONObject)                        

                            : super(type, jsonObject){
    //var type = type
    //var jsonObject = jsonObject


                            //For kotlin this is before the body of the constructor.
                    

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!


    var eventFactory: GDEventFactory = GDEventFactory.getInstance()!!

this.name= jsonObject!!.getString(gdProjectStrings!!.NAME)
this.source= jsonObject!!.getString(gdProjectStrings!!.SOURCE)
this.creationTime= jsonObject!!.getInt(gdProjectStrings!!.CREATION_TIME)
this.colorR= jsonObject!!.getInt(gdProjectStrings!!.COLOR_R)
this.colorG= jsonObject!!.getInt(gdProjectStrings!!.COLOR_G)
this.colorB= jsonObject!!.getInt(gdProjectStrings!!.COLOR_B)

    var expressionJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.PARAMETERS)!!


    var size: Int = expressionJSONArray!!.length()!!


    var nextJSONObject: JSONObject





                        for (index in 0 until size)

        {
this.parametersExpressionList!!.add(GDExpression(expressionJSONArray!!.getString(index)))
}


    var eventJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.EVENTS)!!

size= eventJSONArray!!.length()




                        for (index in 0 until size)

        {
nextJSONObject= eventJSONArray!!.getJSONObject(index)
this.eventList!!.add(eventFactory!!.create(nextJSONObject))
}

}


}
                
            


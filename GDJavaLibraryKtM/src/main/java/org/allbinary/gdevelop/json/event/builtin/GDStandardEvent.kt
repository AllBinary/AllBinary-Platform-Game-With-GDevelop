
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
import org.allbinary.gdevelop.json.event.GDInstruction
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONObject

open public class GDStandardEvent : GDEvent {
        

    val conditionList: BasicArrayList = BasicArrayListD()

    val actionList: BasicArrayList = BasicArrayListD()

    val eventList: BasicArrayList = BasicArrayListD()
public constructor (type: String, jsonObject: JSONObject)                        

                            : super(type, jsonObject){
    //var type = type
    //var jsonObject = jsonObject


                            //For kotlin this is before the body of the constructor.
                    

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!


    var eventFactory: GDEventFactory = GDEventFactory.getInstance()!!


    var conditionJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.CONDITIIONS)!!


    var size: Int = conditionJSONArray!!.length()


    var nextJSONObject: JSONObject





                        for (index in 0 until size)

        {
nextJSONObject= conditionJSONArray!!.getJSONObject(index)
this.conditionList!!.add(GDInstruction(nextJSONObject))
}


    var actionJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.ACTIONS)!!

size= actionJSONArray!!.length()




                        for (index in 0 until size)

        {
nextJSONObject= actionJSONArray!!.getJSONObject(index)
this.actionList!!.add(GDInstruction(nextJSONObject))
}


    
                        if(jsonObject!!.has(gdProjectStrings!!.EVENTS))
                        
                                    {
                                    
    var eventJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.EVENTS)!!

size= eventJSONArray!!.length()




                        for (index in 0 until size)

        {
nextJSONObject= eventJSONArray!!.getJSONObject(index)
this.eventList!!.add(eventFactory!!.create(nextJSONObject))
}


                                    }
                                
}


}
                
            


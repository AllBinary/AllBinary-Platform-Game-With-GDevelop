
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
import org.allbinary.gdevelop.json.event.GDExpression
import org.allbinary.gdevelop.json.event.GDInstruction
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONObject
import org.json.JSONArray

open public class GDWhileEvent : GDStandardEvent {
        

    val whileConditionInstructionList: BasicArrayList = BasicArrayListD()

    val infiniteLoopWarning: Boolean

    val justCreatedByTheUser: Boolean
public constructor (type: String, jsonObject: JSONObject)                        

                            : super(type, jsonObject){
    //var type = type
    //var jsonObject = jsonObject


                            //For kotlin this is before the body of the constructor.
                    

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.justCreatedByTheUser= false
this.infiniteLoopWarning= jsonObject!!.getBoolean(gdProjectStrings!!.INFINITE_LOOP_WARNING)

    var whileConditionJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.WHILE_CONDITIONS)!!


    var size: Int = whileConditionJSONArray!!.length()


    var nextJSONObject: JSONObject





                        for (index in 0 until size)

        {
nextJSONObject= whileConditionJSONArray!!.getJSONObject(index)
this.whileConditionInstructionList!!.add(GDInstruction(nextJSONObject))
}

}


}
                
            


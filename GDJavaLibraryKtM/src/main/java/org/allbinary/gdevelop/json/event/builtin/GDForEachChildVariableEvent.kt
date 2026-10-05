
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
import org.allbinary.util.BasicArrayList
import org.json.JSONArray
import org.json.JSONObject

open public class GDForEachChildVariableEvent : GDStandardEvent {
        

    val valueIteratorVariableName: String

    val keyIteratorVariableName: String

    val iterableVariableName: String
public constructor (type: String, jsonObject: JSONObject)                        

                            : super(type, jsonObject){
    //var type = type
    //var jsonObject = jsonObject


                            //For kotlin this is before the body of the constructor.
                    

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.valueIteratorVariableName= jsonObject!!.getString(gdProjectStrings!!.VALUE_ITERATOR_VARIABLE_NAME)
this.keyIteratorVariableName= jsonObject!!.getString(gdProjectStrings!!.KEY_ITERATOR_VARIABLE_NAME)
this.iterableVariableName= jsonObject!!.getString(gdProjectStrings!!.ITERABLE_VARIABLE_NAME)
}


}
                
            


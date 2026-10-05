
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
import org.json.JSONObject

open public class GDEffect
            : Object
         {
        

    val name: String

    val effectType: String

    val doubleParameterMap: ABHashMap<String, Double> = ABHashMap<String, Double>()

    val stringParameterMap: ABHashMap<String, String> = ABHashMap<String, String>()

    val booleanParameterMap: ABHashMap<String, Boolean> = ABHashMap<String, Boolean>()
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.name= jsonObject!!.getString(gdProjectStrings!!.NAME)
this.effectType= jsonObject!!.getString(gdProjectStrings!!.EFFECT_TYPE)
}


}
                
            



        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.json.event




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.json.GDProjectStrings
import org.json.JSONObject

open public class GDEvent
            : Object
         {
        

    val type: String
public constructor (type: String, jsonObject: JSONObject)
            : super()
        {
    //var type = type
    //var jsonObject = jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.type= type
}


}
                
            



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
        
import org.json.JSONObject

open public class GDBehavior
            : Object
         {
        

    val name: String

    val type: String

    val jsonObject: JSONObject
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.type= jsonObject!!.getString(gdProjectStrings!!.TYPE)
this.name= jsonObject!!.getString(gdProjectStrings!!.NAME)
this.jsonObject= jsonObject
}


}
                
            


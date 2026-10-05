
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.json.resource




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.json.GDProjectStrings
import org.json.JSONObject

open public class GDJsonResource : GDResource {
        

    val disablePreload: Boolean
public constructor (kind: String, jsonObject: JSONObject)                        

                            : super(kind, jsonObject){
    //var kind = kind
    //var jsonObject = jsonObject


                            //For kotlin this is before the body of the constructor.
                    

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.disablePreload= jsonObject!!.getBoolean(gdProjectStrings!!.DISABLE_PRELOAD)
}


}
                
            


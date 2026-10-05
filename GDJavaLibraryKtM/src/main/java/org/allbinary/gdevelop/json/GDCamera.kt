
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

open public class GDCamera
            : Object
         {
        

    val defaultSize: Boolean

    val defaultViewport: Boolean

    val x1: Double

    val y1: Double

    val x2: Double

    val y2: Double

    val width: Double

    val height: Double
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.defaultSize= jsonObject!!.getBoolean(gdProjectStrings!!.DEFAULT_SIZE)
this.defaultViewport= jsonObject!!.getBoolean(gdProjectStrings!!.DEFAULT_VIEWPORT)
this.width= jsonObject!!.getDouble(gdProjectStrings!!.WIDTH)
this.height= jsonObject!!.getDouble(gdProjectStrings!!.HEIGHT)
this.x1= jsonObject!!.getDouble(gdProjectStrings!!.VIEWPORT_LEFT)
this.y1= jsonObject!!.getDouble(gdProjectStrings!!.VIEWPORT_TOP)
this.x2= jsonObject!!.getDouble(gdProjectStrings!!.VIEWPORT_RIGHT)
this.y2= jsonObject!!.getDouble(gdProjectStrings!!.VIEWPORT_BOTTOM)
}


}
                
            


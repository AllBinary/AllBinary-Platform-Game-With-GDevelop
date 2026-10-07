
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.extensions.builtin.sprite




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.json.GDProjectStrings
import org.allbinary.logic.communication.log.LogUtil
import org.json.JSONObject

open public class GDPoint
            : Object
         {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    val name: String

    val automatic: Boolean

    val x: Int

    val y: Int
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var projectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.name= jsonObject!!.getString(projectStrings!!.NAME)

    var automatic: Boolean = false


    
                        if(jsonObject!!.has(projectStrings!!.AUTOMATIC))
                        
                                    {
                                    automatic= jsonObject!!.getBoolean(projectStrings!!.AUTOMATIC)

                                    }
                                
this.automatic= automatic
this.x= jsonObject!!.getInt(projectStrings!!.X)
this.y= jsonObject!!.getInt(projectStrings!!.Y)
}


}
                
            


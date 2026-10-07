
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
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONObject

open public class GDDirection
            : Object
         {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    val looping: Boolean

    val timeBetweenFrames: Int

    val spriteList: BasicArrayList = BasicArrayListD()
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var projectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.looping= jsonObject!!.getBoolean(projectStrings!!.LOOPING)
this.timeBetweenFrames= jsonObject!!.getInt(projectStrings!!.TIME_BETWEEN_FRAMES)

    var jsonArray: JSONArray = jsonObject!!.getJSONArray(projectStrings!!.SPRITES)!!


    var size: Int = jsonArray!!.length()





                        for (index in 0 until size)

        {
this.spriteList!!.add(GDSprite(jsonArray!!.getJSONObject(index)))
}

}


}
                
            


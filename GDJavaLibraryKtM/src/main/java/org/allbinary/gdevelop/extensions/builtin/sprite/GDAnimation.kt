
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
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONObject

open public class GDAnimation
            : Object
         {
        

    val name: String

    val useMultipleDirections: Boolean

    val directionList: BasicArrayList = BasicArrayListD()
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var projectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.name= jsonObject!!.getString(projectStrings!!.NAME)
this.useMultipleDirections= jsonObject!!.getBoolean(projectStrings!!.USE_MULTIPLE_DIRECTIONS)

    var jsonArray: JSONArray = jsonObject!!.getJSONArray(projectStrings!!.DIRECTIONS)!!


    var size: Int = jsonArray!!.length()





                        for (index in 0 until size)

        {
this.directionList!!.add(GDDirection(jsonArray!!.getJSONObject(index)))
}

}


}
                
            


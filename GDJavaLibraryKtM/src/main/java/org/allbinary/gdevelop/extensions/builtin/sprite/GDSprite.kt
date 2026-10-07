
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

open public class GDSprite
            : Object
         {
        

    val hasCustomCollisionMask: Boolean

    val imageAsString: String

    val pointList: BasicArrayList = BasicArrayListD()

    val originPoint: GDPoint

    val centerPoint: GDPoint

    val polygon2dList: BasicArrayList = BasicArrayListD()
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var projectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.hasCustomCollisionMask= jsonObject!!.getBoolean(projectStrings!!.HAS_CUSTOM_COLLISION_MASK)
this.imageAsString= jsonObject!!.getString(projectStrings!!.IMAGE)

    var jsonArray: JSONArray = jsonObject!!.getJSONArray(projectStrings!!.POINTS)!!


    var size: Int = jsonArray!!.length()





                        for (index in 0 until size)

        {
this.pointList!!.add(GDPoint(jsonArray!!.getJSONObject(index)))
}

this.originPoint= GDPoint(jsonObject!!.getJSONObject(projectStrings!!.ORIGIN_POINTS))
this.centerPoint= GDPoint(jsonObject!!.getJSONObject(projectStrings!!.CENTER_POINTS))

    var polygon2dJSONArray: JSONArray = jsonObject!!.getJSONArray(projectStrings!!.CUSTOM_COLLISION_MASK)!!


    var size2: Int = polygon2dJSONArray!!.length()





                        for (index in 0 until size2)

        {
this.polygon2dList!!.add(GDPolygon2d(polygon2dJSONArray!!.getJSONArray(index)))
}

}


}
                
            


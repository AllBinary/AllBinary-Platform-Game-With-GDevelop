
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
import org.allbinary.graphics.PointFactory
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONObject

open public class GDPolygon2d
            : Object
         {
        

    val pointList: BasicArrayList = BasicArrayListD()
public constructor (jsonArray: JSONArray)
            : super()
        {
    //var jsonArray = jsonArray

    var pointFactory: PointFactory = PointFactory.getInstance()!!


    var projectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!


    var size: Int = jsonArray!!.length()


    var jsonObject: JSONObject





                        for (index in 0 until size)

        {
jsonObject= jsonArray!!.getJSONObject(index)
this.pointList!!.add(pointFactory!!.createXY(jsonObject!!.getInt(projectStrings!!.X), jsonObject!!.getInt(projectStrings!!.Y)))
}

}


}
                
            



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
        
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONObject

open public class GDExternalLayout
            : Object
         {
        

    val name: String

    val initialInstanceList: BasicArrayList = BasicArrayListD()

    val associatedLayout: String
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.name= jsonObject!!.getString(gdProjectStrings!!.NAME)

    var initialInstancesJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.INSTANCES)!!


    var size: Int = initialInstancesJSONArray!!.length()!!


    var nextJSONObject: JSONObject





                        for (index in 0 until size)

        {
nextJSONObject= initialInstancesJSONArray!!.getJSONObject(index)
this.initialInstanceList!!.add(GDInitialInstance(nextJSONObject))
}

this.associatedLayout= jsonObject!!.getString(gdProjectStrings!!.ASSOCIATED_LAYOUT)
}


}
                
            


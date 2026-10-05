
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
        
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONObject

open public class GDResourceFolder
            : Object
         {
        
companion object {
            
    private val RESOURCES: String = "Resources: "

        }
            
    val logUtil: LogUtil = LogUtil.getInstance()!!

    val name: String

    val resourceList: BasicArrayList = BasicArrayListD()
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.name= jsonObject!!.getString(gdProjectStrings!!.NAME)

    var jsonArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.RESOURCES)!!


    var size: Int = jsonArray!!.length()!!


    var nextJSONObject: JSONObject





                        for (index in 0 until size)

        {
nextJSONObject= jsonArray!!.getJSONObject(index)
this.resourceList!!.add(nextJSONObject!!.getString(gdProjectStrings!!.NAME))
}


    var commonStrings: CommonStrings = CommonStrings.getInstance()!!

this.logUtil!!.putF(GDResourceFolder.RESOURCES +this.resourceList!!.size(), this, commonStrings!!.CONSTRUCTOR)
}


}
                
            



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
        
import org.allbinary.gdevelop.json.resource.GDResourceFactory
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONObject

open public class GDResourcesManager
            : Object
         {
        
companion object {
            
    val NULL_GDRESOURCEMANAGER: GDResourcesManager = GDResourcesManager(JSONObject.NULL_JSONOBJECT)

        }
            
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val RESOURCES: String = "GDResources: "

    val resourceList: BasicArrayList = BasicArrayListD()
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var commonStrings: CommonStrings = CommonStrings.getInstance()!!


    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!


    var resourceFactory: GDResourceFactory = GDResourceFactory.getInstance()!!


    var conditionJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.RESOURCES)!!


    var size: Int = conditionJSONArray!!.length()


    var nextJSONObject: JSONObject





                        for (index in 0 until size)

        {
nextJSONObject= conditionJSONArray!!.getJSONObject(index)
this.resourceList!!.add(resourceFactory!!.create(nextJSONObject))
}

this.logUtil!!.putF(this.RESOURCES +this.resourceList!!.size(), this, commonStrings!!.CONSTRUCTOR)
}


}
                
            


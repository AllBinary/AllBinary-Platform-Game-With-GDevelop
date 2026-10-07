
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
        
import org.allbinary.logic.string.StringUtil
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONObject

open public class GDObject
            : Object
         {
        

    val jsonObject: JSONObject

    val type: String

    val name: String

    val tags: String

    val variableList: BasicArrayList = BasicArrayListD()

    val effectsList: BasicArrayList = BasicArrayListD()

    val behaviorContentList: BasicArrayList = BasicArrayListD()
public constructor (type: String, jsonObject: JSONObject)
            : super()
        {
    //var type = type
    //var jsonObject = jsonObject
this.jsonObject= jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.type= type
this.name= jsonObject!!.getString(gdProjectStrings!!.NAME)

    
                        if(jsonObject!!.has(gdProjectStrings!!.TAGS))
                        
                                    {
                                    this.tags= jsonObject!!.getString(gdProjectStrings!!.TAGS)

                                    }
                                
                        else {
                            this.tags= StringUtil.getInstance()!!.EMPTY_STRING

                        }
                            

    var variableJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.VARIABLES)!!


    var size: Int = variableJSONArray!!.length()





                        for (index in 0 until size)

        {
this.variableList!!.add(GDVariable(variableJSONArray!!.getJSONObject(index)))
}


    
                        if(jsonObject!!.has(gdProjectStrings!!.EFFECTS))
                        
                                    {
                                    
    var effectsJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.EFFECTS)!!

size= effectsJSONArray!!.length()




                        for (index in 0 until size)

        {
this.effectsList!!.add(GDEffect(effectsJSONArray!!.getJSONObject(index)))
}


                                    }
                                

    var behaviorsJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.BEHAVIORS)!!

size= behaviorsJSONArray!!.length()




                        for (index in 0 until size)

        {
this.behaviorContentList!!.add(GDBehavior(behaviorsJSONArray!!.getJSONObject(index)))
}

}


}
                
            


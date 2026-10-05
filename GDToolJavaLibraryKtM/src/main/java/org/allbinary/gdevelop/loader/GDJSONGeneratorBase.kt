
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2022 AllBinary 
                *   
                *  By agreeing to this license you and any business entity you represent are 
                *  legally bound to the AllBinary Open License Version 1 legal agreement. 
                *   
                *  You may obtain the AllBinary Open License Version 1 legal agreement from 
                *  AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
                *   
                *  Created By: Travis Berthelot    
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        import java.lang.System
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.json.GDProjectStrings
import org.json.JSONArray
import org.json.JSONObject

open public class GDJSONGeneratorBase
            : Object
         {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

    val LEVEL: String = "Level"

    private val LAYOUT: String = "Layout: "

    val PROCESSING_LAYOUT: String = "Processing Layout: "

                @Throws(Exception::class)
            
    open fun processLayout(jsonObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonObject = jsonObject
}


                @Throws(Exception::class)
            
    open fun process(gameAsConfigurationJSONObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameAsConfigurationJSONObject = gameAsConfigurationJSONObject

    var jsonArray: JSONArray = gameAsConfigurationJSONObject!!.getJSONArray(this.gdProjectStrings!!.LAYOUTS)!!


    var size: Int = jsonArray!!.length()!!


    var jsonObject: JSONObject


    var value: String





                        for (index in 0 until size)

        {
jsonObject= jsonArray!!.getJSONObject(index)
value= jsonObject!!.getString(this.gdProjectStrings!!.NAME)
System.out.println(this.LAYOUT +value)
this.processLayout(jsonObject)
}

}


}
                
            


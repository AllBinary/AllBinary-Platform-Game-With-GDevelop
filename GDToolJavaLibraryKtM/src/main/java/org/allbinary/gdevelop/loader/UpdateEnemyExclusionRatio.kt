
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2025 AllBinary 
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
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.json.GDProjectStrings
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.string.CommonStrings
import org.json.JSONArray
import org.json.JSONObject

open public class UpdateEnemyExclusionRatio
            : Object
         {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

    open fun process(gameAsConfigurationJSONObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameAsConfigurationJSONObject = gameAsConfigurationJSONObject

    var ENEMY_EXCLUSION_RATIO: String = "enemyExclusionRatio"


    var jsonArray: JSONArray = gameAsConfigurationJSONObject!!.getJSONArray("layouts")!!


    var jsonObject: JSONObject = jsonArray!!.getJSONObject(1)!!


    var variablesJSONArray: JSONArray = jsonObject!!.getJSONArray("variables")!!


    var size: Int = variablesJSONArray!!.length()!!





                        for (index in 0 until size)

        {
jsonObject= variablesJSONArray!!.getJSONObject(index)

    
                        if(jsonObject!!.getString(this.gdProjectStrings!!.NAME)!!.compareTo(ENEMY_EXCLUSION_RATIO) == 0)
                        
                                    {
                                    jsonObject!!.put(this.gdProjectStrings!!.VALUE, 1)

                                    }
                                
}

}


}
                
            


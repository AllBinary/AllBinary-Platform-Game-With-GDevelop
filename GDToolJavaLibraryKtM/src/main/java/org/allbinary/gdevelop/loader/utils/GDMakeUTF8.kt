
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
        package org.allbinary.gdevelop.loader.utils




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.loader.GDJSONGeneratorBase
import org.allbinary.gdevelop.loader.GDJSONPersistence
import org.allbinary.gdevelop.loader.GDPaths
import org.json.JSONObject

open public class GDMakeUTF8 : GDJSONGeneratorBase {
        
companion object {
            
                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args
GDPaths.init()

    var gdJSONPersistence: GDJSONPersistence = GDJSONPersistence.getInstance()!!


    var gameAsConfigurationJSONObject: JSONObject = gdJSONPersistence!!.load()!!

GDMakeAllResourcesLowerCaseForAndroid().
                            process(gameAsConfigurationJSONObject)

    var gdPaths: GDPaths = GDPaths.getInstance()!!


    var jsonAsString: String = gameAsConfigurationJSONObject!!.toString(2)!!


    var fixed: String = jsonAsString!!.replaceAll("[^\\x00-\\x7F]", "nonUTF-8char")!!

gdJSONPersistence!!.save(gdPaths!!.ROOT_PATH +"game_updated.json", fixed)
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
}
                
            


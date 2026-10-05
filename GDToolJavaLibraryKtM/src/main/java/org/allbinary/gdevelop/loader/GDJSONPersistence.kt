
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
        
import java.io.FileInputStream
import java.io.FileOutputStream
import org.allbinary.logic.io.StreamUtil
import org.json.JSONObject
import org.json.JSONTokener

open public class GDJSONPersistence
            : Object
         {
        
companion object {
            
    private val instance: GDJSONPersistence = GDJSONPersistence()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDJSONPersistence{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDJSONPersistence.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

                @Throws(Exception::class)
            
    open fun load()
        //nullable = true from not(false or (false and true)) = true
: JSONObject{

    var streamUtil: StreamUtil = StreamUtil.getInstance()!!


    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!

sharedBytes!!.outputStream!!.reset()

    var inputStream: FileInputStream = FileInputStream(this.gdPaths!!.GAME_JSON_PATH)


    var gameAsConfiguration: String = streamUtil!!.getByteArray.toCharArray()


    var jsonTokener: JSONTokener = JSONTokener(gameAsConfiguration)


    var gameAsConfigurationJSONObject: JSONObject = jsonTokener!!.nextValue() as JSONObject




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return gameAsConfigurationJSONObject
}


                @Throws(Exception::class)
            
    open fun save(saveFilePath: String, gameAsConfigurationJSONObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var saveFilePath = saveFilePath
    //var gameAsConfigurationJSONObject = gameAsConfigurationJSONObject

    var jsonAsString: String = gameAsConfigurationJSONObject!!.toString(2)!!

this.save(saveFilePath, jsonAsString)
}


                @Throws(Exception::class)
            
    open fun save(saveFilePath: String, jsonAsString: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var saveFilePath = saveFilePath
    //var jsonAsString = jsonAsString

    var byteArray: ByteArray = jsonAsString!!.encodeToByteArray()!!

System.out.println("Saving bytes: " +byteArray!!.size)

    var outputStream: FileOutputStream = FileOutputStream(saveFilePath)

outputStream!!.write(byteArray)
outputStream!!.flush()
outputStream!!.close()
}


}
                
            


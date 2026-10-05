
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
        
        import java.lang.System
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.loader.GDJSONGeneratorBase
import org.allbinary.gdevelop.loader.GDJSONPersistence
import org.allbinary.gdevelop.loader.GDPaths
import org.allbinary.logic.io.file.FileUnamedUtil
import org.json.JSONArray
import org.json.JSONObject

open public class GDMakeAllResourcesLowerCaseForAndroid : GDJSONGeneratorBase {
        
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

gdJSONPersistence!!.save(gdPaths!!.ROOT_PATH +"game_updated.json", gameAsConfigurationJSONObject)
}


        }
            
    private val fileUnamedUtil: FileUnamedUtil = FileUnamedUtil.getInstance()!!
public constructor (){
}


    private val TEXTURE: String = "Texture: "

    private val IMAGE: String = "Image: "

                @Throws(Exception::class)
            
    override fun process(gameAsConfigurationJSONObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameAsConfigurationJSONObject = gameAsConfigurationJSONObject

    var jsonObject: JSONObject = gameAsConfigurationJSONObject!!.getJSONObject(this.gdProjectStrings!!.RESOURCES)!!


    var jsonArray: JSONArray = jsonObject!!.getJSONArray(this.gdProjectStrings!!.RESOURCES)!!

this.processResources(jsonArray)
super.process(gameAsConfigurationJSONObject)
}


    open fun processResources(jsonArray: JSONArray)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonArray = jsonArray
System.out.println("Resource Total: " +jsonArray!!.length())

    var jsonObject: JSONObject


    var value: String





                        for (index in 0 until jsonArray!!.length()!!)

        {
jsonObject= jsonArray!!.getJSONObject(index)
value= jsonObject!!.getString(this.gdProjectStrings!!.FILE)
jsonObject!!.put(this.gdProjectStrings!!.FILE, this.fileUnamedUtil!!.process(value))
value= jsonObject!!.getString(this.gdProjectStrings!!.NAME)
jsonObject!!.put(this.gdProjectStrings!!.NAME, this.fileUnamedUtil!!.process(value))
}

}


                @Throws(Exception::class)
            
    open fun processObjects(layoutJSONObject: Object)
        //nullable = true from not(false or (false and false)) = true
{
    //var layoutJSONObject = layoutJSONObject

    var jsonArray: JSONArray = layoutJSONObject!!.getJSONArray(this.gdProjectStrings!!.OBJECTS)!!

System.out.println("Object Total: " +jsonArray!!.length())

    var size: Int = jsonArray!!.length()!!


    var jsonObject: JSONObject





                        for (index in 0 until size)

        {
jsonObject= jsonArray!!.getJSONObject(index)
this.processObject(jsonObject)
}

}


                @Throws(Exception::class)
            
    open fun processObject(jsonObject: Object)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonObject = jsonObject

    
                        if(jsonObject!!.has(this.gdProjectStrings!!.TEXTURE))
                        
                                    {
                                    
    var texture: String = jsonObject!!.getString(this.gdProjectStrings!!.TEXTURE)!!

texture= this.fileUnamedUtil!!.process(texture)
System.out.println(this.TEXTURE +texture)
jsonObject!!.put(this.gdProjectStrings!!.TEXTURE, texture)

                                    }
                                

    
                        if(jsonObject!!.has(this.gdProjectStrings!!.ANIMATIONS))
                        
                                    {
                                    
    var jsonArray: JSONArray = jsonObject!!.getJSONArray(this.gdProjectStrings!!.ANIMATIONS)!!

this.processAnimations(jsonArray)

                                    }
                                
}


                @Throws(Exception::class)
            
    open fun processAnimations(jsonArray: JSONArray)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonArray = jsonArray

    var size: Int = jsonArray!!.length()!!


    var jsonObject: JSONObject


    var animationsJSONArray: JSONArray





                        for (index in 0 until size)

        {
jsonObject= jsonArray!!.getJSONObject(index)
animationsJSONArray= jsonObject!!.getJSONArray(this.gdProjectStrings!!.DIRECTIONS)
this.processDirections(animationsJSONArray)
}

}


                @Throws(Exception::class)
            
    open fun processDirections(jsonArray: JSONArray)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonArray = jsonArray

    var size: Int = jsonArray!!.length()!!


    var jsonObject: JSONObject


    var spritesJSONArray: JSONArray





                        for (index in 0 until size)

        {
jsonObject= jsonArray!!.getJSONObject(index)
spritesJSONArray= jsonObject!!.getJSONArray(this.gdProjectStrings!!.SPRITES)
this.processSprites(spritesJSONArray)
}

}


                @Throws(Exception::class)
            
    open fun processSprites(jsonArray: JSONArray)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonArray = jsonArray

    var size: Int = jsonArray!!.length()!!


    var jsonObject: JSONObject





                        for (index in 0 until size)

        {
jsonObject= jsonArray!!.getJSONObject(index)
this.makeResourcesLowercaseForLayout(jsonObject)
}

}


    open fun makeResourcesLowercaseForLayout(jsonObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonObject = jsonObject

    var image: String = jsonObject!!.getString(this.gdProjectStrings!!.IMAGE)!!

image= this.fileUnamedUtil!!.process(image)
System.out.println(this.IMAGE +image)
jsonObject!!.put(this.gdProjectStrings!!.IMAGE, image)
}


                @Throws(Exception::class)
            
    override fun processLayout(jsonObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonObject = jsonObject
this.processObjects(jsonObject)
}


}
                
            


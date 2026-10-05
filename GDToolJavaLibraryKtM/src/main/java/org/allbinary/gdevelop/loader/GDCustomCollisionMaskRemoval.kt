
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
        
import org.json.JSONArray
import org.json.JSONObject

open public class GDCustomCollisionMaskRemoval : GDJSONGeneratorBase {
        
companion object {
            
                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args
GDPaths.init()

    var gdCustomCollisionMaskRemoval: GDCustomCollisionMaskRemoval = GDCustomCollisionMaskRemoval()

gdCustomCollisionMaskRemoval!!.process()
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val inclusionExclusionArray: Array<String?> = arrayOf("BloodSplatter")

    private val UPDATE_SPRITE: String = "Update Sprite: "

                @Throws(Exception::class)
            
    open fun process()
        //nullable = true from not(false or (false and true)) = true
{

    var gameAsConfigurationJSONObject: JSONObject = GDJSONPersistence.getInstance()!!.load()!!

this.process(gameAsConfigurationJSONObject)

    var gdJSONPersistence: GDJSONPersistence = GDJSONPersistence.getInstance()!!


    var gdPaths: GDPaths = GDPaths.getInstance()!!

gdJSONPersistence!!.save(gdPaths!!.ROOT_PATH +"game_updated.json", gameAsConfigurationJSONObject)
}


                @Throws(Exception::class)
            
    override fun processLayout(jsonObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonObject = jsonObject

    var value: String = jsonObject!!.getString(this.gdProjectStrings!!.NAME)!!


    
                        if(value.indexOf(this.LEVEL) >= 0)
                        
                                    {
                                    System.out.println(this.PROCESSING_LAYOUT +value)
this.processObjects(jsonObject)

                                    }
                                
}


    open fun processObjects(name: Object)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var name = name

    var size: Int = this.inclusionExclusionArray!!.size
                





                        for (index in 0 until size)

        {

    
                        if(this.inclusionExclusionArray[index]!!.compareTo(name) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
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


    var type: String


    var name: String





                        for (index in 0 until size)

        {
jsonObject= jsonArray!!.getJSONObject(index)
type= jsonObject!!.getString(this.gdProjectStrings!!.TYPE)

    
                        if(type.compareTo(this.gdProjectStrings!!.SPRITE) == 0)
                        
                                    {
                                    name= jsonObject!!.getString(this.gdProjectStrings!!.NAME)

    
                        if(this.processObjects(name))
                        
                                    {
                                    System.out.println(this.UPDATE_SPRITE +name)
this.processSprite(jsonObject)

                                    }
                                

                                    }
                                
}

}


                @Throws(Exception::class)
            
    open fun processSprite(jsonObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonObject = jsonObject

    var jsonArray: JSONArray = jsonObject!!.getJSONArray(this.gdProjectStrings!!.ANIMATIONS)!!

this.processAnimations(jsonArray)
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
this.updateSprite(jsonObject)
}

}


                @Throws(Exception::class)
            
    open fun updateSprite(jsonObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonObject = jsonObject
System.out.println("Remove Mask")
jsonObject!!.remove(this.gdProjectStrings!!.HAS_CUSTOM_COLLISION_MASK)
jsonObject!!.remove(this.gdProjectStrings!!.CUSTOM_COLLISION_MASK)
}


}
                
            


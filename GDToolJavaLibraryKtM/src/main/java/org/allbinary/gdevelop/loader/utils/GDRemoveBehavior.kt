
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
        
import org.allbinary.gdevelop.json.GDBehavior
import org.allbinary.gdevelop.json.GDObject
import org.allbinary.gdevelop.json.GDObjectFactory
import org.allbinary.gdevelop.loader.GDJSONGeneratorBase
import org.allbinary.gdevelop.loader.GDJSONPersistence
import org.allbinary.gdevelop.loader.GDPaths
import org.allbinary.logic.io.file.FileUnamedUtil
import org.allbinary.util.BasicArrayList
import org.json.JSONArray
import org.json.JSONObject

open public class GDRemoveBehavior : GDJSONGeneratorBase {
        
companion object {
            
                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args
GDPaths.init()

    var gdJSONPersistence: GDJSONPersistence = GDJSONPersistence.getInstance()!!


    var gameAsConfigurationJSONObject: JSONObject = gdJSONPersistence!!.load()!!

GDRemoveBehavior().
                            process(gameAsConfigurationJSONObject)

    var gdPaths: GDPaths = GDPaths.getInstance()!!

gdJSONPersistence!!.save(gdPaths!!.ROOT_PATH +"game_updated.json", gameAsConfigurationJSONObject)
}


        }
            
    private val fileUnamedUtil: FileUnamedUtil = FileUnamedUtil.getInstance()!!

    private val FIND_BEHAVIOR: String = "Physics3D::Physics3DBehavior"
public constructor (){
}


                @Throws(Exception::class)
            
    override fun process(gameAsConfigurationJSONObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameAsConfigurationJSONObject = gameAsConfigurationJSONObject

    var jsonObject: JSONObject = gameAsConfigurationJSONObject!!.getJSONObject(this.gdProjectStrings!!.RESOURCES)!!

super.process(gameAsConfigurationJSONObject)
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

    var gdObject: GDObject = GDObjectFactory.getInstance()!!.create(jsonObject)!!


    
                        if(gdObject!!.name.indexOf("zombie") >= 0)
                        
                                    {
                                    this.process(gdObject)

                                    }
                                
}

}


    open fun process(gdObject: GDObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gdObject = gdObject

    var behaviorsJSONArray: JSONArray = gdObject!!.jsonObject!!.getJSONArray(this.gdProjectStrings!!.BEHAVIORS)!!


    var behaviorList: BasicArrayList = gdObject!!.behaviorContentList


    var size: Int = behaviorList!!.size()!!

System.out.println("Behavior Total: " +size)

    var found: Boolean = false





                        for (index in 0 until size)

        {

    var gdBehaviorContent: GDBehavior = behaviorList!!.get(index) as GDBehavior


    
                        if(gdBehaviorContent!!.type.compareTo(this.FIND_BEHAVIOR) == 0)
                        
                                    {
                                    found= true
behaviorsJSONArray!!.remove(index)
break;

                    

                                    }
                                
}


    
                        if(found)
                        
                                    {
                                    System.out.println("GDObject - Removed Behavior: " +gdObject!!.name)

                                    }
                                
                        else {
                            
                        }
                            
}


                @Throws(Exception::class)
            
    override fun processLayout(jsonObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonObject = jsonObject
this.processObjects(jsonObject)
}


}
                
            


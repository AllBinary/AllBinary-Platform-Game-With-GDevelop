
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
        
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONObject

open public class ReduceObjectsForTesting : GDJSONGeneratorBase {
        
companion object {
            
                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args
GDPaths.init()

    var gdJSONPersistence: GDJSONPersistence = GDJSONPersistence.getInstance()!!


    var gameAsConfigurationJSONObject: JSONObject = gdJSONPersistence!!.load()!!

UpdateEnemyExclusionRatio().
                            process(gameAsConfigurationJSONObject)
ReduceObjectsForTesting().
                            process(gameAsConfigurationJSONObject)

    var gdPaths: GDPaths = GDPaths.getInstance()!!

gdJSONPersistence!!.save(gdPaths!!.ROOT_PATH +"game_updated.json", gameAsConfigurationJSONObject)
}


        }
            
    private val list: BasicArrayList = BasicArrayListD()

    private val ENEMY: String = "Enemy"

    private val ATTACK: String = "Attack"

    private val ENEMIES: String = "Enemies"

    private val PROJECTILES: String = "Projectiles"

    private val ENEMY_ARRAY: String = "enemyArray"

    private val ENEMY_SIZE2_ARRAY: String = "enemySize2Array"

    private val ENEMY_SIZE3_ARRAY: String = "enemySize3Array"

    private val REMOVING_FROM_OBJECT_GROUP: String = "Removing from ObjectGroup: "

    private val REMOVING_FROM_OBJECTS: String = "Removing from Objects: "

    private val REMOVING_FROM_VARIABLE_ARRAY: String = "Removing from Variable Array: "
public constructor (){
this.list.add("AdultRedDragon")
this.list.add("Bat")
this.list.add("SkeletonWarriorEnemy")
}


    open fun contains(value: String)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var value = value

    var size: Int = this.list.size()!!





                        for (index in 0 until size)

        {

    
                        if(value.indexOf(this.list.get(index) as String) >= 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


    open fun reduceObjectsInObjectGroups(jsonArray: Object, inclusion: Object)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonArray = jsonArray
    //var inclusion = inclusion
System.out.println("Object Total: " +jsonArray!!.length())

    var jsonObject: JSONObject


    var value: String





                        for (index in 0 until jsonArray!!.length()!!)

        {
jsonObject= jsonArray!!.getJSONObject(index)
value= jsonObject!!.getString(this.gdProjectStrings!!.NAME)

    
                        if(this.contains(value))
                        
                                    {
                                    
                                    }
                                
                             else 
    
                        if(value.indexOf(inclusion) >= 0)
                        
                                    {
                                    System.out.println(this.REMOVING_FROM_OBJECT_GROUP +value)
jsonArray!!.remove(index)
index--

                                    }
                                
}

}


    open fun reduceObjectGroups(layoutJSONObject: Object)
        //nullable = true from not(false or (false and false)) = true
{
    //var layoutJSONObject = layoutJSONObject

    var jsonArray: JSONArray = layoutJSONObject!!.getJSONArray(this.gdProjectStrings!!.OBJECT_GROUPS)!!


    var size: Int = jsonArray!!.length()!!


    var jsonObject: JSONObject





                        for (index in 0 until size)

        {
jsonObject= jsonArray!!.getJSONObject(index)

    
                        if(jsonObject!!.getString(this.gdProjectStrings!!.NAME)!!.compareTo(this.ENEMIES) == 0)
                        
                                    {
                                    this.reduceObjectsInObjectGroups(jsonObject!!.getJSONArray(this.gdProjectStrings!!.OBJECTS), this.ENEMY)

                                    }
                                
                             else 
    
                        if(jsonObject!!.getString(this.gdProjectStrings!!.NAME)!!.compareTo(this.PROJECTILES) == 0)
                        
                                    {
                                    this.reduceObjectsInObjectGroups(jsonObject!!.getJSONArray(this.gdProjectStrings!!.OBJECTS), this.ATTACK)

                                    }
                                
}

}


    open fun reduceVariableArray(jsonArray: JSONArray)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonArray = jsonArray

    var jsonObject: JSONObject


    var value: String





                        for (index in 0 until jsonArray!!.length()!!)

        {
jsonObject= jsonArray!!.getJSONObject(index)
value= jsonObject!!.getString(this.gdProjectStrings!!.VALUE)

    
                        if(this.contains(value))
                        
                                    {
                                    
                                    }
                                
                        else {
                            System.out.println(this.REMOVING_FROM_VARIABLE_ARRAY +value)
jsonArray!!.remove(index)
index--

                        }
                            
}

System.out.println(jsonArray!!.length())
}


    open fun reduceObjects(layoutJSONObject: Object)
        //nullable = true from not(false or (false and false)) = true
{
    //var layoutJSONObject = layoutJSONObject

    var jsonArray: JSONArray = layoutJSONObject!!.getJSONArray(this.gdProjectStrings!!.OBJECTS)!!


    var jsonObject: JSONObject


    var value: String





                        for (index in 0 until jsonArray!!.length()!!)

        {
jsonObject= jsonArray!!.getJSONObject(index)
value= jsonObject!!.getString(this.gdProjectStrings!!.NAME)

    
                        if(this.contains(value))
                        
                                    {
                                    
                                    }
                                
                             else 
    
                        if(value.indexOf(this.ENEMY) >= 0 || value.indexOf(this.ATTACK) >= 0)
                        
                                    {
                                    System.out.println(this.REMOVING_FROM_OBJECTS +value)
jsonArray!!.remove(index)
index--

                                    }
                                
}

System.out.println(jsonArray!!.length())
}


    open fun reduceVariables(layoutJSONObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var layoutJSONObject = layoutJSONObject

    var jsonArray: JSONArray = layoutJSONObject!!.getJSONArray(this.gdProjectStrings!!.VARIABLES)!!


    var size: Int = jsonArray!!.length()!!


    var jsonObject: JSONObject





                        for (index in 0 until size)

        {
jsonObject= jsonArray!!.getJSONObject(index)

    
                        if(jsonObject!!.getString(this.gdProjectStrings!!.NAME)!!.compareTo(this.ENEMY_ARRAY) == 0)
                        
                                    {
                                    this.reduceVariableArray(jsonObject!!.getJSONArray(this.gdProjectStrings!!.CHILDREN))

                                    }
                                
                             else 
    
                        if(jsonObject!!.getString(this.gdProjectStrings!!.NAME)!!.compareTo(this.ENEMY_SIZE2_ARRAY) == 0)
                        
                                    {
                                    this.reduceVariableArray(jsonObject!!.getJSONArray(this.gdProjectStrings!!.CHILDREN))

                                    }
                                
                             else 
    
                        if(jsonObject!!.getString(this.gdProjectStrings!!.NAME)!!.compareTo(this.ENEMY_SIZE3_ARRAY) == 0)
                        
                                    {
                                    this.reduceVariableArray(jsonObject!!.getJSONArray(this.gdProjectStrings!!.CHILDREN))

                                    }
                                
}

}


    override fun processLayout(jsonObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var jsonObject = jsonObject

    var value: String = jsonObject!!.getString(this.gdProjectStrings!!.NAME)!!


    
                        if(value.indexOf(this.LEVEL) >= 0)
                        
                                    {
                                    System.out.println(this.PROCESSING_LAYOUT +value)
this.reduceObjectGroups(jsonObject)
this.reduceObjects(jsonObject)
this.reduceVariables(jsonObject)

                                    }
                                
}


}
                
            


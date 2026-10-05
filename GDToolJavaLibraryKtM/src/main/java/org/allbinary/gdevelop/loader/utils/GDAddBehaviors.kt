
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

open public class GDAddBehaviors : GDJSONGeneratorBase {
        
companion object {
            
                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args
GDPaths.init()

    var gdJSONPersistence: GDJSONPersistence = GDJSONPersistence.getInstance()!!


    var gameAsConfigurationJSONObject: JSONObject = gdJSONPersistence!!.load()!!

GDAddBehaviors().
                            process(gameAsConfigurationJSONObject)

    var gdPaths: GDPaths = GDPaths.getInstance()!!

gdJSONPersistence!!.save(gdPaths!!.ROOT_PATH +"game_updated.json", gameAsConfigurationJSONObject)
}


        }
            
    private val fileUnamedUtil: FileUnamedUtil = FileUnamedUtil.getInstance()!!

    val RESOURCE_START: String = "character_"

    private val FIND_BEHAVIOR3: String = "Material3D::Material3D"

    private val FIND_BEHAVIOR4: String = "PathfindingBehavior::PathfindingBehavior"

    private val FIND_BEHAVIOR5: String = "Physics3D::PhysicsCharacter3D"

    private val FIND_BEHAVIOR: String = "Physics3D::Physics3DBehavior"

    private val BEHAVIOR3: String = "            {\n" +"              \"name\": \"Material3D\",\n" +"              \"type\": \"Material3D::Material3D\"\n" +"            }\n"

    private val behavior3JSONObject: JSONObject = JSONObject(this.BEHAVIOR3)

    private val BEHAVIOR4: String = "{\n" +"              \"name\": \"Pathfinding\",\n" +"              \"type\": \"PathfindingBehavior::PathfindingBehavior\",\n" +"              \"extraBorder\": 10,\n" +"              \"angularMaxSpeed\": 180,\n" +"              \"rotateObject\": true,\n" +"              \"angleOffset\": 0,\n" +"              \"cellHeight\": 20,\n" +"              \"maxSpeed\": 180,\n" +"              \"gridOffsetY\": 0,\n" +"              \"cellWidth\": 20,\n" +"              \"acceleration\": 180,\n" +"              \"allowDiagonals\": true,\n" +"              \"gridOffsetX\": 0,\n" +"              \"smoothingMaxCellGap\": 1\n" +"            }"

    private val behavior4JSONObject: JSONObject = JSONObject(this.BEHAVIOR4)

    private val BEHAVIOR5: String = "{\n" +"              \"name\": \"PhysicsCharacter3D\",\n" +"              \"type\": \"Physics3D::PhysicsCharacter3D\",\n" +"              \"fallingSpeedMax\": 700,\n" +"              \"forwardDeceleration\": 1200,\n" +"              \"sidewaysSpeedMax\": 400,\n" +"              \"slopeMaxAngle\": 50,\n" +"              \"physics3D\": \"Physics3D\",\n" +"              \"sidewaysDeceleration\": 800,\n" +"              \"forwardAcceleration\": 1200,\n" +"              \"forwardSpeedMax\": 600,\n" +"              \"sidewaysAcceleration\": 800,\n" +"              \"jumpHeight\": 200,\n" +"              \"shouldBindObjectAndForwardAngle\": true,\n" +"              \"canBePushed\": true,\n" +"              \"gravity\": 1000,\n" +"              \"jumpSustainTime\": 0.2,\n" +"              \"stairHeightMax\": 20\n" +"            }"

    private val behavior5JSONObject: JSONObject = JSONObject(this.BEHAVIOR5)

    private val BEHAVIOR: String = "{\n" +"              \"name\": \"Physics3D\",\n" +"              \"type\": \"Physics3D::Physics3DBehavior\",\n" +"              \"object3D\": \"Object3D\",\n" +"              \"bodyType\": \"Static\",\n" +"              \"bullet\": false,\n" +"              \"fixedRotation\": false,\n" +"              \"shape\": \"Box\",\n" +"              \"meshShapeResourceName\": \"\",\n" +"              \"shapeOrientation\": \"Z\",\n" +"              \"shapeDimensionA\": 0,\n" +"              \"shapeDimensionB\": 0,\n" +"              \"shapeDimensionC\": 0,\n" +"              \"shapeOffsetX\": 0,\n" +"              \"shapeOffsetY\": 0,\n" +"              \"shapeOffsetZ\": 0,\n" +"              \"massCenterOffsetX\": 0,\n" +"              \"massCenterOffsetY\": 0,\n" +"              \"massCenterOffsetZ\": 0,\n" +"              \"massOverride\": 0,\n" +"              \"density\": 1,\n" +"              \"friction\": 0.3,\n" +"              \"restitution\": 0.1,\n" +"              \"linearDamping\": 0.1,\n" +"              \"angularDamping\": 0.1,\n" +"              \"gravityScale\": 1,\n" +"              \"layers\": 17,\n" +"              \"masks\": 17\n" +"            }"

    private val behaviorJSONObject: JSONObject = JSONObject(this.BEHAVIOR)
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


    
                        if(gdObject!!.name.startsWith(this.RESOURCE_START))
                        
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

    var found: BooleanArray = BooleanArray(5)


    var found2: Boolean = false





                        for (index in 0 until size)

        {

    var gdBehaviorContent: GDBehavior = behaviorList!!.get(index) as GDBehavior


    
                        if(gdBehaviorContent!!.type.compareTo(this.FIND_BEHAVIOR) == 0)
                        
                                    {
                                    found[0]= true

                                    }
                                

    
                        if(gdBehaviorContent!!.type.compareTo(this.FIND_BEHAVIOR3) == 0)
                        
                                    {
                                    found[2]= true

                                    }
                                

    
                        if(gdBehaviorContent!!.type.compareTo(this.FIND_BEHAVIOR4) == 0)
                        
                                    {
                                    found[3]= true

                                    }
                                

    
                        if(gdBehaviorContent!!.type.compareTo(this.FIND_BEHAVIOR5) == 0)
                        
                                    {
                                    found[4]= true

                                    }
                                
}


    
                        if(found[0] && found[1])
                        
                                    {
                                    
                                    }
                                
                        else {
                            System.out.println("GDObject -Adding Behaviors: " +gdObject!!.name)
behaviorsJSONArray!!.put(this.behavior3JSONObject)
behaviorsJSONArray!!.put(this.behavior4JSONObject)
behaviorsJSONArray!!.put(this.behaviorJSONObject)
behaviorsJSONArray!!.put(this.behavior5JSONObject)

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
                
            


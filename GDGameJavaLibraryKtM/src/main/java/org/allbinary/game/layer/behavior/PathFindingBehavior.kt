
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
        package org.allbinary.game.layer.behavior




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.lcdui.Graphics
import org.allbinary.game.layer.GDGameLayer
import org.allbinary.game.layer.PathFindingLayerInterface
import org.allbinary.game.layout.GDObject
import org.allbinary.util.BasicArrayList

open public class PathFindingBehavior : GDBehavior {
        
companion object {
            
    private val instance: PathFindingBehavior = PathFindingBehavior()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: PathFindingBehavior{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return PathFindingBehavior.instance
}


        }
            private constructor (){
}


    override fun process(gameLayerList: BasicArrayList, index: Int, graphics: Graphics)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var gameLayerList = gameLayerList
    //var index = index
    //var graphics = graphics

    var gameLayer: GDGameLayer = gameLayerList!!.get(index) as GDGameLayer


    var gdObject: GDObject = gameLayer!!.gdObject


    
                        if(gdObject == 
                                    null
                                )
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


                @Throws(Exception::class)
            
    open fun setTarget(sourceGameLayer: GDGameLayer, targetGameLayer: GDGameLayer, x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var sourceGameLayer = sourceGameLayer
    //var targetGameLayer = targetGameLayer
    //var x = x
    //var y = y
targetGameLayer!!.setAllBinaryGameLayerManager(sourceGameLayer!!.allBinaryGameLayerManagerP)

    var pathFindingLayerInterface: PathFindingLayerInterface = (sourceGameLayer as PathFindingLayerInterface)

pathFindingLayerInterface!!.setTarget(targetGameLayer as PathFindingLayerInterface)
}


}
                
            


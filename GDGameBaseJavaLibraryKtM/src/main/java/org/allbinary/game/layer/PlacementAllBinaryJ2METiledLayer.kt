
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
        package org.allbinary.game.layer




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.lcdui.Graphics
import javax.microedition.lcdui.game.TiledLayer
import org.allbinary.graphics.color.BasicColorFactory

open public class PlacementAllBinaryJ2METiledLayer : AllBinaryJ2METiledLayer {
        
public constructor (dataId: Integer, tiledLayer: TiledLayer, i_Map2DArray: Array<IntArray?>, debugColor: Int)                        

                            : super(dataId, tiledLayer, i_Map2DArray, debugColor){
    //var dataId = dataId
    //var tiledLayer = tiledLayer
    //var i_Map2DArray = i_Map2DArray
    //var debugColor = debugColor


                            //For kotlin this is before the body of the constructor.
                    
}


    override fun setPosition(x: Int, y: Int, z: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var x = x
    //var y = y
    //var z = z
super.setPosition(x, y, z)
}


    override fun paint(graphics: Graphics)
        //nullable = true from not(false or (false and false)) = true
{
    //var graphics = graphics
super.paint(graphics)
}


    private val colorArray: IntArray = intArrayOf(BasicColorFactory.getInstance()!!.RED.toInt(), BasicColorFactory.getInstance()!!.GREEN.toInt(), BasicColorFactory.getInstance()!!.YELLOW.toInt(), BasicColorFactory.getInstance()!!.BLUE.toInt())

    open fun paintPlacementDebug(graphics: Graphics)
        //nullable = true from not(false or (false and false)) = true
{
    //var graphics = graphics
}


}
                
            



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
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.lcdui.Graphics
import org.allbinary.animation.Animation
import org.allbinary.animation.vector.ARectangleFilledAnimation
import org.allbinary.graphics.color.BasicColor
import org.allbinary.logic.communication.log.LogUtil

open public class GDRectOnlyPrimitiveDrawing : Animation {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val rectangleFilledAnimation: ARectangleFilledAnimation = ARectangleFilledAnimation()

    var x: Int= 0

    var y: Int= 0

    override fun nextFrame()
        //nullable = true from not(false or (false and true)) = true
{
}


    open fun addFillColor(basicColor: BasicColor)
        //nullable = true from not(false or (false and false)) = true
{
    //var basicColor = basicColor
this.rectangleFilledAnimation!!.setBasicColorP(basicColor)
}


    open fun addFillRectangle(x: Int, y: Int, x2: Int, y2: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var x = x
    //var y = y
    //var x2 = x2
    //var y2 = y2
this.rectangleFilledAnimation!!.x= x
this.rectangleFilledAnimation!!.y= y
this.rectangleFilledAnimation!!.setWidth(x2 -x)
this.rectangleFilledAnimation!!.setHeight(y2 -y)
}


    override fun paintXY(graphics: Graphics, x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var graphics = graphics
    //var x = x
    //var y = y
this.rectangleFilledAnimation!!.paintXY(graphics, this.x, this.y)
}


    override fun paintThreedXYZ(graphics: Graphics, x: Int, y: Int, z: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var graphics = graphics
    //var x = x
    //var y = y
    //var z = z
}


}
                
            


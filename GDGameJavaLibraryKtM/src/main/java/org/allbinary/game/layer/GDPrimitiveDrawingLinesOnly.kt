
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
import org.allbinary.graphics.GPoint
import org.allbinary.graphics.PointFactory
import org.allbinary.graphics.color.BasicColor
import org.allbinary.layer.AllBinaryLayer
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDPrimitiveDrawingLinesOnly : Animation {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val pointFactory: PointFactory = PointFactory.getInstance()!!

    private val NULL_ALLBINARY_LAYER: AllBinaryLayer = AllBinaryLayer.NULL_ALLBINARY_LAYER

    private val colorAnimation: Animation = Animation()

    private val linePathAnimation: LinePathAnimation = LinePathAnimation()

    private val pointList: BasicArrayList = BasicArrayListD()

    override fun nextFrame()
        //nullable = true from not(false or (false and true)) = true
{
}


    open fun clear()
        //nullable = true from not(false or (false and true)) = true
{
this.pointList!!.clear()
}


    open fun addFillColor(basicColor: BasicColor)
        //nullable = true from not(false or (false and false)) = true
{
    //var basicColor = basicColor
this.colorAnimation!!.setBasicColorP(basicColor)
}


    open fun addLineV2(x: Int, y: Int, x2: Int, y2: Int, thickness: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var x = x
    //var y = y
    //var x2 = x2
    //var y2 = y2
    //var thickness = thickness
this.pointList!!.add(this.pointFactory!!.createXY(x, y))
this.pointList!!.add(this.pointFactory!!.createXY(x2, y2))
}


    override fun paintXY(graphics: Graphics, x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var graphics = graphics
    //var x = x
    //var y = y
this.colorAnimation!!.paintXY(graphics, x, y)

    var size: Int = this.pointList!!.size()!!


    var point: GPoint


    var nextPoint: GPoint





                        for (index in 1 until size)

        {
point= this.pointList!!.get(index -1) as GPoint
nextPoint= this.pointList!!.get(index) as GPoint
this.linePathAnimation!!.paint(graphics, point, nextPoint, this.NULL_ALLBINARY_LAYER)
}

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
                
            


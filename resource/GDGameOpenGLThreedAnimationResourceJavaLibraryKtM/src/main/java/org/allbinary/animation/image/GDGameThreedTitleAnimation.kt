
        /*
                *  
                * Copyright (c) 2002 All Binary 
                * All Rights Reserved. 
                * Don't Duplicate or Distributed. 
                * Trade Secret Information 
                * For Internal Use Only 
                * Confidential 
                * Unpublished 
                *  
                * Created By: Travis Berthelot 
                * Date: 11/29/02 
                *  
                *  
                * Modified By         When       ?   
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.animation.image




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.lcdui.Graphics
import org.allbinary.animation.IndexedAnimationBehavior
import org.allbinary.animation.threed.ThreedAnimation
import org.allbinary.animation.IndexedAnimation
import org.allbinary.animation.special.TitleAnimation
import org.allbinary.graphics.color.BasicColor
import org.allbinary.graphics.color.ColorChangeEvent
import org.allbinary.graphics.color.ColorChangeListener
import org.allbinary.logic.util.event.AllBinaryEventObject
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.media.graphics.geography.map.ColorFromEventUtil
import org.allbinary.view.CenterViewPositionFactory
import org.allbinary.view.ViewPositionBase

open public class GDGameThreedTitleAnimation : TitleAnimation
                , ColorChangeListener {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private var color: Int = ColorFromEventUtil.getInstance()!!.COLOR_INT
public constructor (animationInterfaceArray: Array<IndexedAnimation?>, basicColorArray: Array<BasicColor?>, dxArray: IntArray, dyArray: IntArray, y: Int, width: Int)                        

                            : super(animationInterfaceArray, basicColorArray, dxArray, dyArray, y, width, IndexedAnimationBehavior(1, 250)){
var animationInterfaceArray = animationInterfaceArray
var basicColorArray = basicColorArray
var dxArray = dxArray
var dyArray = dyArray
var y = y
var width = width


                            //For kotlin this is before the body of the constructor.
                    
this.logUtil!!.putF("Constructor", this, this::class.toString()!!)
}


    open fun onEvent(eventObject: AllBinaryEventObject)
        //nullable = true from not(false or (false and false)) = true
{
var eventObject = eventObject

    var basicColor: BasicColor = 
                                    (eventObject as ColorChangeEvent).getBasicColorP()!!

this.color= basicColor!!.toInt()
}


    override fun paintXY(graphics: Graphics, ax: Int, ay: Int)
        //nullable = true from not(false or (false and false)) = true
{
var graphics = graphics
var ax = ax
var ay = ay
graphics.setColor(this.color)

    var x: Int = 0


    
                        if(this.widthP != Integer.MIN_VALUE)
                        
                                    {
                                    x= ((graphics.getClipWidth() -this.widthP) /2)

                                    }
                                

    var deltaX: Int= 0


    var deltaY: Int= 0





                        for (index in 0 until this.sizeP -1)

        {
deltaX= this.dxArray[index] +x
deltaY= this.dyArray[index] +this.y

    
                        if(this.basicColorArray[index] != this.CLEAR_COLOR)
                        
                                    {
                                    this.basicSetColorUtil!!.setBasicColorP(graphics, this.basicColorArray[index]!!)

                                    }
                                
this.animationInterfaceArray[index]!!.paintXY(graphics, deltaX, deltaY)
}

}


    private val viewPosition: ViewPositionBase = CenterViewPositionFactory().
                            getInstance(0)!!

    open fun paintThreed(graphics: Graphics, x: Int, y: Int, z: Int)
        //nullable = true from not(false or (false and false)) = true
{
var graphics = graphics
var x = x
var y = y
var z = z

    var deltaY: Int= 0


    var index: Int = this.sizeP -1


    var halfHeight: Int = (graphics.getClipHeight() shr 3) /3 *2

deltaY= this.dyArray[index] +y

    var threedAnimation: ThreedAnimation = this.animationInterfaceArray[index]!! as ThreedAnimation

threedAnimation!!.nextRotation()
deltaY= (deltaY shr 2)

    var az: Int = ()

this.animationInterfaceArray[index]!!.paintThreedXYZ(graphics, this.viewPosition!!.getX(), this.viewPosition!!.getY(), az)
}


}
                
            


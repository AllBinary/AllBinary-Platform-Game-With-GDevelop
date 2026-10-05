
        /*
                * 
                *  AllBinary Open License Version 1
                *  Copyright (c) 2011 AllBinary
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
        package org.allbinary.animation.compound




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.lcdui.Graphics
import org.allbinary.J2MEUtil
import org.allbinary.animation.Animation
import org.allbinary.animation.AnimationBehavior
import org.allbinary.animation.IndexedAnimation
import org.allbinary.animation.text.CustomTextAnimation
import org.allbinary.game.layer.SWTUtil
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.math.PrimitiveIntUtil
//Similar to ScollBar
open public class SliderAnimation : IndexedAnimation {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private var animationInterfaceArray: Array<IndexedAnimation?>

    private val width: Int

    private val height: Int

    private var dx: Int

    private var value: Int= 0

    var hasFocus: Boolean= false
public constructor (animationInterfaceArray: Array<IndexedAnimation?>, width: Int, height: Int, animationBehavior: AnimationBehavior)                        

                            : super(animationBehavior){
    //var animationInterfaceArray = animationInterfaceArray
    //var width = width
    //var height = height
    //var animationBehavior = animationBehavior


                            //For kotlin this is before the body of the constructor.
                    
this.animationInterfaceArray= animationInterfaceArray
this.dx= this.animationInterfaceArray[3]!!.getDx()
this.width= width
this.height= height

    var animation: Animation = this.animationInterfaceArray[4]!!


    
                        if(SWTUtil.isSWT)
                        
                                    {
                                    
    var h: Int = this.dxhack()!!

animation.setDy( -h /3 *2)

                                    }
                                
                        else {
                            
    var h: Int = this.dxhack()!!

animation.setDy( -h +(h /10))

                        }
                            
}


    open fun dxhack()
        //nullable = true from not(false or (false and true)) = true
: Int{

    
                        if(J2MEUtil.isHTML())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.height *2 /3

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.height

                        }
                            
}


    override fun setFrame(frameIndex: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var frameIndex = frameIndex




                        for (index in this.animationInterfaceArray!!.size  - 1  downTo 0)

        {
this.animationInterfaceArray[index]!!.setFrame(frameIndex)
}

}


    override fun getFrame()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.animationInterfaceArray[0]!!.getFrame()
}


    override fun getSize()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.animationInterfaceArray[0]!!.getSize()
}


    override fun previousFrame()
        //nullable = true from not(false or (false and true)) = true
{




                        for (index in this.animationInterfaceArray!!.size  - 1  downTo 0)

        {
this.animationInterfaceArray[index]!!.previousFrame()
}

}


    override fun setSequence(sequence: IntArray)
        //nullable = true from not(false or (false and false)) = true
{
    //var sequence = sequence
}


    override fun getSequence()
        //nullable = true from not(false or (false and true)) = true
: IntArray{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return PrimitiveIntUtil.getArrayInstance()
}


                @Throws(Exception::class)
            
    override fun nextFrame()
        //nullable = true from not(false or (false and true)) = true
{




                        for (index in this.animationInterfaceArray!!.size  - 1  downTo 0)

        {
this.animationInterfaceArray[index]!!.nextFrame()
}

}


    override fun paintXY(graphics: Graphics, x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var graphics = graphics
    //var x = x
    //var y = y

    var size: Int = this.animationInterfaceArray!!.size
                





                        for (index in 0 until size)

        {
this.animationInterfaceArray[index]!!.paintXY(graphics, x, y)
}

}


    override fun paintThreedXYZ(graphics: Graphics, x: Int, y: Int, z: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var graphics = graphics
    //var x = x
    //var y = y
    //var z = z

    var size: Int = this.animationInterfaceArray!!.size
                





                        for (index in 0 until size)

        {
this.animationInterfaceArray[index]!!.paintThreedXYZ(graphics, x, y, z)
}

}


    open fun getAnimationInterfaceArray()
        //nullable = true from not(false or (false and true)) = true
: Array<IndexedAnimation?>{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.animationInterfaceArray
}


    open fun setAnimationInterfaceArray(animationInterfaceArray: Array<IndexedAnimation?>)
        //nullable = true from not(false or (false and false)) = true
{
    //var animationInterfaceArray = animationInterfaceArray
this.animationInterfaceArray= animationInterfaceArray
}


    open fun setValue(value: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var value = value

    
                        if(value >= 0 && value < 101)
                        
                                    {
                                    this.value= value

    var newDx: Int = this.dx +(value *this.width /100)

this.animationInterfaceArray[3]!!.setDx(newDx)

    var customTextAnimation: CustomTextAnimation = (this.animationInterfaceArray[4]!! as CustomTextAnimation)

customTextAnimation!!.setText(this.value.toString())
customTextAnimation!!.setDx(newDx +(this.getThumbWidth() /2) -(customTextAnimation!!.getWidth() /2))

                                    }
                                
}


    open fun setValue2(thumbX: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var thumbX = thumbX

    var usedThumbX: Int = thumbX


    var maxX: Int = this.width


    
                        if(thumbX >= this.dx && thumbX < this.dx +this.width)
                        
                                    {
                                    
                                    }
                                
                             else 
    
                        if(thumbX < 0)
                        
                                    {
                                    usedThumbX= 0

                                    }
                                
                             else 
    
                        if(thumbX > maxX)
                        
                                    {
                                    usedThumbX= maxX

                                    }
                                

    var value: Int = (100 *usedThumbX /this.width)


    
                        if(value > 100)
                        
                                    {
                                    value= 100

                                    }
                                
this.setValue(value)
}


    open fun getThumbDx()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.animationInterfaceArray[3]!!.getDx()
}


    open fun getThumbWidth()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.animationInterfaceArray[3]!!.getWidth()
}


    open fun getValue()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.value
}


    open fun setFocus(hasFocus: Boolean)
        //nullable = true from not(false or (false and false)) = true
{
    //var hasFocus = hasFocus
this.hasFocus= hasFocus
}


}
                
            


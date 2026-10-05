
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
        
import org.allbinary.animation.AnimationInterfaceFactoryInterface
import org.allbinary.animation.IndexedAnimation
import org.allbinary.animation.RotationAnimation
import org.allbinary.game.layout.GDObject
import org.allbinary.graphics.GraphicsStrings
import org.allbinary.string.CommonStrings
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.math.FrameUtil

open public class GDRotationBehavior : GDAnimationBehaviorBase {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    val frameUtil: FrameUtil = FrameUtil.getInstance()!!

    var rotationAnimationInterfaceArray: Array<RotationAnimation?>

    override fun init(gdObject: GDObject, animationInterfaceFactoryInterfaceArray: Array<AnimationInterfaceFactoryInterface?>)
        //nullable = true from not(false or (false and false)) = true
: Array<IndexedAnimation?>{
    //var gdObject = gdObject
    //var animationInterfaceFactoryInterfaceArray = animationInterfaceFactoryInterfaceArray

    var size: Int = animationInterfaceFactoryInterfaceArray!!.size
                


    var initIndexedAnimationInterfaceArray: Array<RotationAnimation?> = arrayOfNulls(size)





                        for (index in 0 until size)

        {

        try {
            initIndexedAnimationInterfaceArray[index]= animationInterfaceFactoryInterfaceArray[index]!!.getInstance(0) as RotationAnimation
} catch(e: Exception)
            {

    var commonStrings: CommonStrings = CommonStrings.getInstance()!!

this.logUtil!!.put(StringMaker().
                            append(animationInterfaceFactoryInterfaceArray[index]!!.toString())!!.append(" index: ")!!.appendint(index)!!.toString(), this, commonStrings!!.CONSTRUCTOR, e)
this.logUtil!!.put(gdObject!!.toString(), this, commonStrings!!.CONSTRUCTOR, e)
}

}

this.rotationAnimationInterfaceArray= initIndexedAnimationInterfaceArray



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return initIndexedAnimationInterfaceArray
}


    override fun setAnimationArray(rotationAnimationInterfaceArray: Array<IndexedAnimation?>)
        //nullable = true from not(false or (false and false)) = true
{
    //var rotationAnimationInterfaceArray = rotationAnimationInterfaceArray
this.rotationAnimationInterfaceArray= rotationAnimationInterfaceArray as Array<RotationAnimation?>
}


    open fun getRotationAnimationInterfaceArray()
        //nullable = true from not(false or (false and true)) = true
: Array<RotationAnimation?>{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.rotationAnimationInterfaceArray
}


                @Throws(Exception::class)
            
    override fun set(gameLayer: GDGameLayer, gdObject: GDObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameLayer = gameLayer
    //var gdObject = gdObject

    var size: Int = this.rotationAnimationInterfaceArray!!.size
                





                        for (index in 0 until size)

        {
this.rotationAnimationInterfaceArray[index]!!.setFrame(this.frameUtil!!.getFrameForAngle(0.toShort(), 1))
}

}


    override fun setRotation(gameLayer: GDGameLayer, angleAdjustment: Short)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameLayer = gameLayer
    //var angleAdjustment = angleAdjustment

    var gdObject: GDObject = gameLayer!!.gdObject


    var rotationAnimation: RotationAnimation

rotationAnimation= this.rotationAnimationInterfaceArray[gdObject!!.animation]!!

    
                        if(angleAdjustment > 0)
                        
                                    {
                                    
    var value: Short = angleAdjustment


        while(value > 0)
        {
rotationAnimation!!.nextRotation()
value--
}


                                    }
                                
                        else {
                            
    var value: Short = angleAdjustment


        while(value < 0)
        {
rotationAnimation!!.previousRotation()
value++
}


                        }
                            
}


    open fun toString(gdObject: GDObject, stringBuffer: StringMaker)
        //nullable = true from not(false or (true and false)) = true
{
    //var gdObject = gdObject
    //var stringBuffer = stringBuffer

    var rotationAnimation: RotationAnimation = this.rotationAnimationInterfaceArray[gdObject!!.animation]!!

stringBuffer!!.append(GraphicsStrings.getInstance()!!.ANGLE)!!.appendint(rotationAnimation!!.getAngleInfoP()!!.getAngle())
}


}
                
            


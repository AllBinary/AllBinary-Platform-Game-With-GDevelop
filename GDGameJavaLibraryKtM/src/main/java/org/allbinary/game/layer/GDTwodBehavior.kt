
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
        
import org.allbinary.animation.RotationAnimation
import org.allbinary.game.layout.GDObject
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringMaker

open public class GDTwodBehavior
            : Object
         {
        

    private val animationBehavior: GDAnimationBehaviorBase

    private var rotationRemainder: Float= 0.0f
public constructor (animationBehavior: GDAnimationBehaviorBase)
            : super()
        {
    //var animationBehavior = animationBehavior
this.animationBehavior= animationBehavior
}


    open fun process(gdObject: GDObject, rotationAnimation: RotationAnimation)
        //nullable = true from not(false or (false and false)) = true
{
    //var gdObject = gdObject
    //var rotationAnimation = rotationAnimation
}


                @Throws(Exception::class)
            
    open fun reset(gameLayer: GDGameLayer, gdObject: GDObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameLayer = gameLayer
    //var gdObject = gdObject
this.rotationRemainder= 0
this.animationBehavior!!.set(gameLayer, gdObject)
}


    open fun updateRotation(gameLayer: GDGameLayer, timeDelta: Long)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameLayer = gameLayer
    //var timeDelta = timeDelta

    var gdObject: GDObject = gameLayer!!.gdObject


    var newPortion: Float = (gdObject!!.rotationP *timeDelta /1000f)

this.rotationRemainder= this.rotationRemainder +newPortion

    var angleAdjustment: Short = ().toShort()


    
                        if(angleAdjustment != 0)
                        
                                    {
                                    
    var adjustedAngle2: Int = gdObject!!.angle +angleAdjustment


        while(adjustedAngle2 > 359)
        {
adjustedAngle2 -= 360
}


        while(adjustedAngle2 < 0)
        {
adjustedAngle2 += 360
}

gdObject!!.setAngle(adjustedAngle2.toShort())
gdObject!!.angle= adjustedAngle2.toShort()
this.getAnimationBehavior()!!.setRotation(gameLayer, angleAdjustment)
this.rotationRemainder -= angleAdjustment

                                    }
                                
                        else {
                            
                        }
                            
}


    open fun getAnimationBehavior()
        //nullable = true from not(false or (false and true)) = true
: GDAnimationBehaviorBase{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.animationBehavior
}


}
                
            


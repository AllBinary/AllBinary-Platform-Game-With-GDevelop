
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2025 AllBinary 
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
        
import org.allbinary.animation.Animation
import org.allbinary.animation.AnimationInterfaceFactoryInterface
import org.allbinary.animation.IndexedAnimation
import org.allbinary.animation.compound.SimultaneousCompoundIndexedAnimation
import org.allbinary.game.layout.GDObject
import org.allbinary.graphics.GPoint
import org.allbinary.graphics.PointFactory
import org.allbinary.input.motion.gesture.TouchMotionGestureFactory
import org.allbinary.logic.communication.log.LogUtil

open public class GDSoftJoystickAnimationBehavior : GDAnimationBehaviorBase {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val touchMotionGestureFactory: TouchMotionGestureFactory = TouchMotionGestureFactory.getInstance()!!

    private var initialX: Int= 0

    private var initialY: Int= 0

    override fun init(gdObject: GDObject, animationInterfaceFactoryInterfaceArray: Array<AnimationInterfaceFactoryInterface?>)
        //nullable = true from not(false or (false and false)) = true
: Array<IndexedAnimation?>{
    //var gdObject = gdObject
    //var animationInterfaceFactoryInterfaceArray = animationInterfaceFactoryInterfaceArray

    var indexedAnimationArray: Array<IndexedAnimation?> = super.init(gdObject, animationInterfaceFactoryInterfaceArray)!!


    var simultaneousCompoundIndexedAnimation: SimultaneousCompoundIndexedAnimation = indexedAnimationArray[0]!! as SimultaneousCompoundIndexedAnimation


    var animation: Animation = simultaneousCompoundIndexedAnimation!!.getAnimationInterfaceArray()[1]!!

this.initialX= animation.getDx()
this.initialY= animation.getDy()



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return indexedAnimationArray
}


                @Throws(Exception::class)
            
    override fun set(gameLayer: GDGameLayer, gdObject: GDObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameLayer = gameLayer
    //var gdObject = gdObject

    var simultaneousCompoundIndexedAnimation: SimultaneousCompoundIndexedAnimation = gameLayer!!.getIndexedAnimationInterfaceArray()[0]!! as SimultaneousCompoundIndexedAnimation


    var animation: Animation = simultaneousCompoundIndexedAnimation!!.getAnimationInterfaceArray()[1]!!


    var softJoystickInterface: SoftJoystickInterface = gdObject as SoftJoystickInterface


    var point: GPoint = softJoystickInterface!!.getPoint()!!


    
                        if(point == PointFactory.getInstance()!!.ZERO_ZERO)
                        
                                    {
                                    animation.setDx(this.initialX)
animation.setDy(this.initialY)

                                    }
                                
                        else {
                            animation.setDx(point.getX() -gameLayer!!.getXP() -(gameLayer!!.getWidth() shr 2))
animation.setDy(point.getY() -gameLayer!!.getYP() -(gameLayer!!.getHeight() shr 2))

                        }
                            
}


}
                
            


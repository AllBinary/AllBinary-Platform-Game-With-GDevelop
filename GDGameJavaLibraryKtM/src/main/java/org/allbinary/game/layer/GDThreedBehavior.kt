
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
import org.allbinary.logic.string.StringMaker

open public class GDThreedBehavior : GDTwodBehavior {
        

    private val rotationAnimationInterfaceArray: Array<RotationAnimation?>

    private var rotationRemainderZ: Float= 0.0f
public constructor (animationBehavior: GDAnimationBehaviorBase, rotationAnimationInterfaceArray: Array<RotationAnimation?>)                        

                            : super(animationBehavior){
    //var animationBehavior = animationBehavior
var rotationAnimationInterfaceArray = rotationAnimationInterfaceArray


                            //For kotlin this is before the body of the constructor.
                    
this.rotationAnimationInterfaceArray= rotationAnimationInterfaceArray
}


                @Throws(Exception::class)
            
    override fun reset(gameLayer: GDGameLayer, gdObject: GDObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameLayer = gameLayer
    //var gdObject = gdObject
super.reset(gameLayer, gdObject)
this.rotationRemainderZ= 0
}


    override fun updateRotation(gameLayer: GDGameLayer, timeDelta: Long)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameLayer = gameLayer
    //var timeDelta = timeDelta
super.updateRotation(gameLayer, timeDelta)

    var gdObject: GDObject = gameLayer!!.gdObject


    var newPortion: Float = (gdObject!!.rotationZP *timeDelta /1000f)

this.rotationRemainderZ= this.rotationRemainderZ +newPortion

    var angleAdjustment: Short = ().toShort()


    
                        if(angleAdjustment != 0)
                        
                                    {
                                    gdObject!!.angle += angleAdjustment
this.setRotationZ(gdObject, angleAdjustment)
this.rotationRemainderZ -= angleAdjustment

                                    }
                                
                        else {
                            
                        }
                            
}


    open fun setRotationZ(gdObject: GDObject, angleAdjustment: Short)
        //nullable = true from not(false or (false and false)) = true
{
    //var gdObject = gdObject
    //var angleAdjustment = angleAdjustment

    var rotationAnimation: RotationAnimation = this.rotationAnimationInterfaceArray[gdObject!!.animation]!!


    
                        if(angleAdjustment > 0)
                        
                                    {
                                    
    var value: Short = angleAdjustment


        while(value > 0)
        {
rotationAnimation!!.nextRotationZ()
value--
}


                                    }
                                
                        else {
                            
    var value: Short = angleAdjustment


        while(value < 0)
        {
rotationAnimation!!.previousRotationZ()
value++
}


                        }
                            
}


}
                
            


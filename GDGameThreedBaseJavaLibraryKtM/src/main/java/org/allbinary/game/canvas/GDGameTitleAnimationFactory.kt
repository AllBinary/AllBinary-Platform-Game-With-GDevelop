
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
        package org.allbinary.game.canvas




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.animation.AnimationBehavior
import org.allbinary.animation.ColorLessVectorAnimation
import org.allbinary.animation.IndexedAnimation
import org.allbinary.animation.VectorExplosionGenerator
import org.allbinary.animation.special.TitleAnimation
import org.allbinary.graphics.color.BasicColor
import org.allbinary.graphics.color.BasicColorFactory

open public class GDGameTitleAnimationFactory
            : Object
         {
        
companion object {
            
    private val instance: GDGameTitleAnimationFactory = GDGameTitleAnimationFactory()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDGameTitleAnimationFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameTitleAnimationFactory.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
                @Throws(Exception::class)
            
    open fun getInstance(animationInterfaceArray: Array<IndexedAnimation?>)
        //nullable =  from not(true or (false and false)) = 
: TitleAnimation{
var animationInterfaceArray = animationInterfaceArray

    var basicColorArray: Array<BasicColor?> = arrayOfNulls(2)

basicColorArray[0]= BasicColorFactory.getInstance()!!.PURPLE
basicColorArray[1]= BasicColorFactory.getInstance()!!.BLACK

    var deltaXArray: IntArray = IntArray(2)

deltaXArray[0]= 0
deltaXArray[1]= 52

    var deltaYArray: IntArray = IntArray(2)

deltaYArray[0]= 0
deltaYArray[1]= 30



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return TitleAnimation.createAnimation(animationInterfaceArray, basicColorArray, deltaXArray, deltaYArray, 15, 120)
}


                @Throws(Exception::class)
            
    open fun getArrayInstance()
        //nullable = true from not(false or (false and true)) = true
: Array<IndexedAnimation?>{

    var animationInterfaceArray: Array<IndexedAnimation?> = arrayOfNulls(2)


    var titleVectorData: TitleVectorData = TitleVectorData()


    var vectorExplosionGenerator: VectorExplosionGenerator = VectorExplosionGenerator.getInstance()!!


    var points: Array<Array<IntArray?>?> = vectorExplosionGenerator!!.getInstance(titleVectorData!!.testPoints, 6, vectorExplosionGenerator!!.RANDOM)!!

animationInterfaceArray[0]= ColorLessVectorAnimation(points, AnimationBehavior.getInstance())
points= vectorExplosionGenerator!!.getInstance(titleVectorData!!.gamePoints, 6, vectorExplosionGenerator!!.RANDOM)
animationInterfaceArray[1]= ColorLessVectorAnimation(points, AnimationBehavior.getInstance())



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return animationInterfaceArray
}


}
                
            


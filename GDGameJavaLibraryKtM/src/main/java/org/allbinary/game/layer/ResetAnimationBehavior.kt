
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
        
import org.allbinary.animation.IndexedAnimation
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.math.FrameUtil
import org.allbinary.string.CommonStrings

open public class ResetAnimationBehavior
            : Object
         {
        
companion object {
            
    private val instance: ResetAnimationBehavior = ResetAnimationBehavior()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: ResetAnimationBehavior{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ResetAnimationBehavior.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    open fun resetAnimation(indexedAnimationInterfaceArray: Array<IndexedAnimation?>, animationIndex: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var indexedAnimationInterfaceArray = indexedAnimationInterfaceArray
    //var animationIndex = animationIndex
indexedAnimationInterfaceArray[animationIndex]!!.setFrame(0)
}


}
                
            


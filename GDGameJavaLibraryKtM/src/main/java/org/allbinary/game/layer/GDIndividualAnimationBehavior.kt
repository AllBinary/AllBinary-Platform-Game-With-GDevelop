
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
        
        import java.lang.Math
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.animation.IndexedAnimation
import org.allbinary.animation.IndexedAnimationBehavior
import org.allbinary.game.layout.GDObject
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringMaker

open public class GDIndividualAnimationBehavior : GDAnimationBehaviorBase {
        
companion object {
            
    private val instance: GDIndividualAnimationBehavior = GDIndividualAnimationBehavior()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDIndividualAnimationBehavior{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDIndividualAnimationBehavior.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    override fun animate(gdObject: GDObject, initIndexedAnimationInterfaceArray: Array<IndexedAnimation?>, timeDelta: Long)
        //nullable = true from not(false or (false and false)) = true
{
    //var gdObject = gdObject
    //var initIndexedAnimationInterfaceArray = initIndexedAnimationInterfaceArray
    //var timeDelta = timeDelta

        try {
            
    var indexedAnimation: IndexedAnimation = initIndexedAnimationInterfaceArray[gdObject!!.animation]!!


    var indexedAnimationBehavior: IndexedAnimationBehavior = indexedAnimation!!.getAnimationBehavior() as IndexedAnimationBehavior


    
                        if(indexedAnimationBehavior!!.loopTotal < 0 || !indexedAnimation!!.isLastFrame())
                        
                                    {
                                    indexedAnimationBehavior!!.elapsedTime += timeDelta

    
                        if(indexedAnimationBehavior!!.elapsedTime > (indexedAnimationBehavior!!.frameDelayTime /Math.abs(gdObject!!.timeScale)))
                        
                                    {
                                    indexedAnimationBehavior!!.elapsedTime= 0

    
                        if(gdObject!!.timeScale > 0)
                        
                                    {
                                    indexedAnimation!!.nextFrame()

                                    }
                                
                        else {
                            indexedAnimation!!.previousFrame()

                        }
                            

                                    }
                                

                                    }
                                
} catch(e: Exception)
            {

    var commonStrings: CommonStrings = CommonStrings.getInstance()!!

this.logUtil!!.put(commonStrings!!.EXCEPTION, this, "animate", e)
}

}


}
                
            


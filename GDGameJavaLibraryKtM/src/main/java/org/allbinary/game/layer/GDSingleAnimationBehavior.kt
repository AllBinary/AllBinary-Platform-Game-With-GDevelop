
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
        
import org.allbinary.animation.IndexedAnimation
import org.allbinary.game.layout.GDObject
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringMaker

open public class GDSingleAnimationBehavior : GDAnimationBehaviorBase {
        
companion object {
            
    private val instance: GDSingleAnimationBehavior = GDSingleAnimationBehavior()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDSingleAnimationBehavior{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDSingleAnimationBehavior.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private var elapsedTime: Long = 0

    override fun animate(gdObject: GDObject, initIndexedAnimationInterfaceArray: Array<IndexedAnimation?>, timeDelta: Long)
        //nullable = true from not(false or (false and false)) = true
{
    //var gdObject = gdObject
    //var initIndexedAnimationInterfaceArray = initIndexedAnimationInterfaceArray
    //var timeDelta = timeDelta

        try {
            this.elapsedTime += timeDelta

    
                        if(this.elapsedTime > 200)
                        
                                    {
                                    this.elapsedTime= this.elapsedTime -200
initIndexedAnimationInterfaceArray[gdObject!!.animation]!!.nextFrame()

                                    }
                                
} catch(e: Exception)
            {

    var commonStrings: CommonStrings = CommonStrings.getInstance()!!

this.logUtil!!.put(commonStrings!!.EXCEPTION, this, "animate", e)
}

}


}
                
            



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

open public class ScalableProcessor : ScalableBaseProcessor {
        
companion object {
            
    private val instance: ScalableProcessor = ScalableProcessor()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: ScalableProcessor{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ScalableProcessor.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    override fun process(gameLayer: GDGameLayer, initIndexedAnimationInterface: IndexedAnimation)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameLayer = gameLayer
    //var initIndexedAnimationInterface = initIndexedAnimationInterface

    var gdObject: GDObject = gameLayer!!.gdObject

initIndexedAnimationInterface!!.setScale(gdObject!!.scaleX, gdObject!!.scaleY)
}


}
                
            


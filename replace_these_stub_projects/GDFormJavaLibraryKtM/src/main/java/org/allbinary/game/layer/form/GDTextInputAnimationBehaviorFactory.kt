
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
        package org.allbinary.game.layer.form




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.layer.GDAnimationBehaviorBase
import org.allbinary.game.layer.GDAnimationBehaviorBaseFactory

open public class GDTextInputAnimationBehaviorFactory : GDAnimationBehaviorBaseFactory {
        
companion object {
            
    private val instance: GDTextInputAnimationBehaviorFactory = GDTextInputAnimationBehaviorFactory()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDTextInputAnimationBehaviorFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    override fun create()
        //nullable = true from not(false or (false and true)) = true
: GDAnimationBehaviorBase{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDTextInputAnimationBehavior()
}


}
                
            



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
        

open public class GDAnimationBehaviorBaseFactory
            : Object
         {
        
companion object {
            
    private val instance: GDAnimationBehaviorBaseFactory = GDAnimationBehaviorBaseFactory()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDAnimationBehaviorBaseFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDAnimationBehaviorBaseFactory.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    open fun create()
        //nullable = true from not(false or (false and true)) = true
: GDAnimationBehaviorBase{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDAnimationBehaviorBase.getInstance()
}


}
                
            


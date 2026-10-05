
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
        package org.allbinary.game.init




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.init.BasicBuildGameInitializerFactory
import org.allbinary.game.init.GameInitializationInterface
import org.allbinary.game.resource.ResourceInitialization
import org.allbinary.game.resource.GDGameJ2MEEarlyResourceInitialization

open public class GDGameStaticInitializerFactory : BasicBuildGameInitializerFactory {
        
companion object {
            
    private var STATIC: GameInitializationInterface = J2MEGDGameStaticInitializer(arrayOf(GDGameJ2MEEarlyResourceInitialization(),GDGameResourceInitialization(),GDGameJ2MEAnimationInterfaceFactoryEarlyResourceInitialization(),GDGameJ2MEAnimationInterfaceFactoryResourceInitialization()), 15)

        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GameInitializationInterface{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return STATIC
}


}
                
            



        /* Generated Code Do Not Modify */
        package org.allbinary.game.init




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.init.BasicBuildGameInitializerFactory
import org.allbinary.game.init.GameInitializationInterface
import org.allbinary.game.gd.resource.GDGameAndroidEarlyResourceInitialization
import org.allbinary.game.gd.resource.GDGameAndroidResourceInitialization
import org.allbinary.game.resource.ResourceInitialization

open public class GDGameStaticInitializerFactory : BasicBuildGameInitializerFactory {
        
companion object {
            
    private var STATIC: GameInitializationInterface = GDGameThreedBaseAndroidStaticInitializer(arrayOf(GDGameAndroidEarlyResourceInitialization(),GDGameAndroidResourceInitialization(),GDGameThreedAndroidAnimationInterfaceFactoryEarlyResourceInitialization(),GDGameThreedAndroidAnimationInterfaceFactoryResourceInitialization()), 15)

        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    override fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GameInitializationInterface{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameStaticInitializerFactory.STATIC
}


}
                
            


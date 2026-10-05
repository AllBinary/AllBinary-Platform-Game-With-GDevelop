
        /* Generated Code Do Not Modify */
        package org.allbinary.game.init




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.animation.image.GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.animation.image.GDGameEarlyResourcesOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.game.resource.ResourceInitialization

open public class GDGameAndroidAnimationInterfaceFactoryEarlyResourceInitialization : ResourceInitialization {
        
public constructor (){
}


                @Throws(Exception::class)
            
    override fun init()
        //nullable = true from not(false or (false and true)) = true
{

    var featuredAnimationInterfaceFactoryInterfaceFactory: FeaturedAnimationInterfaceFactoryInterfaceFactory = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()!!

featuredAnimationInterfaceFactoryInterfaceFactory!!.add(GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory())
featuredAnimationInterfaceFactoryInterfaceFactory!!.add(GDGameEarlyResourcesOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory())
}


}
                
            



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
        
import org.allbinary.animation.image.GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.animation.image.GDGameEarlyResourcesOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.game.resource.ResourceInitialization

open public class GDGameJ2MEAnimationInterfaceFactoryEarlyResourceInitialization : ResourceInitialization {
        
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
                
            


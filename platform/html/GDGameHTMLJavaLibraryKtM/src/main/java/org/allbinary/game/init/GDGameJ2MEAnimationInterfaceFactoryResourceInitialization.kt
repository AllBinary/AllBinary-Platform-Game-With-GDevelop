
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
        
import org.allbinary.animation.image.GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.animation.image.GDGameOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.game.resource.ResourceInitialization
import org.allbinary.input.motion.button.TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.input.motion.button.TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory

open public class GDGameJ2MEAnimationInterfaceFactoryResourceInitialization : ResourceInitialization {
        
public constructor (){
}


                @Throws(Exception::class)
            
    open fun init()
        //nullable = true from not(false or (false and true)) = true
{
FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()!!.add(TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory.createFactory())
FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()!!.add(GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory())
FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()!!.add(TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory())
FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()!!.add(GDGameOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory())
}


}
                
            


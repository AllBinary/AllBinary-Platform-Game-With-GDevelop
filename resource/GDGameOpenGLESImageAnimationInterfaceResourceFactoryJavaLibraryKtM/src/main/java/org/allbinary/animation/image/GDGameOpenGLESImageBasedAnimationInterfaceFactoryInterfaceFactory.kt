
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
        package org.allbinary.animation.image




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.graphics.opengles.OpenGLFeatureFactory
import org.allbinary.image.opengles.OpenGLImageCacheFactory
import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory

open public class GDGameOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory : GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory {
        
public constructor ()                        

                            : super("OpenGL Image Animations"){


                            //For kotlin this is before the body of the constructor.
                    
}


                @Throws(Exception::class)
            
    open fun init(level: Int)
        //nullable = true from not(false or (false and false)) = true
{
var level = level
super.initImageCache(OpenGLImageCacheFactory.getInstance(), level)
}


    open fun isFeature()
        //nullable = true from not(false or (false and true)) = true
: Boolean{

    var features: Features = Features.getInstance()!!


    
                        if(features.isFeature(GraphicsFeatureFactory.getInstance()!!.IMAGE_GRAPHICS) && features.isFeature(GraphicsFeatureFactory.getInstance()!!.IMAGE_TO_ARRAY_GRAPHICS) && features.isDefault(OpenGLFeatureFactory.getInstance()!!.OPENGL))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                        }
                            
}


}
                
            


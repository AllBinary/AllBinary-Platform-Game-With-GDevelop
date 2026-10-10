
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
        
import org.allbinary.game.resource.ResourceLoadingLevelFactory
import org.allbinary.graphics.opengles.OpenGLFeatureFactory
import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory
import org.allbinary.image.ImageCache
import org.allbinary.image.ImageCacheFactory
import org.allbinary.logic.StdUtil

open public class GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory : BaseResourceAnimationInterfaceFactoryInterfaceFactory {
        
public constructor ()                        

                            : super("Early Image Animations", StdUtil.getInstance()!!.createHashtable(), StdUtil.getInstance()!!.createHashtable(), StdUtil.getInstance()!!.createHashtable()){


                            //For kotlin this is before the body of the constructor.
                    
}

public constructor (name: String)                        

                            : super(name, StdUtil.getInstance()!!.createHashtable(), StdUtil.getInstance()!!.createHashtable(), StdUtil.getInstance()!!.createHashtable()){
var name = name


                            //For kotlin this is before the body of the constructor.
                    
}


                @Throws(Exception::class)
            
    override fun init(level: Int)
        //nullable = true from not(false or (false and false)) = true
{
var level = level
this.initImageCache(ImageCacheFactory.getInstance(), level)
}


                @Throws(Exception::class)
            
    override fun initImageCache(imageCache: ImageCache, level: Int)
        //nullable = true from not(false or (false and false)) = true
{
var imageCache = imageCache
var level = level

    
                        if(this.isInitialized())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                
super.init(level)
}


    open fun isFeature()
        //nullable = true from not(false or (false and true)) = true
: Boolean{

    var features: Features = Features.getInstance()!!


    
                        if(features.isFeature(GraphicsFeatureFactory.getInstance()!!.IMAGE_GRAPHICS) && features.isFeature(GraphicsFeatureFactory.getInstance()!!.IMAGE_TO_ARRAY_GRAPHICS) && !features.isDefault(OpenGLFeatureFactory.getInstance()!!.OPENGL))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                        }
                            
}


    open fun isLoadingLevel(level: Int)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
var level = level

    
                        if(level == ResourceLoadingLevelFactory.getInstance()!!.LOAD_EARLY.getLevel())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return super.isLoadingLevel(level)

                        }
                            
}


                @Throws(Exception::class)
            
    open fun addRectangles()
        //nullable = true from not(false or (false and true)) = true
{
}


}
                
            


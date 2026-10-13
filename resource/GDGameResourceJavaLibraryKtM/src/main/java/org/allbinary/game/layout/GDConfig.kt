
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2026 AllBinary 
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
        package org.allbinary.game.layout




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import org.allbinary.AndroidUtil
import org.allbinary.J2MEUtil
import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.layer.SWTUtil
import org.allbinary.graphics.opengles.OpenGLFeatureFactory

open public class GDConfig
            : Object
         {
        
companion object {
            
    private val instance: GDConfig = GDConfig()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDConfig{

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDConfig.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    open fun getScale()
        //nullable = true from not(false or (false and true)) = true
: Float{

    
                        if(AndroidUtil.isAndroid())
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 0.75f

                                    }
                                
                        else {
                            
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 1.0f

                        }
                            
}


    open fun getScale2()
        //nullable = true from not(false or (false and true)) = true
: Float{

    
                        if(AndroidUtil.isAndroid())
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 0.75f

                                    }
                                
                        else {
                            
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 2.0f

                        }
                            
}


    open fun getScaleHack()
        //nullable = true from not(false or (false and true)) = true
: Int{

    
                        if(SWTUtil.isSWT || AndroidUtil.isAndroid())
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 2

                                    }
                                
                        else {
                            
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 3

                        }
                            
}


    open fun getFontScale(fontSize: Float)
        //nullable = true from not(false or (false and false)) = true
: Float{
var fontSize = fontSize

    
                        if(AndroidUtil.isAndroid())
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return fontSize

                                    }
                                
                        else {
                            
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return fontSize /2

                        }
                            
}


    open fun getGameScale(androidScale: Float, htmlScale: Float, j2seScale: Float)
        //nullable = true from not(false or (false and false)) = true
: Float{
var androidScale = androidScale
var htmlScale = htmlScale
var j2seScale = j2seScale

    
                        if(AndroidUtil.isAndroid())
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return androidScale

                                    }
                                
                        else {
                            
    
                        if(J2MEUtil.isHTML())
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return htmlScale

                                    }
                                
                        else {
                            
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return j2seScale

                        }
                            

                        }
                            
}


    open fun getScaleThreed(layoutScale: Float)
        //nullable = true from not(false or (false and false)) = true
: Float{
var layoutScale = layoutScale

    var features: Features = Features.getInstance()!!


    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!!


    var isThreed: Boolean = false


    
                        if(features.isFeature(openGLFeatureFactory!!.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory!!.OPENGL_3D))
                        
                                    {
                                    isThreed= true

                                    }
                                

    
                        if(AndroidUtil.isAndroid() && isThreed)
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return layoutScale

                                    }
                                
                        else {
                            
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 1.0f

                        }
                            
}


}
                
            


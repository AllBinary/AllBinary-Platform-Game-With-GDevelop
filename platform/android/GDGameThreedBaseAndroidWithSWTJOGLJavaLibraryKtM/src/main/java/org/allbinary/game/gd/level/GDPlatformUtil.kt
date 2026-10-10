
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
        package org.allbinary.game.gd.level




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.lcdui.Image
import org.allbinary.android.AndroidInfoFactory
import org.allbinary.data.resource.ResourceUtil
import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.layer.CameraLayer
import org.allbinary.graphics.opengles.OpenGLCapabilities
import org.allbinary.graphics.opengles.OpenGLFeatureFactory
import org.allbinary.image.ImageCache
import org.allbinary.logic.system.os.OperatingSystemFactory
import org.allbinary.logic.system.os.OperatingSystemInterface

open public class GDPlatformUtil
            : Object
         {
        
companion object {
            
    private val instance: GDPlatformUtil = GDPlatformUtil()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDPlatformUtil{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    open fun getRange()
        //nullable = true from not(false or (false and true)) = true
: Int{

    var operatingSystem: OperatingSystemInterface = OperatingSystemFactory.getInstance()!!.getOperatingSystemInstance()!!


    var range: Int = 3


    
                        if(operatingSystem!!.isOverScan())
                        
                                    {
                                    range= 4

                                    }
                                
                        else {
                            range= 3

                        }
                            

    var features: Features = Features.getInstance()!!


    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!!


    
                        if(features.isFeature(openGLFeatureFactory!!.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory!!.OPENGL_3D))
                        
                                    {
                                    
    var SDK_VERSION: Int = AndroidInfoFactory.getInstance()!!.getVersion()


    
                        if(SDK_VERSION > 21)
                        
                                    {
                                    
    
                        if(operatingSystem!!.isOverScan())
                        
                                    {
                                    range= 6

                                    }
                                
                        else {
                            range= 5

                        }
                            

                                    }
                                
                             else 
    
                        if(SDK_VERSION > 7)
                        
                                    {
                                    
    
                        if(operatingSystem!!.isOverScan())
                        
                                    {
                                    range= 5

                                    }
                                
                        else {
                            range= 4

                        }
                            

                                    }
                                

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return range
}


    open fun updateCamera(cameraLayer: CameraLayer)
        //nullable = true from not(false or (false and false)) = true
{
    //var cameraLayer = cameraLayer

    var SDK_VERSION: Int = AndroidInfoFactory.getInstance()!!.getVersion()


    
                        if(SDK_VERSION > 7)
                        
                                    {
                                    
    
                        if(OpenGLCapabilities.getInstance()!!.isVertexBufferObjectSupport())
                        
                                    {
                                    
    var operatingSystem: OperatingSystemInterface = OperatingSystemFactory.getInstance()!!.getOperatingSystemInstance()!!


    
                        if(operatingSystem!!.isOverScan())
                        
                                    {
                                    cameraLayer!!.setRotationY(33.toShort())

                                    }
                                
                        else {
                            cameraLayer!!.setRotationY(45.toShort())

                        }
                            

                                    }
                                
                        else {
                            
    var operatingSystem: OperatingSystemInterface = OperatingSystemFactory.getInstance()!!.getOperatingSystemInstance()!!


    
                        if(operatingSystem!!.isOverScan())
                        
                                    {
                                    cameraLayer!!.setRotationY(45.toShort())

                                    }
                                
                        else {
                            cameraLayer!!.setRotationY(67.toShort())

                        }
                            

                        }
                            

                                    }
                                
                        else {
                            cameraLayer!!.setRotationY(67.toShort())

                        }
                            
}


    open fun updateResource(imageCache: ImageCache, image: Image, resource: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var imageCache = imageCache
    //var image = image
    //var resource = resource

    var resourceId: Integer = ResourceUtil.getInstance()!!.getResourceId(resource)!!

imageCache!!.getHashtableP()!!.put(resourceId, image)
}


}
                
            


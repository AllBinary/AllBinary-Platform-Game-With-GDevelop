
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

        


            import { Object } from '../../../../../java/lang/Object.js';
        
            import { Integer } from '../../../../../java/lang/Integer.js';
        
import { Image } from '../../../../../javax/microedition/lcdui/Image.js';
//not GWT import const Image

import { AndroidInfoFactory } from '../../../../../org/allbinary/android/AndroidInfoFactory.js';
//not GWT import const AndroidInfoFactory

//not plain js import { ResourceUtil } 
const ResourceUtil = globalThis.org.allbinary.data.resource.ResourceUtil;

import { Features } from '../../../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const Features

import { CameraLayer } from '../../../../../org/allbinary/game/layer/CameraLayer.js';
//not GWT import const CameraLayer

import { OpenGLCapabilities } from '../../../../../org/allbinary/graphics/opengles/OpenGLCapabilities.js';
//not GWT import const OpenGLCapabilities

import { OpenGLFeatureFactory } from '../../../../../org/allbinary/graphics/opengles/OpenGLFeatureFactory.js';
//not GWT import const OpenGLFeatureFactory

import { ImageCache } from '../../../../../org/allbinary/image/ImageCache.js';
//not GWT import const ImageCache

import { OperatingSystemFactory } from '../../../../../org/allbinary/logic/system/os/OperatingSystemFactory.js';
//not GWT import const OperatingSystemFactory

import { OperatingSystemInterface } from '../../../../../org/allbinary/logic/system/os/OperatingSystemInterface.js';
//not GWT import const OperatingSystemInterface

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDPlatformUtil
            extends Object
         {
        

    private static readonly instance: GDPlatformUtil = new GDPlatformUtil();

    public static getInstance(): GDPlatformUtil{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance;
    
}


    public getRange(): number{

    var operatingSystem: OperatingSystemInterface = OperatingSystemFactory.getInstance()!.getOperatingSystemInstance()!;;
    

    var range: number = 3;;
    

                        if(operatingSystem!.isOverScan())
                        
                                    {
                                    range= 4;
    

                                    }
                                
                        else {
                            range= 3;
    

                        }
                            

    var features: Features = Features.getInstance()!;;
    

    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!;;
    

                        if(features.isFeature(openGLFeatureFactory!.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory!.OPENGL_3D))
                        
                                    {
                                    
    var SDK_VERSION: number = AndroidInfoFactory.getInstance()!.getVersion()!;;
    

                        if(SDK_VERSION > 21)
                        
                                    {
                                    
                        if(operatingSystem!.isOverScan())
                        
                                    {
                                    range= 6;
    

                                    }
                                
                        else {
                            range= 5;
    

                        }
                            

                                    }
                                
                             else 
                        if(SDK_VERSION > 7)
                        
                                    {
                                    
                        if(operatingSystem!.isOverScan())
                        
                                    {
                                    range= 5;
    

                                    }
                                
                        else {
                            range= 4;
    

                        }
                            

                                    }
                                

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return range;
    
}


    public updateCamera(cameraLayer: CameraLayer){

    var SDK_VERSION: number = AndroidInfoFactory.getInstance()!.getVersion()!;;
    

                        if(SDK_VERSION > 7)
                        
                                    {
                                    
                        if(OpenGLCapabilities.getInstance()!.isVertexBufferObjectSupport())
                        
                                    {
                                    
    var operatingSystem: OperatingSystemInterface = OperatingSystemFactory.getInstance()!.getOperatingSystemInstance()!;;
    

                        if(operatingSystem!.isOverScan())
                        
                                    {
                                    cameraLayer!.setRotationY(33);
    

                                    }
                                
                        else {
                            cameraLayer!.setRotationY(45);
    

                        }
                            

                                    }
                                
                        else {
                            
    var operatingSystem: OperatingSystemInterface = OperatingSystemFactory.getInstance()!.getOperatingSystemInstance()!;;
    

                        if(operatingSystem!.isOverScan())
                        
                                    {
                                    cameraLayer!.setRotationY(45);
    

                                    }
                                
                        else {
                            cameraLayer!.setRotationY(67);
    

                        }
                            

                        }
                            

                                    }
                                
                        else {
                            cameraLayer!.setRotationY(67);
    

                        }
                            
}


    public updateResource(imageCache: ImageCache, image: Image, resource: string){

    var resourceId: Integer = ResourceUtil.getInstance()!.getResourceId(resource)!;;
    
imageCache!.getHashtableP()!.put(resourceId, image);
    
}


}




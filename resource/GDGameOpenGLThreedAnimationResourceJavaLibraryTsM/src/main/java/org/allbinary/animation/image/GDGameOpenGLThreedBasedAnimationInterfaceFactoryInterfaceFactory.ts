
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
import { BaseResourceAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/resource/BaseResourceAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const BaseResourceAnimationInterfaceFactoryInterfaceFactory

import { OpenGLFeatureFactory } from '../../../../org/allbinary/graphics/opengles/OpenGLFeatureFactory.js';
//not GWT import const OpenGLFeatureFactory

import { Min3dSceneResourcesFactory } from '../../../../org/allbinary/graphics/threed/min3d/Min3dSceneResourcesFactory.js';
//not GWT import const Min3dSceneResourcesFactory

import { OpenGLImageCacheFactory } from '../../../../org/allbinary/image/opengles/OpenGLImageCacheFactory.js';
//not GWT import const OpenGLImageCacheFactory

import { Features } from '../../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const Features

import { GraphicsFeatureFactory } from '../../../../org/allbinary/game/configuration/feature/GraphicsFeatureFactory.js';
//not GWT import const GraphicsFeatureFactory

import { ProgressCanvas } from '../../../../org/allbinary/graphics/canvas/transition/progress/ProgressCanvas.js';
//not GWT import const ProgressCanvas

import { ProgressCanvasFactory } from '../../../../org/allbinary/graphics/canvas/transition/progress/ProgressCanvasFactory.js';
//not GWT import const ProgressCanvasFactory

//not plain js import { StdUtil } 
const StdUtil = globalThis.org.allbinary.logic.StdUtil;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory extends BaseResourceAnimationInterfaceFactoryInterfaceFactory {
        

public constructor (){
            super("GDGame OpenGL ImageArray Animations", StdUtil.getInstance()!.createHashtable(), StdUtil.getInstance()!.createHashtable(), StdUtil.getInstance()!.createHashtable());
                    

                            //For kotlin this is before the body of the constructor.
                    
}


    private readonly portion: number = 120;

    private index: number = 1;

                //@Throws(Exception.constructor)
            
    public loadDayTrack(loadingString: string){

    var progressCanvas: ProgressCanvas = ProgressCanvasFactory.getInstance()!;;
    

    var min3dSceneResourcesFactory: Min3dSceneResourcesFactory = Min3dSceneResourcesFactory.getInstance()!;;
    
}


    private isInitialized: boolean[] = new Array(11);

                //@Throws(Exception.constructor)
            
    public init(level: number){
super.initImageCache(OpenGLImageCacheFactory.getInstance(), level);
    

    var loadingString: string = this.toString() +" Loading: ";;
    
this.index= 1;
    
}


    public isFeature(): boolean{

    var features: Features = Features.getInstance()!;;
    

    var graphicsFeatureFactory: GraphicsFeatureFactory = GraphicsFeatureFactory.getInstance()!;;
    

    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!;;
    

                        if(features.isFeature(graphicsFeatureFactory!.IMAGE_GRAPHICS) && features.isFeature(graphicsFeatureFactory!.IMAGE_TO_ARRAY_GRAPHICS) && features.isDefault(openGLFeatureFactory!.OPENGL) && (features.isFeature(openGLFeatureFactory!.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory!.OPENGL_3D)))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    

                        }
                            
}


}




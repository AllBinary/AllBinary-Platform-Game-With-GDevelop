
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
import { OpenGLFeatureFactory } from '../../../../org/allbinary/graphics/opengles/OpenGLFeatureFactory.js';
//not GWT import const OpenGLFeatureFactory

import { BaseResourceAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/resource/BaseResourceAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const BaseResourceAnimationInterfaceFactoryInterfaceFactory

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
        
export class GDGameGameResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory extends BaseResourceAnimationInterfaceFactoryInterfaceFactory {
        

public constructor (){
            super("OpenGL Image Animations", StdUtil.getInstance()!.createHashtable(), StdUtil.getInstance()!.createHashtable(), StdUtil.getInstance()!.createHashtable());
                    

                            //For kotlin this is before the body of the constructor.
                    
}


    private index: number = 1;

                //@Throws(Exception.constructor)
            
    public init(level: number){

                        if(this.isInitialized())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

    var portion: number = 120;;
    

    var loadingString: string = this.toString() +" Loading: ";;
    
this.index= 1;
    

    var progressCanvas: ProgressCanvas = ProgressCanvasFactory.getInstance()!;;
    
progressCanvas!.addPortion(portion, loadingString, this.index++);
    
super.init(level);
    
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




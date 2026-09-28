
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
import { ResourceLoadingLevelFactory } from '../../../../org/allbinary/game/resource/ResourceLoadingLevelFactory.js';
//not GWT import const ResourceLoadingLevelFactory

import { OpenGLFeatureFactory } from '../../../../org/allbinary/graphics/opengles/OpenGLFeatureFactory.js';
//not GWT import const OpenGLFeatureFactory

import { BaseResourceAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/resource/BaseResourceAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const BaseResourceAnimationInterfaceFactoryInterfaceFactory

import { Features } from '../../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const Features

import { GraphicsFeatureFactory } from '../../../../org/allbinary/game/configuration/feature/GraphicsFeatureFactory.js';
//not GWT import const GraphicsFeatureFactory

//not plain js import { StdUtil } 
const StdUtil = globalThis.org.allbinary.logic.StdUtil;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameEarlyResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory extends BaseResourceAnimationInterfaceFactoryInterfaceFactory {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

public constructor (){
            super("Early OpenGL Animations", StdUtil.getInstance()!.createHashtable(), StdUtil.getInstance()!.createHashtable(), StdUtil.getInstance()!.createHashtable());
                    

                            //For kotlin this is before the body of the constructor.
                    
}


                //@Throws(Exception.constructor)
            
    public init(level: number){
this.logUtil!.putF(this.getName(), this, "init");
    

                        if(this.isInitialized())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                
super.init(level);
    
}


    public isLoadingLevel(level: number): boolean{

    var resourceLoadingLevelFactory: ResourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance()!;;
    

                        if(level == resourceLoadingLevelFactory!.LOAD_EARLY.getLevel())
                        
                                    {
                                    this.logUtil!.putF(this.getName(), this, "isLoadingLevel");
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return super.isLoadingLevel(level);;
    

                        }
                            
}


    public isFeature(): boolean{

    var features: Features = Features.getInstance()!;;
    

    var graphicsFeatureFactory: GraphicsFeatureFactory = GraphicsFeatureFactory.getInstance()!;;
    

    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!;;
    

                        if(features.isFeature(graphicsFeatureFactory!.IMAGE_GRAPHICS) && features.isFeature(graphicsFeatureFactory!.IMAGE_TO_ARRAY_GRAPHICS) && features.isDefault(openGLFeatureFactory!.OPENGL) && (features.isFeature(openGLFeatureFactory!.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory!.OPENGL_3D)))
                        
                                    {
                                    this.logUtil!.putF(this.getName(), this, "isFeature");
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    

                        }
                            
}


}




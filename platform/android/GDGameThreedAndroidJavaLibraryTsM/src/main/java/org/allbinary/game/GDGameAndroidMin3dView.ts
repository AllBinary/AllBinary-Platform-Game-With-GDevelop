
        /* Generated Code Do Not Modify */

        


import { SceneController } from '../../../min3d/core/SceneController.js';
//not GWT import const SceneController

import { Context } from '../../../android/content/Context.js';
//not GWT import const Context

import { GLSurfaceView } from '../../../android/opengl/GLSurfaceView.js';
//not GWT import const GLSurfaceView

import { AttributeSet } from '../../../android/util/AttributeSet.js';
//not GWT import const AttributeSet

import { OpenGLThreadUtil } from '../../../org/allbinary/graphics/opengles/OpenGLThreadUtil.js';
//not GWT import const OpenGLThreadUtil

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { PreLogUtil } 
const PreLogUtil = globalThis.org.allbinary.logic.communication.log.PreLogUtil;

import { AllBinaryMidletMin3dSurfaceView } from '../../../org/allbinary/view/AllBinaryMidletMin3dSurfaceView.js';
//not GWT import const AllBinaryMidletMin3dSurfaceView

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameAllBinarySceneControllerFactory } from './GDGameAllBinarySceneControllerFactory.js';
//not GWT import - same folder const GDGameAllBinarySceneControllerFactory
import { Renderer } from './Renderer.js';
//not GWT import - same folder const Renderer

export class GDGameAndroidMin3dView extends AllBinaryMidletMin3dSurfaceView {
        

    private readonly TAG: string = "GDGameAndroidMin3dView";

public constructor (context: Context, attrs: AttributeSet){
            super(context, attrs);
                    

                            //For kotlin this is before the body of the constructor.
                    
PreLogUtil.put(this.commonStrings!.START, this.TAG, this.commonStrings!.CONSTRUCTOR);
    

    var sceneController: SceneController = GDGameAllBinarySceneControllerFactory.getInstance()!;;
    
this.setRenderer(sceneController!.getRenderer() as GLSurfaceView.Renderer);
    
this.setRenderMode(GLSurfaceView.RENDERMODE_CONTINUOUSLY);
    
OpenGLThreadUtil.getInstance()!.set(this);
    
}


}




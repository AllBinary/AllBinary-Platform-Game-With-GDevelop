
        /* Generated Code Do Not Modify */

        


import { Renderer } from '../../../../min3d/core/Renderer.js';
//not GWT import const Renderer

import { SceneController } from '../../../../min3d/core/SceneController.js';
//not GWT import const SceneController

import { GDGameAllBinarySceneControllerFactory } from '../../../../org/allbinary/game/GDGameAllBinarySceneControllerFactory.js';
//not GWT import const GDGameAllBinarySceneControllerFactory

import { OpenGLThreadUtil } from '../../../../org/allbinary/graphics/opengles/OpenGLThreadUtil.js';
//not GWT import const OpenGLThreadUtil

import { AllBinaryMidletMin3dSurfaceView } from '../../../../org/allbinary/j2se/view/AllBinaryMidletMin3dSurfaceView.js';
//not GWT import const AllBinaryMidletMin3dSurfaceView

import { OptimizedGLSurfaceView } from '../../../../org/allbinary/view/OptimizedGLSurfaceView.js';
//not GWT import const OptimizedGLSurfaceView

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameJOGLMin3dView extends AllBinaryMidletMin3dSurfaceView {
        

public constructor (){

            super();
        
    var sceneController: SceneController = GDGameAllBinarySceneControllerFactory.getInstance()!;;
    
this.setRenderer(sceneController!.getRenderer() as Renderer);
    
this.setRenderMode(OptimizedGLSurfaceView.RENDERMODE_CONTINUOUSLY);
    
OpenGLThreadUtil.getInstance()!.set(this);
    
}


}





        /* Generated Code Do Not Modify */

        


import { OpenGLThreadUtil } from '../../../../org/allbinary/graphics/opengles/OpenGLThreadUtil.js';
//not GWT import const OpenGLThreadUtil

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { AllBinaryMidletOpenGLSurfaceView } from '../../../../org/allbinary/view/AllBinaryMidletOpenGLSurfaceView.js';
//not GWT import const AllBinaryMidletOpenGLSurfaceView

//not plain js import { PreLogUtil } 
const PreLogUtil = globalThis.org.allbinary.logic.communication.log.PreLogUtil;

import { OptimizedGLSurfaceView } from '../../../../org/allbinary/view/OptimizedGLSurfaceView.js';
//not GWT import const OptimizedGLSurfaceView

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameJOGLOpenGLESView extends AllBinaryMidletOpenGLSurfaceView {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly TAG: string = "MiniSpaceWarJOGLOpenGLESView";

public constructor (){

            super();
        PreLogUtil.put(this.commonStrings!.START, this.TAG, this.commonStrings!.CONSTRUCTOR);
    
this.setRenderMode(OptimizedGLSurfaceView.RENDERMODE_CONTINUOUSLY);
    
OpenGLThreadUtil.getInstance()!.set(this);
    
}


}





        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../../java/lang/Exception.js';
        
import { Activity } from '../../../../../android/app/Activity.js';
//not GWT import const Activity

import { GLSurfaceView } from '../../../../../android/opengl/GLSurfaceView.js';
//not GWT import const GLSurfaceView

import { Bundle } from '../../../../../android/os/Bundle.js';
//not GWT import const Bundle

import { SceneController } from '../../../../../min3d/core/SceneController.js';
//not GWT import const SceneController

import { AndroidResources } from '../../../../../org/allbinary/AndroidResources.js';
//not GWT import const AndroidResources

//not plain js import { CommonStateStrings } 
const CommonStateStrings = globalThis.org.allbinary.string.CommonStateStrings;
type CommonStateStrings<T = any, U = any> = typeof CommonStateStrings extends abstract new (...args: any[]) => infer Instance ? Instance : typeof CommonStateStrings;

//not plain js import { ResourceUtil } 
const ResourceUtil = globalThis.org.allbinary.data.resource.ResourceUtil;
type ResourceUtil<T = any, U = any> = typeof ResourceUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof ResourceUtil;

import { OpenGLESGraphicsCompositeFactory } from '../../../../../org/allbinary/device/OpenGLESGraphicsCompositeFactory.js';
//not GWT import const OpenGLESGraphicsCompositeFactory

import { DisplayInfoSingleton } from '../../../../../org/allbinary/graphics/displayable/DisplayInfoSingleton.js';
//not GWT import const DisplayInfoSingleton

import { Features } from '../../../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const Features

import { OpenGLFeatureFactory } from '../../../../../org/allbinary/graphics/opengles/OpenGLFeatureFactory.js';
//not GWT import const OpenGLFeatureFactory

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
type CommonStrings<T = any, U = any> = typeof CommonStrings extends abstract new (...args: any[]) => infer Instance ? Instance : typeof CommonStrings;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
type LogUtil<T = any, U = any> = typeof LogUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof LogUtil;

import { OptimizedGLSurfaceView } from '../../../../../org/allbinary/view/OptimizedGLSurfaceView.js';
//not GWT import const OptimizedGLSurfaceView

import { PlatformOpenGLESGraphicsFactory } from '../../../../../org/microemu/opengles/device/PlatformOpenGLESGraphicsFactory.js';
//not GWT import const PlatformOpenGLESGraphicsFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class RendererActivity extends Activity {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    readonly commonStrings: CommonStrings = CommonStrings.getInstance()!;

    private readonly androidResources: AndroidResources = AndroidResources.getInstance()!;

    _glSurfaceView: OptimizedGLSurfaceView;

    private _renderContinuously: boolean= false;

    sceneController: SceneController;

    onCreate(savedInstanceState: Bundle){

 try { super.onCreate(savedInstanceState);
    
ResourceUtil.getInstance()!.setContextFromActivity(this);
    
ResourceUtil.getInstance()!.setResources(this.getResources());
    

    let features: Features = Features.getInstance()!;;
    

    let openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!;;
    
features.addDefault(openGLFeatureFactory!.OPENGL_3D);
    
OpenGLESGraphicsCompositeFactory.getInstance()!.set(new PlatformOpenGLESGraphicsFactory());
    
this.setContentView(this.androidResources!.layout.gd_min3d_layout);
    
this._glSurfaceView= this.findViewById(this.androidResources!.id.gd_gl) as OptimizedGLSurfaceView;
    

    let displayInfo: DisplayInfoSingleton = DisplayInfoSingleton.getInstance()!;;
    
displayInfo!.setLastSize(this._glSurfaceView.getWidth(), this._glSurfaceView.getHeight(), CommonStateStrings.getInstance()!.CREATE);
    
this.setContentView(this._glSurfaceView);
    
 }
 catch (caught: any) {
 {
  const e = caught;
  
this.logUtil!.put(this.commonStrings!.EXCEPTION, this, CommonStateStrings.getInstance()!.CREATE, e);
    

 }
   }
 
}


    onResume(){
super.onResume();
    
this._glSurfaceView.onResume();
    
}


    onPause(){
super.onPause();
    
this._glSurfaceView.onPause();
    
}


    public renderContinuously($b: boolean){
this._renderContinuously= $b;
    

                        if(this._renderContinuously)
                        this._glSurfaceView.setRenderMode(GLSurfaceView.RENDERMODE_CONTINUOUSLY)
                             else 
                        if()
                        
}


}


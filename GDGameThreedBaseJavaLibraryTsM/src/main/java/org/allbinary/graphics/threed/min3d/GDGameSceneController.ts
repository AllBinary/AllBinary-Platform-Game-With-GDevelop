
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../../java/lang/Exception.js';
        
import { GL10 } from '../../../../../javax/microedition/khronos/opengles/GL10.js';
//not GWT import const GL10

import { TextureManager } from '../../../../../min3d/core/TextureManager.js';
//not GWT import const TextureManager

import { Camera } from '../../../../../min3d/vos/Camera.js';
//not GWT import const Camera

import { OffsetTargetXCamera } from '../../../../../min3d/vos/OffsetTargetXCamera.js';
//not GWT import const OffsetTargetXCamera

import { OffsetTargetXCameraFactory } from '../../../../../min3d/vos/OffsetTargetXCameraFactory.js';
//not GWT import const OffsetTargetXCameraFactory

import { Light } from '../../../../../min3d/vos/light/Light.js';
//not GWT import const Light

import { AndroidUtil } from '../../../../../org/allbinary/AndroidUtil.js';
//not GWT import const AndroidUtil

import { GameTypeFactory } from '../../../../../org/allbinary/game/GameTypeFactory.js';
//not GWT import const GameTypeFactory

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { PreLogUtil } 
const PreLogUtil = globalThis.org.allbinary.logic.communication.log.PreLogUtil;

import { AllBinaryGameLayerManager } from '../../../../../org/allbinary/game/layer/AllBinaryGameLayerManager.js';
//not GWT import const AllBinaryGameLayerManager

import { ProgressCanvas } from '../../../../../org/allbinary/graphics/canvas/transition/progress/ProgressCanvas.js';
//not GWT import const ProgressCanvas

import { ProgressCanvasFactory } from '../../../../../org/allbinary/graphics/canvas/transition/progress/ProgressCanvasFactory.js';
//not GWT import const ProgressCanvasFactory

import { GDGameThreedLevelBuilder } from '../../../../../org/allbinary/game/canvas/GDGameThreedLevelBuilder.js';
//not GWT import const GDGameThreedLevelBuilder

import { CameraLayer } from '../../../../../org/allbinary/game/layer/CameraLayer.js';
//not GWT import const CameraLayer

import { GDGameLayerManager } from '../../../../../org/allbinary/game/layer/GDGameLayerManager.js';
//not GWT import const GDGameLayerManager

import { SimpleUserFollowCameraLayer } from '../../../../../org/allbinary/game/layer/SimpleUserFollowCameraLayer.js';
//not GWT import const SimpleUserFollowCameraLayer

import { GDThreedEarlyResourceInitializationFactory } from '../../../../../org/allbinary/game/resource/GDThreedEarlyResourceInitializationFactory.js';
//not GWT import const GDThreedEarlyResourceInitializationFactory

import { ResourceInitialization } from '../../../../../org/allbinary/game/resource/ResourceInitialization.js';
//not GWT import const ResourceInitialization

import { RectangleFactory } from '../../../../../org/allbinary/graphics/RectangleFactory.js';
//not GWT import const RectangleFactory

import { OpenGLCapabilities } from '../../../../../org/allbinary/graphics/opengles/OpenGLCapabilities.js';
//not GWT import const OpenGLCapabilities

import { AllBinaryToMin3dRendererFactory } from '../../../../../org/allbinary/graphics/threed/min3d/renderer/AllBinaryToMin3dRendererFactory.js';
//not GWT import const AllBinaryToMin3dRendererFactory

//not plain js import { MathData } 
const MathData = globalThis.org.allbinary.logic.math.MathData;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;

import { OperatingSystemFactory } from '../../../../../org/allbinary/logic/system/os/OperatingSystemFactory.js';
//not GWT import const OperatingSystemFactory

import { OperatingSystemInterface } from '../../../../../org/allbinary/logic/system/os/OperatingSystemInterface.js';
//not GWT import const OperatingSystemInterface

//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;

import { ViewPosition } from '../../../../../org/allbinary/view/ViewPosition.js';
//not GWT import const ViewPosition

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { AllBinaryGameSceneController } from './AllBinaryGameSceneController.js';
//not GWT import - same folder const AllBinaryGameSceneController
import { GDGameThreedLevelBuilderFactory } from './GDGameThreedLevelBuilderFactory.js';
//not GWT import - same folder const GDGameThreedLevelBuilderFactory
import { GDCameraInputProcessor } from './GDCameraInputProcessor.js';
//not GWT import - same folder const GDCameraInputProcessor
import { GDGameCameraSetup } from './GDGameCameraSetup.js';
//not GWT import - same folder const GDGameCameraSetup
import { AllBinarySceneFactory } from './AllBinarySceneFactory.js';
//not GWT import - same folder const AllBinarySceneFactory

export class GDGameSceneController extends AllBinaryGameSceneController {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly TAG: string = "GDGameSceneController";

    private readonly openGLCapabilities: OpenGLCapabilities = OpenGLCapabilities.getInstance()!;

    private readonly gameThreedLevelBuilderFactory: GDGameThreedLevelBuilderFactory = GDGameThreedLevelBuilderFactory.getInstance()!;

    private readonly cameraInputProcessor: GDCameraInputProcessor = new class extends GDCameraInputProcessor
                                {
                                
    public process(gdGameCameraSetup: GDGameCameraSetup){
}

                                }
                            ;

public constructor (){
            super(new AllBinaryToMin3dRendererFactory(), new OffsetTargetXCameraFactory(), new AllBinarySceneFactory(), true, true);
                    

                            //For kotlin this is before the body of the constructor.
                    
PreLogUtil.put(this.commonStrings!.START, this.TAG, this.commonStrings!.CONSTRUCTOR);
    
}


    private initialized: boolean= false;

    readonly portion: number = 100;

    readonly loadingString: string = this.toString() +" Loading: ";

    index: number= 0;

    public initScene(gl: GL10){

        try {
            PreLogUtil.put(this.commonStrings!.START, this, this.sceneStrings!.INIT_SCENE);
    
this.index= 1;
    

    var glInstanceVersion: string = this.openGLCapabilities!.glInstanceVersion;;
    

    var progressCanvas: ProgressCanvas = ProgressCanvasFactory.getInstance()!;;
    
progressCanvas!.addEarlyPortion(this.portion, this.loadingString, this.index++);
    

                        if(!this.initialized)
                        
                                    {
                                    
    var resourceInitialization: ResourceInitialization = (GDThreedEarlyResourceInitializationFactory.getInstance()!.list.get(0) as ResourceInitialization);;
    
resourceInitialization!.init();
    
progressCanvas!.addEarlyPortion(this.portion, this.loadingString, this.index++);
    
this.processLighting();
    

    var camera: Camera = this.scene.getCamera()!;;
    
camera.frustum.horizontalCenter(0.5);
    
camera.frustum.verticalCenter(0.5);
    
this.initialized= true;
    

                                    }
                                
                        else {
                            TextureManager.getInstance()!.reset(gl);
    

                        }
                            
progressCanvas!.addEarlyPortion(this.portion, this.loadingString, this.index++);
    

    var gdGameThreedLevelBuilder: GDGameThreedLevelBuilder;;
    

    var size: number = this.gameThreedLevelBuilderFactory!.list.size()!;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
gdGameThreedLevelBuilder= (this.gameThreedLevelBuilderFactory!.list.get(index) as GDGameThreedLevelBuilder);
    
gdGameThreedLevelBuilder!.build(gl, glInstanceVersion);
    
}

progressCanvas!.addEarlyPortion(this.portion, this.loadingString, this.index++);
    
PreLogUtil.put(this.commonStrings!.END, this, this.sceneStrings!.INIT_SCENE);
    

                //: 
} catch(e) 
            {
this.logUtil!.put(this.commonStrings!.EXCEPTION, this, this.sceneStrings!.INIT_SCENE, e);
    
}

}


    private cameraLayer: CameraLayer;

                //@Throws(Exception.constructor)
            
    public buildScene(layerManager: AllBinaryGameLayerManager){

        try {
            PreLogUtil.put(this.commonStrings!.START, this, this.sceneStrings!.BUILD_SCENE);
    

    var gdLayerManager: GDGameLayerManager = layerManager as GDGameLayerManager;;
    

    var gdGameCameraSetup: GDGameCameraSetup = (this.gameThreedLevelBuilderFactory!.cameraList!.get(gdLayerManager!.layout) as GDGameCameraSetup);;
    

    var camera: Camera = this.scene.getCamera()!;;
    

                        if(gdGameCameraSetup!.type == GDGameCameraSetup.FOLLOW)
                        
                                    {
                                    this.scene.reset();
    

    var vehicleCamera: OffsetTargetXCamera = this.scene.getCamera() as OffsetTargetXCamera;;
    

    var operatingSystem: OperatingSystemInterface = OperatingSystemFactory.getInstance()!.getOperatingSystemInstance()!;;
    

    var distance: number = operatingSystem!.isOverScan()
                        ?       
                                (AndroidUtil.isAndroid()
                        ?       
                                550
                                :

                            650;

    )
                                :

                            
                                        //Otherwise - expression - elseExpr - EnclosedExpr
;

    ;;
    
this.cameraLayer= new SimpleUserFollowCameraLayer(vehicleCamera, RectangleFactory.SINGLETON, ViewPosition.getInstanceD(), distance, distance, distance);
    

                        if(layerManager!.getGameInfo()!.getGameType() != GameTypeFactory.getInstance()!.BOT)
                        
                                    {
                                    vehicleCamera!.setOffsetY(10);
    

                                    }
                                
                        else {
                            vehicleCamera!.setOffsetY(8);
    

                        }
                            
this.cameraLayer!.updateCamera();
    

                                    }
                                

    var stringMaker: StringMaker = new StringMaker();;
    
gdGameCameraSetup!.processTarget(this.cameraLayer, camera);
    
gdGameCameraSetup!.process(camera, stringMaker);
    
camera.cameraSetup= gdGameCameraSetup;
    
camera.updateFrustrum();
    

                        if(gdGameCameraSetup!.type == GDGameCameraSetup.FOLLOW)
                        
                                    {
                                    this.cameraLayer!.processTick(layerManager);
    
layerManager!.append(this.cameraLayer);
    

                                    }
                                
this.cameraInputProcessor!.process(gdGameCameraSetup);
    
camera.position.append(stringMaker);
    
stringMaker!.append(CommonSeps.getInstance()!.DASH)!.append(MathData.getInstance()!.GREATER_THAN);
    
camera.target.getPosition()!.append(stringMaker);
    
PreLogUtil.put(stringMaker!.toString(), this, this.sceneStrings!.BUILD_SCENE);
    

                //: 
} catch(e) 
            {
this.logUtil!.put(this.commonStrings!.EXCEPTION, this, this.sceneStrings!.BUILD_SCENE, e);
    
}

}


    processLighting(){

    var light: Light = new Light();;
    

                        if(this.scene.getLights()!.size() > 0)
                        
                                    {
                                    this.scene.getLights()!.reset();
    

                                    }
                                
this.scene.getLights()!.add(light);
    
}


    public processEarlyGameAction(){
}


    public processStartGameAction(){
}


    private readonly NAME: string = "GDGame Scene";

    public toString(): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.NAME;
    
}


}




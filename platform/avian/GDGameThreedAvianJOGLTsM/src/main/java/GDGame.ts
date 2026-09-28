
        /* Generated Code Do Not Modify */

        


            import { Exception } from 'java/lang/Exception.js';
        
            import { RuntimeException } from 'java/lang/RuntimeException.js';
        
import { GameAdStateFactory } from 'org/allbinary/business/advertisement/GameAdStateFactory.js';
//not GWT import const GameAdStateFactory

//not plain js import { ResourceUtil } 
const ResourceUtil = globalThis.org.allbinary.data.resource.ResourceUtil;

import { InitEmulatorFactory } from 'org/allbinary/emulator/InitEmulatorFactory.js';
//not GWT import const InitEmulatorFactory

import { GDGameSoftwareInfo } from 'org/allbinary/game/canvas/GDGameSoftwareInfo.js';
//not GWT import const GDGameSoftwareInfo

import { GameConfigurationCentral } from 'org/allbinary/game/configuration/GameConfigurationCentral.js';
//not GWT import const GameConfigurationCentral

import { Features } from 'org/allbinary/game/configuration/feature/Features.js';
//not GWT import const Features

import { GameFeatureFactory } from 'org/allbinary/game/configuration/feature/GameFeatureFactory.js';
//not GWT import const GameFeatureFactory

import { GraphicsFeatureFactory } from 'org/allbinary/game/configuration/feature/GraphicsFeatureFactory.js';
//not GWT import const GraphicsFeatureFactory

import { InputFeatureFactory } from 'org/allbinary/game/configuration/feature/InputFeatureFactory.js';
//not GWT import const InputFeatureFactory

import { SensorFeatureFactory } from 'org/allbinary/game/configuration/feature/SensorFeatureFactory.js';
//not GWT import const SensorFeatureFactory

import { TouchFeatureFactory } from 'org/allbinary/game/configuration/feature/TouchFeatureFactory.js';
//not GWT import const TouchFeatureFactory

import { DefaultGameInitializationListener } from 'org/allbinary/game/init/DefaultGameInitializationListener.js';
//not GWT import const DefaultGameInitializationListener

import { GDGameJOGLMin3dView } from 'org/allbinary/game/gd/GDGameJOGLMin3dView.js';
//not GWT import const GDGameJOGLMin3dView

import { OpenGLConfiguration } from 'org/allbinary/graphics/opengles/OpenGLConfiguration.js';
//not GWT import const OpenGLConfiguration

import { OpenGLFeatureFactory } from 'org/allbinary/graphics/opengles/OpenGLFeatureFactory.js';
//not GWT import const OpenGLFeatureFactory

import { AllMotionRecognizer } from 'org/allbinary/input/motion/AllMotionRecognizer.js';
//not GWT import const AllMotionRecognizer

import { BasicMotionGesturesHandler } from 'org/allbinary/input/motion/gesture/observer/BasicMotionGesturesHandler.js';
//not GWT import const BasicMotionGesturesHandler

import { GDGameMotionGestureListener } from 'org/allbinary/input/motion/gesture/observer/GDGameMotionGestureListener.js';
//not GWT import const GDGameMotionGestureListener

import { MotionGestureReceiveInterfaceFactory } from 'org/allbinary/input/motion/gesture/observer/MotionGestureReceiveInterfaceFactory.js';
//not GWT import const MotionGestureReceiveInterfaceFactory

//not plain js import { LogFactory } 
const LogFactory = globalThis.org.allbinary.logic.communication.log.LogFactory;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { SmallIntegerSingletonFactory } from 'org/allbinary/logic/math/SmallIntegerSingletonFactory.js';
//not GWT import const SmallIntegerSingletonFactory

import { GDGameClientInformationInterfaceFactory } from 'org/allbinary/logic/system/security/licensing/GDGameClientInformationInterfaceFactory.js';
//not GWT import const GDGameClientInformationInterfaceFactory

import { EarlySoundsFactory } from 'org/allbinary/media/audio/EarlySoundsFactory.js';
//not GWT import const EarlySoundsFactory

import { GDGameSoundsFactory } from 'org/allbinary/media/audio/GDGameSoundsFactory.js';
//not GWT import const GDGameSoundsFactory

import { Sounds } from 'org/allbinary/media/audio/Sounds.js';
//not GWT import const Sounds

import { RaceTrackGameFeature } from 'org/allbinary/media/graphics/geography/map/racetrack/RaceTrackGameFeature.js';
//not GWT import const RaceTrackGameFeature

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

import { EmulatorViewInterface } from 'org/allbinary/view/EmulatorViewInterface.js';
//not GWT import const EmulatorViewInterface

import { OptimizedGLSurfaceView } from 'org/allbinary/view/OptimizedGLSurfaceView.js';
//not GWT import const OptimizedGLSurfaceView

import { MidletJOGLInterface } from 'org/microemu/app/MidletJOGLInterface.js';
//not GWT import const MidletJOGLInterface

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameMIDlet } from './GDGameMIDlet.js';
//not GWT import - same folder const GDGameMIDlet

export class GDGame extends org.allbinary.game.GDGameMIDlet implements MidletJOGLInterface {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly DEVICE_ID: number = 0;

    private motionRecognizer: AllMotionRecognizer = new AllMotionRecognizer();

    private glSurfaceView: OptimizedGLSurfaceView;

public constructor (){
            super(GDGameClientInformationInterfaceFactory.getFactoryInstance());
                    

                            //For kotlin this is before the body of the constructor.
                    
GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION= GDGameClientInformationInterfaceFactory.getFactoryInstance()!.getInstance();
    

        try {
            GameAdStateFactory.getInstance()!.getInstance(GDGameSoftwareInfo.getInstance());
    

                //: 
} catch(e) 
            {
logUtil!.put(CommonStrings.getInstance()!.EXCEPTION, this, CommonStrings.getInstance()!.CONSTRUCTOR, e);
    
}


    var motionGesturesHandler: BasicMotionGesturesHandler = motionRecognizer!.getMotionGestureRecognizer()!.getMotionGesturesHandler()!;;
    
motionGesturesHandler!.addListener(new GDGameMotionGestureListener(MotionGestureReceiveInterfaceFactory.getInstance()));
    
new DefaultGameInitializationListener();
    
}


    init(){

    var logUtil: LogUtil = LogUtil.getInstance()!;;
    

        try {
            logUtil!.putF(commonStrings!.START, this, commonStrings!.INIT);
    
ResourceUtil.getInstance()!.setClassLoader(this.constructor.namegetClassLoader());
    

    var features: Features = Features.getInstance()!;;
    

    var gameFeatureFactory: GameFeatureFactory = GameFeatureFactory.getInstance()!;;
    

    var inputFeatureFactory: InputFeatureFactory = InputFeatureFactory.getInstance()!;;
    

    var graphicsFeatureFactory: GraphicsFeatureFactory = GraphicsFeatureFactory.getInstance()!;;
    

    var sensorFeatureFactory: SensorFeatureFactory = SensorFeatureFactory.getInstance()!;;
    
features.removeDefault(sensorFeatureFactory!.ORIENTATION_SENSORS);
    
features.addDefault(sensorFeatureFactory!.NO_ORIENTATION);
    
features.addDefault(graphicsFeatureFactory!.IMAGE_GRAPHICS);
    
features.addDefault(graphicsFeatureFactory!.SPRITE_FULL_GRAPHICS);
    
features.addDefault(gameFeatureFactory!.HEALTH_BARS);
    
features.addDefault(gameFeatureFactory!.DAMAGE_FLOATERS);
    
features.addDefault(gameFeatureFactory!.DROPPED_ITEMS);
    
features.addDefault(gameFeatureFactory!.SOUND);
    
features.addDefault(inputFeatureFactory!.MULTI_KEY_PRESS);
    
features.addDefault(inputFeatureFactory!.REMOVE_DUPLICATE_KEY_PRESSES);
    
features.addDefault(RaceTrackGameFeature.AUTO_FINISH_AI);
    
features.addDefault(RaceTrackGameFeature.MINI_MAP);
    

    var touchFeatureFactory: TouchFeatureFactory = TouchFeatureFactory.getInstance()!;;
    
features.removeDefault(touchFeatureFactory!.AUTO_HIDE_SHOW_SCREEN_BUTTONS);
    
features.addDefault(touchFeatureFactory!.HIDE_SCREEN_BUTTONS);
    

    var gameConfigurationCentral: GameConfigurationCentral = GameConfigurationCentral.getInstance()!;;
    

    var smallIntegerSingletonFactory: SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()!;;
    
gameConfigurationCentral!.VIBRATION.setDefaultValue(smallIntegerSingletonFactory!.getInstance(0));
    
gameConfigurationCentral!.VIBRATION.setDefault();
    
gameConfigurationCentral!.SPEED_CHALLENGE_LEVEL.setDefaultValue(smallIntegerSingletonFactory!.getInstance(4));
    
gameConfigurationCentral!.SPEED_CHALLENGE_LEVEL.setDefault();
    
gameConfigurationCentral!.SPEED.setDefaultValue(smallIntegerSingletonFactory!.getInstance(9));
    
gameConfigurationCentral!.SPEED.setDefault();
    
gameConfigurationCentral!.PLAYER_INPUT_WAIT.setDefaultValue(smallIntegerSingletonFactory!.getInstance(0));
    
gameConfigurationCentral!.PLAYER_INPUT_WAIT.setDefault();
    
gameConfigurationCentral!.SCALE.setDefaultValue(smallIntegerSingletonFactory!.getInstance(3));
    
gameConfigurationCentral!.SCALE.setDefault();
    
this.initOpenGL();
    
InitEmulatorFactory.getInstance()!.setInitEmulator(true);
    

    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!;;
    

                        if(features.isFeature(openGLFeatureFactory!.OPENGL_2D))
                        
                                    {
                                    


                            throw new RuntimeException();
                    

                                    }
                                
                             else 
                        if(features.isFeature(openGLFeatureFactory!.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory!.OPENGL_3D))
                        
                                    {
                                    this.glSurfaceView= new GDGameJOGLMin3dView();
    

                                    }
                                

                //: 
} catch(e) 
            {
logUtil!.put(commonStrings!.EXCEPTION, this, commonStrings!.CONSTRUCTOR, e);
    
}

}


                //@Throws(Exception.constructor)
            
    initOpenGL(){

    var openGLConfiguration: OpenGLConfiguration = OpenGLConfiguration.getInstance()!;;
    
openGLConfiguration!.setOpenGL(true);
    
openGLConfiguration!.init();
    
openGLConfiguration!.write();
    
}


    public initView(){
glSurfaceView = this.glSurfaceViewglSurfaceView as EmulatorViewInterface
glSurfaceView.
                    setMidlet(this);
    
}


    exit(isProgress: boolean){
this.glSurfaceView!.onDetachedFromWindow();
    
super.exit(isProgress);
    
}


    public stopAll(){

        try {
            new Sounds(EarlySoundsFactory.getInstance()).stopAll();
    
new Sounds(GDGameSoundsFactory.getInstance()).stopAll();
    

                //: 
} catch(e) 
            {
logUtil!.put(commonStrings!.EXCEPTION, this, "stopAll", e);
    
}

}


    public mouseClicked(x: number, y: number, button: number){
}


    public mousePressed(x: number, y: number, button: number){

        try {
            this.motionRecognizer!.processStartMotionEvent(x, y, this.DEVICE_ID, button);
    

                //: 
} catch(e) 
            {
logUtil!.put(commonStrings!.EXCEPTION, this, "mousePressed", e);
    
}

}


    public mouseReleased(x: number, y: number, button: number){

        try {
            this.dragged= false;
    
this.motionRecognizer!.processEndMotionEvent(x, y, this.DEVICE_ID, button);
    

                //: 
} catch(e) 
            {
logUtil!.put(commonStrings!.EXCEPTION, this, "mouseReleased", e);
    
}

}


    public mouseMoved(x: number, y: number, button: number){

        try {
            
                        if(this.dragged)
                        
                                    {
                                    this.motionRecognizer!.processDraggedMotionEvent(x, y, this.DEVICE_ID, button);
    

                                    }
                                
                        else {
                            this.motionRecognizer!.processMovedMotionEvent(x, y, DEVICE_ID, button);
    

                        }
                            

                //: 
} catch(e) 
            {
logUtil!.put(commonStrings!.EXCEPTION, this, "mouseMoved", e);
    
}

}


    private dragged: boolean = false;

    public mouseDragged(x: number, y: number, button: number){

        try {
            this.dragged= true;
    
this.motionRecognizer!.processDraggedMotionEvent(x, y, this.DEVICE_ID, button);
    

                //: 
} catch(e) 
            {
logUtil!.put(commonStrings!.EXCEPTION, this, "mouseDragged", e);
    
}

}


    public mouseWheelMoved(x: number, y: number, button: number){
}


}




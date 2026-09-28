
        /* Generated Code Do Not Modify */

        


            import { Exception } from 'java/lang/Exception.js';
        
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { ResourceUtil } 
const ResourceUtil = globalThis.org.allbinary.data.resource.ResourceUtil;

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

import { AllMotionRecognizer } from 'org/allbinary/input/motion/AllMotionRecognizer.js';
//not GWT import const AllMotionRecognizer

import { BasicMotionGesturesHandler } from 'org/allbinary/input/motion/gesture/observer/BasicMotionGesturesHandler.js';
//not GWT import const BasicMotionGesturesHandler

import { GDGameMotionGestureListener } from 'org/allbinary/input/motion/gesture/observer/GDGameMotionGestureListener.js';
//not GWT import const GDGameMotionGestureListener

import { MotionGestureReceiveInterfaceFactory } from 'org/allbinary/input/motion/gesture/observer/MotionGestureReceiveInterfaceFactory.js';
//not GWT import const MotionGestureReceiveInterfaceFactory

import { SmallIntegerSingletonFactory } from 'org/allbinary/logic/math/SmallIntegerSingletonFactory.js';
//not GWT import const SmallIntegerSingletonFactory

import { EarlySoundsFactory } from 'org/allbinary/media/audio/EarlySoundsFactory.js';
//not GWT import const EarlySoundsFactory

import { Sounds } from 'org/allbinary/media/audio/Sounds.js';
//not GWT import const Sounds

import { DefaultGameInitializationListener } from 'org/allbinary/game/init/DefaultGameInitializationListener.js';
//not GWT import const DefaultGameInitializationListener

import { GameMotionGestureListener } from 'org/allbinary/input/motion/gesture/observer/GameMotionGestureListener.js';
//not GWT import const GameMotionGestureListener

import { GDGameClientInformationInterfaceFactory } from 'org/allbinary/logic/system/security/licensing/GDGameClientInformationInterfaceFactory.js';
//not GWT import const GDGameClientInformationInterfaceFactory

import { GDGameSoundsFactory } from 'org/allbinary/media/audio/GDGameSoundsFactory.js';
//not GWT import const GDGameSoundsFactory

import { MidletJOGLInterface } from 'org/microemu/app/MidletJOGLInterface.js';
//not GWT import const MidletJOGLInterface

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameMIDlet extends org.allbinary.game.GDGameMIDlet implements MidletJOGLInterface {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly DEVICE_ID: number = 0;

    private motionRecognizer: AllMotionRecognizer = new AllMotionRecognizer();

public constructor (){
            super(GDGameClientInformationInterfaceFactory.getFactoryInstance());
                    

                            //For kotlin this is before the body of the constructor.
                    
GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION= GDGameClientInformationInterfaceFactory.getFactoryInstance()!.getInstance();
    

    var motionGesturesHandler: BasicMotionGesturesHandler = this.motionRecognizer!.getMotionGestureRecognizer()!.getMotionGesturesHandler()!;;
    
motionGesturesHandler!.addListenerInterface(new GameMotionGestureListener(MotionGestureReceiveInterfaceFactory.getInstance()));
    
motionGesturesHandler!.addListenerInterface(new GDGameMotionGestureListener());
    
new DefaultGameInitializationListener();
    
}


    init(){

        try {
            
    var logUtil: LogUtil = LogUtil.getInstance()!;;
    
logUtil!.putF(this.commonStrings!.START, this, this.commonStrings!.INIT);
    
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
    

    var gameConfigurationCentral: GameConfigurationCentral = GameConfigurationCentral.getInstance()!;;
    

    var smallIntegerSingletonFactory: SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()!;;
    
gameConfigurationCentral!.VIBRATION.setDefaultValue(smallIntegerSingletonFactory!.getAt(0));
    
gameConfigurationCentral!.VIBRATION.setDefault();
    
gameConfigurationCentral!.SPEED_CHALLENGE_LEVEL.setDefaultValue(smallIntegerSingletonFactory!.getAt(4));
    
gameConfigurationCentral!.SPEED_CHALLENGE_LEVEL.setDefault();
    
gameConfigurationCentral!.SPEED.setDefaultValue(smallIntegerSingletonFactory!.getAt(9));
    
gameConfigurationCentral!.SPEED.setDefault();
    
gameConfigurationCentral!.PLAYER_INPUT_WAIT.setDefaultValue(smallIntegerSingletonFactory!.getAt(0));
    
gameConfigurationCentral!.PLAYER_INPUT_WAIT.setDefault();
    
gameConfigurationCentral!.SCALE.setDefaultValue(smallIntegerSingletonFactory!.getAt(3));
    
gameConfigurationCentral!.SCALE.setDefault();
    

                //: 
} catch(e) 
            {
this.logUtil!.put(this.commonStrings!.EXCEPTION, this, this.commonStrings!.CONSTRUCTOR, e);
    
}

}


    public stopAll(){

        try {
            new Sounds(EarlySoundsFactory.getInstance()).stopAll();
    
new Sounds(GDGameSoundsFactory.getInstance()).stopAll();
    

                //: 
} catch(e) 
            {
this.logUtil!.put(this.commonStrings!.EXCEPTION, this, "stopAll", e);
    
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
this.logUtil!.put(this.commonStrings!.EXCEPTION, this, "mousePressed", e);
    
}

}


    public mouseReleased(x: number, y: number, button: number){

        try {
            this.dragged= false;
    
this.motionRecognizer!.processEndMotionEvent(x, y, this.DEVICE_ID, button);
    

                //: 
} catch(e) 
            {
this.logUtil!.put(this.commonStrings!.EXCEPTION, this, "mouseReleased", e);
    
}

}


    public mouseMoved(x: number, y: number, button: number){

        try {
            
                        if(this.dragged)
                        
                                    {
                                    this.motionRecognizer!.processDraggedMotionEvent(x, y, this.DEVICE_ID, button);
    

                                    }
                                
                        else {
                            this.motionRecognizer!.processMovedMotionEvent(x, y, this.DEVICE_ID, button);
    

                        }
                            

                //: 
} catch(e) 
            {
this.logUtil!.put(this.commonStrings!.EXCEPTION, this, "mouseMoved", e);
    
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
this.logUtil!.put(this.commonStrings!.EXCEPTION, this, "mouseDragged", e);
    
}

}


    public mouseWheelMoved(x: number, y: number, button: number){

        try {
            this.motionRecognizer!.processScrolledMotionEvent(x, y, this.DEVICE_ID, button);
    

                //: 
} catch(e) 
            {
this.logUtil!.put(this.commonStrings!.EXCEPTION, this, "mouseWheelMoved", e);
    
}

}


}





        /* Generated Code Do Not Modify */

        


            import { Exception } from 'java/lang/Exception.js';
        
//not plain js import { LogFactory } 
const LogFactory = globalThis.org.allbinary.logic.communication.log.LogFactory;

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

import { GameMotionGestureListener } from 'org/allbinary/input/motion/gesture/observer/GameMotionGestureListener.js';
//not GWT import const GameMotionGestureListener

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

import { GDGameMotionGestureListener } from 'org/allbinary/input/motion/gesture/observer/GDGameMotionGestureListener.js';
//not GWT import const GDGameMotionGestureListener

import { GDGameClientInformationInterfaceFactory } from 'org/allbinary/logic/system/security/licensing/GDGameClientInformationInterfaceFactory.js';
//not GWT import const GDGameClientInformationInterfaceFactory

import { GDGameSoundsFactory } from 'org/allbinary/media/audio/GDGameSoundsFactory.js';
//not GWT import const GDGameSoundsFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameMIDlet extends org.allbinary.game.GDGameMIDlet {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly DEVICE_ID: number = 0;

    private motionRecognizer: AllMotionRecognizer = new AllMotionRecognizer();

public constructor (){
            super(GDGameClientInformationInterfaceFactory.getFactoryInstance());
                    

                            //For kotlin this is before the body of the constructor.
                    
GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION= GDGameClientInformationInterfaceFactory.getFactoryInstance()!.getInstance();
    

    var motionGesturesHandler: BasicMotionGesturesHandler = motionRecognizer!.getMotionGestureRecognizer()!.getMotionGesturesHandler()!;;
    
motionGesturesHandler!.addListener(new GameMotionGestureListener(MotionGestureReceiveInterfaceFactory.getInstance()));
    
motionGesturesHandler!.addListener(new GDGameMotionGestureListener());
    
new DefaultGameInitializationListener();
    
}


    init(){

        try {
            
    var logUtil: LogUtil = LogUtil.getInstance()!;;
    
logUtil!.put(commonStrings!.START, this, commonStrings!.INIT);
    
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
    

                //: 
} catch(e) 
            {
logUtil!.put(commonStrings!.EXCEPTION, this, commonStrings!.CONSTRUCTOR, e);
    
}

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

        try {
            this.motionRecognizer!.processScrolledMotionEvent(x, y, this.DEVICE_ID, button);
    

                //: 
} catch(e) 
            {
logUtil!.put(commonStrings!.EXCEPTION, this, "mouseWheelMoved", e);
    
}

}


}





        /* Generated Code Do Not Modify */

        


            import { Exception } from 'java/lang/Exception.js';
        
import { GDGameSoftwareInfo } from 'org/allbinary/game/canvas/GDGameSoftwareInfo.js';
//not GWT import const GDGameSoftwareInfo

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

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

import { SmallIntegerSingletonFactory } from 'org/allbinary/logic/math/SmallIntegerSingletonFactory.js';
//not GWT import const SmallIntegerSingletonFactory

import { DefaultGameInitializationListener } from 'org/allbinary/game/init/DefaultGameInitializationListener.js';
//not GWT import const DefaultGameInitializationListener

import { GDGameClientInformationInterfaceFactory } from 'org/allbinary/logic/system/security/licensing/GDGameClientInformationInterfaceFactory.js';
//not GWT import const GDGameClientInformationInterfaceFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameMIDlet extends org.allbinary.game.GDGameMIDlet {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

public constructor (){
            super(GDGameClientInformationInterfaceFactory.getFactoryInstance());
                    

                            //For kotlin this is before the body of the constructor.
                    
GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION= GDGameClientInformationInterfaceFactory.getFactoryInstance()!.getInstance();
    
new DefaultGameInitializationListener();
    
}


    init(){

        try {
            
    var logUtil: LogUtil = LogUtil.getInstance()!;;
    
logUtil!.putF(commonStrings!.START, this, commonStrings!.INIT);
    

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
logUtil!.put(commonStrings!.EXCEPTION, this, commonStrings!.CONSTRUCTOR, e);
    
}

}


}




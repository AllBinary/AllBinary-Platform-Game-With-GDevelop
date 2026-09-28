
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
import { OrientationData } from '../../../../org/allbinary/input/gyro/OrientationData.js';
//not GWT import const OrientationData

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

import { GameConfigurationCentral } from '../../../../org/allbinary/game/configuration/GameConfigurationCentral.js';
//not GWT import const GameConfigurationCentral

import { GameConfigurationSingleton } from '../../../../org/allbinary/game/configuration/GameConfigurationSingleton.js';
//not GWT import const GameConfigurationSingleton

import { GameFeatureChoiceGroups } from '../../../../org/allbinary/game/configuration/feature/GameFeatureChoiceGroups.js';
//not GWT import const GameFeatureChoiceGroups

import { GameFeatureFactory } from '../../../../org/allbinary/game/configuration/feature/GameFeatureFactory.js';
//not GWT import const GameFeatureFactory

import { SensorFeatureFactory } from '../../../../org/allbinary/game/configuration/feature/SensorFeatureFactory.js';
//not GWT import const SensorFeatureFactory

import { Init } from '../../../../org/allbinary/init/Init.js';
//not GWT import const Init

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameGameFeatures extends Init {
        

public constructor (){

            super();
        }


                //@Throws(Exception.constructor)
            
    public init(){

    var GRAPHICS_OPTIONS: string = "Graphics Options";;
    

    var exclusiveOrientationSensorList: BasicArrayList = new BasicArrayListD();;
    

    var sensorFeatureFactory: SensorFeatureFactory = SensorFeatureFactory.getInstance()!;;
    
exclusiveOrientationSensorList!.add(sensorFeatureFactory!.ORIENTATION_SENSORS);
    
exclusiveOrientationSensorList!.add(sensorFeatureFactory!.NO_ORIENTATION);
    

    var gameConfigurationSingleton: GameConfigurationSingleton = GameConfigurationSingleton.getInstance()!;;
    

    var gameConfigurationCentral: GameConfigurationCentral = GameConfigurationCentral.getInstance()!;;
    
gameConfigurationSingleton!.add(gameConfigurationCentral!.VIBRATION);
    
gameConfigurationSingleton!.add(gameConfigurationCentral!.ORIENTATION);
    
gameConfigurationSingleton!.add(gameConfigurationCentral!.SPEED);
    

    var multipleList: BasicArrayList = new BasicArrayListD();;
    
multipleList!.add(GameFeatureFactory.getInstance()!.SOUND);
    
multipleList!.add(GameFeatureFactory.getInstance()!.SCREEN_SHAKE);
    
GameFeatureChoiceGroups.getMultipleInstance()!.add(GRAPHICS_OPTIONS, multipleList);
    
GameFeatureChoiceGroups.getExclusiveInstance()!.add(OrientationData.getInstance()!.ORIENTATION_SENSOR_INPUT, exclusiveOrientationSensorList);
    
}


}




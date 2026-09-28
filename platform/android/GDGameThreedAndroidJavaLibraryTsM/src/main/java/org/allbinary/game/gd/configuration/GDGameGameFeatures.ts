
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../java/lang/Object.js';
        
import { OrientationData } from '../../../../../org/allbinary/input/gyro/OrientationData.js';
//not GWT import const OrientationData

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

import { DebugFactory } from '../../../../../org/allbinary/debug/DebugFactory.js';
//not GWT import const DebugFactory

import { NoDebug } from '../../../../../org/allbinary/debug/NoDebug.js';
//not GWT import const NoDebug

import { GameConfigurationCentral } from '../../../../../org/allbinary/game/configuration/GameConfigurationCentral.js';
//not GWT import const GameConfigurationCentral

import { GameConfigurationSingleton } from '../../../../../org/allbinary/game/configuration/GameConfigurationSingleton.js';
//not GWT import const GameConfigurationSingleton

import { GameFeatureChoiceGroups } from '../../../../../org/allbinary/game/configuration/feature/GameFeatureChoiceGroups.js';
//not GWT import const GameFeatureChoiceGroups

import { GameFeatureFactory } from '../../../../../org/allbinary/game/configuration/feature/GameFeatureFactory.js';
//not GWT import const GameFeatureFactory

import { SensorFeatureFactory } from '../../../../../org/allbinary/game/configuration/feature/SensorFeatureFactory.js';
//not GWT import const SensorFeatureFactory

import { InitInterface } from '../../../../../org/allbinary/init/InitInterface.js';
//not GWT import const InitInterface

import { RaceTrackGameFeature } from '../../../../../org/allbinary/media/graphics/geography/map/racetrack/RaceTrackGameFeature.js';
//not GWT import const RaceTrackGameFeature

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameGameFeatures
            extends Object
         implements InitInterface {
        

    private static readonly GRAPHICS_OPTIONS: string = "Graphics Options";

    public init(){

    var gameConfigurationSingleton: GameConfigurationSingleton = GameConfigurationSingleton.getInstance()!;;
    

    var gameConfigurationCentral: GameConfigurationCentral = GameConfigurationCentral.getInstance()!;;
    

    var sensorFeatureFactory: SensorFeatureFactory = SensorFeatureFactory.getInstance()!;;
    

    var exclusiveOrientationSensorBasicArrayList: BasicArrayList = new BasicArrayListD();;
    
exclusiveOrientationSensorBasicArrayList!.add(sensorFeatureFactory!.ORIENTATION_SENSORS);
    
exclusiveOrientationSensorBasicArrayList!.add(sensorFeatureFactory!.NO_ORIENTATION);
    

                        if(DebugFactory.getInstance() != NoDebug.getInstance())
                        
                                    {
                                    gameConfigurationSingleton!.add(gameConfigurationCentral!.CHALLENGE_LEVEL);
    
gameConfigurationSingleton!.add(gameConfigurationCentral!.SPEED_CHALLENGE_LEVEL);
    
gameConfigurationSingleton!.add(gameConfigurationCentral!.VIBRATION);
    
gameConfigurationSingleton!.add(gameConfigurationCentral!.ORIENTATION);
    
gameConfigurationSingleton!.add(gameConfigurationCentral!.CONTROL_LEVEL);
    
gameConfigurationSingleton!.add(gameConfigurationCentral!.SPEED);
    

                                    }
                                

    var multipleBasicArrayList: BasicArrayList = new BasicArrayListD();;
    

    var gameFeatureFactory: GameFeatureFactory = GameFeatureFactory.getInstance()!;;
    
multipleBasicArrayList!.add(gameFeatureFactory!.SOUND);
    
multipleBasicArrayList!.add(gameFeatureFactory!.SCREEN_SHAKE);
    
multipleBasicArrayList!.add(gameFeatureFactory!.DROPPED_ITEMS);
    
multipleBasicArrayList!.add(RaceTrackGameFeature.MINI_MAP);
    
GameFeatureChoiceGroups.getExclusiveInstance()!.get()!.clear();
    
GameFeatureChoiceGroups.getMultipleInstance()!.add(GDGameGameFeatures.GRAPHICS_OPTIONS, multipleBasicArrayList);
    
GameFeatureChoiceGroups.getExclusiveInstance()!.add(OrientationData.getInstance()!.ORIENTATION_SENSOR_INPUT, exclusiveOrientationSensorBasicArrayList);
    
}


}




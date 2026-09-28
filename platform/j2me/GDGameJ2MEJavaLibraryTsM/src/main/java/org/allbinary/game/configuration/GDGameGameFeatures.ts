
        /*
                * 
                *  AllBinary Open License Version 1
                *  Copyright (c) 2011 AllBinary
                *  
                *  By agreeing to this license you and any business entity you represent are
                *  legally bound to the AllBinary Open License Version 1 legal agreement.
                *  
                *  You may obtain the AllBinary Open License Version 1 legal agreement from
                *  AllBinary or the root directory of AllBinary's AllBinary Platform repository.
                *  
                *  Created By: Travis Berthelot  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
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

import { InitInterface } from '../../../../org/allbinary/init/InitInterface.js';
//not GWT import const InitInterface

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameGameFeatures
            extends Object
         implements InitInterface {
        

    private readonly GRAPHICS_OPTIONS: string = "Graphics Options";

public constructor (){

            super();
        }


    public init(){

    var sensorFeatureFactory: SensorFeatureFactory = SensorFeatureFactory.getInstance()!;;
    

    var gameFeatureFactory: GameFeatureFactory = GameFeatureFactory.getInstance()!;;
    

    var gameConfigurationSingleton: GameConfigurationSingleton = GameConfigurationSingleton.getInstance()!;;
    

    var gameConfigurationCentral: GameConfigurationCentral = GameConfigurationCentral.getInstance()!;;
    
gameConfigurationSingleton!.add(gameConfigurationCentral!.VIBRATION);
    
gameConfigurationSingleton!.add(gameConfigurationCentral!.ORIENTATION);
    
gameConfigurationSingleton!.add(gameConfigurationCentral!.SPEED);
    

    var multipleList: BasicArrayList = new BasicArrayListD();;
    
multipleList!.add(gameFeatureFactory!.SOUND);
    
multipleList!.add(gameFeatureFactory!.SCREEN_SHAKE);
    
GameFeatureChoiceGroups.getMultipleInstance()!.add(this.GRAPHICS_OPTIONS, multipleList);
    
}


}




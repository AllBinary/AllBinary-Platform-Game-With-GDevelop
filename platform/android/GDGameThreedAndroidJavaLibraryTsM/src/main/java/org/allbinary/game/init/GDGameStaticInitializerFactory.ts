
        /* Generated Code Do Not Modify */

        


import { BasicBuildGameInitializerFactory } from '../../../../org/allbinary/game/init/BasicBuildGameInitializerFactory.js';
//not GWT import const BasicBuildGameInitializerFactory

import { GameInitializationInterface } from '../../../../org/allbinary/game/init/GameInitializationInterface.js';
//not GWT import const GameInitializationInterface

import { GDGameAndroidEarlyResourceInitialization } from '../../../../org/allbinary/game/gd/resource/GDGameAndroidEarlyResourceInitialization.js';
//not GWT import const GDGameAndroidEarlyResourceInitialization

import { GDGameAndroidResourceInitialization } from '../../../../org/allbinary/game/gd/resource/GDGameAndroidResourceInitialization.js';
//not GWT import const GDGameAndroidResourceInitialization

import { ResourceInitialization } from '../../../../org/allbinary/game/resource/ResourceInitialization.js';
//not GWT import const ResourceInitialization

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameThreedBaseAndroidStaticInitializer } from './GDGameThreedBaseAndroidStaticInitializer.js';
//not GWT import - same folder const GDGameThreedBaseAndroidStaticInitializer
import { GDGameThreedAndroidAnimationInterfaceFactoryEarlyResourceInitialization } from './GDGameThreedAndroidAnimationInterfaceFactoryEarlyResourceInitialization.js';
//not GWT import - same folder const GDGameThreedAndroidAnimationInterfaceFactoryEarlyResourceInitialization
import { GDGameThreedAndroidAnimationInterfaceFactoryResourceInitialization } from './GDGameThreedAndroidAnimationInterfaceFactoryResourceInitialization.js';
//not GWT import - same folder const GDGameThreedAndroidAnimationInterfaceFactoryResourceInitialization

export class GDGameStaticInitializerFactory extends BasicBuildGameInitializerFactory {
        

    private static STATIC: GameInitializationInterface = new GDGameThreedBaseAndroidStaticInitializer(
                                                [
                                                    new GDGameAndroidEarlyResourceInitialization(),new GDGameAndroidResourceInitialization(),new GDGameThreedAndroidAnimationInterfaceFactoryEarlyResourceInitialization(),new GDGameThreedAndroidAnimationInterfaceFactoryResourceInitialization()
                                                ], 15);

    public getInstance(): GameInitializationInterface{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameStaticInitializerFactory.STATIC;
    
}


}




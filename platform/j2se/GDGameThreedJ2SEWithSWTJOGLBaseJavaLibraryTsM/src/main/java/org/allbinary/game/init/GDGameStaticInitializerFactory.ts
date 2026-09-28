
        /* Generated Code Do Not Modify */

        


import { BasicBuildGameInitializerFactory } from '../../../../org/allbinary/game/init/BasicBuildGameInitializerFactory.js';
//not GWT import const BasicBuildGameInitializerFactory

import { GameInitializationInterface } from '../../../../org/allbinary/game/init/GameInitializationInterface.js';
//not GWT import const GameInitializationInterface

import { GDGameJ2SEWithSWTJOGLEarlyResourceInitialization } from '../../../../org/allbinary/game/gd/resource/GDGameJ2SEWithSWTJOGLEarlyResourceInitialization.js';
//not GWT import const GDGameJ2SEWithSWTJOGLEarlyResourceInitialization

import { GDGameJ2SEWithSWTJOGLResourceInitialization } from '../../../../org/allbinary/game/gd/resource/GDGameJ2SEWithSWTJOGLResourceInitialization.js';
//not GWT import const GDGameJ2SEWithSWTJOGLResourceInitialization

import { ResourceInitialization } from '../../../../org/allbinary/game/resource/ResourceInitialization.js';
//not GWT import const ResourceInitialization

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameThreedBaseJ2SEWithSWTJOGLStaticInitializer } from './GDGameThreedBaseJ2SEWithSWTJOGLStaticInitializer.js';
//not GWT import - same folder const GDGameThreedBaseJ2SEWithSWTJOGLStaticInitializer
import { GDGameThreedJ2SEWithSWTJOGLAnimationInterfaceFactoryEarlyResourceInitialization } from './GDGameThreedJ2SEWithSWTJOGLAnimationInterfaceFactoryEarlyResourceInitialization.js';
//not GWT import - same folder const GDGameThreedJ2SEWithSWTJOGLAnimationInterfaceFactoryEarlyResourceInitialization
import { GDGameThreedJ2SEWithSWTJOGLAnimationInterfaceFactoryResourceInitialization } from './GDGameThreedJ2SEWithSWTJOGLAnimationInterfaceFactoryResourceInitialization.js';
//not GWT import - same folder const GDGameThreedJ2SEWithSWTJOGLAnimationInterfaceFactoryResourceInitialization

export class GDGameStaticInitializerFactory extends BasicBuildGameInitializerFactory {
        

    private static STATIC: GameInitializationInterface = new GDGameThreedBaseJ2SEWithSWTJOGLStaticInitializer(
                                                [
                                                    new GDGameJ2SEWithSWTJOGLEarlyResourceInitialization(),new GDGameJ2SEWithSWTJOGLResourceInitialization(),new GDGameThreedJ2SEWithSWTJOGLAnimationInterfaceFactoryEarlyResourceInitialization(),new GDGameThreedJ2SEWithSWTJOGLAnimationInterfaceFactoryResourceInitialization()
                                                ], 15);

    public getInstance(): GameInitializationInterface{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameStaticInitializerFactory.STATIC;
    
}


}




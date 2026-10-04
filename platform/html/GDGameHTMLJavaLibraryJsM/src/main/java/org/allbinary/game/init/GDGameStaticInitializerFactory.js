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
import { BasicBuildGameInitializerFactory } from '../../../../org/allbinary/game/init/BasicBuildGameInitializerFactory.js';
//not GWT import const ResourceInitialization
import { GDGameJ2MEEarlyResourceInitialization } from '../../../../org/allbinary/game/resource/GDGameJ2MEEarlyResourceInitialization.js';
//not GWT import const GDGameJ2MEEarlyResourceInitialization
//Current folder imports from return types, extended types, and scope (deduplicated)
import { J2MEGDGameStaticInitializer } from './J2MEGDGameStaticInitializer.js';
//not GWT import - same folder const J2MEGDGameStaticInitializer
import { GDGameResourceInitialization } from './GDGameResourceInitialization.js';
//not GWT import - same folder const GDGameResourceInitialization
import { GDGameJ2MEAnimationInterfaceFactoryEarlyResourceInitialization } from './GDGameJ2MEAnimationInterfaceFactoryEarlyResourceInitialization.js';
//not GWT import - same folder const GDGameJ2MEAnimationInterfaceFactoryEarlyResourceInitialization
import { GDGameJ2MEAnimationInterfaceFactoryResourceInitialization } from './GDGameJ2MEAnimationInterfaceFactoryResourceInitialization.js';
//not GWT import - same folder const GDGameJ2MEAnimationInterfaceFactoryResourceInitialization
export class GDGameStaticInitializerFactory extends BasicBuildGameInitializerFactory {
    getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return STATIC;
    }
}
GDGameStaticInitializerFactory.STATIC = new J2MEGDGameStaticInitializer([
    new GDGameJ2MEEarlyResourceInitialization(), new GDGameResourceInitialization(), new GDGameJ2MEAnimationInterfaceFactoryEarlyResourceInitialization(), new GDGameJ2MEAnimationInterfaceFactoryResourceInitialization()
], 15);

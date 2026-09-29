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
import { GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/image/GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory
import { GDGameEarlyResourcesOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/image/GDGameEarlyResourcesOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const GDGameEarlyResourcesOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory
import { FeaturedAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/FeaturedAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const FeaturedAnimationInterfaceFactoryInterfaceFactory
import { ResourceInitialization } from '../../../../org/allbinary/game/resource/ResourceInitialization.js';
//not GWT import const ResourceInitialization
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDGameJ2MEAnimationInterfaceFactoryEarlyResourceInitialization extends ResourceInitialization {
    constructor() {
        super();
    }
    //@Throws(Exception.constructor)
    init() {
        var featuredAnimationInterfaceFactoryInterfaceFactory = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance();
        ;
        featuredAnimationInterfaceFactoryInterfaceFactory.add(new GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory());
        featuredAnimationInterfaceFactoryInterfaceFactory.add(new GDGameEarlyResourcesOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory());
    }
}

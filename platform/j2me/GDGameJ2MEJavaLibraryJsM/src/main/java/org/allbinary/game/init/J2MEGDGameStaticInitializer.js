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
//not GWT import const ResourceInitialization
import { ProgressCanvasFactory } from '../../../../org/allbinary/graphics/canvas/transition/progress/ProgressCanvasFactory.js';
//not GWT import const CommandListener
import { GDGameGameFeatures } from '../../../../org/allbinary/game/configuration/GDGameGameFeatures.js';
//not GWT import const AbeClientInformationInterface
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDGameStaticInitializer } from './GDGameStaticInitializer.js';
//not GWT import - same folder const GDGameStaticInitializer
export class J2MEGDGameStaticInitializer extends GDGameStaticInitializer {
    constructor(resourceInitializationArray, portion) {
        super(resourceInitializationArray, portion);
        this.platformGameInitialized = false;
        //For kotlin this is before the body of the constructor.
    }
    //@Throws(Exception.constructor)
    initKey(portion) {
        super.initKey(portion);
    }
    //@Throws(Exception.constructor)
    init(abeClientInformation, commandListener, level) {
        super.init(abeClientInformation, commandListener, level);
        if (this.isPlatformGameInitialized()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        this.setPlatformGameInitialized(true);
        ProgressCanvasFactory.getInstance().addNormalPortion(50, "Game Options");
        new GDGameGameFeatures().init();
    }
    setPlatformGameInitialized(platformGameInitialized) {
        this.platformGameInitialized = platformGameInitialized;
    }
    isPlatformGameInitialized() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.platformGameInitialized;
    }
}

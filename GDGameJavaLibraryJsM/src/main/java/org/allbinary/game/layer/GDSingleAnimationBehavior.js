/*
        *
        *  AllBinary Open License Version 1
        *  Copyright (c) 2022 AllBinary
        *
        *  By agreeing to this license you and any business entity you represent are
        *  legally bound to the AllBinary Open License Version 1 legal agreement.
        *
        *  You may obtain the AllBinary Open License Version 1 legal agreement from
        *  AllBinary or the root directory of AllBinary's AllBinary Platform repository.
        *
        *  Created By: Travis Berthelot
*/
//not GWT import const GDObject
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDAnimationBehaviorBase } from './GDAnimationBehaviorBase.js';
//not GWT import - same folder const GDAnimationBehaviorBase
export class GDSingleAnimationBehavior extends GDAnimationBehaviorBase {
    constructor() {
        super(...arguments);
        this.elapsedTime = 0;
    }
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDSingleAnimationBehavior.instance;
    }
    animate(gdObject, initIndexedAnimationInterfaceArray, timeDelta) {
        try {
            this.elapsedTime += timeDelta;
            if (this.elapsedTime > 200) {
                this.elapsedTime = this.elapsedTime - 200;
                initIndexedAnimationInterfaceArray[gdObject.animation].nextFrame();
            }
            //: 
        }
        catch (e) {
            var commonStrings = CommonStrings.getInstance();
            ;
            this.logUtil.put(commonStrings.EXCEPTION, this, "animate", e);
        }
    }
}
GDSingleAnimationBehavior.instance = new GDSingleAnimationBehavior();

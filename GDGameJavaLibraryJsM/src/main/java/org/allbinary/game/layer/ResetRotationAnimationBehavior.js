/*
        *
        *  AllBinary Open License Version 1
        *  Copyright (c) 2025 AllBinary
        *
        *  By agreeing to this license you and any business entity you represent are
        *  legally bound to the AllBinary Open License Version 1 legal agreement.
        *
        *  You may obtain the AllBinary Open License Version 1 legal agreement from
        *  AllBinary or the root directory of AllBinary's AllBinary Platform repository.
        *
        *  Created By: Travis Berthelot
*/
//not GWT import const IndexedAnimation
import { FrameUtil } from '../../../../org/allbinary/math/FrameUtil.js';
//not GWT import const FrameUtil
//Current folder imports from return types, extended types, and scope (deduplicated)
import { ResetAnimationBehavior } from './ResetAnimationBehavior.js';
//not GWT import - same folder const ResetAnimationBehavior
export class ResetRotationAnimationBehavior extends ResetAnimationBehavior {
    constructor() {
        super(...arguments);
        this.frameUtil = FrameUtil.getInstance();
    }
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return ResetRotationAnimationBehavior.instance;
    }
    resetAnimation(indexedAnimationInterfaceArray, animationIndex) {
        indexedAnimationInterfaceArray[animationIndex].setFrame(this.frameUtil.getFrameForAngle(0, 1));
    }
}
ResetRotationAnimationBehavior.instance = new ResetRotationAnimationBehavior();

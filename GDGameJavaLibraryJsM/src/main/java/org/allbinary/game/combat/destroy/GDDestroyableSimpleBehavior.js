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
//not GWT import const CollidableCompositeLayer
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { DestroyableSimpleBehavior } from './DestroyableSimpleBehavior.js';
//not GWT import - same folder const DestroyableSimpleBehavior
export class GDDestroyableSimpleBehavior extends DestroyableSimpleBehavior {
    constructor(ownerLayer) {
        super(ownerLayer);
        this.logUtil = LogUtil.getInstance();
        //For kotlin this is before the body of the constructor.
    }
    setDestroyed(destroyed) {
        super.setDestroyed(destroyed);
    }
}

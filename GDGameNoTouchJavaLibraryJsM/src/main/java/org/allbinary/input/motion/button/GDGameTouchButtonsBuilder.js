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
import { BaseTouchInput } from '../../../../../org/allbinary/input/motion/button/BaseTouchInput.js';
//not GWT import const BaseTouchInput
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
//not plain js import { LogFactory } 
const LogFactory = globalThis.org.allbinary.logic.communication.log.LogFactory;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not GWT import const SensorGameUpdateProcessor
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDGameTouchButtonsBuilder extends BaseTouchInput {
    constructor() {
        super(...arguments);
        this.logUtil = LogUtil.getInstance();
    }
    static getInstance(sensorGameUpdateProcessor) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return instance;
    }
    build() {
        logUtil.putF(commonStrings.START, this, "build");
    }
}
GDGameTouchButtonsBuilder.instance = new GDGameTouchButtonsBuilder();

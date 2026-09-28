
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

import { SensorGameUpdateProcessor } from '../../../../../org/allbinary/input/gyro/SensorGameUpdateProcessor.js';
//not GWT import const SensorGameUpdateProcessor

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameNeededTouchButtonsBuilder extends BaseTouchInput {
        

    private static readonly instance: GDGameNeededTouchButtonsBuilder = new GDGameNeededTouchButtonsBuilder();

    public static getInstance(sensorGameUpdateProcessor: SensorGameUpdateProcessor): BaseTouchInput{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance;
    
}


    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    public build(){
logUtil!.putF(commonStrings!.START, this, "build");
    
}


}




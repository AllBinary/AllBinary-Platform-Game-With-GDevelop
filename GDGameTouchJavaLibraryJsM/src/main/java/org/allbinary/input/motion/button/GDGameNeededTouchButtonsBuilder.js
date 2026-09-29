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
import { Object } from '../../../../../java/lang/Object.js';
import { TouchScreenFactory } from '../../../../../org/allbinary/input/motion/button/TouchScreenFactory.js';
//not GWT import const SensorGameUpdateProcessor
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDGameNeededMultiTouchButtonsBuilder } from './GDGameNeededMultiTouchButtonsBuilder.js';
//not GWT import - same folder const GDGameNeededMultiTouchButtonsBuilder
import { GDGameNeededWithSensorTouchButtonsBuilder } from './GDGameNeededWithSensorTouchButtonsBuilder.js';
//not GWT import - same folder const GDGameNeededWithSensorTouchButtonsBuilder
export class GDGameNeededTouchButtonsBuilder extends Object {
    static getInstance(sensorGameUpdateProcessor) {
        if (sensorGameUpdateProcessor.isAnySensor()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new GDGameNeededWithSensorTouchButtonsBuilder();
        }
        else if (TouchScreenFactory.getInstance().isMultiTouch()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new GDGameNeededMultiTouchButtonsBuilder();
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new GDGameNeededMultiTouchButtonsBuilder();
        }
    }
}

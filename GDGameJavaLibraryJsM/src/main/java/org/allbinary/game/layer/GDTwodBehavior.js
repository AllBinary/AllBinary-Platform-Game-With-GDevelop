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
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
//not GWT import const GDObject
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
//not GWT import - same folder const GDGameLayer
export class GDTwodBehavior extends Object {
    constructor(animationBehavior) {
        super();
        this.rotationRemainder = 0.0;
        this.animationBehavior = animationBehavior;
    }
    process(gdObject, rotationAnimation) {
    }
    //@Throws(Exception.constructor)
    reset(gameLayer, gdObject) {
        this.rotationRemainder = 0;
        this.animationBehavior.set(gameLayer, gdObject);
    }
    updateRotation(gameLayer, timeDelta) {
        var gdObject = gameLayer.gdObject;
        ;
        var newPortion = (gdObject.rotationP * timeDelta / 1000);
        ;
        this.rotationRemainder = this.rotationRemainder + newPortion;
        var angleAdjustment = ();
        ;
        if (angleAdjustment != 0) {
            var adjustedAngle2 = gdObject.angle + angleAdjustment;
            ;
            while (adjustedAngle2 > 359) {
                adjustedAngle2 -= 360;
            }
            while (adjustedAngle2 < 0) {
                adjustedAngle2 += 360;
            }
            gdObject.setAngle(adjustedAngle2);
            gdObject.angle = adjustedAngle2;
            this.getAnimationBehavior().setRotation(gameLayer, angleAdjustment);
            this.rotationRemainder -= angleAdjustment;
        }
        else {
        }
    }
    getAnimationBehavior() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.animationBehavior;
    }
}

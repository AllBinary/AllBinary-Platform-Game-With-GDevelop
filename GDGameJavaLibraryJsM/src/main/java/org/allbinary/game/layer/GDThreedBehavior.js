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
//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDTwodBehavior } from './GDTwodBehavior.js';
//not GWT import - same folder const GDGameLayer
export class GDThreedBehavior extends GDTwodBehavior {
    constructor(animationBehavior, rotationAnimationInterfaceArray) {
        super(animationBehavior);
        this.rotationRemainderZ = 0.0;
        //For kotlin this is before the body of the constructor.
        this.rotationAnimationInterfaceArray = rotationAnimationInterfaceArray;
    }
    //@Throws(Exception.constructor)
    reset(gameLayer, gdObject) {
        super.reset(gameLayer, gdObject);
        this.rotationRemainderZ = 0;
    }
    updateRotation(gameLayer, timeDelta) {
        super.updateRotation(gameLayer, timeDelta);
        var gdObject = gameLayer.gdObject;
        ;
        var newPortion = (gdObject.rotationZP * timeDelta / 1000);
        ;
        this.rotationRemainderZ = this.rotationRemainderZ + newPortion;
        var angleAdjustment = ();
        ;
        if (angleAdjustment != 0) {
            gdObject.angle += angleAdjustment;
            this.setRotationZ(gdObject, angleAdjustment);
            this.rotationRemainderZ -= angleAdjustment;
        }
        else {
        }
    }
    setRotationZ(gdObject, angleAdjustment) {
        var rotationAnimation = this.rotationAnimationInterfaceArray[gdObject.animation];
        ;
        if (angleAdjustment > 0) {
            var value = angleAdjustment;
            ;
            while (value > 0) {
                rotationAnimation.nextRotationZ();
                value--;
            }
        }
        else {
            var value = angleAdjustment;
            ;
            while (value < 0) {
                rotationAnimation.previousRotationZ();
                value++;
            }
        }
    }
}

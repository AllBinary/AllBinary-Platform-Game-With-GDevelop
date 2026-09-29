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
import { GraphicsStrings } from '../../../../org/allbinary/graphics/GraphicsStrings.js';
//not GWT import const GraphicsStrings
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
import { FrameUtil } from '../../../../org/allbinary/math/FrameUtil.js';
//not GWT import const FrameUtil
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDAnimationBehaviorBase } from './GDAnimationBehaviorBase.js';
//not GWT import - same folder const GDGameLayer
export class GDRotationBehavior extends GDAnimationBehaviorBase {
    constructor() {
        super(...arguments);
        this.logUtil = LogUtil.getInstance();
        this.frameUtil = FrameUtil.getInstance();
    }
    init(gdObject, animationInterfaceFactoryInterfaceArray) {
        var size = animationInterfaceFactoryInterfaceArray.length;
        ;
        var initIndexedAnimationInterfaceArray = new Array(size);
        ;
        for (var index = 0; index < size; index++) {
            try {
                initIndexedAnimationInterfaceArray[index] = animationInterfaceFactoryInterfaceArray[index].getInstance(0);
                //: 
            }
            catch (e) {
                var commonStrings = CommonStrings.getInstance();
                ;
                this.logUtil.put(new StringMaker().append(animationInterfaceFactoryInterfaceArray[index].toString()).append(" index: ").appendint(index).toString(), this, commonStrings.CONSTRUCTOR, e);
                this.logUtil.put(gdObject.toString(), this, commonStrings.CONSTRUCTOR, e);
            }
        }
        this.rotationAnimationInterfaceArray = initIndexedAnimationInterfaceArray;
        //if statement needs to be on the same line and ternary does not work the same way.
        return initIndexedAnimationInterfaceArray;
    }
    setAnimationArray(rotationAnimationInterfaceArray) {
        this.rotationAnimationInterfaceArray = rotationAnimationInterfaceArray;
    }
    getRotationAnimationInterfaceArray() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.rotationAnimationInterfaceArray;
    }
    //@Throws(Exception.constructor)
    set(gameLayer, gdObject) {
        var size = this.rotationAnimationInterfaceArray.length;
        ;
        for (var index = 0; index < size; index++) {
            this.rotationAnimationInterfaceArray[index].setFrame(this.frameUtil.getFrameForAngle(0, 1));
        }
    }
    setRotation(gameLayer, angleAdjustment) {
        var gdObject = gameLayer.gdObject;
        ;
        var rotationAnimation;
        ;
        rotationAnimation = this.rotationAnimationInterfaceArray[gdObject.animation];
        if (angleAdjustment > 0) {
            var value = angleAdjustment;
            ;
            while (value > 0) {
                rotationAnimation.nextRotation();
                value--;
            }
        }
        else {
            var value = angleAdjustment;
            ;
            while (value < 0) {
                rotationAnimation.previousRotation();
                value++;
            }
        }
    }
    toString(gdObject, stringBuffer) {
        var rotationAnimation = this.rotationAnimationInterfaceArray[gdObject.animation];
        ;
        stringBuffer.append(GraphicsStrings.getInstance().ANGLE).appendint(rotationAnimation.getAngleInfoP().getAngle());
    }
}

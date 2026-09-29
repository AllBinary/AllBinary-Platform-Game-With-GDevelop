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
//not GWT import const Graphics
import { J2MEUtil } from '../../../../org/allbinary/J2MEUtil.js';
//not GWT import const AnimationBehavior
import { IndexedAnimation } from '../../../../org/allbinary/animation/IndexedAnimation.js';
//not GWT import const IndexedAnimation
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
import { PrimitiveIntUtil } from '../../../../org/allbinary/logic/math/PrimitiveIntUtil.js';
//not GWT import const PrimitiveIntUtil
//Current folder imports from return types, extended types, and scope (deduplicated)
//Similar to Slider
export class ScrollBarAnimation extends IndexedAnimation {
    constructor(animationInterfaceArray, width, height, animationBehavior) {
        super(animationBehavior);
        this.logUtil = LogUtil.getInstance();
        this.value = 0;
        this.hasFocus = false;
        //For kotlin this is before the body of the constructor.
        this.animationInterfaceArray = animationInterfaceArray;
        this.dy = this.animationInterfaceArray[3].getDy();
        this.width = width;
        this.height = height;
    }
    dxhack() {
        if (J2MEUtil.isHTML()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.height * 2 / 3;
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.height;
        }
    }
    setFrame(frameIndex) {
        for (var index = this.animationInterfaceArray.length; --index >= 0;) {
            this.animationInterfaceArray[index].setFrame(frameIndex);
        }
    }
    getFrame() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.animationInterfaceArray[0].getFrame();
        ;
    }
    getSize() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.animationInterfaceArray[0].getSize();
        ;
    }
    previousFrame() {
        for (var index = this.animationInterfaceArray.length; --index >= 0;) {
            this.animationInterfaceArray[index].previousFrame();
        }
    }
    setSequence(sequence) {
    }
    getSequence() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return PrimitiveIntUtil.getArrayInstance();
        ;
    }
    //@Throws(Exception.constructor)
    nextFrame() {
        for (var index = this.animationInterfaceArray.length; --index >= 0;) {
            this.animationInterfaceArray[index].nextFrame();
        }
    }
    paintXY(graphics, x, y) {
        var size = this.animationInterfaceArray.length;
        ;
        for (var index = 0; index < size; index++) {
            this.animationInterfaceArray[index].paintXY(graphics, x, y);
        }
    }
    paintThreedXYZ(graphics, x, y, z) {
        var size = this.animationInterfaceArray.length;
        ;
        for (var index = 0; index < size; index++) {
            this.animationInterfaceArray[index].paintThreedXYZ(graphics, x, y, z);
        }
    }
    getAnimationInterfaceArray() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.animationInterfaceArray;
    }
    setAnimationInterfaceArray(animationInterfaceArray) {
        this.animationInterfaceArray = animationInterfaceArray;
    }
    setValue(value) {
        if (value >= 0 && value < 101) {
            this.value = value;
            var newDy = this.dy + (value * this.height / 100);
            ;
            this.animationInterfaceArray[3].setDy(newDy);
        }
    }
    setValue2(thumbY) {
        var usedThumbX = thumbY;
        ;
        var maxY = this.height;
        ;
        if (thumbY >= this.dy && thumbY < this.dy + this.height) {
        }
        else if (thumbY < 0) {
            usedThumbX = 0;
        }
        else if (thumbY > maxY) {
            usedThumbX = maxY;
        }
        var value = (100 * usedThumbX / this.height);
        ;
        if (value > 100) {
            value = 100;
        }
        this.setValue(value);
    }
    getThumbDy() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.animationInterfaceArray[3].getDy();
        ;
    }
    getThumbHeight() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.animationInterfaceArray[3].getHeight();
        ;
    }
    getValue() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.value;
    }
    setFocus(hasFocus) {
        this.hasFocus = hasFocus;
    }
}

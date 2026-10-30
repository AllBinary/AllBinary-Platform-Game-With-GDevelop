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
//not GWT import const CustomTextAnimation
import { SWTUtil } from '../../../../org/allbinary/game/layer/SWTUtil.js';
//not GWT import const SWTUtil
import { PrimitiveIntUtil } from '../../../../org/allbinary/logic/math/PrimitiveIntUtil.js';
//not GWT import const PrimitiveIntUtil
//Current folder imports from return types, extended types, and scope (deduplicated)
//Similar to ScollBar
export class SliderAnimation extends IndexedAnimation {
    constructor(animationInterfaceArray, width, height, animationBehavior) {
        super(animationBehavior);
        this.value = 0;
        this.hasFocus = false;
        //For kotlin this is before the body of the constructor.
        this.animationInterfaceArray = animationInterfaceArray;
        this.dx = this.animationInterfaceArray[3].getDx();
        this.width = width;
        this.height = height;
        let animation = this.animationInterfaceArray[4];
        ;
        if (SWTUtil.isSWT) {
            let h = this.dxhack();
            ;
            animation.setDy(globalThis.Math.trunc(-h / 3) * 2);
        }
        else {
            let h = this.dxhack();
            ;
            animation.setDy(-h + (globalThis.Math.trunc(h / 10)));
        }
    }
    dxhack() {
        if (J2MEUtil.isHTML()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return globalThis.Math.trunc(this.height * 2 / 3);
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.height;
        }
    }
    setFrame(frameIndex) {
        for (let index = this.animationInterfaceArray.length; --index >= 0;) {
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
        for (let index = this.animationInterfaceArray.length; --index >= 0;) {
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
        for (let index = this.animationInterfaceArray.length; --index >= 0;) {
            this.animationInterfaceArray[index].nextFrame();
        }
    }
    paintXY(graphics, x, y) {
        let size = this.animationInterfaceArray.length;
        ;
        for (let index = 0; index < size; index++) {
            this.animationInterfaceArray[index].paintXY(graphics, x, y);
        }
    }
    paintThreedXYZ(graphics, x, y, z) {
        let size = this.animationInterfaceArray.length;
        ;
        for (let index = 0; index < size; index++) {
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
            let newDx = this.dx + (globalThis.Math.trunc(value * this.width / 100));
            ;
            this.animationInterfaceArray[3].setDx(newDx);
            let customTextAnimation = this.animationInterfaceArray[4];
            ;
            customTextAnimation.setText(this.value.toString());
            customTextAnimation.setDx(newDx + (this.getThumbWidth() / 2) - (customTextAnimation.getWidth() / 2));
        }
    }
    setValue2(thumbX) {
        let usedThumbX = thumbX;
        ;
        let maxX = this.width;
        ;
        if (thumbX >= this.dx && thumbX < this.dx + this.width) {
        }
        else if (thumbX < 0) {
            usedThumbX = 0;
        }
        else if (thumbX > maxX) {
            usedThumbX = maxX;
        }
        let value = (globalThis.Math.trunc(100 * usedThumbX / this.width));
        ;
        if (value > 100) {
            value = 100;
        }
        this.setValue(value);
    }
    getThumbDx() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.animationInterfaceArray[3].getDx();
        ;
    }
    getThumbWidth() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.animationInterfaceArray[3].getWidth();
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

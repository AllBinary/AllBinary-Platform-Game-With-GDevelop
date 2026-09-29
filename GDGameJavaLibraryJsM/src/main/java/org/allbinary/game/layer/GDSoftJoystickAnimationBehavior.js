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
//not GWT import const GPoint
import { PointFactory } from '../../../../org/allbinary/graphics/PointFactory.js';
//not GWT import const PointFactory
import { TouchMotionGestureFactory } from '../../../../org/allbinary/input/motion/gesture/TouchMotionGestureFactory.js';
//not GWT import const TouchMotionGestureFactory
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDAnimationBehaviorBase } from './GDAnimationBehaviorBase.js';
//not GWT import - same folder const GDGameLayer
export class GDSoftJoystickAnimationBehavior extends GDAnimationBehaviorBase {
    constructor() {
        super(...arguments);
        this.logUtil = LogUtil.getInstance();
        this.touchMotionGestureFactory = TouchMotionGestureFactory.getInstance();
        this.initialX = 0;
        this.initialY = 0;
    }
    init(gdObject, animationInterfaceFactoryInterfaceArray) {
        var indexedAnimationArray = super.init(gdObject, animationInterfaceFactoryInterfaceArray);
        ;
        var simultaneousCompoundIndexedAnimation = indexedAnimationArray[0];
        ;
        var animation = simultaneousCompoundIndexedAnimation.getAnimationInterfaceArray()[1];
        ;
        this.initialX = animation.getDx();
        this.initialY = animation.getDy();
        //if statement needs to be on the same line and ternary does not work the same way.
        return indexedAnimationArray;
    }
    //@Throws(Exception.constructor)
    set(gameLayer, gdObject) {
        var simultaneousCompoundIndexedAnimation = gameLayer.getIndexedAnimationInterfaceArray()[0];
        ;
        var animation = simultaneousCompoundIndexedAnimation.getAnimationInterfaceArray()[1];
        ;
        var softJoystickInterface = gdObject;
        ;
        var point = softJoystickInterface.getPoint();
        ;
        if (point == PointFactory.getInstance().ZERO_ZERO) {
            animation.setDx(this.initialX);
            animation.setDy(this.initialY);
        }
        else {
            animation.setDx(point.getX() - gameLayer.getXP() - (gameLayer.getWidth() >> 2));
            animation.setDy(point.getY() - gameLayer.getYP() - (gameLayer.getHeight() >> 2));
        }
    }
}

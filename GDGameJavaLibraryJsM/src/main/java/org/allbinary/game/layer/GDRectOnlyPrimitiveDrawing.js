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
//not GWT import const Graphics
import { Animation } from '../../../../org/allbinary/animation/Animation.js';
//not GWT import const Animation
import { ARectangleFilledAnimation } from '../../../../org/allbinary/animation/vector/ARectangleFilledAnimation.js';
//not GWT import const BasicColor
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDRectOnlyPrimitiveDrawing extends Animation {
    constructor() {
        super(...arguments);
        this.logUtil = LogUtil.getInstance();
        this.rectangleFilledAnimation = new ARectangleFilledAnimation();
        this.x = 0;
        this.y = 0;
    }
    nextFrame() {
    }
    addFillColor(basicColor) {
        this.rectangleFilledAnimation.setBasicColorP(basicColor);
    }
    addFillRectangle(x, y, x2, y2) {
        this.rectangleFilledAnimation.x = x;
        this.rectangleFilledAnimation.y = y;
        this.rectangleFilledAnimation.setWidth(x2 - x);
        this.rectangleFilledAnimation.setHeight(y2 - y);
    }
    paintXY(graphics, x, y) {
        this.rectangleFilledAnimation.paintXY(graphics, this.x, this.y);
    }
    paintThreedXYZ(graphics, x, y, z) {
    }
}

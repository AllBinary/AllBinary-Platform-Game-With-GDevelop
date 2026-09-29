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
//not GWT import const GPoint
import { PointFactory } from '../../../../org/allbinary/graphics/PointFactory.js';
//not GWT import const BasicColor
import { AllBinaryLayer } from '../../../../org/allbinary/layer/AllBinaryLayer.js';
//not GWT import const AllBinaryLayer
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { LinePathAnimation } from './LinePathAnimation.js';
//not GWT import - same folder const LinePathAnimation
export class GDPrimitiveDrawingLinesOnly extends Animation {
    constructor() {
        super(...arguments);
        this.logUtil = LogUtil.getInstance();
        this.pointFactory = PointFactory.getInstance();
        this.NULL_ALLBINARY_LAYER = AllBinaryLayer.NULL_ALLBINARY_LAYER;
        this.colorAnimation = new Animation();
        this.linePathAnimation = new LinePathAnimation();
        this.pointList = new BasicArrayListD();
    }
    nextFrame() {
    }
    clear() {
        this.pointList.clear();
    }
    addFillColor(basicColor) {
        this.colorAnimation.setBasicColorP(basicColor);
    }
    addLineV2(x, y, x2, y2, thickness) {
        this.pointList.add(this.pointFactory.createXY(x, y));
        this.pointList.add(this.pointFactory.createXY(x2, y2));
    }
    paintXY(graphics, x, y) {
        this.colorAnimation.paintXY(graphics, x, y);
        var size = this.pointList.size();
        ;
        var point;
        ;
        var nextPoint;
        ;
        for (var index = 1; index < size;) {
            point = this.pointList.get(index - 1);
            nextPoint = this.pointList.get(index);
            this.linePathAnimation.paint(graphics, point, nextPoint, this.NULL_ALLBINARY_LAYER);
        }
    }
    paintThreedXYZ(graphics, x, y, z) {
    }
}

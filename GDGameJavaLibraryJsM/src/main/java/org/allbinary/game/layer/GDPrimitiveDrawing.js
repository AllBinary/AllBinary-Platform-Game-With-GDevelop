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
//not GWT import const BasicColorFactory
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not plain js import { CircularIndexUtil } 
const CircularIndexUtil = globalThis.org.allbinary.util.CircularIndexUtil;
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDPrimitiveDrawing extends Animation {
    constructor() {
        super(...arguments);
        this.logUtil = LogUtil.getInstance();
        this.animationListArray = [
            new BasicArrayListD(), new BasicArrayListD(), new BasicArrayListD(), new BasicArrayListD(), new BasicArrayListD(), new BasicArrayListD(), new BasicArrayListD(), new BasicArrayListD(), new BasicArrayListD()
        ];
        this.circularIndexUtil = CircularIndexUtil.createInstance(this.animationListArray.length);
        this.colorAnimationInUseList = new BasicArrayListD();
        this.colorAnimationCacheList = new BasicArrayListD();
        this.aRetangleFilledAnimationInUseList = new BasicArrayListD();
        this.aRetangleFilledAnimationCacheList = new BasicArrayListD();
        this.animationList = this.animationListArray[this.animationListArray.length - 1];
    }
    nextFrame() {
        this.animationList = this.animationListArray[this.circularIndexUtil.getIndex()];
        this.circularIndexUtil.next();
        this.animationListArray[this.circularIndexUtil.getIndex()].clear();
        this.colorAnimationCacheList.addAllList(this.colorAnimationInUseList);
        this.colorAnimationInUseList.clear();
        this.aRetangleFilledAnimationCacheList.addAllList(this.aRetangleFilledAnimationInUseList);
        this.aRetangleFilledAnimationInUseList.clear();
    }
    addFillColor(basicColor) {
        if (this.colorAnimationCacheList.size() == 0) {
            var colorAnimation = new Animation();
            ;
            colorAnimation.setBasicColorP(basicColor);
            this.animationListArray[this.circularIndexUtil.getIndex()].add(colorAnimation);
            this.colorAnimationInUseList.add(colorAnimation);
        }
        else {
            var colorAnimation = this.colorAnimationCacheList.removeAt(this.colorAnimationCacheList.size() - 1);
            ;
            colorAnimation.setBasicColorP(basicColor);
            this.animationListArray[this.circularIndexUtil.getIndex()].add(colorAnimation);
            this.colorAnimationInUseList.add(colorAnimation);
        }
    }
    addFillRectangle(x, y, x2, y2) {
        if (this.aRetangleFilledAnimationCacheList.size() == 0) {
            var rectangleFilledAnimation = new ARectangleFilledAnimation();
            ;
            rectangleFilledAnimation.x = x;
            rectangleFilledAnimation.y = y;
            rectangleFilledAnimation.setWidth(x2 - x);
            rectangleFilledAnimation.setHeight(y2 - y);
            this.animationListArray[this.circularIndexUtil.getIndex()].add(rectangleFilledAnimation);
            this.aRetangleFilledAnimationInUseList.add(rectangleFilledAnimation);
        }
        else {
            var rectangleFilledAnimation = this.aRetangleFilledAnimationCacheList.removeAt(this.aRetangleFilledAnimationCacheList.size() - 1);
            ;
            rectangleFilledAnimation.x = x;
            rectangleFilledAnimation.y = y;
            rectangleFilledAnimation.setWidth(x2 - x);
            rectangleFilledAnimation.setHeight(y2 - y);
            this.animationListArray[this.circularIndexUtil.getIndex()].add(rectangleFilledAnimation);
            this.aRetangleFilledAnimationInUseList.add(rectangleFilledAnimation);
        }
    }
    paintXY(graphics, x, y) {
        var animationList = this.animationList;
        ;
        var size = animationList.size();
        ;
        for (var index = 0; index < size; index++) {
            get = animationList.get(index);
            get;
            get.
                paintXY(graphics, x, y);
        }
    }
    paintThreedXYZ(graphics, x, y, z) {
        var animationList = this.animationList;
        ;
        var size = animationList.size();
        ;
        var animation;
        ;
        for (var index = 0; index < size; index++) {
            animation = animationList.get(index);
            animation.paintThreedXYZ(graphics, x, y, z);
        }
    }
}

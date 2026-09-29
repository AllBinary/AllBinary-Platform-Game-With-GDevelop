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
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not GWT import - same folder const GDGameLayer
export class GDAnimationBehaviorBase extends Object {
    constructor() {
        super(...arguments);
        this.logUtil = LogUtil.getInstance();
    }
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDAnimationBehaviorBase.instance;
    }
    init(gdObject, animationInterfaceFactoryInterfaceArray) {
        var size = animationInterfaceFactoryInterfaceArray.length;
        ;
        var initIndexedAnimationInterfaceArray = new Array(size);
        ;
        for (var index = 0; index < size; index++) {
            try {
                initIndexedAnimationInterfaceArray[index] = animationInterfaceFactoryInterfaceArray[index].getInstance(gdObject.hashCode());
                //: 
            }
            catch (e) {
                var commonStrings = CommonStrings.getInstance();
                ;
                this.logUtil.put(new StringMaker().append(animationInterfaceFactoryInterfaceArray[index].toString()).append(" index: ").appendint(index).toString(), this, commonStrings.CONSTRUCTOR, e);
                this.logUtil.put(gdObject.toString(), this, commonStrings.CONSTRUCTOR, e);
            }
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return initIndexedAnimationInterfaceArray;
    }
    setAnimationArray(rotationAnimationInterfaceArray) {
    }
    add(gameLayer) {
    }
    //@Throws(Exception.constructor)
    set(gameLayer, gdObject) {
    }
    setRotation(gameLayer, angleAdjustment) {
    }
    animate(gdObject, initIndexedAnimationInterfaceArray, timeDelta) {
    }
    toString(gdObject, stringBuffer) {
    }
}
GDAnimationBehaviorBase.instance = new GDAnimationBehaviorBase();

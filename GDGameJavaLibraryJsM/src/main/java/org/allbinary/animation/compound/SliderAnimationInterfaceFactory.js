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
//not GWT import const Animation
import { AnimationBehaviorFactory } from '../../../../org/allbinary/animation/AnimationBehaviorFactory.js';
//not GWT import const IndexedAnimation
import { ScaleProperties } from '../../../../org/allbinary/media/ScaleProperties.js';
//not GWT import const ScaleProperties
//Current folder imports from return types, extended types, and scope (deduplicated)
import { CompoundAnimationInterfaceFactory } from './CompoundAnimationInterfaceFactory.js';
//not GWT import - same folder const CompoundAnimationInterfaceFactory
import { SliderAnimation } from './SliderAnimation.js';
//not GWT import - same folder const SliderAnimation
export class SliderAnimationInterfaceFactory extends CompoundAnimationInterfaceFactory {
    constructor(basicAnimationInterfaceFactoryInterfaceArray, width, height) {
        this.scaleProperties = ScaleProperties.instance;
        this(basicAnimationInterfaceFactoryInterfaceArray, width, height, AnimationBehaviorFactory.getInstance());
        //For kotlin this is before the body of the constructor.
    }
    constructor(basicAnimationInterfaceFactoryInterfaceArray, width, height, animationBehaviorFactory) {
        super(basicAnimationInterfaceFactoryInterfaceArray, animationBehaviorFactory);
        this.scaleProperties = ScaleProperties.instance;
        //For kotlin this is before the body of the constructor.
        this.width = width;
        this.height = height;
    }
    createArray(size) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return new Array(size);
    }
    createAnimation(animationInterfaceArray) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return new SliderAnimation(animationInterfaceArray, this.scaleProperties.scaleWidth, this.scaleProperties.scaleHeight, this.animationBehaviorFactory.getOrCreateInstance());
    }
    setInitialScale(scaleProperties) {
        this.scaleProperties = scaleProperties;
    }
}

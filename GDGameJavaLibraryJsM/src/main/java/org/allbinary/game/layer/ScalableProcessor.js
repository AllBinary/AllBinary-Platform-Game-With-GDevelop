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
//Current folder imports from return types, extended types, and scope (deduplicated)
import { ScalableBaseProcessor } from './ScalableBaseProcessor.js';
//not GWT import - same folder const GDGameLayer
export class ScalableProcessor extends ScalableBaseProcessor {
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return ScalableProcessor.instance;
    }
    process(gameLayer, initIndexedAnimationInterface) {
        var gdObject = gameLayer.gdObject;
        ;
        initIndexedAnimationInterface.setScale(gdObject.scaleX, gdObject.scaleY);
    }
}
ScalableProcessor.instance = new ScalableProcessor();

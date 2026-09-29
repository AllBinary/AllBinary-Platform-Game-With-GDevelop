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
/* Generated Code Do Not Modify */
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDAnimationBehaviorBaseFactory } from './GDAnimationBehaviorBaseFactory.js';
//not GWT import - same folder const GDAnimationBehaviorBaseFactory
import { GDIndividualAnimationBehavior } from './GDIndividualAnimationBehavior.js';
//not GWT import - same folder const GDAnimationBehaviorBase
export class GDIndividualAnimationBehaviorFactory extends GDAnimationBehaviorBaseFactory {
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDIndividualAnimationBehaviorFactory.instance;
    }
    create() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return new GDIndividualAnimationBehavior();
    }
}
GDIndividualAnimationBehaviorFactory.instance = new GDIndividualAnimationBehaviorFactory();

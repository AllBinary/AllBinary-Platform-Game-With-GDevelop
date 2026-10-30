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
import { Object } from '../../../../../java/lang/Object.js';
import { RuntimeException } from '../../../../../java/lang/RuntimeException.js';
//Current folder imports from return types, extended types, and scope (deduplicated)
import { DraggableBehavior } from './DraggableBehavior.js';
//not GWT import - same folder const DraggableBehavior
import { PathFindingBehavior } from './PathFindingBehavior.js';
//not GWT import - same folder const GDBehavior
export class GDBehaviorUtil extends Object {
    constructor() {
        super(...arguments);
        this.PATHFINDING_BEHAVIOR_INDEX = 0;
        this.DRAGGABLE_BEHAVIOR_INDEX = 1;
        this.MAX = this.DRAGGABLE_BEHAVIOR_INDEX + 1;
    }
    static getInstance(...args) {
        if (args.length === 0)
            return this.getInstance$overload1();
        if (args.length === 1 && typeof args[0] === 'number')
            return this.getInstance$overload2(args[0]);
        throw new TypeError('No matching overload: getInstance');
    }
    static getInstance$overload1() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDBehaviorUtil.instance;
    }
    getInstance$overload2(index) {
        if (index == this.PATHFINDING_BEHAVIOR_INDEX) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return PathFindingBehavior.getInstance();
            ;
        }
        else if (index == this.DRAGGABLE_BEHAVIOR_INDEX) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return DraggableBehavior.getInstance();
            ;
        }
        else {
            throw new RuntimeException();
        }
    }
}
GDBehaviorUtil.instance = new GDBehaviorUtil();

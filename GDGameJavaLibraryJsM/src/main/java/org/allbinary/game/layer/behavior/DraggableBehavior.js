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
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDBehavior } from './GDBehavior.js';
//not GWT import - same folder const GDBehavior
export class DraggableBehavior extends GDBehavior {
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return DraggableBehavior.instance;
    }
    constructor() {
        super();
    }
    process(gameLayerList, index, graphics) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
}
DraggableBehavior.instance = new DraggableBehavior();

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
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDBehavior } from './GDBehavior.js';
//not GWT import - same folder const GDBehavior
export class PathFindingBehavior extends GDBehavior {
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return PathFindingBehavior.instance;
    }
    constructor() {
        super();
    }
    process(gameLayerList, index, graphics) {
        var gameLayer = gameLayerList.get(index);
        ;
        var gdObject = gameLayer.gdObject;
        ;
        if (gdObject ==
            null) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return false;
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    //@Throws(Exception.constructor)
    setTarget(sourceGameLayer, targetGameLayer, x, y) {
        targetGameLayer.setAllBinaryGameLayerManager(sourceGameLayer.allBinaryGameLayerManagerP);
        var pathFindingLayerInterface = sourceGameLayer;
        ;
        pathFindingLayerInterface.setTarget(targetGameLayer);
    }
}
PathFindingBehavior.instance = new PathFindingBehavior();

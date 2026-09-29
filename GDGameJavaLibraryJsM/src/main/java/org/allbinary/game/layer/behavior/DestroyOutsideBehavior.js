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
//not GWT import const GDObject
import { GameTickDisplayInfoSingleton } from '../../../../../org/allbinary/graphics/displayable/GameTickDisplayInfoSingleton.js';
//not GWT import const GameTickDisplayInfoSingleton
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDBehavior } from './GDBehavior.js';
//not GWT import - same folder const GDBehavior
export class DestroyOutsideBehavior extends GDBehavior {
    constructor() {
        super(...arguments);
        this.gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();
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
        if (gdObject.x > this.SceneWindowWidth() + gdObject.Width(graphics)) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
        if (gdObject.y > this.SceneWindowHeight() + gdObject.Width(graphics)) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
        if (gdObject.y < -gdObject.Width(graphics)) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
        if (gdObject.x < -gdObject.Height(graphics)) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    SceneWindowWidth() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.gameTickDisplayInfoSingleton.getLastWidth();
        ;
    }
    SceneWindowHeight() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.gameTickDisplayInfoSingleton.getLastHeight();
        ;
    }
}

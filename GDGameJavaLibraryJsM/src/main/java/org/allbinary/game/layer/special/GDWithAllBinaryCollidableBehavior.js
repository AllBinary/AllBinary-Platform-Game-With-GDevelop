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
import { CollidableBaseBehavior } from '../../../../../org/allbinary/game/collision/CollidableBaseBehavior.js';
//not GWT import const GDNode
//not plain js import { ForcedLogUtil } 
const ForcedLogUtil = globalThis.org.allbinary.logic.communication.log.ForcedLogUtil;
//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
//not GWT import - same folder const CollidableDestroyableDamageableLayer
import { TempGameLayerUtil } from './TempGameLayerUtil.js';
//not GWT import - same folder const TempGameLayerUtil
export class GDWithAllBinaryCollidableBehavior extends CollidableBaseBehavior {
    constructor(collidableBehavior, collidable) {
        super(collidable);
        this.IS_COLLISION = "isCollision";
        //For kotlin this is before the body of the constructor.
        this.conditionWIthGroupActions = collidableBehavior;
    }
    isCollision(ownerLayer, collisionLayer) {
        if (getCollidableInferface = collisionLayer.getCollidableInferface())
            getCollidableInferface;
        getCollidableInferface.
            conditionWIthGroupActions.groupWithActionsList.size() > 0;
        {
            if (ownerLayer.getGroupInterface()[0] != collisionLayer.getGroupInterface()[0]) {
                if (ownerLayer != collisionLayer) {
                    //if statement needs to be on the same line and ternary does not work the same way.
                    return super.isCollision(ownerLayer, collisionLayer);
                    ;
                }
            }
        }
        {
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    //@Throws(Exception.constructor)
    collide(ownerLayer, collisionLayer) {
        if (collisionLayer.isDestroyed()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        if (ownerLayer.isDestroyed()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        if (this.conditionWIthGroupActions.groupWithActionsList.size() > 0) {
            var groupInterfaceArray = collisionLayer.getGroupInterface();
            ;
            var size = groupInterfaceArray.length;
            ;
            var indexOfGroup = 0;
            ;
            var node;
            ;
            for (var index = 0; index < size; index++) {
                indexOfGroup = this.conditionWIthGroupActions.groupWithActionsList.indexOf(groupInterfaceArray[index]);
                if (indexOfGroup >= 0) {
                    node = this.conditionWIthGroupActions.actionForGroupsList.get(indexOfGroup);
                    var tempGameLayerUtil = TempGameLayerUtil.getInstance();
                    ;
                    tempGameLayerUtil.clear();
                    tempGameLayerUtil.gameLayerArray[0] = ownerLayer;
                    tempGameLayerUtil.gameLayerArray[1] = collisionLayer;
                    tempGameLayerUtil.clear2();
                }
            }
        }
        else {
        }
    }
    isCollisionInterface(ownerLayer, collidableInterfaceCompositeInterface) {
        ForcedLogUtil.log("No Longer Used", this);
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    //@Throws(Exception.constructor)
    collideInterface(ownerLayer, collidableInterfaceCompositeInterface) {
        ForcedLogUtil.log("No Longer Used", this);
    }
    toString(ownerLayer, collisionLayer, stringBuilder) {
        var stringUtil = StringUtil.getInstance();
        ;
        var size = ownerLayer.getGroupInterface().length;
        ;
        for (var index = 0; index < size; index++) {
            stringBuilder.append(stringUtil.toString(ownerLayer.getGroupInterface()[index]));
        }
        stringBuilder.append(" != ");
        size = collisionLayer.getGroupInterface().length;
        for (var index = 0; index < size; index++) {
            stringBuilder.append(stringUtil.toString(collisionLayer.getGroupInterface()[index]));
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return stringBuilder.toString();
        ;
    }
}

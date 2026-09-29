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
//not GWT import const CollidableCompositeLayer
//Current folder imports from return types, extended types, and scope (deduplicated)
export class TempGameLayerUtil extends Object {
    constructor() {
        super(...arguments);
        this.gameLayerArray = new Array(5);
    }
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return TempGameLayerUtil.instance;
    }
    clear() {
        for (var index = 0; index < 5; index++) {
            this.gameLayerArray[index] =
                null;
        }
    }
    clear2() {
        this.clear();
    }
}
TempGameLayerUtil.instance = new TempGameLayerUtil();

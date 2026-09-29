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
//not GWT import const GameInputProcessor
import { InputFactory } from '../../../../org/allbinary/game/input/InputFactory.js';
//not GWT import const InputFactory
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDSceneGlobals extends Object {
    constructor() {
        super(...arguments);
        this.anyKeyProcessorArray = new Array(1);
        this.inputProcessorArray = new Array(InputFactory.getInstance().MAX);
        this.unmappedInputProcessorArray = new Array(InputFactory.getInstance().MAX);
    }
}

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
//not GWT import const AllBinaryLayerManager
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GameInputProcessor } from './GameInputProcessor.js';
//not GWT import - same folder const GameInputProcessor
export class GDRGameInputProcessor extends GameInputProcessor {
    constructor() {
        super(...arguments);
        this.releasedGameInputProcessor = GameInputProcessor.getInstance();
    }
    //@Throws(Exception.constructor)
    processReleasedEvent(allbinaryLayerManager, gameKeyEvent) {
    }
}

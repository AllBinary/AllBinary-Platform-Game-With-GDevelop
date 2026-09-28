
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

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
import { GameKeyEvent } from '../../../../org/allbinary/game/input/event/GameKeyEvent.js';
//not GWT import const GameKeyEvent

import { AllBinaryLayerManager } from '../../../../org/allbinary/layer/AllBinaryLayerManager.js';
//not GWT import const AllBinaryLayerManager

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GameInputProcessor } from './GameInputProcessor.js';
//not GWT import - same folder const GameInputProcessor

export class GDRGameInputProcessor extends GameInputProcessor {
        

    public releasedGameInputProcessor: GameInputProcessor = GameInputProcessor.getInstance()!;

                //@Throws(Exception.constructor)
            
    public processReleasedEvent(allbinaryLayerManager: AllBinaryLayerManager, gameKeyEvent: GameKeyEvent){
}


}




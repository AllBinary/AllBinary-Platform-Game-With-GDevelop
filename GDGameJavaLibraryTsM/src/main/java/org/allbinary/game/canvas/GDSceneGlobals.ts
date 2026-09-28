
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
        
import { GameInputProcessor } from '../../../../org/allbinary/game/input/GameInputProcessor.js';
//not GWT import const GameInputProcessor

import { InputFactory } from '../../../../org/allbinary/game/input/InputFactory.js';
//not GWT import const InputFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDSceneGlobals
            extends Object
         {
        

    public readonly anyKeyProcessorArray: GameInputProcessor[] = new Array(1);

    public readonly inputProcessorArray: GameInputProcessor[] = new Array(InputFactory.getInstance()!.MAX);

    public readonly unmappedInputProcessorArray: GameInputProcessor[] = new Array(InputFactory.getInstance()!.MAX);

}




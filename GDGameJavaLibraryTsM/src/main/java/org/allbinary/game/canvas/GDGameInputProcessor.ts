
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
        
            import { Exception } from '../../../../java/lang/Exception.js';
        
            import { Integer } from '../../../../java/lang/Integer.js';
        
import { Animation } from '../../../../org/allbinary/animation/Animation.js';
//not GWT import const Animation

import { SpecialAnimation } from '../../../../org/allbinary/animation/special/SpecialAnimation.js';
//not GWT import const SpecialAnimation

import { GameInputStrings } from '../../../../org/allbinary/game/input/GameInputStrings.js';
//not GWT import const GameInputStrings

import { PlayerGameInput } from '../../../../org/allbinary/game/input/PlayerGameInput.js';
//not GWT import const PlayerGameInput

import { PlayerInput } from '../../../../org/allbinary/game/input/PlayerInput.js';
//not GWT import const PlayerInput

import { GameKeyEvent } from '../../../../org/allbinary/game/input/event/GameKeyEvent.js';
//not GWT import const GameKeyEvent

import { AllBinaryLayerManager } from '../../../../org/allbinary/layer/AllBinaryLayerManager.js';
//not GWT import const AllBinaryLayerManager

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDSpecialAnimation } from './GDSpecialAnimation.js';
//not GWT import - same folder const GDSpecialAnimation
import { GDSceneGlobals } from './GDSceneGlobals.js';
//not GWT import - same folder const GDSceneGlobals

export class GDGameInputProcessor
            extends Object
         {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly gameInputStrings: GameInputStrings = GameInputStrings.getInstance()!;

    private readonly gameKeyEventList: BasicArrayList = new BasicArrayListD();

    private readonly removalGameKeyEventList: BasicArrayList = new BasicArrayListD();

    private readonly keyEventList: BasicArrayList = new BasicArrayListD();

    private readonly removalKeyEventList: BasicArrayList = new BasicArrayListD();

    private readonly playerGameInput: PlayerGameInput = new PlayerInput(this.keyEventList, this.removalKeyEventList, this.gameKeyEventList, this.removalGameKeyEventList, 0);

                //@Throws(Exception.constructor)
            
    public process(allbinaryLayerManager: AllBinaryLayerManager, specialAnimation: Animation){

                        if(specialAnimation == SpecialAnimation.getInstance())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

    var globals: GDSceneGlobals = (specialAnimation as GDSpecialAnimation).getGlobals()!;;
    

    var gameKeyEvent: GameKeyEvent;;
    

    var size: number = this.gameKeyEventList!.size()!;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
gameKeyEvent= this.gameKeyEventList!.get(index) as GameKeyEvent;
    
globals.inputProcessorArray[gameKeyEvent!.getKey()]!.processEvent(allbinaryLayerManager, gameKeyEvent);
    
}


    var size2: number = this.removalGameKeyEventList!.size()!;;
    




                        for (
    var index: number = 0;index < size2; index++)
        {
gameKeyEvent= this.removalGameKeyEventList!.get(index) as GameKeyEvent;
    
globals.inputProcessorArray[gameKeyEvent!.getKey()]!.processReleasedEvent(allbinaryLayerManager, gameKeyEvent);
    
}


    var keyAsInteger: Integer;;
    

    var size3: number = this.keyEventList!.size()!;;
    

                        if(size3 > 0)
                        
                                    {
                                    keyAsInteger= this.keyEventList!.get(0) as Integer;
    
globals.anyKeyProcessorArray[0]!.process(allbinaryLayerManager, keyAsInteger);
    

                                    }
                                




                        for (
    var index: number = 0;index < size3; index++)
        {
keyAsInteger= this.keyEventList!.get(index) as Integer;
    
globals.unmappedInputProcessorArray[keyAsInteger!.intValue()]!.process(allbinaryLayerManager, keyAsInteger);
    
}


    var size4: number = this.removalKeyEventList!.size()!;;
    




                        for (
    var index: number = 0;index < size4; index++)
        {
keyAsInteger= this.removalKeyEventList!.get(index) as Integer;
    
globals.unmappedInputProcessorArray[keyAsInteger!.intValue()]!.processReleased(allbinaryLayerManager, keyAsInteger);
    
}

this.processInput(allbinaryLayerManager);
    
}


                //@Throws(Exception.constructor)
            
    public processInput(allbinaryLayerManager: AllBinaryLayerManager){

        try {
            this.playerGameInput!.update();
    

                //: 
} catch(e) 
            {

    var commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    
this.logUtil!.putF(commonStrings!.EXCEPTION, this, this.gameInputStrings!.PROCESS_INPUT);
    
}

}


    public getPlayerGameInput(): PlayerGameInput{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.playerGameInput;
    
}


    public getGameKeyEventList(): BasicArrayList{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gameKeyEventList;
    
}


}




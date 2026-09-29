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
//not GWT import const Animation
import { SpecialAnimation } from '../../../../org/allbinary/animation/special/SpecialAnimation.js';
//not GWT import const SpecialAnimation
import { GameInputStrings } from '../../../../org/allbinary/game/input/GameInputStrings.js';
//not GWT import const PlayerGameInput
import { PlayerInput } from '../../../../org/allbinary/game/input/PlayerInput.js';
//not GWT import const AllBinaryLayerManager
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not GWT import - same folder const GDSceneGlobals
export class GDGameInputProcessor extends Object {
    constructor() {
        super(...arguments);
        this.logUtil = LogUtil.getInstance();
        this.gameInputStrings = GameInputStrings.getInstance();
        this.gameKeyEventList = new BasicArrayListD();
        this.removalGameKeyEventList = new BasicArrayListD();
        this.keyEventList = new BasicArrayListD();
        this.removalKeyEventList = new BasicArrayListD();
        this.playerGameInput = new PlayerInput(this.keyEventList, this.removalKeyEventList, this.gameKeyEventList, this.removalGameKeyEventList, 0);
    }
    //@Throws(Exception.constructor)
    process(allbinaryLayerManager, specialAnimation) {
        if (specialAnimation == SpecialAnimation.getInstance()) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        var globals = specialAnimation.getGlobals();
        ;
        var gameKeyEvent;
        ;
        var size = this.gameKeyEventList.size();
        ;
        for (var index = 0; index < size; index++) {
            gameKeyEvent = this.gameKeyEventList.get(index);
            globals.inputProcessorArray[gameKeyEvent.getKey()].processEvent(allbinaryLayerManager, gameKeyEvent);
        }
        var size2 = this.removalGameKeyEventList.size();
        ;
        for (var index = 0; index < size2; index++) {
            gameKeyEvent = this.removalGameKeyEventList.get(index);
            globals.inputProcessorArray[gameKeyEvent.getKey()].processReleasedEvent(allbinaryLayerManager, gameKeyEvent);
        }
        var keyAsInteger;
        ;
        var size3 = this.keyEventList.size();
        ;
        if (size3 > 0) {
            keyAsInteger = this.keyEventList.get(0);
            globals.anyKeyProcessorArray[0].process(allbinaryLayerManager, keyAsInteger);
        }
        for (var index = 0; index < size3; index++) {
            keyAsInteger = this.keyEventList.get(index);
            globals.unmappedInputProcessorArray[keyAsInteger.intValue()].process(allbinaryLayerManager, keyAsInteger);
        }
        var size4 = this.removalKeyEventList.size();
        ;
        for (var index = 0; index < size4; index++) {
            keyAsInteger = this.removalKeyEventList.get(index);
            globals.unmappedInputProcessorArray[keyAsInteger.intValue()].processReleased(allbinaryLayerManager, keyAsInteger);
        }
        this.processInput(allbinaryLayerManager);
    }
    //@Throws(Exception.constructor)
    processInput(allbinaryLayerManager) {
        try {
            this.playerGameInput.update();
            //: 
        }
        catch (e) {
            var commonStrings = CommonStrings.getInstance();
            ;
            this.logUtil.putF(commonStrings.EXCEPTION, this, this.gameInputStrings.PROCESS_INPUT);
        }
    }
    getPlayerGameInput() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.playerGameInput;
    }
    getGameKeyEventList() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.gameKeyEventList;
    }
}

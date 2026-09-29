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
//not GWT import const UpKeyEventListenerInterface
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { PlayerGameInput } from './PlayerGameInput.js';
//not GWT import - same folder const PlayerGameInput
export class PlayerInput extends PlayerGameInput {
    constructor(keyEventList, removalKeyEventList, gameKeyEventList, removalGameKeyEventList, playerInputId) {
        super(gameKeyEventList, removalGameKeyEventList, playerInputId);
        this.logUtil = LogUtil.getInstance();
        //For kotlin this is before the body of the constructor.
        this.keyEventList = keyEventList;
        this.removalKeyEventList = removalKeyEventList;
    }
    //@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.
    onDownKey(keyInteger) {
        if (keyInteger.intValue() > 0) {
            this.addKey(keyInteger);
        }
        else {
        }
    }
    //@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.
    onUpKeyEvent(keyInteger) {
        if (keyInteger.intValue() > 0) {
            this.addKeyForRemoval(keyInteger);
        }
        else {
        }
    }
    //@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.
    addKey(keyInteger) {
        if (this.isRemoveDuplicateKeyPresses && this.keyEventList.contains(keyInteger)) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        if (keyInteger !=
            null) {
            this.keyEventList.add(keyInteger);
        }
        else {
            this.logUtil.putF("Danger Passed Null KeyEvent", this, this.commonStrings.ADD);
        }
    }
    //@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.
    addKeyForRemoval(keyInteger) {
        this.removalKeyEventList.add(keyInteger);
    }
    //@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.
    isKeyForRemoval(keyInteger) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.removalKeyEventList.contains(keyInteger);
        ;
    }
    //@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.
    clear() {
        super.clear();
        this.keyEventList.clear();
    }
    //@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.
    removeNonAIInputGameKeyEvents() {
        super.removeNonAIInputGameKeyEvents();
        var list = this.keyEventList;
        ;
        for (var index = list.size(); --index >= 0;) {
            list.removeAt(index);
        }
    }
    //@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.
    update() {
        super.update();
        var removeList = this.removalKeyEventList;
        ;
        var list = this.keyEventList;
        ;
        var size = removeList.size();
        ;
        for (var index = 0; index < size; index++) {
            var anyType = removeList.objectArray[index];
            ;
            for (var index2 = list.size(); --index2 >= 0;) {
                if (list.objectArray[index2] == anyType) {
                    list.removeAt(index2);
                }
            }
        }
        removeList.clear();
    }
}

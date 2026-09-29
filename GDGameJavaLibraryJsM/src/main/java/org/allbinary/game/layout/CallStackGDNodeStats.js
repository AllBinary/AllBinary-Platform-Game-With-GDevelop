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
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;
//Current folder imports from return types, extended types, and scope (deduplicated)
export class CallStackGDNodeStats extends Object {
    constructor() {
        super(...arguments);
        this.logUtil = LogUtil.getInstance();
        this.SIZE = 16;
        this.callStack = new Array(this.SIZE).fill(null).map(() => new Array(6000).fill(null));
        this.total = 0;
    }
    reset() {
        for (var index2 = 0; index2 < this.SIZE; index2++) {
            for (var index = 0; index < this.total; index++) {
                this.callStack[index2][index] = 0;
            }
        }
        this.total = 0;
    }
    push(index, name) {
        this.callStack[index][this.total++] = name;
    }
    log(stringBuilder, anyType = {}) {
        var commonStrings = CommonStrings.getInstance();
        ;
        var commonSeps = CommonSeps.getInstance();
        ;
        stringBuilder.delete(0, stringBuilder.length());
        for (var index2 = 0; index2 < this.total; index2++) {
            for (var index = 0; index < this.SIZE; index++) {
                if (this.callStack[index][index2] != 0) {
                    stringBuilder.appendint(index2);
                    stringBuilder.append(commonSeps.COLON);
                    stringBuilder.appendint(index);
                    stringBuilder.append(commonSeps.COLON);
                    stringBuilder.appendint(this.callStack[index][index2]);
                    stringBuilder.append(commonSeps.SEMICOLON);
                    if (stringBuilder.length() > 256) {
                        this.logUtil.putF(stringBuilder.toString(), anyType, commonStrings.PROCESS);
                        stringBuilder.delete(0, stringBuilder.length());
                    }
                }
            }
        }
        if (stringBuilder.length() > 0) {
            this.logUtil.putF(stringBuilder.toString(), anyType, commonStrings.PROCESS);
        }
    }
}

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
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
//not plain js import { NullRunnable } 
const NullRunnable = globalThis.org.allbinary.thread.NullRunnable;
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not GWT import - same folder const GDNode
export class GDNodes extends Object {
    constructor() {
        super(...arguments);
        this.runnableList = new BasicArrayListD();
    }
    process() {
        var gdNode;
        ;
        var size2 = this.runnableList.size();
        ;
        for (var index = 0; index < size2; index++) {
            gdNode = this.runnableList.get(index);
            gdNode.currentRunnable.run();
        }
    }
    clear() {
        var gdNode;
        ;
        var size2 = this.runnableList.size();
        ;
        for (var index = 0; index < size2; index++) {
            gdNode = this.runnableList.get(index);
            gdNode.currentRunnable = NullRunnable.getInstance();
        }
    }
}

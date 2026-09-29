/*
        *
        *  AllBinary Open License Version 1
        *  Copyright (c) 2011 AllBinary
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
import { RuntimeException } from '../../../../java/lang/RuntimeException.js';
//not GWT import const MotionGestureEvent
//not plain js import { NullUtil } 
const NullUtil = globalThis.org.allbinary.logic.NullUtil;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
//not plain js import { NullRunnable } 
const NullRunnable = globalThis.org.allbinary.thread.NullRunnable;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDNodeStatsFactory } from './GDNodeStatsFactory.js';
//not GWT import - same folder const GDObject
export class GDNode extends Object {
    constructor(name) {
        super();
        this.logUtil = LogUtil.getInstance();
        this.commonStrings = CommonStrings.getInstance();
        this.nodeStatsFactory = GDNodeStatsFactory.getInstance();
        this.currentRunnable = NullRunnable.getInstance();
        this.name = name;
        this.init();
    }
    init() {
    }
    reset() {
        this.currentRunnable = NullRunnable.getInstance();
    }
    //@Throws(Exception.constructor)
    process() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return true;
    }
    process(objecArray, intArray, longArray, floatArray) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return true;
    }
    processStats() {
        this.nodeStatsFactory.push(2, this.name);
    }
    processStatsE() {
        this.nodeStatsFactory.push(3, this.name);
    }
    //@Throws(Exception.constructor)
    processReleased() {
        this.processReleasedStats();
        //if statement needs to be on the same line and ternary does not work the same way.
        return true;
    }
    processReleasedStats() {
        this.nodeStatsFactory.push(4, this.name);
    }
    //@Throws(Exception.constructor)
    process(gameKeyEvent) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    //@Throws(Exception.constructor)
    processReleased(gameKeyEvent) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    //@Throws(Exception.constructor)
    process(keyAsInteger) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    //@Throws(Exception.constructor)
    processReleased(keyAsInteger) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    //@Throws(Exception.constructor)
    process(motionGestureEvent, lastMotionGestureInput) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    //@Throws(Exception.constructor)
    processScrolling(motionGestureEvent, lastMotionGestureInput) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    processStats(motionGestureEvent) {
        this.nodeStatsFactory.push(5, this.name);
    }
    //@Throws(Exception.constructor)
    process(index) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    //@Throws(Exception.constructor)
    processStats(index) {
        this.nodeStatsFactory.push(6, this.name);
    }
    //@Throws(Exception.constructor)
    processEnd() {
    }
    //@Throws(Exception.constructor)
    processEnd(index, createIndex) {
    }
    //@Throws(Exception.constructor)
    processEndStats() {
        this.nodeStatsFactory.push(7, this.name);
    }
    //@Throws(Exception.constructor)
    processCreate() {
        if (true)
            throw new RuntimeException();
        //if statement needs to be on the same line and ternary does not work the same way.
        return true;
    }
    //@Throws(Exception.constructor)
    processCreateWithGDObject(gdObject) {
        if (true)
            throw new RuntimeException();
        //if statement needs to be on the same line and ternary does not work the same way.
        return true;
    }
    //@Throws(Exception.constructor)
    processCreateByName(gdObject, createString, createIndex) {
        if (true)
            throw new RuntimeException();
        //if statement needs to be on the same line and ternary does not work the same way.
        return true;
    }
    //@Throws(Exception.constructor)
    processCreateGD(gameLayerArray) {
        if (true)
            throw new RuntimeException();
        //if statement needs to be on the same line and ternary does not work the same way.
        return true;
    }
    processCreateStats(gdObject) {
        this.nodeStatsFactory.push(10, this.name);
    }
    processReleasedStats(gdObject) {
        this.nodeStatsFactory.push(11, this.name);
    }
    //@Throws(Exception.constructor)
    processGD(gameLayerArray) {
        this.processGDStats(gameLayerArray);
        //if statement needs to be on the same line and ternary does not work the same way.
        return false;
    }
    processGDStats(gameLayerArray) {
        this.nodeStatsFactory.push(14, this.name);
    }
    getReturnValue() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return NullUtil.getInstance().NULL_OBJECT;
    }
    getName() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.name;
    }
}

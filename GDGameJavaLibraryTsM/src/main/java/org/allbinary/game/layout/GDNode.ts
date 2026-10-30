
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
        
            import { Exception } from '../../../../java/lang/Exception.js';
        
            import { RuntimeException } from '../../../../java/lang/RuntimeException.js';
        
            import { Integer } from '../../../../java/lang/Integer.js';
        
            import { Runnable } from '../../../../java/lang/Runnable.js';
        
import { GameKeyEvent } from '../../../../org/allbinary/game/input/event/GameKeyEvent.js';
//not GWT import const GameKeyEvent

import { GDGameLayer } from '../../../../org/allbinary/game/layer/GDGameLayer.js';
//not GWT import const GDGameLayer

import { MotionGestureInput } from '../../../../org/allbinary/input/motion/gesture/MotionGestureInput.js';
//not GWT import const MotionGestureInput

import { MotionGestureEvent } from '../../../../org/allbinary/input/motion/gesture/observer/MotionGestureEvent.js';
//not GWT import const MotionGestureEvent

//not plain js import { NullUtil } 
const NullUtil = globalThis.org.allbinary.logic.NullUtil;
type NullUtil<T = any, U = any> = typeof NullUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof NullUtil;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
type LogUtil<T = any, U = any> = typeof LogUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof LogUtil;

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
type CommonStrings<T = any, U = any> = typeof CommonStrings extends abstract new (...args: any[]) => infer Instance ? Instance : typeof CommonStrings;

//not plain js import { NullRunnable } 
const NullRunnable = globalThis.org.allbinary.thread.NullRunnable;
type NullRunnable<T = any, U = any> = typeof NullRunnable extends abstract new (...args: any[]) => infer Instance ? Instance : typeof NullRunnable;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDNodeStatsFactory } from './GDNodeStatsFactory.js';
//not GWT import - same folder const GDNodeStatsFactory
import { BaseGDNodeStats } from './BaseGDNodeStats.js';
//not GWT import - same folder const BaseGDNodeStats
import { GDObject } from './GDObject.js';
//not GWT import - same folder const GDObject

export class GDNode
            extends Object
         {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    readonly commonStrings: CommonStrings = CommonStrings.getInstance()!;

    private readonly nodeStatsFactory: BaseGDNodeStats = GDNodeStatsFactory.getInstance()!;

    currentRunnable: Runnable = NullRunnable.getInstance()!;

    private readonly name: number;

public constructor (name: number){

            super();
        this.name= name;
    
this.init();
    
}


    public init(){
}


    public reset(){
this.currentRunnable= NullRunnable.getInstance();
    
}


                //@Throws(Exception.constructor)
            
    public process(): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    
}


    public processExtensionParams(objecArray: any[], intArray: number[], longArray: number[], floatArray: number[]): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    
}


    processStats(){
this.nodeStatsFactory!.push(2, this.name);
    
}


    processStatsE(){
this.nodeStatsFactory!.push(3, this.name);
    
}

processReleased(...args: any[]): any {
   
    if (args.length === 0) return this.processReleased$overload1();
   
    if (args.length === 1) return this.processReleased$overload2(args[0]);
   
    if (args.length === 1) return this.processReleased$overload3(args[0]);
   
   throw new TypeError('No matching overload: processReleased'); }
  
                //@Throws(Exception.constructor)
            
    public processReleased$overload1(): boolean{
this.processReleasedStats();
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    
}

processReleasedStats(...args: any[]): any {
   
    if (args.length === 0) return this.processReleasedStats$overload1();
   
    if (args.length === 1) return this.processReleasedStats$overload2(args[0]);
   
   throw new TypeError('No matching overload: processReleasedStats'); }
  
    processReleasedStats$overload1(){
this.nodeStatsFactory!.push(4, this.name);
    
}


                //@Throws(Exception.constructor)
            
    public processGameKey(gameKeyEvent: GameKeyEvent): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    public processReleased$overload2(gameKeyEvent: GameKeyEvent): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    public processKeyAsInteger(keyAsInteger: Integer): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    public processReleased$overload3(keyAsInteger: Integer): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    public processMotion(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    public processScrolling(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


    processMotionStats(motionGestureEvent: MotionGestureEvent){
this.nodeStatsFactory!.push(5, this.name);
    
}


                //@Throws(Exception.constructor)
            
    public processIndex(index: number): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    processIndexStats(index: number){
this.nodeStatsFactory!.push(6, this.name);
    
}


                //@Throws(Exception.constructor)
            
    public processEnd(){
}


                //@Throws(Exception.constructor)
            
    public processIndexEnd(index: number, createIndex: number){
}


                //@Throws(Exception.constructor)
            
    processEndStats(){
this.nodeStatsFactory!.push(7, this.name);
    
}


                //@Throws(Exception.constructor)
            
    public processCreate(): boolean{

                        if(true)
                        
                                    throw new RuntimeException();
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    
}


                //@Throws(Exception.constructor)
            
    public processCreateWithGDObject(gdObject: Object): boolean{

                        if(true)
                        
                                    throw new RuntimeException();
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    
}


                //@Throws(Exception.constructor)
            
    public processCreateByName(gdObject: GDObject, createString: string, createIndex: number): boolean{

                        if(true)
                        
                                    throw new RuntimeException();
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    
}


                //@Throws(Exception.constructor)
            
    public processCreateGD(gameLayerArray: GDGameLayer[]): boolean{

                        if(true)
                        
                                    throw new RuntimeException();
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    
}


    processCreateStats(gdObject: GDObject){
this.nodeStatsFactory!.push(10, this.name);
    
}


    processReleasedStats$overload2(gdObject: GDObject){
this.nodeStatsFactory!.push(11, this.name);
    
}


                //@Throws(Exception.constructor)
            
    public processGD(gameLayerArray: GDGameLayer[]): boolean{
this.processGDStats(gameLayerArray);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


    processGDStats(gameLayerArray: GDGameLayer[]){
this.nodeStatsFactory!.push(14, this.name);
    
}


    public processGDGameLayer(gameLayer: GDGameLayer, x: number, y: number){



                            throw new RuntimeException();
                    
}


    public processGDObject(gdObject: Object, x: number, y: number){



                            throw new RuntimeException();
                    
}


                //@Throws(Exception.constructor)
            
    public processSub(){



                            throw new RuntimeException();
                    
}


                //@Throws(Exception.constructor)
            
    public processMotionSub(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput){



                            throw new RuntimeException();
                    
}


                //@Throws(Exception.constructor)
            
    public processArraySub(gameLayerArray: GDGameLayer[]){



                            throw new RuntimeException();
                    
}


                //@Throws(Exception.constructor)
            
    public processC(): boolean{



                            throw new RuntimeException();
                    
}


    public getReturnValue(): any{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return NullUtil.getInstance()!.NULL_OBJECT;
    
}


    public getName(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.name;
    
}


}


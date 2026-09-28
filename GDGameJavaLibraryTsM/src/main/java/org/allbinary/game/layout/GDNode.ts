
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

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { NullRunnable } 
const NullRunnable = globalThis.org.allbinary.thread.NullRunnable;

















                                        
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


    public process(objecArray: any[], intArray: number[], longArray: number[], floatArray: number[]): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    
}


    processStats(){
this.nodeStatsFactory!.push(2, this.name);
    
}


    processStatsE(){
this.nodeStatsFactory!.push(3, this.name);
    
}


                //@Throws(Exception.constructor)
            
    public processReleased(): boolean{
this.processReleasedStats();
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    
}


    processReleasedStats(){
this.nodeStatsFactory!.push(4, this.name);
    
}


                //@Throws(Exception.constructor)
            
    public process(gameKeyEvent: GameKeyEvent): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    public processReleased(gameKeyEvent: GameKeyEvent): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    public process(keyAsInteger: Integer): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    public processReleased(keyAsInteger: Integer): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    public process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    public processScrolling(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


    processStats(motionGestureEvent: MotionGestureEvent){
this.nodeStatsFactory!.push(5, this.name);
    
}


                //@Throws(Exception.constructor)
            
    public process(index: number): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    processStats(index: number){
this.nodeStatsFactory!.push(6, this.name);
    
}


                //@Throws(Exception.constructor)
            
    public processEnd(){
}


                //@Throws(Exception.constructor)
            
    public processEnd(index: number, createIndex: number){
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


    processReleasedStats(gdObject: GDObject){
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


    public getReturnValue(): any{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return NullUtil.getInstance()!.NULL_OBJECT;
    
}


    public getName(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.name;
    
}


}




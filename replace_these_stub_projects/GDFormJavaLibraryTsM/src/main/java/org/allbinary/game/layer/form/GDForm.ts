
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../java/lang/Object.js';
        
            import { Exception } from '../../../../../java/lang/Exception.js';
        
            import { Integer } from '../../../../../java/lang/Integer.js';
        
import { DownKeyEventListenerInterface } from '../../../../../org/allbinary/game/input/event/DownKeyEventListenerInterface.js';
//not GWT import const DownKeyEventListenerInterface

import { GameKeyEvent } from '../../../../../org/allbinary/game/input/event/GameKeyEvent.js';
//not GWT import const GameKeyEvent

import { RawKeyEventListener } from '../../../../../org/allbinary/game/input/event/RawKeyEventListener.js';
//not GWT import const RawKeyEventListener

import { GDGameLayer } from '../../../../../org/allbinary/game/layer/GDGameLayer.js';
//not GWT import const GDGameLayer

import { MotionGestureEvent } from '../../../../../org/allbinary/input/motion/gesture/observer/MotionGestureEvent.js';
//not GWT import const MotionGestureEvent

import { AllBinaryEventObject } from '../../../../../org/allbinary/logic/util/event/AllBinaryEventObject.js';
//not GWT import const AllBinaryEventObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameLayerItemStateListener } from './GDGameLayerItemStateListener.js';
//not GWT import - same folder const GDGameLayerItemStateListener

export class GDForm
            extends Object
         implements RawKeyEventListener, DownKeyEventListenerInterface {
        

public constructor (){

            super();
        }


    public onEventRaw(keyCode: number, deviceId: number, repeated: boolean){
}


    public submit(){
}


    public open(){
}


    public close(){
}


    public onMotionGestureEvent(motionGestureEvent: MotionGestureEvent){
}


    public onPressGameKeyEvent(gameKeyEvent: GameKeyEvent){
}


    public onDownGameKeyEvent(gameKeyEvent: GameKeyEvent){
}


                //@Throws(Exception.constructor)
            
    public onDownKeyEvent(keyInteger: GameKeyEvent){
}


                //@Throws(Exception.constructor)
            
    public onDownKey(keyInteger: Integer){
}


    public onUpGameKeyEvent(gameKeyEvent: GameKeyEvent){
}


    public onEvent(eventObject: AllBinaryEventObject){
}


    public append(gameLayerAsItem: GDGameLayer): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return  -1;
    
}


    public delete(itemNum: number){
}


    public deleteAll(){
}


    public get(itemNum: number): GDGameLayer{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null;
    
}


    public getHeight(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return  -1;
    
}


    public getWidth(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return  -1;
    
}


    public insert(itemNum: number, gameLayerAsItem: GDGameLayer){
}


    public set(itemNum: number, gameLayerAsItem: GDGameLayer){
}


    public setItemStateListener(iListener: GDGameLayerItemStateListener){
}


    public size(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 0;
    
}


    fireItemStateListener(gameLayerAsItem: GDGameLayer){
}


    fireItemStateListener(){
}


    public hideNotify(){
}


    public keyPressed(keyCode: number){
}


    public keyReleased(keyCode: number){
}


    public keyRepeated(keyCode: number){
}


    public keyPressedByDevice(keyCode: number, deviceId: number){
}


    public keyReleasedByDevice(keyCode: number, deviceId: number){
}


    public showNotify(){
}


    traverse(keyCode: number, top: number, bottom: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return  -1;
    
}


    getTopVisibleIndex(top: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return  -1;
    
}


    getBottomVisibleIndex(bottom: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return  -1;
    
}


    getHeightToItem(itemIndex: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return  -1;
    
}


    public reset(){
}


}




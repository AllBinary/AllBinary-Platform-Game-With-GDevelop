
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

        


            import { Object } from '../../../../../java/lang/Object.js';
        
            import { Exception } from '../../../../../java/lang/Exception.js';
        
            import { Integer } from '../../../../../java/lang/Integer.js';
        
import { KeyInterface } from '../../../../../org/allbinary/game/input/KeyInterface.js';
//not GWT import const KeyInterface

import { DownGameKeyEventListenerInterface } from '../../../../../org/allbinary/game/input/event/DownGameKeyEventListenerInterface.js';
//not GWT import const DownGameKeyEventListenerInterface

import { DownKeyEventListenerInterface } from '../../../../../org/allbinary/game/input/event/DownKeyEventListenerInterface.js';
//not GWT import const DownKeyEventListenerInterface

import { GameKeyEvent } from '../../../../../org/allbinary/game/input/event/GameKeyEvent.js';
//not GWT import const GameKeyEvent

import { GameKeyEventListenerInterface } from '../../../../../org/allbinary/game/input/event/GameKeyEventListenerInterface.js';
//not GWT import const GameKeyEventListenerInterface

import { RawKeyEventListener } from '../../../../../org/allbinary/game/input/event/RawKeyEventListener.js';
//not GWT import const RawKeyEventListener

import { UpGameKeyEventListenerInterface } from '../../../../../org/allbinary/game/input/event/UpGameKeyEventListenerInterface.js';
//not GWT import const UpGameKeyEventListenerInterface

import { BaseMotionGestureEventListener } from '../../../../../org/allbinary/input/motion/gesture/observer/BaseMotionGestureEventListener.js';
//not GWT import const BaseMotionGestureEventListener

import { MotionGestureEvent } from '../../../../../org/allbinary/input/motion/gesture/observer/MotionGestureEvent.js';
//not GWT import const MotionGestureEvent

import { AllBinaryEventObject } from '../../../../../org/allbinary/logic/util/event/AllBinaryEventObject.js';
//not GWT import const AllBinaryEventObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDFormInput
            extends Object
         implements KeyInterface, DownGameKeyEventListenerInterface, BaseMotionGestureEventListener, RawKeyEventListener, DownKeyEventListenerInterface {
        

    public onEventRaw(keyCode: number, deviceId: number, repeated: boolean){
}


    public onEvent(eventObject: AllBinaryEventObject){
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


    public onMotionGestureEvent(motionGestureEvent: MotionGestureEvent){
}


    public onScrolledMotionGestureEvent(motionGestureEvent: MotionGestureEvent){
}


    public keyPressed(keyCode: number){
}


    public keyReleased(keyCode: number){
}


    public keyPressedByDevice(keyCode: number, deviceId: number){
}


    public keyReleasedByDevice(keyCode: number, deviceId: number){
}


    public reset(){
}


}




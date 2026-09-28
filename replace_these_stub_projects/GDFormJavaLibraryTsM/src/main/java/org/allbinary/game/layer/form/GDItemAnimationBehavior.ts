
        /* Generated Code Do Not Modify */

        


import { GameKey } from '../../../../../org/allbinary/game/input/GameKey.js';
//not GWT import const GameKey

import { GameKeyFactory } from '../../../../../org/allbinary/game/input/GameKeyFactory.js';
//not GWT import const GameKeyFactory

import { GDAnimationBehaviorBase } from '../../../../../org/allbinary/game/layer/GDAnimationBehaviorBase.js';
//not GWT import const GDAnimationBehaviorBase

import { MotionGestureEvent } from '../../../../../org/allbinary/input/motion/gesture/observer/MotionGestureEvent.js';
//not GWT import const MotionGestureEvent

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDItemAnimationBehavior extends GDAnimationBehaviorBase {
        

    readonly gameKeyFactory: GameKeyFactory = GameKeyFactory.getInstance()!;

    hasFocus: boolean= false;

    public select(gameKey: GameKey, keyCode: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 0;
    
}


    public onMotionGestureEvent(motionGestureEvent: MotionGestureEvent){
}


    public keyPressed(keyCode: number){
}


    public isFocusable(): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    
}


    public setFocus(hasFocus: boolean){
this.hasFocus= hasFocus;
    
}


    public hasFocus(): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return hasFocus;
    
}


    traverse(gameKeyCode: number, top: number, bottom: number, action: boolean): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 0;
    
}


}




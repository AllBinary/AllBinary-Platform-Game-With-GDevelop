/* Generated Code Do Not Modify */
//not GWT import const GameKey
import { GameKeyFactory } from '../../../../../org/allbinary/game/input/GameKeyFactory.js';
//not GWT import const GameKeyFactory
import { GDAnimationBehaviorBase } from '../../../../../org/allbinary/game/layer/GDAnimationBehaviorBase.js';
//not GWT import const MotionGestureEvent
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDItemAnimationBehavior extends GDAnimationBehaviorBase {
    constructor() {
        super(...arguments);
        this.gameKeyFactory = GameKeyFactory.getInstance();
        this.hasFocus = false;
    }
    select(gameKey, keyCode) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return 0;
    }
    onMotionGestureEvent(motionGestureEvent) {
    }
    keyPressed(keyCode) {
    }
    isFocusable() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return true;
    }
    setFocus(hasFocus) {
        this.hasFocus = hasFocus;
    }
    hasFocus() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return hasFocus;
    }
    traverse(gameKeyCode, top, bottom, action) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return 0;
    }
}

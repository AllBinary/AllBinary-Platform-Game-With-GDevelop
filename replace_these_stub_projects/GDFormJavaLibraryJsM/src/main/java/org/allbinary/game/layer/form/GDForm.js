/* Generated Code Do Not Modify */
import { Object } from '../../../../../java/lang/Object.js';
import { RuntimeException } from '../../../../../java/lang/RuntimeException.js';
//not GWT import - same folder const GDGameLayerItemStateListener
export class GDForm extends Object {
    constructor() {
        super();
    }
    onEventRaw(keyCode, deviceId, repeated) {
    }
    submit() {
    }
    open() {
    }
    close() {
    }
    onMotionGestureEvent(motionGestureEvent) {
    }
    onPressGameKeyEvent(gameKeyEvent) {
    }
    onDownGameKeyEvent(gameKeyEvent) {
    }
    //@Throws(Exception.constructor)
    onDownKeyEvent(keyInteger) {
    }
    //@Throws(Exception.constructor)
    onDownKey(keyInteger) {
    }
    onUpGameKeyEvent(gameKeyEvent) {
    }
    onEvent(eventObject) {
    }
    append(gameLayerAsItem) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return -1;
    }
    delete(itemNum) {
    }
    deleteAll() {
    }
    get(itemNum) {
        throw new RuntimeException();
    }
    getHeight() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return -1;
    }
    getWidth() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return -1;
    }
    insert(itemNum, gameLayerAsItem) {
    }
    set(itemNum, gameLayerAsItem) {
    }
    setItemStateListener(iListener) {
    }
    size() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return 0;
    }
    fireItemStateListener(...args) {
        if (args.length === 1)
            return this.fireItemStateListener$overload1(args[0]);
        if (args.length === 0)
            return this.fireItemStateListener$overload2();
        throw new TypeError('No matching overload: fireItemStateListener');
    }
    fireItemStateListener$overload1(gameLayerAsItem) {
    }
    fireItemStateListener$overload2() {
    }
    hideNotify() {
    }
    keyPressed(keyCode) {
    }
    keyReleased(keyCode) {
    }
    keyRepeated(keyCode) {
    }
    keyPressedByDevice(keyCode, deviceId) {
    }
    keyReleasedByDevice(keyCode, deviceId) {
    }
    showNotify() {
    }
    traverse(keyCode, top, bottom) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return -1;
    }
    getTopVisibleIndex(top) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return -1;
    }
    getBottomVisibleIndex(bottom) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return -1;
    }
    getHeightToItem(itemIndex) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return -1;
    }
    reset() {
    }
}

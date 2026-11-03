/*
        *
        *  AllBinary Open License Version 1
        *  Copyright (c) 2026 AllBinary
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
import { Math } from '../../../../java/lang/Math.js';
import { Float } from '../../../../java/lang/Float.js';
import { GameGlobalsFactory } from '../../../../org/allbinary/canvas/GameGlobalsFactory.js';
//not GWT import const GDStructure
//not plain js import { MyRandomFactory } 
const MyRandomFactory = globalThis.org.allbinary.game.rand.MyRandomFactory;
import { GameTickDisplayInfoSingleton } from '../../../../org/allbinary/graphics/displayable/GameTickDisplayInfoSingleton.js';
//not GWT import const GameTickDisplayInfoSingleton
import { SmallIntegerSingletonFactory } from '../../../../org/allbinary/logic/math/SmallIntegerSingletonFactory.js';
//not GWT import const SmallIntegerSingletonFactory
//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;
import { GameTickTimeDelayHelper } from '../../../../org/allbinary/time/GameTickTimeDelayHelper.js';
//not GWT import const TimeDelayHelper
//Current folder imports from return types, extended types, and scope (deduplicated)
export class GDUtil extends Object {
    constructor() {
        super(...arguments);
        this.commonSeps = CommonSeps.getInstance();
        this.smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        this.randomFactory = MyRandomFactory.getInstance();
        this.gameGlobalsFactory = GameGlobalsFactory.getInstance();
        this.gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();
        this.globalsGameTickTimeDelayHelper = new GameTickTimeDelayHelper(Date.now());
        this.fStringMaker = new StringMaker();
    }
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDUtil.instance;
    }
    TimeDelta() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.globalsGameTickTimeDelayHelper.timeDelta * .001;
    }
    SceneWindowWidth() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.gameTickDisplayInfoSingleton.getLastWidth();
        ;
    }
    SceneWindowHeight() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.gameTickDisplayInfoSingleton.getLastHeight();
        ;
    }
    Random(...args) {
        if (args.length === 1 && typeof args[0] === 'number' && Number.isInteger(args[0]))
            return this.Random$overload1(args[0]);
        if (args.length === 1 && typeof args[0] === 'number' && !Number.isInteger(args[0]))
            return this.Random$overload2(args[0]);
        throw new TypeError('No matching overload: Random');
    }
    Random$overload1(range) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.randomFactory.getAbsoluteNextInt(range + 1);
        ;
    }
    Random$overload2(range) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return (this.randomFactory.getAbsoluteNextInt(globalThis.Math.trunc((range * 1000)))) / 1000;
    }
    RandomFloatInRange(...args) {
        if (args.length === 2 && typeof args[0] === 'number' && typeof args[1] === 'number')
            return this.RandomFloatInRange$overload1(args[0], args[1]);
        if (args.length === 2 && typeof args[0] === 'number' && typeof args[1] === 'number')
            return this.RandomFloatInRange$overload2(args[0], args[1]);
        throw new TypeError('No matching overload: RandomFloatInRange');
    }
    RandomFloatInRange$overload1(min, max) {
        let next = (max - min);
        ;
        let nextF = next * 1000;
        ;
        let nextI = Math.round(nextF);
        ;
        let random = this.randomFactory.getAbsoluteNextInt(nextI);
        ;
        let randomF = random;
        ;
        let result = min + (randomF / 1000);
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return result;
    }
    RandomFloatInRange$overload2(min, max) {
        let nextF = (max - min) * 1000;
        ;
        let nextI = Math.round(nextF);
        ;
        let random = this.randomFactory.getAbsoluteNextInt(nextI);
        ;
        let randomF = random;
        ;
        let result = min + (randomF / 1000);
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return result;
    }
    Variable(...args) {
        if (args.length === 1 && typeof args[0] === 'number' && Number.isInteger(args[0]))
            return this.Variable$overload1(args[0]);
        if (args.length === 1 && typeof args[0] === 'number' && !Number.isInteger(args[0]))
            return this.Variable$overload2(args[0]);
        if (args.length === 1 && typeof args[0] === 'number' && !Number.isInteger(args[0]))
            return this.Variable$overload3(args[0]);
        if (args.length === 1 && typeof args[0] === 'string')
            return this.Variable$overload4(args[0]);
        throw new TypeError('No matching overload: Variable');
    }
    Variable$overload1(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    Variable$overload2(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    Variable$overload3(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    Variable$overload4(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    VariableString(...args) {
        if (args.length === 1 && typeof args[0] === 'string')
            return this.VariableString$overload1(args[0]);
        if (args.length === 1)
            return this.VariableString$overload2(args[0]);
        if (args.length === 1 && typeof args[0] === 'number')
            return this.VariableString$overload3(args[0]);
        throw new TypeError('No matching overload: VariableString');
    }
    VariableString$overload1(string) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return string;
    }
    VariableString$overload2(anyType) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return anyType.toString();
        ;
    }
    VariableString$overload3(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    VariableChildCount(...args) {
        if (args.length === 1)
            return this.VariableChildCount$overload1(args[0]);
        if (args.length === 1)
            return this.VariableChildCount$overload2(args[0]);
        throw new TypeError('No matching overload: VariableChildCount');
    }
    VariableChildCount$overload1(array) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return array.length;
    }
    VariableChildCount$overload2(array) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return array.length;
    }
    GlobalVariable(...args) {
        if (args.length === 1 && typeof args[0] === 'string')
            return this.GlobalVariable$overload1(args[0]);
        if (args.length === 1 && typeof args[0] === 'number' && !Number.isInteger(args[0]))
            return this.GlobalVariable$overload2(args[0]);
        if (args.length === 1 && typeof args[0] === 'number' && Number.isInteger(args[0]))
            return this.GlobalVariable$overload3(args[0]);
        if (args.length === 1 && typeof args[0] === 'number' && Number.isInteger(args[0]))
            return this.GlobalVariable$overload4(args[0]);
        throw new TypeError('No matching overload: GlobalVariable');
    }
    GlobalVariable$overload1(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    GlobalVariable$overload2(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    GlobalVariable$overload3(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    GlobalVariable$overload4(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    GlobalVariableString(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    GlobalVariableChildCount(...args) {
        if (args.length === 1)
            return this.GlobalVariableChildCount$overload1(args[0]);
        if (args.length === 1)
            return this.GlobalVariableChildCount$overload2(args[0]);
        if (args.length === 1)
            return this.GlobalVariableChildCount$overload3(args[0]);
        throw new TypeError('No matching overload: GlobalVariableChildCount');
    }
    GlobalVariableChildCount$overload1(array) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return array.length;
    }
    GlobalVariableChildCount$overload2(array) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return array.length;
    }
    GlobalVariableChildCount$overload3(array) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return array.length;
    }
    GlobalVarToJSON(...args) {
        if (args.length === 1 && typeof args[0] === 'string')
            return this.GlobalVarToJSON$overload1(args[0]);
        if (args.length === 1 && typeof args[0] === 'number')
            return this.GlobalVarToJSON$overload2(args[0]);
        if (args.length === 1 && typeof args[0] === 'number')
            return this.GlobalVarToJSON$overload3(args[0]);
        throw new TypeError('No matching overload: GlobalVarToJSON');
    }
    GlobalVarToJSON$overload1(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    GlobalVarToJSON$overload2(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value.toString();
        ;
    }
    GlobalVarToJSON$overload3(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return (value).toString();
        ;
    }
    ToJSONType(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value.getJSONType();
        ;
    }
    ToJSON(...args) {
        if (args.length === 1)
            return this.ToJSON$overload1(args[0]);
        if (args.length === 1 && typeof args[0] === 'string')
            return this.ToJSON$overload2(args[0]);
        if (args.length === 1 && typeof args[0] === 'number')
            return this.ToJSON$overload3(args[0]);
        if (args.length === 1 && typeof args[0] === 'number')
            return this.ToJSON$overload4(args[0]);
        throw new TypeError('No matching overload: ToJSON');
    }
    ToJSON$overload1(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value.toJSONAsString();
        ;
    }
    ToJSON$overload2(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    ToJSON$overload3(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value.toString();
        ;
    }
    ToJSON$overload4(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return (value).toString();
        ;
    }
    SceneInstancesCount(size) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return size;
    }
    MouseX(...args) {
        if (args.length === 0)
            return this.MouseX$overload1();
        if (args.length === 2 && typeof args[0] === 'string' && typeof args[1] === 'number')
            return this.MouseX$overload2(args[0], args[1]);
        throw new TypeError('No matching overload: MouseX');
    }
    MouseX$overload1() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.gameGlobalsFactory.point.getX();
        ;
    }
    MouseY(...args) {
        if (args.length === 0)
            return this.MouseY$overload1();
        if (args.length === 2 && typeof args[0] === 'string' && typeof args[1] === 'number')
            return this.MouseY$overload2(args[0], args[1]);
        throw new TypeError('No matching overload: MouseY');
    }
    MouseY$overload1() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.gameGlobalsFactory.point.getY();
        ;
    }
    MouseX$overload2(string, value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.gameGlobalsFactory.point.getX();
        ;
    }
    MouseY$overload2(string, value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.gameGlobalsFactory.point.getY();
        ;
    }
    CameraX(string, value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return 0;
    }
    CameraY(string, value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return 0;
    }
    CameraWidth(string, value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.gameTickDisplayInfoSingleton.getLastWidth();
        ;
    }
    TimerElapsedTime(timeDelayHelper) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return timeDelayHelper.getElapsed(this.globalsGameTickTimeDelayHelper.lastStartTime) / 1000;
    }
    floor(...args) {
        if (args.length === 1 && typeof args[0] === 'number' && Number.isInteger(args[0]))
            return this.floor$overload1(args[0]);
        if (args.length === 1 && typeof args[0] === 'number' && Number.isInteger(args[0]))
            return this.floor$overload2(args[0]);
        if (args.length === 1 && typeof args[0] === 'number' && !Number.isInteger(args[0]))
            return this.floor$overload3(args[0]);
        throw new TypeError('No matching overload: floor');
    }
    floor$overload1(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    floor$overload2(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    floor$overload3(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return Math.floor(value);
    }
    mod(value, mod) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value % mod;
    }
    round(...args) {
        if (args.length === 1 && typeof args[0] === 'number' && Number.isInteger(args[0]))
            return this.round$overload1(args[0]);
        if (args.length === 1 && typeof args[0] === 'number' && Number.isInteger(args[0]))
            return this.round$overload2(args[0]);
        if (args.length === 1 && typeof args[0] === 'number' && !Number.isInteger(args[0]))
            return this.round$overload3(args[0]);
        throw new TypeError('No matching overload: round');
    }
    round$overload1(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    round$overload2(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    round$overload3(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return Math.round(value);
    }
    abs(...args) {
        if (args.length === 1 && typeof args[0] === 'number' && Number.isInteger(args[0]))
            return this.abs$overload1(args[0]);
        if (args.length === 1 && typeof args[0] === 'number' && !Number.isInteger(args[0]))
            return this.abs$overload2(args[0]);
        throw new TypeError('No matching overload: abs');
    }
    abs$overload1(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return Math.abs(value);
        ;
    }
    abs$overload2(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return Math.abs(value);
        ;
    }
    log2(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return Math.log(value);
        ;
    }
    sin(angle) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return Math.sin(angle);
        ;
    }
    cos(angle) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return Math.cos(angle);
        ;
    }
    min(min, max) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return Math.min(min, max);
        ;
    }
    max(min, max) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return Math.max(min, max);
        ;
    }
    ceil(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return globalThis.Math.trunc(Math.ceil(value));
    }
    ToRad(angdeg) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return angdeg;
    }
    TimeFromStart() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.globalsGameTickTimeDelayHelper.getTimeFromStart() / 100;
    }
    NewLine() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.commonSeps.NEW_LINE;
    }
    LastTouchId() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return 0;
    }
    LastEndedTouchId() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return 0;
    }
    TouchX(touchId, name, unknown) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return 0;
    }
    TouchY(touchId, name, unknown) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return 0;
    }
    ToNumber(string) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return Float.parseFloat(string);
        ;
    }
    StrLength(string) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return string.length;
        ;
    }
    StrFind(string, key) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return string.indexOf(key);
        ;
    }
    StrReplaceAll(string, find, replace) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return string.replace(find, replace);
        ;
    }
    SubStr(string, startIndex, endIndex) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return string.substring(startIndex, endIndex);
        ;
    }
    ToString(...args) {
        if (args.length === 1 && typeof args[0] === 'string')
            return this.ToString$overload1(args[0]);
        if (args.length === 1 && typeof args[0] === 'number' && Number.isInteger(args[0]))
            return this.ToString$overload2(args[0]);
        if (args.length === 1 && typeof args[0] === 'number' && Number.isInteger(args[0]))
            return this.ToString$overload3(args[0]);
        if (args.length === 1 && typeof args[0] === 'number' && !Number.isInteger(args[0]))
            return this.ToString$overload4(args[0]);
        throw new TypeError('No matching overload: ToString');
    }
    ToString$overload1(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
    ToString$overload2(value) {
        if (this.abs(value) > 499) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return value.toString();
            ;
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.smallIntegerSingletonFactory.getString(value);
            ;
        }
    }
    ToString$overload3(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return (value).toString();
        ;
    }
    LargeNumberToString(...args) {
        if (args.length === 1 && typeof args[0] === 'number' && Number.isInteger(args[0]))
            return this.LargeNumberToString$overload1(args[0]);
        if (args.length === 1 && typeof args[0] === 'number' && !Number.isInteger(args[0]))
            return this.LargeNumberToString$overload2(args[0]);
        throw new TypeError('No matching overload: LargeNumberToString');
    }
    LargeNumberToString$overload1(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return (value).toString();
        ;
    }
    LargeNumberToString$overload2(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return (value).toString();
        ;
    }
    ToString$overload4(value) {
        this.fStringMaker.delete(0, this.fStringMaker.length());
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.fStringMaker.appendfloat(value).toString();
        ;
    }
    ToNotString(value) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return value;
    }
}
GDUtil.instance = new GDUtil();


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
        
            import { System } from '../../../../java/lang/System.js';
        
            import { Math } from '../../../../java/lang/Math.js';
        
            import { Integer } from '../../../../java/lang/Integer.js';
        
            import { Long } from '../../../../java/lang/Long.js';
        
            import { Float } from '../../../../java/lang/Float.js';
        
import { GameGlobalsFactory } from '../../../../org/allbinary/canvas/GameGlobalsFactory.js';
//not GWT import const GameGlobalsFactory

import { GDStructure } from '../../../../org/allbinary/game/configuration/persistance/GDStructure.js';
//not GWT import const GDStructure

//not plain js import { MyRandomFactory } 
const MyRandomFactory = globalThis.org.allbinary.game.rand.MyRandomFactory;
type MyRandomFactory<T = any, U = any> = typeof MyRandomFactory extends abstract new (...args: any[]) => infer Instance ? Instance : typeof MyRandomFactory;

import { GameTickDisplayInfoSingleton } from '../../../../org/allbinary/graphics/displayable/GameTickDisplayInfoSingleton.js';
//not GWT import const GameTickDisplayInfoSingleton

import { SmallIntegerSingletonFactory } from '../../../../org/allbinary/logic/math/SmallIntegerSingletonFactory.js';
//not GWT import const SmallIntegerSingletonFactory

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
type StringMaker<T = any, U = any> = typeof StringMaker extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringMaker;

//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;
type CommonSeps<T = any, U = any> = typeof CommonSeps extends abstract new (...args: any[]) => infer Instance ? Instance : typeof CommonSeps;

import { GameTickTimeDelayHelper } from '../../../../org/allbinary/time/GameTickTimeDelayHelper.js';
//not GWT import const GameTickTimeDelayHelper

import { TimeDelayHelper } from '../../../../org/allbinary/time/TimeDelayHelper.js';
//not GWT import const TimeDelayHelper

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDUtil
            extends Object
         {
        

    private static readonly instance: GDUtil = new GDUtil();

    public static getInstance(): GDUtil{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance;
    
}


    private readonly commonSeps: CommonSeps = CommonSeps.getInstance()!;

    private readonly smallIntegerSingletonFactory: SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()!;

    private readonly randomFactory: MyRandomFactory = MyRandomFactory.getInstance()!;

    private readonly gameGlobalsFactory: GameGlobalsFactory = GameGlobalsFactory.getInstance()!;

    private readonly gameTickDisplayInfoSingleton: GameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance()!;

    public readonly globalsGameTickTimeDelayHelper: GameTickTimeDelayHelper = new GameTickTimeDelayHelper(Date.now());

    public TimeDelta(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.globalsGameTickTimeDelayHelper!.timeDelta *.001;
    
}


    public SceneWindowWidth(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gameTickDisplayInfoSingleton!.getLastWidth();;
    
}


    public SceneWindowHeight(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gameTickDisplayInfoSingleton!.getLastHeight();;
    
}

Random(...args: any[]): any {
   
   
    if (args.length === 1 && typeof args[0] === 'number') return this.Random$overload1(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.Random$overload2(args[0]);
   
   throw new TypeError('No matching overload: Random'); }
  
    public Random$overload1(range: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.randomFactory!.getAbsoluteNextInt(range +1);;
    
}


    public Random$overload2(range: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return (this.randomFactory!.getAbsoluteNextInt(globalThis.Math.trunc((range *1000)))) /1000;
    
}

RandomFloatInRange(...args: any[]): any {
   
   
    if (args.length === 2 && typeof args[0] === 'number' && typeof args[1] === 'number') return this.RandomFloatInRange$overload1(args[0], args[1]);
   
    if (args.length === 2 && typeof args[0] === 'number' && typeof args[1] === 'number') return this.RandomFloatInRange$overload2(args[0], args[1]);
   
   throw new TypeError('No matching overload: RandomFloatInRange'); }
  
    public RandomFloatInRange$overload1(min: number, max: number): number{

    let next: number = (max -min);;
    

    let nextF: number = next *1000;;
    

    let nextI: number = Math.round(nextF)!;;
    

    let random: number = this.randomFactory!.getAbsoluteNextInt(nextI)!;;
    

    let randomF: number = random;;
    

    let result: number = min +(randomF /1000);;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return result;
    
}


    public RandomFloatInRange$overload2(min: number, max: number): number{

    let nextF: number = (max -min) *1000;;
    

    let nextI: number = Math.round(nextF)!;;
    

    let random: number = this.randomFactory!.getAbsoluteNextInt(nextI)!;;
    

    let randomF: number = random;;
    

    let result: number = min +(randomF /1000);;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return result;
    
}

Variable(...args: any[]): any {
   
   
    if (args.length === 1 && typeof args[0] === 'number') return this.Variable$overload1(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.Variable$overload2(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.Variable$overload3(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'string') return this.Variable$overload4(args[0]);
   
   throw new TypeError('No matching overload: Variable'); }
  
    public Variable$overload1(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public Variable$overload2(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public Variable$overload3(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public Variable$overload4(value: string): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}

VariableString(...args: any[]): any {
   
   
    if (args.length === 1 && typeof args[0] === 'string') return this.VariableString$overload1(args[0]);
   
    if (args.length === 1) return this.VariableString$overload2(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.VariableString$overload3(args[0]);
   
   throw new TypeError('No matching overload: VariableString'); }
  
    public VariableString$overload1(string: string): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return string;
    
}


    public VariableString$overload2(anyType: any): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return anyType!.toString();;
    
}


    public VariableString$overload3(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}

VariableChildCount(...args: any[]): any {
   
   
    if (args.length === 1) return this.VariableChildCount$overload1(args[0]);
   
    if (args.length === 1) return this.VariableChildCount$overload2(args[0]);
   
   throw new TypeError('No matching overload: VariableChildCount'); }
  
    public VariableChildCount$overload1(array: string[]): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return array.length;
    
}


    public VariableChildCount$overload2(array: number[]): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return array.length;
    
}

GlobalVariable(...args: any[]): any {
   
   
    if (args.length === 1 && typeof args[0] === 'string') return this.GlobalVariable$overload1(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.GlobalVariable$overload2(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.GlobalVariable$overload3(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.GlobalVariable$overload4(args[0]);
   
   throw new TypeError('No matching overload: GlobalVariable'); }
  
    public GlobalVariable$overload1(value: string): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public GlobalVariable$overload2(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public GlobalVariable$overload3(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public GlobalVariable$overload4(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public GlobalVariableString(value: string): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}

GlobalVariableChildCount(...args: any[]): any {
   
   
    if (args.length === 1) return this.GlobalVariableChildCount$overload1(args[0]);
   
    if (args.length === 1) return this.GlobalVariableChildCount$overload2(args[0]);
   
    if (args.length === 1) return this.GlobalVariableChildCount$overload3(args[0]);
   
   throw new TypeError('No matching overload: GlobalVariableChildCount'); }
  
    public GlobalVariableChildCount$overload1(array: string[]): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return array.length;
    
}


    public GlobalVariableChildCount$overload2(array: number[]): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return array.length;
    
}


    public GlobalVariableChildCount$overload3(array: number[]): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return array.length;
    
}

GlobalVarToJSON(...args: any[]): any {
   
   
    if (args.length === 1 && typeof args[0] === 'string') return this.GlobalVarToJSON$overload1(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.GlobalVarToJSON$overload2(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.GlobalVarToJSON$overload3(args[0]);
   
   throw new TypeError('No matching overload: GlobalVarToJSON'); }
  
    public GlobalVarToJSON$overload1(value: string): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public GlobalVarToJSON$overload2(value: number): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value.toString();;
    
}


    public GlobalVarToJSON$overload3(value: number): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return (value).toString();;
    
}


    public ToJSONType(value: GDStructure): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value.getJSONType();;
    
}

ToJSON(...args: any[]): any {
   
   
    if (args.length === 1) return this.ToJSON$overload1(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'string') return this.ToJSON$overload2(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.ToJSON$overload3(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.ToJSON$overload4(args[0]);
   
   throw new TypeError('No matching overload: ToJSON'); }
  
    public ToJSON$overload1(value: GDStructure): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value.toJSONAsString();;
    
}


    public ToJSON$overload2(value: string): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public ToJSON$overload3(value: number): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value.toString();;
    
}


    public ToJSON$overload4(value: number): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return (value).toString();;
    
}


    public SceneInstancesCount(size: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return size;
    
}

MouseX(...args: any[]): any {
   
   
    if (args.length === 0) return this.MouseX$overload1();
   
    if (args.length === 2 && typeof args[0] === 'string' && typeof args[1] === 'number') return this.MouseX$overload2(args[0], args[1]);
   
   throw new TypeError('No matching overload: MouseX'); }
  
    public MouseX$overload1(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gameGlobalsFactory!.point.getX();;
    
}

MouseY(...args: any[]): any {
   
   
    if (args.length === 0) return this.MouseY$overload1();
   
    if (args.length === 2 && typeof args[0] === 'string' && typeof args[1] === 'number') return this.MouseY$overload2(args[0], args[1]);
   
   throw new TypeError('No matching overload: MouseY'); }
  
    public MouseY$overload1(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gameGlobalsFactory!.point.getY();;
    
}


    public MouseX$overload2(string: string, value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gameGlobalsFactory!.point.getX();;
    
}


    public MouseY$overload2(string: string, value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gameGlobalsFactory!.point.getY();;
    
}


    public CameraX(string: string, value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 0;
    
}


    public CameraY(string: string, value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 0;
    
}


    public CameraWidth(string: string, value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gameTickDisplayInfoSingleton!.getLastWidth();;
    
}


    public TimerElapsedTime(timeDelayHelper: TimeDelayHelper): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return timeDelayHelper!.getElapsed(this.globalsGameTickTimeDelayHelper!.lastStartTime) /1000;
    
}

floor(...args: any[]): any {
   
   
    if (args.length === 1 && typeof args[0] === 'number') return this.floor$overload1(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.floor$overload2(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.floor$overload3(args[0]);
   
   throw new TypeError('No matching overload: floor'); }
  
    public floor$overload1(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public floor$overload2(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public floor$overload3(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Math.floor(value);
    
}


    public mod(value: number, mod: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value % mod;
    
}

round(...args: any[]): any {
   
   
    if (args.length === 1 && typeof args[0] === 'number') return this.round$overload1(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.round$overload2(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.round$overload3(args[0]);
   
   throw new TypeError('No matching overload: round'); }
  
    public round$overload1(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public round$overload2(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public round$overload3(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Math.round(value);
    
}

abs(...args: any[]): any {
   
   
    if (args.length === 1 && typeof args[0] === 'number') return this.abs$overload1(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.abs$overload2(args[0]);
   
   throw new TypeError('No matching overload: abs'); }
  
    public abs$overload1(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Math.abs(value);;
    
}


    public abs$overload2(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Math.abs(value);;
    
}


    public log2(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Math.log(value);;
    
}


    public sin(angle: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Math.sin(angle);;
    
}


    public cos(angle: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Math.cos(angle);;
    
}


    public min(min: number, max: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Math.min(min, max);;
    
}


    public max(min: number, max: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Math.max(min, max);;
    
}


    public ceil(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return globalThis.Math.trunc(Math.ceil(value));
    
}


    public ToRad(angdeg: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return angdeg;
    
}


    public TimeFromStart(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.globalsGameTickTimeDelayHelper!.getTimeFromStart() /100;
    
}


    public NewLine(): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.commonSeps!.NEW_LINE;
    
}


    public LastTouchId(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 0;
    
}


    public LastEndedTouchId(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 0;
    
}


    public TouchX(touchId: number, name: string, unknown: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 0;
    
}


    public TouchY(touchId: number, name: string, unknown: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 0;
    
}


    public ToNumber(string: string): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Float.parseFloat(string);;
    
}


    public StrLength(string: string): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return string.length;;
    
}


    public StrFind(string: string, key: string): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return string.indexOf(key);;
    
}


    public StrReplaceAll(string: string, find: string, replace: string): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return string.replace(find, replace);;
    
}


    public SubStr(string: string, startIndex: number, endIndex: number): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return string.substring(startIndex, endIndex);;
    
}

ToString(...args: any[]): any {
   
   
    if (args.length === 1 && typeof args[0] === 'string') return this.ToString$overload1(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.ToString$overload2(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.ToString$overload3(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.ToString$overload4(args[0]);
   
   throw new TypeError('No matching overload: ToString'); }
  
    public ToString$overload1(value: string): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public ToString$overload2(value: number): string{

                        if(this.abs(value) > 499)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value.toString();;
    

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.smallIntegerSingletonFactory!.getString(value);;
    

                        }
                            
}


    public ToString$overload3(value: number): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return (value).toString();;
    
}

LargeNumberToString(...args: any[]): any {
   
   
    if (args.length === 1 && typeof args[0] === 'number') return this.LargeNumberToString$overload1(args[0]);
   
    if (args.length === 1 && typeof args[0] === 'number') return this.LargeNumberToString$overload2(args[0]);
   
   throw new TypeError('No matching overload: LargeNumberToString'); }
  
    public LargeNumberToString$overload1(value: number): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return (value).toString();;
    
}


    public LargeNumberToString$overload2(value: number): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return (value).toString();;
    
}


    private readonly fStringMaker: StringMaker = new StringMaker();

    public ToString$overload4(value: number): string{
this.fStringMaker!.delete(0, this.fStringMaker!.length());
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.fStringMaker!.appendfloat(value)!.toString();;
    
}


    public ToNotString(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


}



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

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
import { AnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/AnimationInterfaceFactoryInterface.js';
//not GWT import const AnimationInterfaceFactoryInterface

import { IndexedAnimation } from '../../../../org/allbinary/animation/IndexedAnimation.js';
//not GWT import const IndexedAnimation

import { NullRotationAnimationFactory } from '../../../../org/allbinary/animation/NullRotationAnimationFactory.js';
//not GWT import const NullRotationAnimationFactory

import { RotationAnimation } from '../../../../org/allbinary/animation/RotationAnimation.js';
//not GWT import const RotationAnimation

import { GDObject } from '../../../../org/allbinary/game/layout/GDObject.js';
//not GWT import const GDObject

import { GraphicsStrings } from '../../../../org/allbinary/graphics/GraphicsStrings.js';
//not GWT import const GraphicsStrings

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
type CommonStrings<T = any, U = any> = typeof CommonStrings extends abstract new (...args: any[]) => infer Instance ? Instance : typeof CommonStrings;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
type StringMaker<T = any, U = any> = typeof StringMaker extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringMaker;

import { FrameUtil } from '../../../../org/allbinary/math/FrameUtil.js';
//not GWT import const FrameUtil

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDAnimationBehaviorBase } from './GDAnimationBehaviorBase.js';
//not GWT import - same folder const GDAnimationBehaviorBase
import { GDGameLayer } from './GDGameLayer.js';
//not GWT import - same folder const GDGameLayer

export class GDRotationBehavior extends GDAnimationBehaviorBase {
        

    readonly frameUtil: FrameUtil = FrameUtil.getInstance()!;

    public rotationAnimationInterfaceArrayP: RotationAnimation[] = NullRotationAnimationFactory.getFactoryInstance()!.NULL_ROTATION_ANIMATION_ARRAY;

    public init(gdObject: GDObject, animationInterfaceFactoryInterfaceArray: AnimationInterfaceFactoryInterface[]): IndexedAnimation[]{

    let size: number = animationInterfaceFactoryInterfaceArray!.length
                ;;
    

    let initIndexedAnimationInterfaceArray: RotationAnimation[] = new Array(size);;
    




                        for (
    let index: number = 0;index < size; index++)
        {

 try { initIndexedAnimationInterfaceArray[index]= animationInterfaceFactoryInterfaceArray[index]!.getInstance(0) as RotationAnimation;
    
 }
 catch (caught: any) {
 {
  const e = caught;
  

    let commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    
this.logUtil!.put(new StringMaker().append(animationInterfaceFactoryInterfaceArray[index]!.toString())!.append(" index: ")!.appendint(index)!.toString(), this, commonStrings!.CONSTRUCTOR, e);
    
this.logUtil!.put(gdObject!.toString(), this, commonStrings!.CONSTRUCTOR, e);
    

 }
   }
 
}

this.rotationAnimationInterfaceArrayP= initIndexedAnimationInterfaceArray;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return initIndexedAnimationInterfaceArray;
    
}


    public setAnimationArray(rotationAnimationInterfaceArray: IndexedAnimation[]){
this.rotationAnimationInterfaceArrayP= rotationAnimationInterfaceArray as RotationAnimation[];
    
}


    public getRotationAnimationInterfaceArray(): RotationAnimation[]{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.rotationAnimationInterfaceArrayP;
    
}


                //@Throws(Exception.constructor)
            
    public set(gameLayer: GDGameLayer, gdObject: GDObject){

    let size: number = this.rotationAnimationInterfaceArrayP!.length
                ;;
    




                        for (
    let index: number = 0;index < size; index++)
        {
this.rotationAnimationInterfaceArrayP[index]!.setFrame(this.frameUtil!.getFrameForAngle(0, 1));
    
}

}


    public setRotation(gameLayer: GDGameLayer, angleAdjustment: number){

    let gdObject: GDObject = gameLayer!.gdObject;;
    

    let rotationAnimation: RotationAnimation;;
    
rotationAnimation= this.rotationAnimationInterfaceArrayP[gdObject!.animation]!;
    

                        if(angleAdjustment > 0)
                        
                                    {
                                    
    let value: number = angleAdjustment;;
    

        while(value > 0)
        {
rotationAnimation!.nextRotation();
    
value--;
    
}


                                    }
                                
                        else {
                            
    let value: number = angleAdjustment;;
    

        while(value < 0)
        {
rotationAnimation!.previousRotation();
    
value++;
    
}


                        }
                            
}


    public toString(gdObject: GDObject, stringBuffer: StringMaker){

    let rotationAnimation: RotationAnimation = this.rotationAnimationInterfaceArrayP[gdObject!.animation]!;;
    
stringBuffer!.append(GraphicsStrings.getInstance()!.ANGLE)!.appendint(rotationAnimation!.getAngleInfoP()!.getAngle());
    
}


}


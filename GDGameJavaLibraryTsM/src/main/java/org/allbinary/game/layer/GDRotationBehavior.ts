
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

import { RotationAnimation } from '../../../../org/allbinary/animation/RotationAnimation.js';
//not GWT import const RotationAnimation

import { GDObject } from '../../../../org/allbinary/game/layout/GDObject.js';
//not GWT import const GDObject

import { GraphicsStrings } from '../../../../org/allbinary/graphics/GraphicsStrings.js';
//not GWT import const GraphicsStrings

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { FrameUtil } from '../../../../org/allbinary/math/FrameUtil.js';
//not GWT import const FrameUtil

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDAnimationBehaviorBase } from './GDAnimationBehaviorBase.js';
//not GWT import - same folder const GDAnimationBehaviorBase
import { GDGameLayer } from './GDGameLayer.js';
//not GWT import - same folder const GDGameLayer

export class GDRotationBehavior extends GDAnimationBehaviorBase {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    readonly frameUtil: FrameUtil = FrameUtil.getInstance()!;

    public rotationAnimationInterfaceArray: RotationAnimation[];

    public init(gdObject: GDObject, animationInterfaceFactoryInterfaceArray: AnimationInterfaceFactoryInterface[]): IndexedAnimation[]{

    var size: number = animationInterfaceFactoryInterfaceArray!.length
                ;;
    

    var initIndexedAnimationInterfaceArray: RotationAnimation[] = new Array(size);;
    




                        for (
    var index: number = 0;index < size; index++)
        {

        try {
            initIndexedAnimationInterfaceArray[index]= animationInterfaceFactoryInterfaceArray[index]!.getInstance(0) as RotationAnimation;
    

                //: 
} catch(e) 
            {

    var commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    
this.logUtil!.put(new StringMaker().append(animationInterfaceFactoryInterfaceArray[index]!.toString())!.append(" index: ")!.appendint(index)!.toString(), this, commonStrings!.CONSTRUCTOR, e);
    
this.logUtil!.put(gdObject!.toString(), this, commonStrings!.CONSTRUCTOR, e);
    
}

}

this.rotationAnimationInterfaceArray= initIndexedAnimationInterfaceArray;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return initIndexedAnimationInterfaceArray;
    
}


    public setAnimationArray(rotationAnimationInterfaceArray: IndexedAnimation[]){
this.rotationAnimationInterfaceArray= rotationAnimationInterfaceArray as RotationAnimation[];
    
}


    public getRotationAnimationInterfaceArray(): RotationAnimation[]{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.rotationAnimationInterfaceArray;
    
}


                //@Throws(Exception.constructor)
            
    public set(gameLayer: GDGameLayer, gdObject: GDObject){

    var size: number = this.rotationAnimationInterfaceArray!.length
                ;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
this.rotationAnimationInterfaceArray[index]!.setFrame(this.frameUtil!.getFrameForAngle(0, 1));
    
}

}


    public setRotation(gameLayer: GDGameLayer, angleAdjustment: number){

    var gdObject: GDObject = gameLayer!.gdObject;;
    

    var rotationAnimation: RotationAnimation;;
    
rotationAnimation= this.rotationAnimationInterfaceArray[gdObject!.animation]!;
    

                        if(angleAdjustment > 0)
                        
                                    {
                                    
    var value: number = angleAdjustment;;
    

        while(value > 0)
        {
rotationAnimation!.nextRotation();
    
value--;
    
}


                                    }
                                
                        else {
                            
    var value: number = angleAdjustment;;
    

        while(value < 0)
        {
rotationAnimation!.previousRotation();
    
value++;
    
}


                        }
                            
}


    public toString(gdObject: GDObject, stringBuffer: StringMaker){

    var rotationAnimation: RotationAnimation = this.rotationAnimationInterfaceArray[gdObject!.animation]!;;
    
stringBuffer!.append(GraphicsStrings.getInstance()!.ANGLE)!.appendint(rotationAnimation!.getAngleInfoP()!.getAngle());
    
}


}




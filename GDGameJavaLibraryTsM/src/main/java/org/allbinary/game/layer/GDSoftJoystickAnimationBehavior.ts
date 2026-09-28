
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2025 AllBinary 
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
        
import { Animation } from '../../../../org/allbinary/animation/Animation.js';
//not GWT import const Animation

import { AnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/AnimationInterfaceFactoryInterface.js';
//not GWT import const AnimationInterfaceFactoryInterface

import { IndexedAnimation } from '../../../../org/allbinary/animation/IndexedAnimation.js';
//not GWT import const IndexedAnimation

import { SimultaneousCompoundIndexedAnimation } from '../../../../org/allbinary/animation/compound/SimultaneousCompoundIndexedAnimation.js';
//not GWT import const SimultaneousCompoundIndexedAnimation

import { GDObject } from '../../../../org/allbinary/game/layout/GDObject.js';
//not GWT import const GDObject

import { GPoint } from '../../../../org/allbinary/graphics/GPoint.js';
//not GWT import const GPoint

import { PointFactory } from '../../../../org/allbinary/graphics/PointFactory.js';
//not GWT import const PointFactory

import { TouchMotionGestureFactory } from '../../../../org/allbinary/input/motion/gesture/TouchMotionGestureFactory.js';
//not GWT import const TouchMotionGestureFactory

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDAnimationBehaviorBase } from './GDAnimationBehaviorBase.js';
//not GWT import - same folder const GDAnimationBehaviorBase
import { SoftJoystickInterface } from './SoftJoystickInterface.js';
//not GWT import - same folder const SoftJoystickInterface
import { GDGameLayer } from './GDGameLayer.js';
//not GWT import - same folder const GDGameLayer

export class GDSoftJoystickAnimationBehavior extends GDAnimationBehaviorBase {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly touchMotionGestureFactory: TouchMotionGestureFactory = TouchMotionGestureFactory.getInstance()!;

    private initialX: number= 0;

    private initialY: number= 0;

    public init(gdObject: GDObject, animationInterfaceFactoryInterfaceArray: AnimationInterfaceFactoryInterface[]): IndexedAnimation[]{

    var indexedAnimationArray: IndexedAnimation[] = super.init(gdObject, animationInterfaceFactoryInterfaceArray)!;;
    

    var simultaneousCompoundIndexedAnimation: SimultaneousCompoundIndexedAnimation = indexedAnimationArray[0]! as SimultaneousCompoundIndexedAnimation;;
    

    var animation: Animation = simultaneousCompoundIndexedAnimation!.getAnimationInterfaceArray()[1]!;;
    
this.initialX= animation.getDx();
    
this.initialY= animation.getDy();
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return indexedAnimationArray;
    
}


                //@Throws(Exception.constructor)
            
    public set(gameLayer: GDGameLayer, gdObject: GDObject){

    var simultaneousCompoundIndexedAnimation: SimultaneousCompoundIndexedAnimation = gameLayer!.getIndexedAnimationInterfaceArray()[0]! as SimultaneousCompoundIndexedAnimation;;
    

    var animation: Animation = simultaneousCompoundIndexedAnimation!.getAnimationInterfaceArray()[1]!;;
    

    var softJoystickInterface: SoftJoystickInterface = gdObject as SoftJoystickInterface;;
    

    var point: GPoint = softJoystickInterface!.getPoint()!;;
    

                        if(point == PointFactory.getInstance()!.ZERO_ZERO)
                        
                                    {
                                    animation.setDx(this.initialX);
    
animation.setDy(this.initialY);
    

                                    }
                                
                        else {
                            animation.setDx(point.getX() -gameLayer!.getXP() -(gameLayer!.getWidth()>>2));
    
animation.setDy(point.getY() -gameLayer!.getYP() -(gameLayer!.getHeight()>>2));
    

                        }
                            
}


}




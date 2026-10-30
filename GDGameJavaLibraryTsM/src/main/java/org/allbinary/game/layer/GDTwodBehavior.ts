
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

        


            import { Object } from '../../../../java/lang/Object.js';
        
            import { Exception } from '../../../../java/lang/Exception.js';
        
import { RotationAnimation } from '../../../../org/allbinary/animation/RotationAnimation.js';
//not GWT import const RotationAnimation

import { GDObject } from '../../../../org/allbinary/game/layout/GDObject.js';
//not GWT import const GDObject

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
type LogUtil<T = any, U = any> = typeof LogUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof LogUtil;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
type StringMaker<T = any, U = any> = typeof StringMaker extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringMaker;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDAnimationBehaviorBase } from './GDAnimationBehaviorBase.js';
//not GWT import - same folder const GDAnimationBehaviorBase
import { GDGameLayer } from './GDGameLayer.js';
//not GWT import - same folder const GDGameLayer

export class GDTwodBehavior
            extends Object
         {
        

    private readonly animationBehavior: GDAnimationBehaviorBase;

    private rotationRemainder: number= 0.0;

public constructor (animationBehavior: GDAnimationBehaviorBase){

            super();
        this.animationBehavior= animationBehavior;
    
}


    public process(gdObject: GDObject, rotationAnimation: RotationAnimation){
}


                //@Throws(Exception.constructor)
            
    public reset(gameLayer: GDGameLayer, gdObject: GDObject){
this.rotationRemainder= 0;
    
this.animationBehavior!.set(gameLayer, gdObject);
    
}


    public updateRotation(gameLayer: GDGameLayer, timeDelta: number){

    let gdObject: GDObject = gameLayer!.gdObject;;
    

    let newPortion: number = (gdObject!.rotationP *timeDelta /1000);;
    
this.rotationRemainder= this.rotationRemainder +newPortion;
    

    let angleAdjustment: number = this.rotationRemainder;;
    

                        if(angleAdjustment != 0)
                        
                                    {
                                    
    let adjustedAngle2: number = gdObject!.angleP +angleAdjustment;;
    

        while(adjustedAngle2 > 359)
        {
adjustedAngle2 -= 360;
    
}


        while(adjustedAngle2 < 0)
        {
adjustedAngle2 += 360;
    
}

gdObject!.setAngle(adjustedAngle2);
    
gdObject!.angleP= adjustedAngle2;
    
this.getAnimationBehavior()!.setRotation(gameLayer, angleAdjustment);
    
this.rotationRemainder -= angleAdjustment;
    

                                    }
                                
                        else {
                            
                        }
                            
}


    public getAnimationBehavior(): GDAnimationBehaviorBase{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.animationBehavior;
    
}


}


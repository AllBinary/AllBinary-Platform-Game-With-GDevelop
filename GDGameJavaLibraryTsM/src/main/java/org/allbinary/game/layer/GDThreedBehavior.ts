
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
        
import { RotationAnimation } from '../../../../org/allbinary/animation/RotationAnimation.js';
//not GWT import const RotationAnimation

import { GDObject } from '../../../../org/allbinary/game/layout/GDObject.js';
//not GWT import const GDObject

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDTwodBehavior } from './GDTwodBehavior.js';
//not GWT import - same folder const GDTwodBehavior
import { GDAnimationBehaviorBase } from './GDAnimationBehaviorBase.js';
//not GWT import - same folder const GDAnimationBehaviorBase
import { GDGameLayer } from './GDGameLayer.js';
//not GWT import - same folder const GDGameLayer

export class GDThreedBehavior extends GDTwodBehavior {
        

    private readonly rotationAnimationInterfaceArray: RotationAnimation[];

    private rotationRemainderZ: number= 0.0;

public constructor (animationBehavior: GDAnimationBehaviorBase, rotationAnimationInterfaceArray: RotationAnimation[]){
            super(animationBehavior);
                    

                            //For kotlin this is before the body of the constructor.
                    
this.rotationAnimationInterfaceArray= rotationAnimationInterfaceArray;
    
}


                //@Throws(Exception.constructor)
            
    public reset(gameLayer: GDGameLayer, gdObject: GDObject){
super.reset(gameLayer, gdObject);
    
this.rotationRemainderZ= 0;
    
}


    public updateRotation(gameLayer: GDGameLayer, timeDelta: number){
super.updateRotation(gameLayer, timeDelta);
    

    var gdObject: GDObject = gameLayer!.gdObject;;
    

    var newPortion: number = (gdObject!.rotationZP *timeDelta /1000);;
    
this.rotationRemainderZ= this.rotationRemainderZ +newPortion;
    

    var angleAdjustment: number = ();;
    

                        if(angleAdjustment != 0)
                        
                                    {
                                    gdObject!.angle += angleAdjustment;
    
this.setRotationZ(gdObject, angleAdjustment);
    
this.rotationRemainderZ -= angleAdjustment;
    

                                    }
                                
                        else {
                            
                        }
                            
}


    public setRotationZ(gdObject: GDObject, angleAdjustment: number){

    var rotationAnimation: RotationAnimation = this.rotationAnimationInterfaceArray[gdObject!.animation]!;;
    

                        if(angleAdjustment > 0)
                        
                                    {
                                    
    var value: number = angleAdjustment;;
    

        while(value > 0)
        {
rotationAnimation!.nextRotationZ();
    
value--;
    
}


                                    }
                                
                        else {
                            
    var value: number = angleAdjustment;;
    

        while(value < 0)
        {
rotationAnimation!.previousRotationZ();
    
value++;
    
}


                        }
                            
}


}




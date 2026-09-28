
        /*
                * 
                *  AllBinary Open License Version 1
                *  Copyright (c) 2011 AllBinary
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

        


import { Animation } from '../../../../org/allbinary/animation/Animation.js';
//not GWT import const Animation

import { AnimationBehaviorFactory } from '../../../../org/allbinary/animation/AnimationBehaviorFactory.js';
//not GWT import const AnimationBehaviorFactory

import { AnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/AnimationInterfaceFactoryInterface.js';
//not GWT import const AnimationInterfaceFactoryInterface

import { IndexedAnimation } from '../../../../org/allbinary/animation/IndexedAnimation.js';
//not GWT import const IndexedAnimation

import { ScaleProperties } from '../../../../org/allbinary/media/ScaleProperties.js';
//not GWT import const ScaleProperties

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { CompoundAnimationInterfaceFactory } from './CompoundAnimationInterfaceFactory.js';
//not GWT import - same folder const CompoundAnimationInterfaceFactory
import { SliderAnimation } from './SliderAnimation.js';
//not GWT import - same folder const SliderAnimation

export class SliderAnimationInterfaceFactory extends CompoundAnimationInterfaceFactory {
        

    private width: number;

    private height: number;

    public scaleProperties: ScaleProperties = ScaleProperties.instance;

public constructor (basicAnimationInterfaceFactoryInterfaceArray: AnimationInterfaceFactoryInterface[], width: number, height: number){
            this(basicAnimationInterfaceFactoryInterfaceArray, width, height, AnimationBehaviorFactory.getInstance());
                    

                            //For kotlin this is before the body of the constructor.
                    
}


public constructor (basicAnimationInterfaceFactoryInterfaceArray: AnimationInterfaceFactoryInterface[], width: number, height: number, animationBehaviorFactory: AnimationBehaviorFactory){
            super(basicAnimationInterfaceFactoryInterfaceArray, animationBehaviorFactory);
                    

                            //For kotlin this is before the body of the constructor.
                    
this.width= width;
    
this.height= height;
    
}


    createArray(size: number): Animation[]{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new Array(size);
    
}


    createAnimation(animationInterfaceArray: Animation[]): Animation{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new SliderAnimation(animationInterfaceArray as IndexedAnimation[], this.scaleProperties!.scaleWidth, this.scaleProperties!.scaleHeight, this.animationBehaviorFactory!.getOrCreateInstance());
    
}


    public setInitialScale(scaleProperties: ScaleProperties){
this.scaleProperties= scaleProperties;
    
}


}




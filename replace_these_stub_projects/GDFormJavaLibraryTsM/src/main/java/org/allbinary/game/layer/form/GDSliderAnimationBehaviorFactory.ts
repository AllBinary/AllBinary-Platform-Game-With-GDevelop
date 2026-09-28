
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

        


import { GDAnimationBehaviorBase } from '../../../../../org/allbinary/game/layer/GDAnimationBehaviorBase.js';
//not GWT import const GDAnimationBehaviorBase

import { GDAnimationBehaviorBaseFactory } from '../../../../../org/allbinary/game/layer/GDAnimationBehaviorBaseFactory.js';
//not GWT import const GDAnimationBehaviorBaseFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDSliderAnimationBehavior } from './GDSliderAnimationBehavior.js';
//not GWT import - same folder const GDSliderAnimationBehavior

export class GDSliderAnimationBehaviorFactory extends GDAnimationBehaviorBaseFactory {
        

    private static readonly instance: GDSliderAnimationBehaviorFactory = new GDSliderAnimationBehaviorFactory();

    public static getInstance(): GDSliderAnimationBehaviorFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance;
    
}


    public create(): GDAnimationBehaviorBase{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDSliderAnimationBehavior();
    
}


}




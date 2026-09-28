
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

        


















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDAnimationBehaviorBaseFactory } from './GDAnimationBehaviorBaseFactory.js';
//not GWT import - same folder const GDAnimationBehaviorBaseFactory
import { GDRotationBehavior } from './GDRotationBehavior.js';
//not GWT import - same folder const GDRotationBehavior
import { GDAnimationBehaviorBase } from './GDAnimationBehaviorBase.js';
//not GWT import - same folder const GDAnimationBehaviorBase

export class GDRotationBehaviorFactory extends GDAnimationBehaviorBaseFactory {
        

    private static readonly instance: GDRotationBehaviorFactory = new GDRotationBehaviorFactory();

    public static getInstance(): GDAnimationBehaviorBaseFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDRotationBehaviorFactory.instance;
    
}


    public create(): GDAnimationBehaviorBase{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDRotationBehavior();
    
}


}





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
        import { GDTextInputAnimationBehavior } from './GDTextInputAnimationBehavior.js';
//not GWT import - same folder const GDTextInputAnimationBehavior

export class GDTextInputAnimationBehaviorFactory extends GDAnimationBehaviorBaseFactory {
        

    private static readonly instance: GDTextInputAnimationBehaviorFactory = new GDTextInputAnimationBehaviorFactory();

    public static getInstance(): GDTextInputAnimationBehaviorFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance;
    
}


    public create(): GDAnimationBehaviorBase{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDTextInputAnimationBehavior();
    
}


}




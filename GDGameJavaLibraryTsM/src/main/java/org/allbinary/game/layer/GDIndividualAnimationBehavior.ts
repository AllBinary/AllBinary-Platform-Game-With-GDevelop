
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
        
            import { Math } from '../../../../java/lang/Math.js';
        
import { IndexedAnimation } from '../../../../org/allbinary/animation/IndexedAnimation.js';
//not GWT import const IndexedAnimation

import { IndexedAnimationBehavior } from '../../../../org/allbinary/animation/IndexedAnimationBehavior.js';
//not GWT import const IndexedAnimationBehavior

import { GDObject } from '../../../../org/allbinary/game/layout/GDObject.js';
//not GWT import const GDObject

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDAnimationBehaviorBase } from './GDAnimationBehaviorBase.js';
//not GWT import - same folder const GDAnimationBehaviorBase

export class GDIndividualAnimationBehavior extends GDAnimationBehaviorBase {
        

    private static readonly instance: GDIndividualAnimationBehavior = new GDIndividualAnimationBehavior();

    public static getInstance(): GDIndividualAnimationBehavior{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDIndividualAnimationBehavior.instance;
    
}


    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    public animate(gdObject: GDObject, initIndexedAnimationInterfaceArray: IndexedAnimation[], timeDelta: number){

        try {
            
    var indexedAnimation: IndexedAnimation = initIndexedAnimationInterfaceArray[gdObject!.animation]!;;
    

    var indexedAnimationBehavior: IndexedAnimationBehavior = indexedAnimation!.getAnimationBehavior() as IndexedAnimationBehavior;;
    

                        if(indexedAnimationBehavior!.loopTotal < 0 || !indexedAnimation!.isLastFrame())
                        
                                    {
                                    indexedAnimationBehavior!.elapsedTime += timeDelta;
    

                        if(indexedAnimationBehavior!.elapsedTime > (indexedAnimationBehavior!.frameDelayTime /Math.abs(gdObject!.timeScale)))
                        
                                    {
                                    indexedAnimationBehavior!.elapsedTime= 0;
    

                        if(gdObject!.timeScale > 0)
                        
                                    {
                                    indexedAnimation!.nextFrame();
    

                                    }
                                
                        else {
                            indexedAnimation!.previousFrame();
    

                        }
                            

                                    }
                                

                                    }
                                

                //: 
} catch(e) 
            {

    var commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    
this.logUtil!.put(commonStrings!.EXCEPTION, this, "animate", e);
    
}

}


}




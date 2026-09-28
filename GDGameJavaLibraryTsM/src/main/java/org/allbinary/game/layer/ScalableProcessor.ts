
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

        


import { IndexedAnimation } from '../../../../org/allbinary/animation/IndexedAnimation.js';
//not GWT import const IndexedAnimation

import { GDObject } from '../../../../org/allbinary/game/layout/GDObject.js';
//not GWT import const GDObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { ScalableBaseProcessor } from './ScalableBaseProcessor.js';
//not GWT import - same folder const ScalableBaseProcessor
import { GDGameLayer } from './GDGameLayer.js';
//not GWT import - same folder const GDGameLayer

export class ScalableProcessor extends ScalableBaseProcessor {
        

    private static readonly instance: ScalableProcessor = new ScalableProcessor();

    public static getInstance(): ScalableProcessor{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ScalableProcessor.instance;
    
}


    public process(gameLayer: GDGameLayer, initIndexedAnimationInterface: IndexedAnimation){

    var gdObject: GDObject = gameLayer!.gdObject;;
    
initIndexedAnimationInterface!.setScale(gdObject!.scaleX, gdObject!.scaleY);
    
}


}





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
        
import { IndexedAnimation } from '../../../../org/allbinary/animation/IndexedAnimation.js';
//not GWT import const IndexedAnimation

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameLayer } from './GDGameLayer.js';
//not GWT import - same folder const GDGameLayer

export class ScalableBaseProcessor
            extends Object
         {
        

    private static readonly instance: ScalableBaseProcessor = new ScalableBaseProcessor();

    public static getInstance(): ScalableBaseProcessor{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ScalableBaseProcessor.instance;
    
}


    public process(gameLayer: GDGameLayer, initIndexedAnimationInterface: IndexedAnimation){
}


}




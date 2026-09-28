
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

        


            import { Object } from '../../../../../java/lang/Object.js';
        
import { CollidableCompositeLayer } from '../../../../../org/allbinary/game/layer/CollidableCompositeLayer.js';
//not GWT import const CollidableCompositeLayer

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class TempGameLayerUtil
            extends Object
         {
        

    private static readonly instance: TempGameLayerUtil = new TempGameLayerUtil();

    public static getInstance(): TempGameLayerUtil{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return TempGameLayerUtil.instance;
    
}


    public readonly gameLayerArray: CollidableCompositeLayer[] = new Array(5);

    public clear(){




                        for (
    var index: number = 0;index < 5; index++)
        {
this.gameLayerArray[index]= 
                                        null
                                    ;
    
}

}


    public clear2(){
this.clear();
    
}


}




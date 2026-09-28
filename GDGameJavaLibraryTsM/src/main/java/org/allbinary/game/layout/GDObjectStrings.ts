
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

        


            import { Object } from '../../../../java/lang/Object.js';
        
















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDObjectStrings
            extends Object
         {
        

    private static readonly instance: GDObjectStrings = new GDObjectStrings();

    public static getInstance(): GDObjectStrings{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDObjectStrings.instance;
    
}


    public readonly GDOBJECT: string = "GDObject";

    public readonly NAME: string = "name";

    public readonly GD_GAME_LAYER_WAS_NULL: string = "GDGameLayer was null";

    public readonly CALLING_GDNODE: string = " calling GDNode: ";

}





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

        


            import { Object } from '../../../../java/lang/Object.js';
        
















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDStrings
            extends Object
         {
        

    private static readonly instance: GDStrings = new GDStrings();

    public static getInstance(): GDStrings{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDStrings.instance;
    
}


    public readonly CANVAS_NEW: string = "Canvas is to new to process this action: ";

    public readonly SCENE_NEW: string = "Scene is to new to process this action: ";

    public readonly LONG_RUNNING_WHILE_LOOP: string = " Long Running While Loop: ";

}




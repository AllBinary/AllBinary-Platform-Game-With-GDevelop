
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
        
















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameSceneController } from './GDGameSceneController.js';
//not GWT import - same folder const GDGameSceneController
import { AllBinarySceneController } from './AllBinarySceneController.js';
//not GWT import - same folder const AllBinarySceneController

export class GDGameAllBinarySceneControllerFactory
            extends Object
         {
        

    private static readonly instance: AllBinarySceneController = new GDGameSceneController();

    public static getInstance(): AllBinarySceneController{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameAllBinarySceneControllerFactory.instance;
    
}


}





        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../java/lang/Object.js';
        
import { AllBinarySceneController } from '../../../org/allbinary/graphics/threed/min3d/AllBinarySceneController.js';
//not GWT import const AllBinarySceneController

import { GDGameSceneController } from '../../../org/allbinary/graphics/threed/min3d/GDGameSceneController.js';
//not GWT import const GDGameSceneController

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { PreLogUtil } 
const PreLogUtil = globalThis.org.allbinary.logic.communication.log.PreLogUtil;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameAllBinarySceneControllerFactory
            extends Object
         {
        

    private static readonly instance: AllBinarySceneController = new GDGameSceneController();

    public static getInstance(): AllBinarySceneController{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameAllBinarySceneControllerFactory.instance;
    
}


}




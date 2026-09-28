
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
import { Features } from '../../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const Features

import { GraphicsFeatureFactory } from '../../../../org/allbinary/game/configuration/feature/GraphicsFeatureFactory.js';
//not GWT import const GraphicsFeatureFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameBaseAndroidResources } from './GDGameBaseAndroidResources.js';
//not GWT import - same folder const GDGameBaseAndroidResources

export class GDGameAndroidResources extends GDGameBaseAndroidResources {
        

    private static readonly STATIC: GDGameAndroidResources = new GDGameAndroidResources();

    public static getInstance(): GDGameAndroidResources{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameAndroidResources.STATIC;
    
}


    initialized: boolean= false;

                //@Throws(Exception.constructor)
            
    initImages(RESOURCES: string[]){

                        if(Features.getInstance()!.isFeature(GraphicsFeatureFactory.getInstance()!.IMAGE_TO_ARRAY_GRAPHICS))
                        
                                    {
                                    
                                    }
                                
                        else {
                            


                            throw new Exception("GDGame Resource Error");
                    

                        }
                            
}


}




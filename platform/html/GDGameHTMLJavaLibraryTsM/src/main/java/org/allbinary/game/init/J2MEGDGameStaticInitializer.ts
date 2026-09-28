
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

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
import { GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/image/GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory

import { FeaturedAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/FeaturedAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const FeaturedAnimationInterfaceFactoryInterfaceFactory

import { ResourceInitialization } from '../../../../org/allbinary/game/resource/ResourceInitialization.js';
//not GWT import const ResourceInitialization

import { GDGameStaticInitializer } from '../../../../org/allbinary/game/init/GDGameStaticInitializer.js';
//not GWT import const GDGameStaticInitializer

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class J2MEGDGameStaticInitializer extends GDGameStaticInitializer {
        

public constructor (resourceInitializationArray: ResourceInitialization[], portion: number){
            super(resourceInitializationArray, portion);
                    

                            //For kotlin this is before the body of the constructor.
                    
}


                //@Throws(Exception.constructor)
            
    initFeatureResources(){
FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()!.add(new GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory());
    
}


}




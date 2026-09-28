
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
import { GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/image/GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory

import { GDGameEarlyResourcesOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/image/GDGameEarlyResourcesOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const GDGameEarlyResourcesOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory

import { FeaturedAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/FeaturedAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const FeaturedAnimationInterfaceFactoryInterfaceFactory

import { ResourceInitialization } from '../../../../org/allbinary/game/resource/ResourceInitialization.js';
//not GWT import const ResourceInitialization

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameAndroidAnimationInterfaceFactoryEarlyResourceInitialization extends ResourceInitialization {
        

public constructor (){

            super();
        }


                //@Throws(Exception.constructor)
            
    public init(){

    var featuredAnimationInterfaceFactoryInterfaceFactory: FeaturedAnimationInterfaceFactoryInterfaceFactory = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()!;;
    
featuredAnimationInterfaceFactoryInterfaceFactory!.add(new GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory());
    
featuredAnimationInterfaceFactoryInterfaceFactory!.add(new GDGameEarlyResourcesOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory());
    
}


}




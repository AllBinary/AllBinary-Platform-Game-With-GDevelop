
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
import { GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/image/GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory

import { GDGameOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/image/GDGameOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const GDGameOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory

import { FeaturedAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/FeaturedAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const FeaturedAnimationInterfaceFactoryInterfaceFactory

import { ResourceInitialization } from '../../../../org/allbinary/game/resource/ResourceInitialization.js';
//not GWT import const ResourceInitialization

import { TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/input/motion/button/TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory

import { TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/input/motion/button/TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameAndroidAnimationInterfaceFactoryResourceInitialization extends ResourceInitialization {
        

public constructor (){

            super();
        }


                //@Throws(Exception.constructor)
            
    public init(){

    var featuredAnimationInterfaceFactoryInterfaceFactory: FeaturedAnimationInterfaceFactoryInterfaceFactory = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()!;;
    
featuredAnimationInterfaceFactoryInterfaceFactory!.add(TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory.createFactory());
    
featuredAnimationInterfaceFactoryInterfaceFactory!.add(new GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory());
    
featuredAnimationInterfaceFactoryInterfaceFactory!.add(new TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory());
    
featuredAnimationInterfaceFactoryInterfaceFactory!.add(new GDGameOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory());
    
}


}




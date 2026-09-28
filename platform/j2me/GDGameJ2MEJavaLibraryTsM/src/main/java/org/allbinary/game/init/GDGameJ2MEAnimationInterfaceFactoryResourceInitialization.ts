
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
        
export class GDGameJ2MEAnimationInterfaceFactoryResourceInitialization extends ResourceInitialization {
        

public constructor (){

            super();
        }


                //@Throws(Exception.constructor)
            
    public init(){
FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()!.add(TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory.createFactory());
    
FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()!.add(new GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory());
    
FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()!.add(new TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory());
    
FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()!.add(new GDGameOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory());
    
}


}




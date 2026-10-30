
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

        


            import { RuntimeException } from '../../../../java/lang/RuntimeException.js';
        
import { AnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/AnimationInterfaceFactoryInterface.js';
//not GWT import const AnimationInterfaceFactoryInterface

import { BasicAnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/BasicAnimationInterfaceFactoryInterface.js';
//not GWT import const BasicAnimationInterfaceFactoryInterface

import { NullRotationAnimationFactory } from '../../../../org/allbinary/animation/NullRotationAnimationFactory.js';
//not GWT import const NullRotationAnimationFactory

import { GroupFactory } from '../../../../org/allbinary/game/identification/GroupFactory.js';
//not GWT import const GroupFactory

import { GDObject } from '../../../../org/allbinary/game/layout/GDObject.js';
//not GWT import const GDObject

import { RectangleFactory } from '../../../../org/allbinary/graphics/RectangleFactory.js';
//not GWT import const RectangleFactory

//not plain js import { BasicArrayListUtil } 
const BasicArrayListUtil = globalThis.org.allbinary.util.BasicArrayListUtil;
type BasicArrayListUtil<T = any, U = any> = typeof BasicArrayListUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListUtil;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameLayerFactory } from './GDGameLayerFactory.js';
//not GWT import - same folder const GDGameLayerFactory
import { GDRotationBehaviorFactory } from './GDRotationBehaviorFactory.js';
//not GWT import - same folder const GDRotationBehaviorFactory
import { GDGameLayer } from './GDGameLayer.js';
//not GWT import - same folder const GDGameLayer

export class NullGDGameLayerFactory extends GDGameLayerFactory {
        

    public static readonly NULL_GD_GAME_LAYER_FACTORY: NullGDGameLayerFactory = new NullGDGameLayerFactory();

private constructor (){
            super(BasicArrayListUtil.getInstance()!.getImmutableInstance(), BasicArrayListUtil.getInstance()!.getImmutableInstance(), GroupFactory.getInstance()!.NULL_GROUP_ARRAY, BasicArrayListUtil.getInstance()!.getImmutableInstance(), 
                                                [
                                                    NullRotationAnimationFactory.getFactoryInstance()
                                                ], 
                                                [
                                                    NullRotationAnimationFactory.getFactoryInstance()
                                                ], RectangleFactory.SINGLETON, RectangleFactory.ARRAY_OF_ARRAYS, GDRotationBehaviorFactory.getInstance(), false);
                    

                            //For kotlin this is before the body of the constructor.
                    
}


    public create(gdObject: GDObject): GDGameLayer{



                            throw new RuntimeException();
                    
}


}


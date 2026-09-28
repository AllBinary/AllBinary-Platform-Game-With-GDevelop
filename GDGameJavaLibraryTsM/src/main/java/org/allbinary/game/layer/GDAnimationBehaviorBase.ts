
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

        


            import { Object } from '../../../../java/lang/Object.js';
        
            import { Exception } from '../../../../java/lang/Exception.js';
        
import { AnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/AnimationInterfaceFactoryInterface.js';
//not GWT import const AnimationInterfaceFactoryInterface

import { IndexedAnimation } from '../../../../org/allbinary/animation/IndexedAnimation.js';
//not GWT import const IndexedAnimation

import { GDObject } from '../../../../org/allbinary/game/layout/GDObject.js';
//not GWT import const GDObject

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameLayer } from './GDGameLayer.js';
//not GWT import - same folder const GDGameLayer

export class GDAnimationBehaviorBase
            extends Object
         {
        

    private static readonly instance: GDAnimationBehaviorBase = new GDAnimationBehaviorBase();

    public static getInstance(): GDAnimationBehaviorBase{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDAnimationBehaviorBase.instance;
    
}


    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    public init(gdObject: GDObject, animationInterfaceFactoryInterfaceArray: AnimationInterfaceFactoryInterface[]): IndexedAnimation[]{

    var size: number = animationInterfaceFactoryInterfaceArray!.length
                ;;
    

    var initIndexedAnimationInterfaceArray: IndexedAnimation[] = new Array(size);;
    




                        for (
    var index: number = 0;index < size; index++)
        {

        try {
            initIndexedAnimationInterfaceArray[index]= animationInterfaceFactoryInterfaceArray[index]!.getInstance(gdObject!.hashCode()) as IndexedAnimation;
    

                //: 
} catch(e) 
            {

    var commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    
this.logUtil!.put(new StringMaker().append(animationInterfaceFactoryInterfaceArray[index]!.toString())!.append(" index: ")!.appendint(index)!.toString(), this, commonStrings!.CONSTRUCTOR, e);
    
this.logUtil!.put(gdObject!.toString(), this, commonStrings!.CONSTRUCTOR, e);
    
}

}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return initIndexedAnimationInterfaceArray;
    
}


    public setAnimationArray(rotationAnimationInterfaceArray: IndexedAnimation[]){
}


    public add(gameLayer: GDGameLayer){
}


                //@Throws(Exception.constructor)
            
    public set(gameLayer: GDGameLayer, gdObject: GDObject){
}


    public setRotation(gameLayer: GDGameLayer, angleAdjustment: number){
}


    public animate(gdObject: GDObject, initIndexedAnimationInterfaceArray: IndexedAnimation[], timeDelta: number){
}


    public toString(gdObject: GDObject, stringBuffer: StringMaker){
}


}




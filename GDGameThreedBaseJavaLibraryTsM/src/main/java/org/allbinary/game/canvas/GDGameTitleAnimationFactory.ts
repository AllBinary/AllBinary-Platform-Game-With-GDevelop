
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

        


            import { Object } from '../../../../java/lang/Object.js';
        
            import { Exception } from '../../../../java/lang/Exception.js';
        
import { AnimationBehavior } from '../../../../org/allbinary/animation/AnimationBehavior.js';
//not GWT import const AnimationBehavior

import { ColorLessVectorAnimation } from '../../../../org/allbinary/animation/ColorLessVectorAnimation.js';
//not GWT import const ColorLessVectorAnimation

import { IndexedAnimation } from '../../../../org/allbinary/animation/IndexedAnimation.js';
//not GWT import const IndexedAnimation

import { VectorExplosionGenerator } from '../../../../org/allbinary/animation/VectorExplosionGenerator.js';
//not GWT import const VectorExplosionGenerator

import { TitleAnimation } from '../../../../org/allbinary/animation/special/TitleAnimation.js';
//not GWT import const TitleAnimation

import { BasicColor } from '../../../../org/allbinary/graphics/color/BasicColor.js';
//not GWT import const BasicColor

import { BasicColorFactory } from '../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { TitleVectorData } from './TitleVectorData.js';
//not GWT import - same folder const TitleVectorData

export class GDGameTitleAnimationFactory
            extends Object
         {
        

    private static readonly instance: GDGameTitleAnimationFactory = new GDGameTitleAnimationFactory();
static getInstance(...args: any[]): any {
   
    if (args.length === 0) return this.getInstance$overload1();
   
    if (args.length === 1) return this.getInstance$overload2(args[0]);
   
   throw new TypeError('No matching overload: getInstance'); }
  
    public static getInstance$overload1(): GDGameTitleAnimationFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameTitleAnimationFactory.instance;
    
}


                //@Throws(Exception.constructor)
            
    public getInstance$overload2(animationInterfaceArray: IndexedAnimation[]): TitleAnimation{

    let basicColorArray: BasicColor[] = new Array(2);;
    
basicColorArray[0]= BasicColorFactory.getInstance()!.PURPLE;
    
basicColorArray[1]= BasicColorFactory.getInstance()!.BLACK;
    

    let deltaXArray: number[] = new Array(2);;
    
deltaXArray[0]= 0;
    
deltaXArray[1]= 52;
    

    let deltaYArray: number[] = new Array(2);;
    
deltaYArray[0]= 0;
    
deltaYArray[1]= 30;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return TitleAnimation.createAnimation(animationInterfaceArray, basicColorArray, deltaXArray, deltaYArray, 15, 120);;
    
}


                //@Throws(Exception.constructor)
            
    public getArrayInstance(): IndexedAnimation[]{

    let animationInterfaceArray: IndexedAnimation[] = new Array(2);;
    

    let titleVectorData: TitleVectorData = new TitleVectorData();;
    

    let vectorExplosionGenerator: VectorExplosionGenerator = VectorExplosionGenerator.getInstance()!;;
    

    let points: number[][][] = vectorExplosionGenerator!.getInstance(titleVectorData!.testPoints, 6, vectorExplosionGenerator!.RANDOM)!;;
    
animationInterfaceArray[0]= new ColorLessVectorAnimation(points, AnimationBehavior.getInstance());
    
points= vectorExplosionGenerator!.getInstance(titleVectorData!.gamePoints, 6, vectorExplosionGenerator!.RANDOM);
    
animationInterfaceArray[1]= new ColorLessVectorAnimation(points, AnimationBehavior.getInstance());
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return animationInterfaceArray;
    
}


}


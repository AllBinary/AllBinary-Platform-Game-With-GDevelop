
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
            import { Exception } from '../../../../java/lang/Exception.js';
        
import { IndexedAnimation } from '../../../../org/allbinary/animation/IndexedAnimation.js';
//not GWT import const IndexedAnimation

import { TitleAnimation } from '../../../../org/allbinary/animation/special/TitleAnimation.js';
//not GWT import const TitleAnimation

import { BasicColor } from '../../../../org/allbinary/graphics/color/BasicColor.js';
//not GWT import const BasicColor

import { BasicColorFactory } from '../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameThreedTitleAnimation } from './GDGameThreedTitleAnimation.js';
//not GWT import - same folder const GDGameThreedTitleAnimation

export class GDGameThreedTitleAnimationFactory
            extends Object
         {
        

    private static readonly instance: GDGameThreedTitleAnimationFactory = new GDGameThreedTitleAnimationFactory();

    public static getIntance(): GDGameThreedTitleAnimationFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameThreedTitleAnimationFactory.instance;
    
}


                //@Throws(Exception.constructor)
            
    public getInstance(animationInterfaceArray: IndexedAnimation[]): TitleAnimation{

    var basicColorFactory: BasicColorFactory = BasicColorFactory.getInstance()!;;
    

    var basicColorArray: BasicColor[] = new Array(3);;
    
basicColorArray[0]= basicColorFactory!.CLEAR_COLOR;
    
basicColorArray[1]= basicColorFactory!.CLEAR_COLOR;
    
basicColorArray[2]= basicColorFactory!.CLEAR_COLOR;
    

    var deltaXArray: number[] = new Array(3);;
    
deltaXArray[0]= 0;
    
deltaXArray[1]= 52;
    
deltaXArray[2]= 0;
    

    var deltaYArray: number[] = new Array(3);;
    
deltaYArray[0]= 0;
    
deltaYArray[1]= 30;
    
deltaYArray[2]= 37;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDGameThreedTitleAnimation(animationInterfaceArray, basicColorArray, deltaXArray, deltaYArray, 15, 120);
    
}


}




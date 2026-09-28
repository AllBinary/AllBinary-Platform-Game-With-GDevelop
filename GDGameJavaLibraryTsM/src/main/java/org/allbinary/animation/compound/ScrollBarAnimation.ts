
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
        
import { Graphics } from '../../../../javax/microedition/lcdui/Graphics.js';
//not GWT import const Graphics

import { J2MEUtil } from '../../../../org/allbinary/J2MEUtil.js';
//not GWT import const J2MEUtil

import { AnimationBehavior } from '../../../../org/allbinary/animation/AnimationBehavior.js';
//not GWT import const AnimationBehavior

import { IndexedAnimation } from '../../../../org/allbinary/animation/IndexedAnimation.js';
//not GWT import const IndexedAnimation

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { PrimitiveIntUtil } from '../../../../org/allbinary/logic/math/PrimitiveIntUtil.js';
//not GWT import const PrimitiveIntUtil

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        //Similar to Slider
export class ScrollBarAnimation extends IndexedAnimation {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private animationInterfaceArray: IndexedAnimation[];

    private readonly width: number;

    private readonly height: number;

    private dy: number;

    private value: number= 0;

    hasFocus: boolean= false;

public constructor (animationInterfaceArray: IndexedAnimation[], width: number, height: number, animationBehavior: AnimationBehavior){
            super(animationBehavior);
                    

                            //For kotlin this is before the body of the constructor.
                    
this.animationInterfaceArray= animationInterfaceArray;
    
this.dy= this.animationInterfaceArray[3]!.getDy();
    
this.width= width;
    
this.height= height;
    
}


    dxhack(): number{

                        if(J2MEUtil.isHTML())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.height *2 /3;
    

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.height;
    

                        }
                            
}


    public setFrame(frameIndex: number){




                        for (
    var index: number = this.animationInterfaceArray!.length
                ;--index >= 0; )
        {
this.animationInterfaceArray[index]!.setFrame(frameIndex);
    
}

}


    public getFrame(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.animationInterfaceArray[0]!.getFrame();;
    
}


    public getSize(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.animationInterfaceArray[0]!.getSize();;
    
}


    public previousFrame(){




                        for (
    var index: number = this.animationInterfaceArray!.length
                ;--index >= 0; )
        {
this.animationInterfaceArray[index]!.previousFrame();
    
}

}


    public setSequence(sequence: number[]){
}


    public getSequence(): number[]{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return PrimitiveIntUtil.getArrayInstance();;
    
}


                //@Throws(Exception.constructor)
            
    public nextFrame(){




                        for (
    var index: number = this.animationInterfaceArray!.length
                ;--index >= 0; )
        {
this.animationInterfaceArray[index]!.nextFrame();
    
}

}


    public paintXY(graphics: Graphics, x: number, y: number){

    var size: number = this.animationInterfaceArray!.length
                ;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
this.animationInterfaceArray[index]!.paintXY(graphics, x, y);
    
}

}


    public paintThreedXYZ(graphics: Graphics, x: number, y: number, z: number){

    var size: number = this.animationInterfaceArray!.length
                ;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
this.animationInterfaceArray[index]!.paintThreedXYZ(graphics, x, y, z);
    
}

}


    public getAnimationInterfaceArray(): IndexedAnimation[]{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.animationInterfaceArray;
    
}


    public setAnimationInterfaceArray(animationInterfaceArray: IndexedAnimation[]){
this.animationInterfaceArray= animationInterfaceArray;
    
}


    public setValue(value: number){

                        if(value >= 0 && value < 101)
                        
                                    {
                                    this.value= value;
    

    var newDy: number = this.dy +(value *this.height /100);;
    
this.animationInterfaceArray[3]!.setDy(newDy);
    

                                    }
                                
}


    public setValue2(thumbY: number){

    var usedThumbX: number = thumbY;;
    

    var maxY: number = this.height;;
    

                        if(thumbY >= this.dy && thumbY < this.dy +this.height)
                        
                                    {
                                    
                                    }
                                
                             else 
                        if(thumbY < 0)
                        
                                    {
                                    usedThumbX= 0;
    

                                    }
                                
                             else 
                        if(thumbY > maxY)
                        
                                    {
                                    usedThumbX= maxY;
    

                                    }
                                

    var value: number = (100 *usedThumbX /this.height);;
    

                        if(value > 100)
                        
                                    {
                                    value= 100;
    

                                    }
                                
this.setValue(value);
    
}


    public getThumbDy(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.animationInterfaceArray[3]!.getDy();;
    
}


    public getThumbHeight(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.animationInterfaceArray[3]!.getHeight();;
    
}


    public getValue(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.value;
    
}


    public setFocus(hasFocus: boolean){
this.hasFocus= hasFocus;
    
}


}




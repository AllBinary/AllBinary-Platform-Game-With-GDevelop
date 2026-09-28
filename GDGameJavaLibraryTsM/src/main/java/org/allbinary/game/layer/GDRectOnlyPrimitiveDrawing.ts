
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

        


import { Graphics } from '../../../../javax/microedition/lcdui/Graphics.js';
//not GWT import const Graphics

import { Animation } from '../../../../org/allbinary/animation/Animation.js';
//not GWT import const Animation

import { ARectangleFilledAnimation } from '../../../../org/allbinary/animation/vector/ARectangleFilledAnimation.js';
//not GWT import const ARectangleFilledAnimation

import { BasicColor } from '../../../../org/allbinary/graphics/color/BasicColor.js';
//not GWT import const BasicColor

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDRectOnlyPrimitiveDrawing extends Animation {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly rectangleFilledAnimation: ARectangleFilledAnimation = new ARectangleFilledAnimation();

    public x: number= 0;

    public y: number= 0;

    public nextFrame(){
}


    public addFillColor(basicColor: BasicColor){
this.rectangleFilledAnimation!.setBasicColorP(basicColor);
    
}


    public addFillRectangle(x: number, y: number, x2: number, y2: number){
this.rectangleFilledAnimation!.x= x;
    
this.rectangleFilledAnimation!.y= y;
    
this.rectangleFilledAnimation!.setWidth(x2 -x);
    
this.rectangleFilledAnimation!.setHeight(y2 -y);
    
}


    public paintXY(graphics: Graphics, x: number, y: number){
this.rectangleFilledAnimation!.paintXY(graphics, this.x, this.y);
    
}


    public paintThreedXYZ(graphics: Graphics, x: number, y: number, z: number){
}


}





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

import { BasicColorFactory } from '../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

//not plain js import { CircularIndexUtil } 
const CircularIndexUtil = globalThis.org.allbinary.util.CircularIndexUtil;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDPrimitiveDrawing extends Animation {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    public readonly animationListArray: BasicArrayList[] = 
                                                        [
                                                            new BasicArrayListD(),new BasicArrayListD(),new BasicArrayListD(),new BasicArrayListD(),new BasicArrayListD(),new BasicArrayListD(),new BasicArrayListD(),new BasicArrayListD(),new BasicArrayListD()
                                                        ];

    private readonly circularIndexUtil: CircularIndexUtil = CircularIndexUtil.createInstance(this.animationListArray!.length)!;

    public readonly colorAnimationInUseList: BasicArrayList = new BasicArrayListD();

    public readonly colorAnimationCacheList: BasicArrayList = new BasicArrayListD();

    public readonly aRetangleFilledAnimationInUseList: BasicArrayList = new BasicArrayListD();

    public readonly aRetangleFilledAnimationCacheList: BasicArrayList = new BasicArrayListD();

    public animationList: BasicArrayList = this.animationListArray[this.animationListArray!.length -1]!;

    public nextFrame(){
this.animationList= this.animationListArray[this.circularIndexUtil!.getIndex()]!;
    
this.circularIndexUtil!.next();
    
this.animationListArray[this.circularIndexUtil!.getIndex()]!.clear();
    
this.colorAnimationCacheList!.addAllList(this.colorAnimationInUseList);
    
this.colorAnimationInUseList!.clear();
    
this.aRetangleFilledAnimationCacheList!.addAllList(this.aRetangleFilledAnimationInUseList);
    
this.aRetangleFilledAnimationInUseList!.clear();
    
}


    public addFillColor(basicColor: BasicColor){

                        if(this.colorAnimationCacheList!.size() == 0)
                        
                                    {
                                    
    var colorAnimation: Animation = new Animation();;
    
colorAnimation!.setBasicColorP(basicColor);
    
this.animationListArray[this.circularIndexUtil!.getIndex()]!.add(colorAnimation);
    
this.colorAnimationInUseList!.add(colorAnimation);
    

                                    }
                                
                        else {
                            
    var colorAnimation: Animation = this.colorAnimationCacheList!.removeAt(this.colorAnimationCacheList!.size() -1) as Animation;;
    
colorAnimation!.setBasicColorP(basicColor);
    
this.animationListArray[this.circularIndexUtil!.getIndex()]!.add(colorAnimation);
    
this.colorAnimationInUseList!.add(colorAnimation);
    

                        }
                            
}


    public addFillRectangle(x: number, y: number, x2: number, y2: number){

                        if(this.aRetangleFilledAnimationCacheList!.size() == 0)
                        
                                    {
                                    
    var rectangleFilledAnimation: ARectangleFilledAnimation = new ARectangleFilledAnimation();;
    
rectangleFilledAnimation!.x= x;
    
rectangleFilledAnimation!.y= y;
    
rectangleFilledAnimation!.setWidth(x2 -x);
    
rectangleFilledAnimation!.setHeight(y2 -y);
    
this.animationListArray[this.circularIndexUtil!.getIndex()]!.add(rectangleFilledAnimation);
    
this.aRetangleFilledAnimationInUseList!.add(rectangleFilledAnimation);
    

                                    }
                                
                        else {
                            
    var rectangleFilledAnimation: ARectangleFilledAnimation = this.aRetangleFilledAnimationCacheList!.removeAt(this.aRetangleFilledAnimationCacheList!.size() -1) as ARectangleFilledAnimation;;
    
rectangleFilledAnimation!.x= x;
    
rectangleFilledAnimation!.y= y;
    
rectangleFilledAnimation!.setWidth(x2 -x);
    
rectangleFilledAnimation!.setHeight(y2 -y);
    
this.animationListArray[this.circularIndexUtil!.getIndex()]!.add(rectangleFilledAnimation);
    
this.aRetangleFilledAnimationInUseList!.add(rectangleFilledAnimation);
    

                        }
                            
}


    public paintXY(graphics: Graphics, x: number, y: number){

    var animationList: BasicArrayList = this.animationList;;
    

    var size: number = animationList!.size()!;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
get = animationList!.get(index)get as Animation
get.
                    paintXY(graphics, x, y);
    
}

}


    public paintThreedXYZ(graphics: Graphics, x: number, y: number, z: number){

    var animationList: BasicArrayList = this.animationList;;
    

    var size: number = animationList!.size()!;;
    

    var animation: Animation;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
animation= animationList!.get(index) as Animation;
    
animation.paintThreedXYZ(graphics, x, y, z);
    
}

}


}




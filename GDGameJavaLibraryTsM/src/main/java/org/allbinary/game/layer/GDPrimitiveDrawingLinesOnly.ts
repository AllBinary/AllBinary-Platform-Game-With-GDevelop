
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

import { GPoint } from '../../../../org/allbinary/graphics/GPoint.js';
//not GWT import const GPoint

import { PointFactory } from '../../../../org/allbinary/graphics/PointFactory.js';
//not GWT import const PointFactory

import { BasicColor } from '../../../../org/allbinary/graphics/color/BasicColor.js';
//not GWT import const BasicColor

import { AllBinaryLayer } from '../../../../org/allbinary/layer/AllBinaryLayer.js';
//not GWT import const AllBinaryLayer

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { LinePathAnimation } from './LinePathAnimation.js';
//not GWT import - same folder const LinePathAnimation

export class GDPrimitiveDrawingLinesOnly extends Animation {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly pointFactory: PointFactory = PointFactory.getInstance()!;

    private readonly NULL_ALLBINARY_LAYER: AllBinaryLayer = AllBinaryLayer.NULL_ALLBINARY_LAYER;

    private readonly colorAnimation: Animation = new Animation();

    private readonly linePathAnimation: LinePathAnimation = new LinePathAnimation();

    private readonly pointList: BasicArrayList = new BasicArrayListD();

    public nextFrame(){
}


    public clear(){
this.pointList!.clear();
    
}


    public addFillColor(basicColor: BasicColor){
this.colorAnimation!.setBasicColorP(basicColor);
    
}


    public addLineV2(x: number, y: number, x2: number, y2: number, thickness: number){
this.pointList!.add(this.pointFactory!.createXY(x, y));
    
this.pointList!.add(this.pointFactory!.createXY(x2, y2));
    
}


    public paintXY(graphics: Graphics, x: number, y: number){
this.colorAnimation!.paintXY(graphics, x, y);
    

    var size: number = this.pointList!.size()!;;
    

    var point: GPoint;;
    

    var nextPoint: GPoint;;
    




                        for (
    var index: number = 1;index < size; )
        {
point= this.pointList!.get(index -1) as GPoint;
    
nextPoint= this.pointList!.get(index) as GPoint;
    
this.linePathAnimation!.paint(graphics, point, nextPoint, this.NULL_ALLBINARY_LAYER);
    
}

}


    public paintThreedXYZ(graphics: Graphics, x: number, y: number, z: number){
}


}




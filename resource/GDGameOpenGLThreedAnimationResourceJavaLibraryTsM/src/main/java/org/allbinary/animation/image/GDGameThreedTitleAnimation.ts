
        /*
                *  
                * Copyright (c) 2002 All Binary 
                * All Rights Reserved. 
                * Don't Duplicate or Distributed. 
                * Trade Secret Information 
                * For Internal Use Only 
                * Confidential 
                * Unpublished 
                *  
                * Created By: Travis Berthelot 
                * Date: 11/29/02 
                *  
                *  
                * Modified By         When       ?   
        */
        
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
            import { Integer } from '../../../../java/lang/Integer.js';
        
import { Graphics } from '../../../../javax/microedition/lcdui/Graphics.js';
//not GWT import const Graphics

import { IndexedAnimationBehavior } from '../../../../org/allbinary/animation/IndexedAnimationBehavior.js';
//not GWT import const IndexedAnimationBehavior

import { ThreedAnimation } from '../../../../org/allbinary/animation/threed/ThreedAnimation.js';
//not GWT import const ThreedAnimation

import { IndexedAnimation } from '../../../../org/allbinary/animation/IndexedAnimation.js';
//not GWT import const IndexedAnimation

import { TitleAnimation } from '../../../../org/allbinary/animation/special/TitleAnimation.js';
//not GWT import const TitleAnimation

import { BasicColor } from '../../../../org/allbinary/graphics/color/BasicColor.js';
//not GWT import const BasicColor

import { ColorChangeEvent } from '../../../../org/allbinary/graphics/color/ColorChangeEvent.js';
//not GWT import const ColorChangeEvent

import { ColorChangeListener } from '../../../../org/allbinary/graphics/color/ColorChangeListener.js';
//not GWT import const ColorChangeListener

import { AllBinaryEventObject } from '../../../../org/allbinary/logic/util/event/AllBinaryEventObject.js';
//not GWT import const AllBinaryEventObject

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { ColorFromEventUtil } from '../../../../org/allbinary/media/graphics/geography/map/ColorFromEventUtil.js';
//not GWT import const ColorFromEventUtil

import { CenterViewPositionFactory } from '../../../../org/allbinary/view/CenterViewPositionFactory.js';
//not GWT import const CenterViewPositionFactory

import { ViewPositionBase } from '../../../../org/allbinary/view/ViewPositionBase.js';
//not GWT import const ViewPositionBase

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameThreedTitleAnimation extends TitleAnimation implements ColorChangeListener {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private color: number = ColorFromEventUtil.getInstance()!.COLOR_INT;

public constructor (animationInterfaceArray: IndexedAnimation[], basicColorArray: BasicColor[], dxArray: number[], dyArray: number[], y: number, width: number){
            super(animationInterfaceArray, basicColorArray, dxArray, dyArray, y, width, new IndexedAnimationBehavior(1, 250));
                    

                            //For kotlin this is before the body of the constructor.
                    
this.logUtil!.putF("Constructor", this, this.constructor.name.toString()!);
    
}


    public onEvent(eventObject: AllBinaryEventObject){

    var basicColor: BasicColor = (eventObject as ColorChangeEvent).getBasicColorP()!;;
    
this.color= basicColor!.intValue();
    
}


    public paintXY(graphics: Graphics, ax: number, ay: number){
graphics.setColor(this.color);
    

    var x: number = 0;;
    

                        if(this.widthP != Integer.MIN_VALUE)
                        
                                    {
                                    x= ((graphics.getClipWidth() -this.widthP) /2);
    

                                    }
                                

    var deltaX: number= 0;;
    

    var deltaY: number= 0;;
    




                        for (
    var index: number = 0;index < this.sizeP -1; index++)
        {
deltaX= this.dxArray[index] +x;
    
deltaY= this.dyArray[index] +this.y;
    

                        if(this.basicColorArray[index] != this.CLEAR_COLOR)
                        
                                    {
                                    this.basicSetColorUtil!.setBasicColorP(graphics, this.basicColorArray[index]!);
    

                                    }
                                
this.animationInterfaceArray[index]!.paintXY(graphics, deltaX, deltaY);
    
}

}


    private readonly viewPosition: ViewPositionBase = new CenterViewPositionFactory().getInstance(0)!;

    public paintThreed(graphics: Graphics, x: number, y: number, z: number){

    var deltaY: number= 0;;
    

    var index: number = this.sizeP -1;;
    

    var halfHeight: number = (graphics.getClipHeight()>>3) /3 *2;;
    
deltaY= this.dyArray[index] +y;
    

    var threedAnimation: ThreedAnimation = this.animationInterfaceArray[index]! as ThreedAnimation;;
    
threedAnimation!.nextRotation();
    
deltaY= (deltaY>>2);
    

    var az: number = ();;
    
this.animationInterfaceArray[index]!.paintThreedXYZ(graphics, this.viewPosition!.getX(), this.viewPosition!.getY(), az);
    
}


}




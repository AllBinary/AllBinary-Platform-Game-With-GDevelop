
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

        


            import { Object } from '../../../../../../java/lang/Object.js';
        
            import { Exception } from '../../../../../../java/lang/Exception.js';
        
import { ABToGBUtil } from '../../../../../../org/allbinary/game/canvas/ABToGBUtil.js';
//not GWT import const ABToGBUtil

import { AllBinaryGameLayerManager } from '../../../../../../org/allbinary/game/layer/AllBinaryGameLayerManager.js';
//not GWT import const AllBinaryGameLayerManager

import { CollidableDestroyableDamageableLayer } from '../../../../../../org/allbinary/game/layer/special/CollidableDestroyableDamageableLayer.js';
//not GWT import const CollidableDestroyableDamageableLayer

import { GPoint } from '../../../../../../org/allbinary/graphics/GPoint.js';
//not GWT import const GPoint

import { MotionGestureInput } from '../../../../../../org/allbinary/input/motion/gesture/MotionGestureInput.js';
//not GWT import const MotionGestureInput

import { TouchMotionGestureFactory } from '../../../../../../org/allbinary/input/motion/gesture/TouchMotionGestureFactory.js';
//not GWT import const TouchMotionGestureFactory

//not plain js import { ForcedLogUtil } 
const ForcedLogUtil = globalThis.org.allbinary.logic.communication.log.ForcedLogUtil;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;

//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;

import { AllBinaryEventObject } from '../../../../../../org/allbinary/logic/util/event/AllBinaryEventObject.js';
//not GWT import const AllBinaryEventObject

import { RectangleCollisionUtil } from '../../../../../../org/allbinary/math/RectangleCollisionUtil.js';
//not GWT import const RectangleCollisionUtil

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { MotionGestureEventListener } from './MotionGestureEventListener.js';
//not GWT import - same folder const MotionGestureEventListener
import { MotionGestureEvent } from './MotionGestureEvent.js';
//not GWT import - same folder const MotionGestureEvent

export class GDGameMotionGestureListener
            extends Object
         implements MotionGestureEventListener {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly commonStrings: CommonStrings = CommonStrings.getInstance()!;

    private readonly rectangleCollisionUtil: RectangleCollisionUtil = RectangleCollisionUtil.getInstance()!;

    private gameLayerDraggedList: BasicArrayList = new BasicArrayListD();

public constructor (){

            super();
        this.logUtil!.putF(this.commonStrings!.START, this, this.commonStrings!.CONSTRUCTOR);
    
}


    public onEvent(eventObject: AllBinaryEventObject){
ForcedLogUtil.log(this.commonStrings!.NOT_IMPLEMENTED, this);
    
}


    public onUpMotionGestureEvent(ev: MotionGestureEvent){
this.onMotionGestureEvent(ev);
    
}


    public onDownMotionGestureEvent(ev: MotionGestureEvent){
this.onMotionGestureEvent(ev);
    
}


    public onLeftMotionGestureEvent(ev: MotionGestureEvent){
this.onMotionGestureEvent(ev);
    
}


    public onRightMotionGestureEvent(ev: MotionGestureEvent){
this.onMotionGestureEvent(ev);
    
}


    public onDiagonalDownRightMotionGestureEvent(ev: MotionGestureEvent){
this.onMotionGestureEvent(ev);
    
}


    public onDiagonalDownLeftMotionGestureEvent(ev: MotionGestureEvent){
this.onMotionGestureEvent(ev);
    
}


    public onDiagonalUpRightMotionGestureEvent(ev: MotionGestureEvent){
this.onMotionGestureEvent(ev);
    
}


    public onDiagonalUpLeftMotionGestureEvent(ev: MotionGestureEvent){
this.onMotionGestureEvent(ev);
    
}


    public onScrolledMotionGestureEvent(motionGestureEvent: MotionGestureEvent){
}


    public onPressedMotionGestureEvent(ev: MotionGestureEvent){

    var abToGBUtil: ABToGBUtil = ABToGBUtil.getInstance()!;;
    

    var allBinaryGameLayerManager: AllBinaryGameLayerManager = abToGBUtil!.allBinaryGameLayerManager;;
    

    var point: GPoint = ev.getCurrentPoint()!;;
    

    var size: number = allBinaryGameLayerManager!.getSize()!;;
    

    var draggableGameLayer: CollidableDestroyableDamageableLayer;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
draggableGameLayer= allBinaryGameLayerManager!.getLayerAt(index) as CollidableDestroyableDamageableLayer;
    

                        if(this.gameLayerDraggedList!.size() == 0)
                        
                                    {
                                    
                        if(draggableGameLayer!.isDraggable)
                        
                                    {
                                    
                        if(this.rectangleCollisionUtil!.isInside(draggableGameLayer!.getXP(), draggableGameLayer!.getYP(), draggableGameLayer!.getX2(), draggableGameLayer!.getY2(), point.getX(), point.getY()))
                        
                                    {
                                    draggableGameLayer!.isDropped= false;
    
draggableGameLayer!.isDragged= true;
    
this.gameLayerDraggedList!.add(draggableGameLayer);
    

                                    }
                                

                                    }
                                

                                    }
                                
}

}


    public released(ev: MotionGestureEvent){

        try {
            
    var size: number = this.gameLayerDraggedList!.size()!;;
    

    var draggableGameLayer: CollidableDestroyableDamageableLayer;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
draggableGameLayer= this.gameLayerDraggedList!.get(index) as CollidableDestroyableDamageableLayer;
    
draggableGameLayer!.isDragged= false;
    
draggableGameLayer!.isDropped= true;
    
}

this.gameLayerDraggedList!.clear();
    

                //: 
} catch(e) 
            {

    var stringBuffer: StringMaker = new StringMaker();;
    
stringBuffer!.append(this.commonStrings!.EXCEPTION_LABEL);
    
stringBuffer!.append(StringUtil.getInstance()!.toString(ev.getMotionGesture()));
    
this.logUtil!.put(stringBuffer!.toString(), this, "release", e);
    
}

}


    public onMotionGestureEvent(ev: MotionGestureEvent){

        try {
            
    var motionGestureInput: MotionGestureInput = ev.getMotionGesture()!;;
    

                        if(motionGestureInput == TouchMotionGestureFactory.getInstance()!.PRESSED)
                        
                                    {
                                    this.onPressedMotionGestureEvent(ev);
    

                                    }
                                
                             else 
                        if(motionGestureInput == TouchMotionGestureFactory.getInstance()!.RELEASED)
                        
                                    {
                                    this.released(ev);
    

                                    }
                                

                //: 
} catch(e) 
            {

    var stringBuffer: StringMaker = new StringMaker();;
    
stringBuffer!.append(this.commonStrings!.EXCEPTION_LABEL);
    
stringBuffer!.append(StringUtil.getInstance()!.toString(ev.getMotionGesture()));
    
this.logUtil!.put(stringBuffer!.toString(), this, "onMotionGestureEvent", e);
    
}

}


}




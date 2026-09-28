
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

        


            import { Exception } from '../../../../../java/lang/Exception.js';
        
import { TouchButtonGenericActionResource } from '../../../../../org/allbinary/input/motion/button/TouchButtonGenericActionResource.js';
//not GWT import const TouchButtonGenericActionResource

import { BaseTouchInput } from '../../../../../org/allbinary/input/motion/button/BaseTouchInput.js';
//not GWT import const BaseTouchInput

import { BasicTouchButtonCellPositionFactory } from '../../../../../org/allbinary/input/motion/button/BasicTouchButtonCellPositionFactory.js';
//not GWT import const BasicTouchButtonCellPositionFactory

import { TouchButtonLocationHelper } from '../../../../../org/allbinary/input/motion/button/TouchButtonLocationHelper.js';
//not GWT import const TouchButtonLocationHelper

import { BasicTouchInputFactory } from '../../../../../org/allbinary/input/motion/button/BasicTouchInputFactory.js';
//not GWT import const BasicTouchInputFactory

import { FullTouchButton } from '../../../../../org/allbinary/input/motion/button/FullTouchButton.js';
//not GWT import const FullTouchButton

import { TouchButton } from '../../../../../org/allbinary/input/motion/button/TouchButton.js';
//not GWT import const TouchButton

import { CommonButtons } from '../../../../../org/allbinary/input/motion/button/CommonButtons.js';
//not GWT import const CommonButtons

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

//not plain js import { BasicArrayListUtil } 
const BasicArrayListUtil = globalThis.org.allbinary.util.BasicArrayListUtil;

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { LogFactory } 
const LogFactory = globalThis.org.allbinary.logic.communication.log.LogFactory;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { Animation } from '../../../../../org/allbinary/animation/Animation.js';
//not GWT import const Animation

import { NullAnimationFactory } from '../../../../../org/allbinary/animation/NullAnimationFactory.js';
//not GWT import const NullAnimationFactory

import { CellPositionFactory } from '../../../../../org/allbinary/graphics/CellPositionFactory.js';
//not GWT import const CellPositionFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameNeededWithSensorTouchButtonsBuilder extends BaseTouchInput {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    public getList(): BasicArrayList{

        try {
            logUtil!.putF(commonStrings!.START, this, commonStrings!.CONSTRUCTOR);
    

    var list: BasicArrayList = new BasicArrayListD();;
    

    var touchButtonLocationHelper: TouchButtonLocationHelper = new TouchButtonLocationHelper();;
    

    var basicTouchButtonCellPositionFactory: BasicTouchButtonCellPositionFactory = new BasicTouchButtonCellPositionFactory();;
    

    var commonButtons: CommonButtons = CommonButtons.getInstance()!;;
    

    var animationInterface: Animation = NullAnimationFactory.getFactoryInstance()!.getInstance(0)!;;
    

    var hintAnimationInterface: Animation = animationInterface;;
    

    var basicTouchInputFactory: BasicTouchInputFactory = BasicTouchInputFactory.getInstance()!;;
    

    var LEFT: TouchButton = new FullTouchButton(basicTouchInputFactory!.LEFT, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.BOTTOM_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    

    var LEFT2: TouchButton = new FullTouchButton(basicTouchInputFactory!.LEFT, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.BOTTOM_SECOND_FROM_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    

    var LEFT3: TouchButton = new FullTouchButton(basicTouchInputFactory!.LEFT, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.SECOND_FROM_BOTTOM_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    

    var LEFT4: TouchButton = new FullTouchButton(basicTouchInputFactory!.LEFT, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.SECOND_FROM_BOTTOM_SECOND_FROM_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    

    var RIGHT: TouchButton = new FullTouchButton(basicTouchInputFactory!.RIGHT, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.BOTTOM_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    

    var RIGHT2: TouchButton = new FullTouchButton(basicTouchInputFactory!.RIGHT, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.BOTTOM_SECOND_FROM_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    

    var RIGHT3: TouchButton = new FullTouchButton(basicTouchInputFactory!.RIGHT, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.SECOND_FROM_BOTTOM_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    

    var RIGHT4: TouchButton = new FullTouchButton(basicTouchInputFactory!.RIGHT, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    
list.add(LEFT);
    
list.add(LEFT2);
    
list.add(LEFT3);
    
list.add(LEFT4);
    
list.add(RIGHT);
    
list.add(RIGHT2);
    
list.add(RIGHT3);
    
list.add(RIGHT4);
    

                        if(basicTouchButtonCellPositionFactory!.THIRD_FROM_BOTTOM_RIGHT != CellPositionFactory.getInstance()!.NONE)
                        
                                    {
                                    
    var WEAPON: TouchButton = TouchButton.createButton(basicTouchInputFactory!.SPECIAL_BUTTON_FIVE, TouchButtonGenericActionResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.THIRD_FROM_BOTTOM_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    
list.add(WEAPON);
    

                                    }
                                

    var SPECIAL3: TouchButton = TouchButton.createButton(basicTouchInputFactory!.SPECIAL_BUTTON_SIX, TouchButtonGenericActionResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.TOP_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    

    var SPECIAL4: TouchButton = TouchButton.createButton(basicTouchInputFactory!.SPECIAL_BUTTON_SEVEN_TESTING_ONLY, TouchButtonGenericActionResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.TOP_SECOND_FROM_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    
list.add(SPECIAL3);
    
list.add(SPECIAL4);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return list;
    

                //: 
} catch(e) 
            {
logUtil!.put(commonStrings!.EXCEPTION, this, commonStrings!.GET_LIST, e);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return BasicArrayListUtil.getInstance()!.getImmutableInstance();;
    
}

}


}




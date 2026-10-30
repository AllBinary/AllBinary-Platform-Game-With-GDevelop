
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
        
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
type BasicArrayListD<T = any, U = any> = typeof BasicArrayListD extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListD;

//not plain js import { BasicArrayListUtil } 
const BasicArrayListUtil = globalThis.org.allbinary.util.BasicArrayListUtil;
type BasicArrayListUtil<T = any, U = any> = typeof BasicArrayListUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListUtil;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
type LogUtil<T = any, U = any> = typeof LogUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof LogUtil;

import { Animation } from '../../../../../org/allbinary/animation/Animation.js';
//not GWT import const Animation

import { NullAnimationFactory } from '../../../../../org/allbinary/animation/NullAnimationFactory.js';
//not GWT import const NullAnimationFactory

import { CellPositionFactory } from '../../../../../org/allbinary/graphics/CellPositionFactory.js';
//not GWT import const CellPositionFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { BaseTouchInput } from './BaseTouchInput.js';
//not GWT import - same folder const BaseTouchInput
import { TouchButtonLocationHelper } from './TouchButtonLocationHelper.js';
//not GWT import - same folder const TouchButtonLocationHelper
import { BasicTouchButtonCellPositionFactory } from './BasicTouchButtonCellPositionFactory.js';
//not GWT import - same folder const BasicTouchButtonCellPositionFactory
import { CommonButtons } from './CommonButtons.js';
//not GWT import - same folder const CommonButtons
import { BasicTouchInputFactory } from './BasicTouchInputFactory.js';
//not GWT import - same folder const BasicTouchInputFactory
import { TouchButton } from './TouchButton.js';
//not GWT import - same folder const TouchButton
import { TouchButtonGenericActionResource } from './TouchButtonGenericActionResource.js';
//not GWT import - same folder const TouchButtonGenericActionResource

export class GDGameNeededMultiTouchButtonsBuilder extends BaseTouchInput {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    public getList(): BasicArrayList{

 try { this.logUtil!.putF(this.commonStrings!.START, this, this.commonStrings!.CONSTRUCTOR);
    

    let list: BasicArrayList = new BasicArrayListD();;
    

    let touchButtonLocationHelper: TouchButtonLocationHelper = new TouchButtonLocationHelper();;
    

    let basicTouchButtonCellPositionFactory: BasicTouchButtonCellPositionFactory = new BasicTouchButtonCellPositionFactory();;
    

    let animationInterface: Animation = NullAnimationFactory.getFactoryInstance()!.getInstance(0)!;;
    

    let hintAnimationInterface: Animation = animationInterface;;
    

    let commonButtons: CommonButtons = CommonButtons.getInstance()!;;
    

    let basicTouchInputFactory: BasicTouchInputFactory = BasicTouchInputFactory.getInstance()!;;
    

    let UP: TouchButton = new TouchButton(basicTouchInputFactory!.UP, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.SECOND_FROM_BOTTOM_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    

    let DOWN: TouchButton = new TouchButton(basicTouchInputFactory!.DOWN, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.BOTTOM_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    

    let LEFT: TouchButton = new TouchButton(basicTouchInputFactory!.LEFT, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.BOTTOM_SECOND_FROM_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    

    let RIGHT: TouchButton = new TouchButton(basicTouchInputFactory!.RIGHT, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.BOTTOM_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    

    let LEFT_STRAFE: TouchButton = new TouchButton(basicTouchInputFactory!.SPECIAL_BUTTON_FOUR, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    

    let RIGHT_STRAFE: TouchButton = new TouchButton(basicTouchInputFactory!.SPECIAL_BUTTON_THREE, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.SECOND_FROM_BOTTOM_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    
list.add(UP);
    
list.add(DOWN);
    
list.add(LEFT);
    
list.add(RIGHT);
    
list.add(LEFT_STRAFE);
    
list.add(RIGHT_STRAFE);
    

                        if(basicTouchButtonCellPositionFactory!.THIRD_FROM_BOTTOM_RIGHT != CellPositionFactory.getInstance()!.NONE)
                        
                                    {
                                    
    let WEAPON: TouchButton = TouchButton.createButton(basicTouchInputFactory!.SPECIAL_BUTTON_TWO, TouchButtonGenericActionResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.THIRD_FROM_BOTTOM_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    
list.add(WEAPON);
    

                                    }
                                

    let ZOOM_IN: TouchButton = new TouchButton(basicTouchInputFactory!.SPECIAL_BUTTON_ONE, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.TOP_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    

    let ZOOM_OUT: TouchButton = new TouchButton(basicTouchInputFactory!.SPECIAL_BUTTON_FIVE, animationInterface, hintAnimationInterface, commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.TOP_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf());;
    

    let SPECIAL3: TouchButton = TouchButton.createButton(basicTouchInputFactory!.SPECIAL_BUTTON_SIX, TouchButtonGenericActionResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.TOP_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    

    let SPECIAL4: TouchButton = TouchButton.createButton(basicTouchInputFactory!.SPECIAL_BUTTON_SEVEN_TESTING_ONLY, TouchButtonGenericActionResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.TOP_SECOND_FROM_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    
list.add(ZOOM_IN);
    
list.add(ZOOM_OUT);
    
list.add(SPECIAL3);
    
list.add(SPECIAL4);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return list;
    
 }
 catch (caught: any) {
 {
  const e = caught;
  
this.logUtil!.put(this.commonStrings!.EXCEPTION, this, this.commonStrings!.GET_LIST, e);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return BasicArrayListUtil.getInstance()!.getImmutableInstance();;
    

 }
   }
 
}


}


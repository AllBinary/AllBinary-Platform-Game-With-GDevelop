
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

import { TouchButtonTurnRightResource } from '../../../../../org/allbinary/input/motion/button/TouchButtonTurnRightResource.js';
//not GWT import const TouchButtonTurnRightResource

import { TouchButtonStrafeRightResource } from '../../../../../org/allbinary/input/motion/button/TouchButtonStrafeRightResource.js';
//not GWT import const TouchButtonStrafeRightResource

import { TouchButtonTurnLeftResource } from '../../../../../org/allbinary/input/motion/button/TouchButtonTurnLeftResource.js';
//not GWT import const TouchButtonTurnLeftResource

import { TouchButtonUpResource } from '../../../../../org/allbinary/input/motion/button/TouchButtonUpResource.js';
//not GWT import const TouchButtonUpResource

import { TouchButtonDownResource } from '../../../../../org/allbinary/input/motion/button/TouchButtonDownResource.js';
//not GWT import const TouchButtonDownResource

import { TouchButtonStrafeLeftResource } from '../../../../../org/allbinary/input/motion/button/TouchButtonStrafeLeftResource.js';
//not GWT import const TouchButtonStrafeLeftResource

import { BaseTouchInput } from '../../../../../org/allbinary/input/motion/button/BaseTouchInput.js';
//not GWT import const BaseTouchInput

import { BasicTouchButtonCellPositionFactory } from '../../../../../org/allbinary/input/motion/button/BasicTouchButtonCellPositionFactory.js';
//not GWT import const BasicTouchButtonCellPositionFactory

import { TouchButtonLocationHelper } from '../../../../../org/allbinary/input/motion/button/TouchButtonLocationHelper.js';
//not GWT import const TouchButtonLocationHelper

import { BasicTouchInputFactory } from '../../../../../org/allbinary/input/motion/button/BasicTouchInputFactory.js';
//not GWT import const BasicTouchInputFactory

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

import { FeaturedAnimationInterfaceFactoryInterfaceFactory } from '../../../../../org/allbinary/animation/FeaturedAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const FeaturedAnimationInterfaceFactoryInterfaceFactory

import { CellPositionFactory } from '../../../../../org/allbinary/graphics/CellPositionFactory.js';
//not GWT import const CellPositionFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameMultiTouchButtonsBuilder extends BaseTouchInput {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    public getList(): BasicArrayList{

        try {
            logUtil!.putF(commonStrings!.START, this, commonStrings!.CONSTRUCTOR);
    

    var list: BasicArrayList = new BasicArrayListD();;
    

    var touchButtonLocationHelper: TouchButtonLocationHelper = new TouchButtonLocationHelper();;
    

    var basicTouchButtonCellPositionFactory: BasicTouchButtonCellPositionFactory = new BasicTouchButtonCellPositionFactory();;
    

    var featuredAnimationInterfaceFactoryInterfaceFactory: FeaturedAnimationInterfaceFactoryInterfaceFactory = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()!;;
    

    var commonButtons: CommonButtons = CommonButtons.getInstance()!;;
    

    var basicTouchInputFactory: BasicTouchInputFactory = BasicTouchInputFactory.getInstance()!;;
    

    var UP: TouchButton = TouchButton.createButton(basicTouchInputFactory!.UP, TouchButtonUpResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.SECOND_FROM_BOTTOM_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    

    var DOWN: TouchButton = TouchButton.createButton(basicTouchInputFactory!.DOWN, TouchButtonDownResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.BOTTOM_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    

    var LEFT: TouchButton = TouchButton.createButton(basicTouchInputFactory!.LEFT, TouchButtonTurnLeftResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.BOTTOM_SECOND_FROM_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    

    var RIGHT: TouchButton = TouchButton.createButton(basicTouchInputFactory!.RIGHT, TouchButtonTurnRightResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.BOTTOM_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    

    var LEFT_STRAFE: TouchButton = TouchButton.createButton(basicTouchInputFactory!.SPECIAL_BUTTON_FOUR, TouchButtonStrafeLeftResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    

    var RIGHT_STRAFE: TouchButton = TouchButton.createButton(basicTouchInputFactory!.SPECIAL_BUTTON_THREE, TouchButtonStrafeRightResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.SECOND_FROM_BOTTOM_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    
list.add(UP);
    
list.add(DOWN);
    
list.add(LEFT);
    
list.add(RIGHT);
    
list.add(LEFT_STRAFE);
    
list.add(RIGHT_STRAFE);
    

                        if(basicTouchButtonCellPositionFactory!.THIRD_FROM_BOTTOM_RIGHT != CellPositionFactory.getInstance()!.NONE)
                        
                                    {
                                    
    var WEAPON: TouchButton = TouchButton.createButton(basicTouchInputFactory!.SPECIAL_BUTTON_TWO, TouchButtonGenericActionResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.THIRD_FROM_BOTTOM_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    
list.add(WEAPON);
    

                                    }
                                

    var ZOOM_IN: TouchButton = TouchButton.createButton(basicTouchInputFactory!.SPECIAL_BUTTON_ONE, TouchButtonGenericActionResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.TOP_RIGHT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    

    var ZOOM_OUT: TouchButton = TouchButton.createButton(basicTouchInputFactory!.SPECIAL_BUTTON_FIVE, TouchButtonGenericActionResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.TOP_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    

    var SPECIAL3: TouchButton = TouchButton.createButton(basicTouchInputFactory!.SPECIAL_BUTTON_SIX, TouchButtonGenericActionResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.TOP_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    

    var SPECIAL4: TouchButton = TouchButton.createButton(basicTouchInputFactory!.SPECIAL_BUTTON_SEVEN_TESTING_ONLY, TouchButtonGenericActionResource.getInstance(), commonButtons!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!.TOP_SECOND_FROM_LEFT, touchButtonLocationHelper!.getColumnsRemainderHalf(), touchButtonLocationHelper!.getRowsRemainderHalf())!;;
    
list.add(ZOOM_IN);
    
list.add(ZOOM_OUT);
    
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




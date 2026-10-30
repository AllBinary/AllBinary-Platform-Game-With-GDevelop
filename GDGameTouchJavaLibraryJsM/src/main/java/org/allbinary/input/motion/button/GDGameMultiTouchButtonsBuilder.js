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
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not plain js import { BasicArrayListUtil } 
const BasicArrayListUtil = globalThis.org.allbinary.util.BasicArrayListUtil;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
import { FeaturedAnimationInterfaceFactoryInterfaceFactory } from '../../../../../org/allbinary/animation/FeaturedAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const FeaturedAnimationInterfaceFactoryInterfaceFactory
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
import { TouchButtonUpResource } from './TouchButtonUpResource.js';
//not GWT import - same folder const TouchButtonUpResource
import { TouchButtonDownResource } from './TouchButtonDownResource.js';
//not GWT import - same folder const TouchButtonDownResource
import { TouchButtonTurnLeftResource } from './TouchButtonTurnLeftResource.js';
//not GWT import - same folder const TouchButtonTurnLeftResource
import { TouchButtonTurnRightResource } from './TouchButtonTurnRightResource.js';
//not GWT import - same folder const TouchButtonTurnRightResource
import { TouchButtonStrafeLeftResource } from './TouchButtonStrafeLeftResource.js';
//not GWT import - same folder const TouchButtonStrafeLeftResource
import { TouchButtonStrafeRightResource } from './TouchButtonStrafeRightResource.js';
//not GWT import - same folder const TouchButtonStrafeRightResource
import { TouchButtonGenericActionResource } from './TouchButtonGenericActionResource.js';
//not GWT import - same folder const TouchButtonGenericActionResource
export class GDGameMultiTouchButtonsBuilder extends BaseTouchInput {
    constructor() {
        super(...arguments);
        this.logUtil = LogUtil.getInstance();
    }
    getList() {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
            let list = new BasicArrayListD();
            ;
            let touchButtonLocationHelper = new TouchButtonLocationHelper();
            ;
            let basicTouchButtonCellPositionFactory = new BasicTouchButtonCellPositionFactory();
            ;
            let featuredAnimationInterfaceFactoryInterfaceFactory = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance();
            ;
            let commonButtons = CommonButtons.getInstance();
            ;
            let basicTouchInputFactory = BasicTouchInputFactory.getInstance();
            ;
            let UP = TouchButton.createButton(basicTouchInputFactory.UP, TouchButtonUpResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.SECOND_FROM_BOTTOM_LEFT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
            ;
            let DOWN = TouchButton.createButton(basicTouchInputFactory.DOWN, TouchButtonDownResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.BOTTOM_LEFT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
            ;
            let LEFT = TouchButton.createButton(basicTouchInputFactory.LEFT, TouchButtonTurnLeftResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.BOTTOM_SECOND_FROM_RIGHT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
            ;
            let RIGHT = TouchButton.createButton(basicTouchInputFactory.RIGHT, TouchButtonTurnRightResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.BOTTOM_RIGHT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
            ;
            let LEFT_STRAFE = TouchButton.createButton(basicTouchInputFactory.SPECIAL_BUTTON_FOUR, TouchButtonStrafeLeftResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
            ;
            let RIGHT_STRAFE = TouchButton.createButton(basicTouchInputFactory.SPECIAL_BUTTON_THREE, TouchButtonStrafeRightResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.SECOND_FROM_BOTTOM_RIGHT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
            ;
            list.add(UP);
            list.add(DOWN);
            list.add(LEFT);
            list.add(RIGHT);
            list.add(LEFT_STRAFE);
            list.add(RIGHT_STRAFE);
            if (basicTouchButtonCellPositionFactory.THIRD_FROM_BOTTOM_RIGHT != CellPositionFactory.getInstance().NONE) {
                let WEAPON = TouchButton.createButton(basicTouchInputFactory.SPECIAL_BUTTON_TWO, TouchButtonGenericActionResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.THIRD_FROM_BOTTOM_RIGHT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
                ;
                list.add(WEAPON);
            }
            let ZOOM_IN = TouchButton.createButton(basicTouchInputFactory.SPECIAL_BUTTON_ONE, TouchButtonGenericActionResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.TOP_RIGHT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
            ;
            let ZOOM_OUT = TouchButton.createButton(basicTouchInputFactory.SPECIAL_BUTTON_FIVE, TouchButtonGenericActionResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.TOP_LEFT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
            ;
            let SPECIAL3 = TouchButton.createButton(basicTouchInputFactory.SPECIAL_BUTTON_SIX, TouchButtonGenericActionResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.TOP_LEFT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
            ;
            let SPECIAL4 = TouchButton.createButton(basicTouchInputFactory.SPECIAL_BUTTON_SEVEN_TESTING_ONLY, TouchButtonGenericActionResource.getInstance(), commonButtons.NORMAL_BUTTON, basicTouchButtonCellPositionFactory.TOP_SECOND_FROM_LEFT, touchButtonLocationHelper.getColumnsRemainderHalf(), touchButtonLocationHelper.getRowsRemainderHalf());
            ;
            list.add(ZOOM_IN);
            list.add(ZOOM_OUT);
            list.add(SPECIAL3);
            list.add(SPECIAL4);
            //if statement needs to be on the same line and ternary does not work the same way.
            return list;
        }
        catch (caught) {
            {
                const e = caught;
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.GET_LIST, e);
                //if statement needs to be on the same line and ternary does not work the same way.
                return BasicArrayListUtil.getInstance().getImmutableInstance();
                ;
            }
        }
    }
}

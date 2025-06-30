/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
* 
* By agreeing to this license you and any business entity you represent are
* legally bound to the AllBinary Open License Version 1 legal agreement.
* 
* You may obtain the AllBinary Open License Version 1 legal agreement from
* AllBinary or the root directory of AllBinary's AllBinary Platform repository.
* 
* Created By: Travis Berthelot
* 
*/
package org.allbinary.input.motion.button;

import org.allbinary.input.motion.button.TouchButtonGenericActionResource;
import org.allbinary.input.motion.button.TouchButtonTurnRightResource;
import org.allbinary.input.motion.button.TouchButtonStrafeRightResource;
import org.allbinary.input.motion.button.TouchButtonTurnLeftResource;
import org.allbinary.input.motion.button.TouchButtonUpResource;
import org.allbinary.input.motion.button.TouchButtonDownResource;
import org.allbinary.input.motion.button.TouchButtonStrafeLeftResource;
import org.allbinary.input.motion.button.BaseTouchInput;
import org.allbinary.input.motion.button.BasicTouchButtonCellPositionFactory;
import org.allbinary.input.motion.button.TouchButtonLocationHelper;
import org.allbinary.input.motion.button.BasicTouchInputFactory;
import org.allbinary.input.motion.button.TouchButton;
import org.allbinary.input.motion.button.CommonButtons;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;

import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.graphics.CellPositionFactory;

public class GDGameMultiTouchButtonsBuilder 
extends BaseTouchInput
{
    public BasicArrayList getList()
    {
        try
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.START, this, commonStrings.CONSTRUCTOR));

            final BasicArrayList list = new BasicArrayList();

            TouchButtonLocationHelper touchButtonLocationHelper = new TouchButtonLocationHelper();

            BasicTouchButtonCellPositionFactory basicTouchButtonCellPositionFactory =
                new BasicTouchButtonCellPositionFactory();

            FeaturedAnimationInterfaceFactoryInterfaceFactory
            featuredAnimationInterfaceFactoryInterfaceFactory =
                FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance();
            
            CommonButtons commonButtons = CommonButtons.getInstance();

            BasicTouchInputFactory basicTouchInputFactory = BasicTouchInputFactory.getInstance();
            
            TouchButton UP = new TouchButton(basicTouchInputFactory.UP,
                    TouchButtonUpResource.getInstance(),
                    commonButtons.NORMAL_BUTTON, 
                    basicTouchButtonCellPositionFactory.SECOND_FROM_BOTTOM_LEFT,
                    touchButtonLocationHelper.getColumnsRemainderHalf(), 
                    touchButtonLocationHelper.getRowsRemainderHalf()
                    );

            TouchButton DOWN = new TouchButton(basicTouchInputFactory.DOWN,
                    TouchButtonDownResource.getInstance(),
                    commonButtons.NORMAL_BUTTON,
                    basicTouchButtonCellPositionFactory.BOTTOM_LEFT,
                    touchButtonLocationHelper.getColumnsRemainderHalf(), 
                    touchButtonLocationHelper.getRowsRemainderHalf()
                    );
            
            TouchButton LEFT = new TouchButton(basicTouchInputFactory.LEFT,
                    TouchButtonTurnLeftResource.getInstance(),
                    commonButtons.NORMAL_BUTTON,
                    basicTouchButtonCellPositionFactory.BOTTOM_SECOND_FROM_RIGHT,
                    touchButtonLocationHelper.getColumnsRemainderHalf(), 
                    touchButtonLocationHelper.getRowsRemainderHalf()
                    );

            TouchButton RIGHT = new TouchButton(basicTouchInputFactory.RIGHT,
                    TouchButtonTurnRightResource.getInstance(),
                    commonButtons.NORMAL_BUTTON,
                    basicTouchButtonCellPositionFactory.BOTTOM_RIGHT,
                    touchButtonLocationHelper.getColumnsRemainderHalf(), 
                    touchButtonLocationHelper.getRowsRemainderHalf()
                    );

            TouchButton LEFT_STRAFE = new TouchButton(basicTouchInputFactory.SPECIAL_BUTTON_FOUR,
                    TouchButtonStrafeLeftResource.getInstance(),
                    commonButtons.NORMAL_BUTTON,
                    basicTouchButtonCellPositionFactory.SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT,
                    touchButtonLocationHelper.getColumnsRemainderHalf(), 
                    touchButtonLocationHelper.getRowsRemainderHalf()
                    );

            TouchButton RIGHT_STRAFE = new TouchButton(basicTouchInputFactory.SPECIAL_BUTTON_THREE,
                    TouchButtonStrafeRightResource.getInstance(),
                    commonButtons.NORMAL_BUTTON,
                    basicTouchButtonCellPositionFactory.SECOND_FROM_BOTTOM_RIGHT,
                    touchButtonLocationHelper.getColumnsRemainderHalf(), 
                    touchButtonLocationHelper.getRowsRemainderHalf()
                    );
            
            list.add(UP);
            list.add(DOWN);
            list.add(LEFT);
            list.add(RIGHT);
            list.add(LEFT_STRAFE);
            list.add(RIGHT_STRAFE);
            
            if(basicTouchButtonCellPositionFactory.THIRD_FROM_BOTTOM_RIGHT != 
                CellPositionFactory.getInstance().NONE)
            {
                TouchButton WEAPON = new TouchButton(basicTouchInputFactory.SPECIAL_BUTTON_TWO,
                        TouchButtonGenericActionResource.getInstance(),
                        commonButtons.NORMAL_BUTTON,
                        basicTouchButtonCellPositionFactory.THIRD_FROM_BOTTOM_RIGHT,
                        touchButtonLocationHelper.getColumnsRemainderHalf(), 
                        touchButtonLocationHelper.getRowsRemainderHalf()
                        );

                list.add(WEAPON);

            }

            TouchButton ZOOM_IN = new TouchButton(
                    basicTouchInputFactory.SPECIAL_BUTTON_ONE,
                    TouchButtonGenericActionResource.getInstance(),
                    commonButtons.NORMAL_BUTTON,
                    basicTouchButtonCellPositionFactory.TOP_RIGHT,
                    touchButtonLocationHelper.getColumnsRemainderHalf(), 
                    touchButtonLocationHelper.getRowsRemainderHalf()
                    );

            TouchButton ZOOM_OUT = new TouchButton(
                    basicTouchInputFactory.SPECIAL_BUTTON_FIVE,
                    TouchButtonGenericActionResource.getInstance(),
                    commonButtons.NORMAL_BUTTON,
                    basicTouchButtonCellPositionFactory.TOP_LEFT,
                    touchButtonLocationHelper.getColumnsRemainderHalf(), 
                    touchButtonLocationHelper.getRowsRemainderHalf()
                    );

            TouchButton SPECIAL3 = new TouchButton(
                    basicTouchInputFactory.SPECIAL_BUTTON_SIX,
                    TouchButtonGenericActionResource.getInstance(),
                    commonButtons.NORMAL_BUTTON,
                    basicTouchButtonCellPositionFactory.TOP_LEFT,
                    touchButtonLocationHelper.getColumnsRemainderHalf(), 
                    touchButtonLocationHelper.getRowsRemainderHalf()
                    );

            TouchButton SPECIAL4 = new TouchButton(
                    basicTouchInputFactory.SPECIAL_BUTTON_SEVEN_TESTING_ONLY,
                    TouchButtonGenericActionResource.getInstance(),
                    commonButtons.NORMAL_BUTTON,
                    basicTouchButtonCellPositionFactory.TOP_SECOND_FROM_LEFT,
                    touchButtonLocationHelper.getColumnsRemainderHalf(), 
                    touchButtonLocationHelper.getRowsRemainderHalf()
                    );
            
            /*
            TouchButton ROTATE_Z = new TouchButton(basicTouchInputFactory.SPECIAL_BUTTON_EIGHT_TESTING_ONLY,
                    animationInterface,
                    commonButtons.NORMAL_BUTTON,
                    basicTouchButtonCellPositionFactory.SECOND_FROM_TOP_LEFT,
                    touchButtonLocationHelper.getColumnsRemainderHalf(), 
                    touchButtonLocationHelper.getRowsRemainderHalf()
                    );
            */

            list.add(ZOOM_IN);
            list.add(ZOOM_OUT);
            
            list.add(SPECIAL3);
            list.add(SPECIAL4);
            //list.add(ROTATE_Z);

            return list;
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.GET_LIST, e));
            return BasicArrayListUtil.getInstance().getImmutableInstance();
        }
    }
}

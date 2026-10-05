
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
        package org.allbinary.input.motion.button




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.input.motion.button.TouchButtonGenericActionResource
import org.allbinary.input.motion.button.BaseTouchInput
import org.allbinary.input.motion.button.BasicTouchButtonCellPositionFactory
import org.allbinary.input.motion.button.TouchButtonLocationHelper
import org.allbinary.input.motion.button.BasicTouchInputFactory
import org.allbinary.input.motion.button.TouchButton
import org.allbinary.input.motion.button.CommonButtons
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.allbinary.util.BasicArrayListUtil
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogFactory
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.animation.Animation
import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.animation.NullAnimationFactory
import org.allbinary.graphics.CellPositionFactory

open public class GDGameNeededMultiTouchButtonsBuilder : BaseTouchInput {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    open fun getList()
        //nullable = true from not(false or (false and true)) = true
: BasicArrayList{

        try {
            logUtil!!.putF(commonStrings!!.START, this, commonStrings!!.CONSTRUCTOR)

    var list: BasicArrayList = BasicArrayListD()


    var touchButtonLocationHelper: TouchButtonLocationHelper = TouchButtonLocationHelper()


    var basicTouchButtonCellPositionFactory: BasicTouchButtonCellPositionFactory = BasicTouchButtonCellPositionFactory()


    var animationInterface: Animation = NullAnimationFactory.getFactoryInstance()!!.getInstance(0)!!


    var hintAnimationInterface: Animation = animationInterface


    var commonButtons: CommonButtons = CommonButtons.getInstance()!!


    var basicTouchInputFactory: BasicTouchInputFactory = BasicTouchInputFactory.getInstance()!!


    var UP: TouchButton = TouchButton(basicTouchInputFactory!!.UP, animationInterface, hintAnimationInterface, commonButtons!!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!!.SECOND_FROM_BOTTOM_LEFT, touchButtonLocationHelper!!.getColumnsRemainderHalf(), touchButtonLocationHelper!!.getRowsRemainderHalf())


    var DOWN: TouchButton = TouchButton(basicTouchInputFactory!!.DOWN, animationInterface, hintAnimationInterface, commonButtons!!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!!.BOTTOM_LEFT, touchButtonLocationHelper!!.getColumnsRemainderHalf(), touchButtonLocationHelper!!.getRowsRemainderHalf())


    var LEFT: TouchButton = TouchButton(basicTouchInputFactory!!.LEFT, animationInterface, hintAnimationInterface, commonButtons!!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!!.BOTTOM_SECOND_FROM_RIGHT, touchButtonLocationHelper!!.getColumnsRemainderHalf(), touchButtonLocationHelper!!.getRowsRemainderHalf())


    var RIGHT: TouchButton = TouchButton(basicTouchInputFactory!!.RIGHT, animationInterface, hintAnimationInterface, commonButtons!!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!!.BOTTOM_RIGHT, touchButtonLocationHelper!!.getColumnsRemainderHalf(), touchButtonLocationHelper!!.getRowsRemainderHalf())


    var LEFT_STRAFE: TouchButton = TouchButton(basicTouchInputFactory!!.SPECIAL_BUTTON_FOUR, animationInterface, hintAnimationInterface, commonButtons!!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!!.SECOND_FROM_BOTTOM_SECOND_FROM_RIGHT, touchButtonLocationHelper!!.getColumnsRemainderHalf(), touchButtonLocationHelper!!.getRowsRemainderHalf())


    var RIGHT_STRAFE: TouchButton = TouchButton(basicTouchInputFactory!!.SPECIAL_BUTTON_THREE, animationInterface, hintAnimationInterface, commonButtons!!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!!.SECOND_FROM_BOTTOM_RIGHT, touchButtonLocationHelper!!.getColumnsRemainderHalf(), touchButtonLocationHelper!!.getRowsRemainderHalf())

list.add(UP)
list.add(DOWN)
list.add(LEFT)
list.add(RIGHT)
list.add(LEFT_STRAFE)
list.add(RIGHT_STRAFE)

    
                        if(basicTouchButtonCellPositionFactory!!.THIRD_FROM_BOTTOM_RIGHT != CellPositionFactory.getInstance()!!.NONE)
                        
                                    {
                                    
    var WEAPON: TouchButton = TouchButton.createButton(basicTouchInputFactory!!.SPECIAL_BUTTON_TWO, TouchButtonGenericActionResource.getInstance(), commonButtons!!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!!.THIRD_FROM_BOTTOM_RIGHT, touchButtonLocationHelper!!.getColumnsRemainderHalf(), touchButtonLocationHelper!!.getRowsRemainderHalf())!!

list.add(WEAPON)

                                    }
                                

    var ZOOM_IN: TouchButton = TouchButton(basicTouchInputFactory!!.SPECIAL_BUTTON_ONE, animationInterface, hintAnimationInterface, commonButtons!!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!!.TOP_RIGHT, touchButtonLocationHelper!!.getColumnsRemainderHalf(), touchButtonLocationHelper!!.getRowsRemainderHalf())


    var ZOOM_OUT: TouchButton = TouchButton(basicTouchInputFactory!!.SPECIAL_BUTTON_FIVE, animationInterface, hintAnimationInterface, commonButtons!!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!!.TOP_LEFT, touchButtonLocationHelper!!.getColumnsRemainderHalf(), touchButtonLocationHelper!!.getRowsRemainderHalf())


    var SPECIAL3: TouchButton = TouchButton.createButton(basicTouchInputFactory!!.SPECIAL_BUTTON_SIX, TouchButtonGenericActionResource.getInstance(), commonButtons!!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!!.TOP_LEFT, touchButtonLocationHelper!!.getColumnsRemainderHalf(), touchButtonLocationHelper!!.getRowsRemainderHalf())!!


    var SPECIAL4: TouchButton = TouchButton.createButton(basicTouchInputFactory!!.SPECIAL_BUTTON_SEVEN_TESTING_ONLY, TouchButtonGenericActionResource.getInstance(), commonButtons!!.NORMAL_BUTTON, basicTouchButtonCellPositionFactory!!.TOP_SECOND_FROM_LEFT, touchButtonLocationHelper!!.getColumnsRemainderHalf(), touchButtonLocationHelper!!.getRowsRemainderHalf())!!

list.add(ZOOM_IN)
list.add(ZOOM_OUT)
list.add(SPECIAL3)
list.add(SPECIAL4)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return list
} catch(e: Exception)
            {
logUtil!!.put(commonStrings!!.EXCEPTION, this, commonStrings!!.GET_LIST, e)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return BasicArrayListUtil.getInstance()!!.getImmutableInstance()
}

}


}
                
            



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
        package org.allbinary.game.layer.form




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.input.KeyInterface
import org.allbinary.game.input.event.DownGameKeyEventListenerInterface
import org.allbinary.game.input.event.DownKeyEventListenerInterface
import org.allbinary.game.input.event.GameKeyEvent
import org.allbinary.game.input.event.GameKeyEventListenerInterface
import org.allbinary.game.input.event.RawKeyEventListener
import org.allbinary.game.input.event.UpGameKeyEventListenerInterface
import org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
import org.allbinary.logic.util.event.AllBinaryEventObject

open public class GDFormInput
            : Object
        
                , KeyInterface
                , DownGameKeyEventListenerInterface
                , BaseMotionGestureEventListener
                , RawKeyEventListener
                , DownKeyEventListenerInterface {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    override fun onEventRaw(keyCode: Int, deviceId: Int, repeated: Boolean)
        //nullable = true from not(false or (false and false)) = true
{
    //var keyCode = keyCode
    //var deviceId = deviceId
    //var repeated = repeated
}


    override fun onEvent(eventObject: AllBinaryEventObject)
        //nullable = true from not(false or (false and false)) = true
{
var eventObject = eventObject
}


    open fun onPressGameKeyEvent(gameKeyEvent: GameKeyEvent)
        //nullable = true from not(false or (false and false)) = true
{
var gameKeyEvent = gameKeyEvent
}


    override fun onDownGameKeyEvent(gameKeyEvent: GameKeyEvent)
        //nullable = true from not(false or (false and false)) = true
{
var gameKeyEvent = gameKeyEvent
}


                @Throws(Exception::class)
            
    override fun onDownKeyEvent(keyInteger: GameKeyEvent)
        //nullable = true from not(false or (false and false)) = true
{
    //var keyInteger = keyInteger
}


                @Throws(Exception::class)
            
    override fun onDownKey(keyInteger: Integer)
        //nullable = true from not(false or (false and false)) = true
{
    //var keyInteger = keyInteger
}


    open fun onUpGameKeyEvent(gameKeyEvent: GameKeyEvent)
        //nullable = true from not(false or (false and false)) = true
{
var gameKeyEvent = gameKeyEvent
}


    override fun onMotionGestureEvent(motionGestureEvent: MotionGestureEvent)
        //nullable = true from not(false or (false and false)) = true
{
    //var motionGestureEvent = motionGestureEvent
}


    override fun onScrolledMotionGestureEvent(motionGestureEvent: MotionGestureEvent)
        //nullable = true from not(false or (false and false)) = true
{
var motionGestureEvent = motionGestureEvent
}


    override fun keyPressed(keyCode: Int)
        //nullable = true from not(false or (false and false)) = true
{
var keyCode = keyCode
}


    override fun keyReleased(keyCode: Int)
        //nullable = true from not(false or (false and false)) = true
{
var keyCode = keyCode
}


    override fun keyPressedByDevice(keyCode: Int, deviceId: Int)
        //nullable = true from not(false or (false and false)) = true
{
var keyCode = keyCode
var deviceId = deviceId
}


    override fun keyReleasedByDevice(keyCode: Int, deviceId: Int)
        //nullable = true from not(false or (false and false)) = true
{
var keyCode = keyCode
var deviceId = deviceId
}


    open fun reset()
        //nullable = true from not(false or (false and true)) = true
{
}


}
                
            


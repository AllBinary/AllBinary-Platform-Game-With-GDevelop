
        /* Generated Code Do Not Modify */
        package org.allbinary.game.layer.form




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.input.event.DownKeyEventListenerInterface
import org.allbinary.game.input.event.GameKeyEvent
import org.allbinary.game.input.event.RawKeyEventListener
import org.allbinary.game.layer.GDGameLayer
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
import org.allbinary.logic.util.event.AllBinaryEventObject

open public class GDForm
            : Object
        
                , RawKeyEventListener
                , DownKeyEventListenerInterface {
        
public constructor ()
            : super()
        {
}


    override fun onEventRaw(keyCode: Int, deviceId: Int, repeated: Boolean)
        //nullable = true from not(false or (false and false)) = true
{
    //var keyCode = keyCode
    //var deviceId = deviceId
    //var repeated = repeated
}


    open fun submit()
        //nullable = true from not(false or (false and true)) = true
{
}


    open fun open()
        //nullable = true from not(false or (false and true)) = true
{
}


    open fun close()
        //nullable = true from not(false or (false and true)) = true
{
}


    open fun onMotionGestureEvent(motionGestureEvent: MotionGestureEvent)
        //nullable = true from not(false or (false and false)) = true
{
    //var motionGestureEvent = motionGestureEvent
}


    open fun onPressGameKeyEvent(gameKeyEvent: GameKeyEvent)
        //nullable = true from not(false or (false and false)) = true
{
var gameKeyEvent = gameKeyEvent
}


    open fun onDownGameKeyEvent(gameKeyEvent: GameKeyEvent)
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


    override fun onEvent(eventObject: AllBinaryEventObject)
        //nullable = true from not(false or (false and false)) = true
{
var eventObject = eventObject
}


    open fun append(gameLayerAsItem: GDGameLayer)
        //nullable = true from not(false or (false and false)) = true
: Int{
var gameLayerAsItem = gameLayerAsItem



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return  -1
}


    open fun delete(itemNum: Int)
        //nullable = true from not(false or (false and false)) = true
{
var itemNum = itemNum
}


    open fun deleteAll()
        //nullable = true from not(false or (false and true)) = true
{
}


    open fun get(itemNum: Int)
        //nullable = true from not(false or (false and false)) = true
: GDGameLayer{
var itemNum = itemNum



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null
}


    open fun getHeight()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return  -1
}


    open fun getWidth()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return  -1
}


    open fun insert(itemNum: Int, gameLayerAsItem: GDGameLayer)
        //nullable = true from not(false or (false and false)) = true
{
var itemNum = itemNum
var gameLayerAsItem = gameLayerAsItem
}


    open fun set(itemNum: Int, gameLayerAsItem: GDGameLayer)
        //nullable = true from not(false or (false and false)) = true
{
var itemNum = itemNum
var gameLayerAsItem = gameLayerAsItem
}


    open fun setItemStateListener(iListener: GDGameLayerItemStateListener)
        //nullable = true from not(false or (false and false)) = true
{
var iListener = iListener
}


    open fun size()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 0
}


    open fun fireItemStateListener(gameLayerAsItem: GDGameLayer)
        //nullable = true from not(false or (false and false)) = true
{
var gameLayerAsItem = gameLayerAsItem
}


    open fun fireItemStateListener()
        //nullable = true from not(false or (false and true)) = true
{
}


    open fun hideNotify()
        //nullable = true from not(false or (false and true)) = true
{
}


    open fun keyPressed(keyCode: Int)
        //nullable = true from not(false or (false and false)) = true
{
var keyCode = keyCode
}


    open fun keyReleased(keyCode: Int)
        //nullable = true from not(false or (false and false)) = true
{
var keyCode = keyCode
}


    open fun keyRepeated(keyCode: Int)
        //nullable = true from not(false or (false and false)) = true
{
var keyCode = keyCode
}


    open fun keyPressedByDevice(keyCode: Int, deviceId: Int)
        //nullable = true from not(false or (false and false)) = true
{
var keyCode = keyCode
var deviceId = deviceId
}


    open fun keyReleasedByDevice(keyCode: Int, deviceId: Int)
        //nullable = true from not(false or (false and false)) = true
{
var keyCode = keyCode
var deviceId = deviceId
}


    open fun showNotify()
        //nullable = true from not(false or (false and true)) = true
{
}


    open fun traverse(keyCode: Int, top: Int, bottom: Int)
        //nullable = true from not(false or (false and false)) = true
: Int{
var keyCode = keyCode
var top = top
var bottom = bottom



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return  -1
}


    open fun getTopVisibleIndex(top: Int)
        //nullable = true from not(false or (false and false)) = true
: Int{
var top = top



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return  -1
}


    open fun getBottomVisibleIndex(bottom: Int)
        //nullable = true from not(false or (false and false)) = true
: Int{
var bottom = bottom



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return  -1
}


    open fun getHeightToItem(itemIndex: Int)
        //nullable = true from not(false or (false and false)) = true
: Int{
var itemIndex = itemIndex



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return  -1
}


    open fun reset()
        //nullable = true from not(false or (false and true)) = true
{
}


}
                
            



        /* Generated Code Do Not Modify */
        package org.allbinary.game.layer.form




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.input.GameKey
import org.allbinary.game.input.GameKeyFactory
import org.allbinary.game.layer.GDAnimationBehaviorBase
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent

open public class GDItemAnimationBehavior : GDAnimationBehaviorBase {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val gameKeyFactory: GameKeyFactory = GameKeyFactory.getInstance()!!

    var hasFocus: Boolean= false

    open fun select(gameKey: GameKey, keyCode: Int)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var gameKey = gameKey
    //var keyCode = keyCode



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 0
}


    open fun onMotionGestureEvent(motionGestureEvent: MotionGestureEvent)
        //nullable = true from not(false or (false and false)) = true
{
    //var motionGestureEvent = motionGestureEvent
}


    open fun keyPressed(keyCode: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var keyCode = keyCode
}


    open fun isFocusable()
        //nullable = true from not(false or (false and true)) = true
: Boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true
}


    open fun setFocus(hasFocus: Boolean)
        //nullable = true from not(false or (false and false)) = true
{
    //var hasFocus = hasFocus
this.hasFocus= hasFocus
}


    open fun hasFocus()
        //nullable = true from not(false or (false and true)) = true
: Boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return hasFocus
}


    open fun traverse(gameKeyCode: Int, top: Int, bottom: Int, action: Boolean)
        //nullable = true from not(false or (false and false)) = true
: Int{
var gameKeyCode = gameKeyCode
var top = top
var bottom = bottom
var action = action



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 0
}


}
                
            


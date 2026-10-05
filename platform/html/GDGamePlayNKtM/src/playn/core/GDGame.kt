
        /* Generated Code Do Not Modify */
        package playn.core




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.canvas.GDGameSoftwareInfo
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.game.configuration.GameConfigurationCentral
import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.configuration.feature.GameFeatureFactory
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory
import org.allbinary.game.configuration.feature.InputFeatureFactory
import org.allbinary.game.configuration.feature.SensorFeatureFactory
import org.allbinary.input.motion.AllMotionRecognizer
import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler
import org.allbinary.input.motion.gesture.observer.GameMotionGestureListener
import org.allbinary.input.motion.gesture.observer.MotionGestureReceiveInterfaceFactory
import org.allbinary.logic.math.SmallIntegerSingletonFactory
import org.allbinary.media.audio.EarlySoundsFactory
import org.allbinary.media.audio.Sounds
import org.allbinary.game.init.DefaultGameInitializationListener
import org.allbinary.game.input.event.RawKeyEventHandler
import org.allbinary.input.motion.gesture.observer.GDGameMotionGestureListener
import org.allbinary.string.CommonLabels
import org.allbinary.logic.system.security.licensing.GDGameClientInformationInterfaceFactory
import org.allbinary.media.audio.GDGameSoundsFactory
import org.allbinary.playn.input.PlayNToAllBinaryKeyInputUtil

open public class GDGame : org.allbinary.game.GDGameMIDlet
                , Keyboard.Listener
                , Mouse.Listener
                , Pointer.Listener {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val DEVICE_ID: Int = 0

    private val playNToAllBinaryKeyInputUtil: PlayNToAllBinaryKeyInputUtil = PlayNToAllBinaryKeyInputUtil.getInstance()!!

    private val rawKeyEventHandler: RawKeyEventHandler = RawKeyEventHandler.getInstance()!!

    private var motionRecognizer: AllMotionRecognizer = AllMotionRecognizer()
public constructor ()                        

                            : super(GDGameClientInformationInterfaceFactory.getFactoryInstance()){


                            //For kotlin this is before the body of the constructor.
                    
GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION= GDGameClientInformationInterfaceFactory.getFactoryInstance()!!.getInstance()

    var motionGesturesHandler: BasicMotionGesturesHandler = this.motionRecognizer!!.getMotionGestureRecognizer()!!.getMotionGesturesHandler()!!

motionGesturesHandler!!.addListenerInterface(GameMotionGestureListener(MotionGestureReceiveInterfaceFactory.getInstance()))
motionGesturesHandler!!.addListenerInterface(GDGameMotionGestureListener())
PlayN.keyboard()!!.setListener(this)
PlayN.mouse()!!.setListener(this)
PlayN.pointer()!!.setListener(this)
DefaultGameInitializationListener()
}


    override fun init()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            this.logUtil!!.putF(CommonStrings.getInstance()!!.START, this, CommonStrings.getInstance()!!.INIT)

    var features: Features = Features.getInstance()!!


    var gameFeatureFactory: GameFeatureFactory = GameFeatureFactory.getInstance()!!


    var inputFeatureFactory: InputFeatureFactory = InputFeatureFactory.getInstance()!!


    var graphicsFeatureFactory: GraphicsFeatureFactory = GraphicsFeatureFactory.getInstance()!!


    var sensorFeatureFactory: SensorFeatureFactory = SensorFeatureFactory.getInstance()!!

features.removeDefault(sensorFeatureFactory!!.ORIENTATION_SENSORS)
features.addDefault(sensorFeatureFactory!!.NO_ORIENTATION)
features.addDefault(graphicsFeatureFactory!!.IMAGE_GRAPHICS)
features.addDefault(graphicsFeatureFactory!!.SPRITE_FULL_GRAPHICS)
features.addDefault(gameFeatureFactory!!.HEALTH_BARS)
features.addDefault(gameFeatureFactory!!.DAMAGE_FLOATERS)
features.addDefault(gameFeatureFactory!!.DROPPED_ITEMS)
features.addDefault(gameFeatureFactory!!.SOUND)
features.addDefault(inputFeatureFactory!!.MULTI_KEY_PRESS)
features.addDefault(inputFeatureFactory!!.REMOVE_DUPLICATE_KEY_PRESSES)

    var gameConfigurationCentral: GameConfigurationCentral = GameConfigurationCentral.getInstance()!!


    var smallIntegerSingletonFactory: SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()!!

gameConfigurationCentral!!.VIBRATION.setDefaultValue(smallIntegerSingletonFactory!!.getAt(0))
gameConfigurationCentral!!.VIBRATION.setDefault()
gameConfigurationCentral!!.SPEED_CHALLENGE_LEVEL.setDefaultValue(smallIntegerSingletonFactory!!.getAt(4))
gameConfigurationCentral!!.SPEED_CHALLENGE_LEVEL.setDefault()
gameConfigurationCentral!!.SPEED.setDefaultValue(smallIntegerSingletonFactory!!.getAt(9))
gameConfigurationCentral!!.SPEED.setDefault()
gameConfigurationCentral!!.PLAYER_INPUT_WAIT.setDefaultValue(smallIntegerSingletonFactory!!.getAt(0))
gameConfigurationCentral!!.PLAYER_INPUT_WAIT.setDefault()
gameConfigurationCentral!!.SCALE.setDefaultValue(smallIntegerSingletonFactory!!.getAt(3))
gameConfigurationCentral!!.SCALE.setDefault()
features.removeDefault(sensorFeatureFactory!!.ORIENTATION_SENSORS)
features.addDefault(sensorFeatureFactory!!.NO_ORIENTATION)
} catch(e: Exception)
            {
this.logUtil!!.put(CommonStrings.getInstance()!!.EXCEPTION, this, CommonStrings.getInstance()!!.CONSTRUCTOR, e)
}

}


    override fun stopAll()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            Sounds(EarlySoundsFactory.getInstance()).
                            stopAll()
Sounds(GDGameSoundsFactory.getInstance()).
                            stopAll()
} catch(e: Exception)
            {
this.logUtil!!.put(CommonStrings.getInstance()!!.EXCEPTION, this, "stopAll", e)
}

}


    override fun onKeyTyped(event: Keyboard.TypedEvent)
        //nullable = true from not(false or (false and false)) = true
{
    //var event = event
}


    override fun onKeyDown(event: Keyboard.Event)
        //nullable = true from not(false or (false and false)) = true
{
    //var event = event

        try {
            this.rawKeyEventHandler!!.fireEvent(event.keyCode(), this.DEVICE_ID, true)
} catch(e: Exception)
            {
this.logUtil!!.put(CommonLabels.getInstance()!!.START_LABEL +event.key(), this, "onKeyDown", e)
}


    var key: Key = event.key()!!


    var abKey: Int = this.playNToAllBinaryKeyInputUtil!!.PLAYN_KEY_ORDINAL_TO_CANVAS_KEY[key.ordinal()]!!


    
                        if(abKey !=  -1)
                        
                                    {
                                    this.getCurrentDisplayable()!!.keyPressed(abKey)

                                    }
                                
}


    override fun onKeyUp(event: Keyboard.Event)
        //nullable = true from not(false or (false and false)) = true
{
    //var event = event

    var key: Key = event.key()!!


    var abKey: Int = this.playNToAllBinaryKeyInputUtil!!.PLAYN_KEY_ORDINAL_TO_CANVAS_KEY[key.ordinal()]!!


    
                        if(abKey !=  -1)
                        
                                    {
                                    this.getCurrentDisplayable()!!.keyReleased(abKey)

                                    }
                                
}


    override fun onPointerStart(mouseEvent: Pointer.Event)
        //nullable = true from not(false or (false and false)) = true
{
    //var mouseEvent = mouseEvent

        try {
            this.motionRecognizer!!.processStartMotionEvent(mouseEvent!!.x().toInt(), mouseEvent!!.y().toInt(), this.DEVICE_ID, 0)
} catch(e: Exception)
            {
this.logUtil!!.put(CommonStrings.getInstance()!!.EXCEPTION, this, "onPointerStart", e)
}

}


    open fun onPointerEnd(mouseEvent: Pointer.Event)
        //nullable = true from not(false or (false and false)) = true
{
    //var mouseEvent = mouseEvent

        try {
            this.motionRecognizer!!.processEndMotionEvent(mouseEvent!!.x().toInt(), mouseEvent!!.y().toInt(), this.DEVICE_ID, 0)
} catch(e: Exception)
            {
this.logUtil!!.put(CommonStrings.getInstance()!!.EXCEPTION, this, "onPointerEnd", e)
}

}


    override fun onPointerDrag(mouseEvent: Pointer.Event)
        //nullable = true from not(false or (false and false)) = true
{
    //var mouseEvent = mouseEvent

        try {
            this.motionRecognizer!!.processDraggedMotionEvent(mouseEvent!!.x().toInt(), mouseEvent!!.y().toInt(), this.DEVICE_ID, 0)
} catch(e: Exception)
            {
this.logUtil!!.put(CommonStrings.getInstance()!!.EXCEPTION, this, "onPointerDrag", e)
}

}


    override fun onMouseDown(mouseEvent: Mouse.ButtonEvent)
        //nullable = true from not(false or (false and false)) = true
{
    //var mouseEvent = mouseEvent
}


    override fun onMouseUp(mouseEvent: Mouse.ButtonEvent)
        //nullable = true from not(false or (false and false)) = true
{
    //var mouseEvent = mouseEvent
}


    override fun onMouseMove(mouseEvent: Mouse.MotionEvent)
        //nullable = true from not(false or (false and false)) = true
{
    //var mouseEvent = mouseEvent

        try {
            this.motionRecognizer!!.processMovedMotionEvent(mouseEvent!!.x().toInt(), mouseEvent!!.y().toInt(), this.DEVICE_ID, 0)
} catch(e: Exception)
            {
this.logUtil!!.put(CommonStrings.getInstance()!!.EXCEPTION, this, "onMouseMove", e)
}

}


    override fun onMouseWheelScroll(event: Mouse.WheelEvent)
        //nullable = true from not(false or (false and false)) = true
{
    //var event = event
}


}
                
            



        /* Generated Code Do Not Modify */
        



        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.data.resource.ResourceUtil
import org.allbinary.game.canvas.GDGameSoftwareInfo
import org.allbinary.game.configuration.GameConfigurationCentral
import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.configuration.feature.GameFeatureFactory
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory
import org.allbinary.game.configuration.feature.InputFeatureFactory
import org.allbinary.game.configuration.feature.SensorFeatureFactory
import org.allbinary.input.motion.AllMotionRecognizer
import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler
import org.allbinary.input.motion.gesture.observer.GDGameMotionGestureListener
import org.allbinary.input.motion.gesture.observer.MotionGestureReceiveInterfaceFactory
import org.allbinary.logic.math.SmallIntegerSingletonFactory
import org.allbinary.media.audio.EarlySoundsFactory
import org.allbinary.media.audio.Sounds
import org.allbinary.game.init.DefaultGameInitializationListener
import org.allbinary.input.motion.gesture.observer.GameMotionGestureListener
import org.allbinary.logic.system.security.licensing.GDGameClientInformationInterfaceFactory
import org.allbinary.media.audio.GDGameSoundsFactory

open public class GDGameMIDlet : org.allbinary.game.GDGameMIDlet {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val DEVICE_ID: Int = 0

    private var motionRecognizer: AllMotionRecognizer = AllMotionRecognizer()
public constructor ()                        

                            : super(GDGameClientInformationInterfaceFactory.getFactoryInstance()){


                            //For kotlin this is before the body of the constructor.
                    
GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION= GDGameClientInformationInterfaceFactory.getFactoryInstance()!!.getInstance()

    var motionGesturesHandler: BasicMotionGesturesHandler = motionRecognizer!!.getMotionGestureRecognizer()!!.getMotionGesturesHandler()!!

motionGesturesHandler!!.addListenerInterface(GameMotionGestureListener(MotionGestureReceiveInterfaceFactory.getInstance()))
motionGesturesHandler!!.addListenerInterface(GDGameMotionGestureListener())
DefaultGameInitializationListener()
}


    override fun init()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            
    var logUtil: LogUtil = LogUtil.getInstance()!!

logUtil!!.putF(this.commonStrings!!.START, this, this.commonStrings!!.INIT)
ResourceUtil.getInstance()!!.setClassLoader(this::class.java.classLoader)

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
} catch(e: Exception)
            {
this.logUtil!!.put(this.commonStrings!!.EXCEPTION, this, this.commonStrings!!.CONSTRUCTOR, e)
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
this.logUtil!!.put(this.commonStrings!!.EXCEPTION, this, "stopAll", e)
}

}


    override fun mouseClicked(x: Int, y: Int, button: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var x = x
    //var y = y
    //var button = button
}


    override fun mousePressed(x: Int, y: Int, button: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var x = x
    //var y = y
    //var button = button

        try {
            this.motionRecognizer!!.processStartMotionEvent(x, y, this.DEVICE_ID, button)
} catch(e: Exception)
            {
this.logUtil!!.put(this.commonStrings!!.EXCEPTION, this, "mousePressed", e)
}

}


    override fun mouseReleased(x: Int, y: Int, button: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var x = x
    //var y = y
    //var button = button

        try {
            this.motionRecognizer!!.processEndMotionEvent(x, y, this.DEVICE_ID, button)
} catch(e: Exception)
            {
this.logUtil!!.put(this.commonStrings!!.EXCEPTION, this, "mouseReleased", e)
}

}


    override fun mouseMoved(x: Int, y: Int, button: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var x = x
    //var y = y
    //var button = button

        try {
            this.motionRecognizer!!.processMovedMotionEvent(x, y, this.DEVICE_ID, button)
} catch(e: Exception)
            {
this.logUtil!!.put(this.commonStrings!!.EXCEPTION, this, "mouseDragged", e)
}

}


    override fun mouseDragged(x: Int, y: Int, button: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var x = x
    //var y = y
    //var button = button

        try {
            this.motionRecognizer!!.processDraggedMotionEvent(x, y, this.DEVICE_ID, button)
} catch(e: Exception)
            {
this.logUtil!!.put(this.commonStrings!!.EXCEPTION, this, "mouseDragged", e)
}

}


    override fun mouseWheelMoved(x: Int, y: Int, button: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var x = x
    //var y = y
    //var button = button

        try {
            this.motionRecognizer!!.processScrolledMotionEvent(x, y, this.DEVICE_ID, button)
} catch(e: Exception)
            {
this.logUtil!!.put(this.commonStrings!!.EXCEPTION, this, "mouseWheelMoved", e)
}

}


}
                
            


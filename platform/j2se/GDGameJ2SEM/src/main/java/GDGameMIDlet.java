import java.awt.event.MouseEvent;
import java.awt.event.MouseWheelEvent;

import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory;
import org.allbinary.game.configuration.feature.InputFeatureFactory;
import org.allbinary.game.configuration.feature.SensorFeatureFactory;
import org.allbinary.input.motion.AllMotionRecognizer;
import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler;
import org.allbinary.input.motion.gesture.observer.GameMotionGestureListener;
import org.allbinary.input.motion.gesture.observer.MotionGestureReceiveInterfaceFactory;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.media.audio.EarlySoundsFactory;
import org.allbinary.media.audio.Sounds;
import org.allbinary.game.init.DefaultGameInitializationListener;
import org.allbinary.media.audio.GDGameSoundsFactory;

public class GDGameMIDlet
        extends org.allbinary.game.GDGameMIDlet
{
    private final int DEVICE_ID = 0;
    private AllMotionRecognizer motionRecognizer = new AllMotionRecognizer();

    public GDGameMIDlet()
    {
        BasicMotionGesturesHandler motionGesturesHandler =
            motionRecognizer.getMotionGestureRecognizer().getMotionGesturesHandler();

        motionGesturesHandler.addListener(
            new GameMotionGestureListener(
            MotionGestureReceiveInterfaceFactory.getInstance()));    

        new DefaultGameInitializationListener();
    }

    protected void init()
    {
        try
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.START, this, commonStrings.INIT));

            ResourceUtil.getInstance().setClassLoader(this.getClass().getClassLoader());

            Features features = Features.getInstance();

            GameFeatureFactory gameFeatureFactory =
                GameFeatureFactory.getInstance();

            InputFeatureFactory inputFeatureFactory =
                InputFeatureFactory.getInstance();

            GraphicsFeatureFactory graphicsFeatureFactory =
                GraphicsFeatureFactory.getInstance();

            SensorFeatureFactory sensorFeatureFactory =
                    SensorFeatureFactory.getInstance();

            features.removeDefault(sensorFeatureFactory.ORIENTATION_SENSORS);
            features.addDefault(sensorFeatureFactory.NO_ORIENTATION);

            features.addDefault(graphicsFeatureFactory.IMAGE_GRAPHICS);
            //features.addDefault(gameFeatureFactory.VECTOR_GRAPHICS);

            features.addDefault(graphicsFeatureFactory.SPRITE_FULL_GRAPHICS);
            //features.addDefault(gameFeatureFactory.SPRITE_QUARTER_ROTATION_GRAPHICS);

            features.addDefault(gameFeatureFactory.HEALTH_BARS);
            features.addDefault(gameFeatureFactory.DAMAGE_FLOATERS);

            features.addDefault(gameFeatureFactory.DROPPED_ITEMS);

            features.addDefault(gameFeatureFactory.SOUND);

            features.addDefault(inputFeatureFactory.MULTI_KEY_PRESS);
            //gameFeatureFactory.removeDefault(inputFeatureFactory.MULTI_KEY_PRESS);
            //features.addDefault(inputFeatureFactory.SINGLE_KEY_PRESS);
            features.addDefault(inputFeatureFactory.REMOVE_DUPLICATE_KEY_PRESSES);

            GameConfigurationCentral gameConfigurationCentral =
                    GameConfigurationCentral.getInstance();

            SmallIntegerSingletonFactory smallIntegerSingletonFactory = 
                    SmallIntegerSingletonFactory.getInstance();

            gameConfigurationCentral.VIBRATION.setDefaultValue(smallIntegerSingletonFactory.getInstance(0));
            gameConfigurationCentral.VIBRATION.setDefault();

            gameConfigurationCentral.SPEED_CHALLENGE_LEVEL.setDefaultValue(smallIntegerSingletonFactory.getInstance(4));
            gameConfigurationCentral.SPEED_CHALLENGE_LEVEL.setDefault();

            gameConfigurationCentral.SPEED.setDefaultValue(smallIntegerSingletonFactory.getInstance(9));
            gameConfigurationCentral.SPEED.setDefault();

            gameConfigurationCentral.PLAYER_INPUT_WAIT.setDefaultValue(smallIntegerSingletonFactory.getInstance(0));
            gameConfigurationCentral.PLAYER_INPUT_WAIT.setDefault();

            gameConfigurationCentral.SCALE.setDefaultValue(smallIntegerSingletonFactory.getInstance(3));
            gameConfigurationCentral.SCALE.setDefault();

        } catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e));
        }
    }
    
    public void stopAll()
    {
        try
        {
            new Sounds(EarlySoundsFactory.getInstance()).stopAll();
            new Sounds(GDGameSoundsFactory.getInstance()).stopAll();
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, "stopAll", e));
        }
    }
    
    public void mouseClicked(MouseEvent mouseEvent)
    {
        /*
        try
        {
        //LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mouseClicked"));
        motionGestureRecognizer.processPressedMotionEvent(
        PointFactory.getInstance(mouseEvent.getX(), mouseEvent.getY()),
        mouseEvent.getButton());
        }
        catch (Exception e)
        {
        LogUtil.put(LogFactory.getInstance("Exception", this, "mouseClicked", e));
        }
         */
    }

    public void mousePressed(MouseEvent mouseEvent)
    {
        try
        {
            //LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mousePressed"));
            this.motionRecognizer.processStartMotionEvent(
                mouseEvent.getX(), mouseEvent.getY(),
                DEVICE_ID,
                mouseEvent.getButton());
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, "mousePressed", e));
        }
    }

    public void mouseReleased(MouseEvent mouseEvent)
    {
        try
        {
            //LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mouseReleased"));
            this.motionRecognizer.processEndMotionEvent(
                mouseEvent.getX(), mouseEvent.getY(),
                    DEVICE_ID,
                mouseEvent.getButton());
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, "mouseReleased", e));
        }
    }

    public void mouseEntered(MouseEvent mouseEvent)
    {
        //LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mouseEntered"));
    }

    public void mouseExited(MouseEvent mouseEvent)
    {
        //LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mouseExited"));
    }

    public void mouseMoved(MouseEvent mouseEvent)
    {
        try
        {
            //LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mouseMoved"));
            this.motionRecognizer.processMovedMotionEvent(mouseEvent.getX(), mouseEvent.getY(), DEVICE_ID, 0);
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, "mouseMoved", e));
        }
    }

    public void mouseDragged(MouseEvent mouseEvent)
    {
        try
        {
            //LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mouseDragged"));
            this.motionRecognizer.processDraggedMotionEvent(
                mouseEvent.getX(), mouseEvent.getY(),
                    DEVICE_ID,
                mouseEvent.getButton());
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, "mouseDragged", e));
        }
    }

    public void mouseWheelMoved(MouseWheelEvent mouseEvent)
    {
        //LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mouseWheelMoved"));
    }

    /*
    private MouseAdapter mouseListener = new MouseAdapter()
    {

    public void mouseClicked(MouseEvent mouseEvent)
    {
    LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mouseClicked"));
    }

    public void mousePressed(MouseEvent mouseEvent)
    {
    LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mousePressed"));
    }
    };
    private MouseMotionListener mouseMotionListener = new MouseMotionListener()
    {

    public void mouseReleased(MouseEvent mouseEvent)
    {
    LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mouseReleased"));
    }

    public void mouseEntered(MouseEvent mouseEvent)
    {
    LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mouseEntered"));
    }

    public void mouseExited(MouseEvent mouseEvent)
    {
    LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mouseExited"));
    }

    public void mouseMoved(MouseEvent mouseEvent)
    {
    LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mouseMoved"));
    }

    public void mouseDragged(MouseEvent mouseEvent)
    {
    LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mouseDragged"));
    }
    };
    private MouseWheelListener mouseWheelListener = new MouseWheelListener()
    {

    public void mouseWheelMoved(MouseWheelEvent mouseEvent)
    {
    LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "mouseWheelMoved"));
    }
    };
     */
    
}

package org.allbinary.game;

import java.util.Hashtable;

import javax.microedition.lcdui.Image;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.View;

import org.allbinary.AllBinaryAndroidGameInitializationUtil;
import org.allbinary.AndroidResources;
import org.allbinary.android.AndroidStrings;
import org.allbinary.android.activity.InitEmulatorFactory;
import org.allbinary.android.activity.game.GameMidletActivity;
import org.allbinary.business.advertisement.GameAdStateFactory;
import org.allbinary.configuration.ApplicationConfiguration;
import org.allbinary.game.canvas.GDGameSoftwareInfo;

import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory;
import org.allbinary.game.configuration.feature.SensorFeatureFactory;
import org.allbinary.graphics.canvas.transition.progress.AndroidBasicTitleProgressBar;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.image.ImageCacheFactory;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;

import org.allbinary.logic.system.security.licensing.GDGameClientInformationInterfaceFactory;

public class GDGameAndroidActivity extends GameMidletActivity
{
    public GDGameAndroidActivity()
    {
        super(GDGameClientInformationInterfaceFactory.getInstance());
        //super(new ProgressHelper(AndroidResources.id.progressbar));
        
        GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION = GDGameClientInformationInterfaceFactory.getInstance();
        
        try
        {
            final GameAdState gameAdState = 
                GameAdStateFactory.getInstance().getInstance(
                		GDGameSoftwareInfo.getInstance());

            gameAdState.setOkayToShowAds(true);
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().CONSTRUCTOR, e));
        }
    }

//    protected void initOpenGL()
//    throws Exception
//    {
//        final OpenGLConfiguration openGLConfiguration = 
//            OpenGLConfiguration.getInstance();
//        openGLConfiguration.setOpenGL(true);
//        openGLConfiguration.write();        
//    }
    
    protected void init()
    {
        super.init();

        AllBinaryAndroidGameInitializationUtil.init();
    }

    protected void initViewIds() 
    throws Exception
    {
//        this.initOpenGL();
//
//        final Features features = Features.getInstance();
//
//        final OpenGLFeatureFactory openGLFeatureFactory
//                = OpenGLFeatureFactory.getInstance();
//
//        features.addDefault(openGLFeatureFactory.OPENGL_SURFACE_VIEW);
//        features.addDefault(openGLFeatureFactory.OPENGL_2D);
//
//        OpenGLESGraphicsFactory.getInstance().set(new AndroidDisplayOpenGLESGraphicsFactory());
        
        final AndroidResources androidResources = AndroidResources.getInstance();
        
        this.initViewIds(
                new int[] {
                        androidResources.id.gd,
                        androidResources.id.gd_gl
                }
                ,
                new int[] {
                        androidResources.layout.gd_layout,
                        androidResources.layout.gd_ad_overlay_layout,
                        //AndroidResources.layout.gd_ad_frame_layout,
                }
                ,
                new int[] {
                        androidResources.layout.gd_gl_layout,
                        //androidResources.layout.gd_min3d_layout,
                        //androidResources.layout.gd_gl_ad_overlay_layout,
                        //androidResources.layout.gd_min3d_ad_overlay_layout,
                        //androidResources.layout.gd_gl_ad_frame_layout,
                        //androidResources.layout.gd_min3d_ad_frame_layout,
                }
                ,
                false
                );
        
        this.setRootViewId(this.getViewId());
    }

    @Override
    public void onCreate(Bundle icicle)
    {
        try
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, AndroidStrings.getInstance().CREATE));

            //final String UNLOCKED = "unlock_gd_levels";
            //InApplicationPurchaseFactory.getInstance().init(this, bundle);
            //InApplicationPurchaseFactory.getInstance().add(new LockableFeature(UNLOCKED));
            
            super.onCreate(icicle);

            if (this.isStartable())
            {
                this.setBackgrounds();
            }

            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().END, this, AndroidStrings.getInstance().CREATE));
        } catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, AndroidStrings.getInstance().CREATE, e));
        }
    }

    public void onStart()
    {
        try
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, AndroidStrings.getInstance().START));

            super.onStart();

            super.onStart(new GDGameMIDletFactory());

            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().END, this, AndroidStrings.getInstance().START));
        } catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, AndroidStrings.getInstance().START, e));
        }
    }

    /*
    public void onEvent(final AllBinaryEventObject eventObject)
    {
        class OpenGLSetup implements Runnable
        {
            public void run()
            {
                try
                {
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, CommonStrings.getInstance().RUN));

                    AllBinaryMidletOpenGLESView view = (AllBinaryMidletOpenGLESView)
                    GDGameAndroidActivity.this.getView();
                    view.onEvent(eventObject);
                    
                    LogUtil.put(LogFactory.getInstance("End Runnable", this, CommonStrings.getInstance().RUN));
                }
                catch (Exception e)
                {
                    LogUtil.put(LogFactory.getInstance("Execption", this, CommonStrings.getInstance().RUN, e));
                }

            }
        }
        
        this.runOnUiThread(new OpenGLSetup());
    }
    */

    public void initEmulator() throws Exception
    {
        super.initEmulator();

        if (!InitEmulatorFactory.getInstance().isInitEmulator())
        {
            LogUtil.put(LogFactory.getInstance("Init Base GameFeatures", this, "initEmulator"));

            Features features = Features.getInstance();
            
            GameConfigurationCentral gameConfigurationCentral = 
                GameConfigurationCentral.getInstance();

            /*
            gameConfigurationCentral.SCALE
                    .setMinValue(SmallIntegerSingletonFactory.getInstance(2));
            gameConfigurationCentral.SCALE
                    .setMaxValue(SmallIntegerSingletonFactory.getInstance(3));
            gameConfigurationCentral.SCALE
                    .setDefaultValue(SmallIntegerSingletonFactory
                            .getInstance(3));
            gameConfigurationCentral.SCALE.setDefault();
            */

            gameConfigurationCentral.VIBRATION.setDefaultValue(
                    SmallIntegerSingletonFactory.getInstance().getInstance(1));
            gameConfigurationCentral.VIBRATION.setDefault();

            /*
            gameConfigurationCentral.SPEED_CHALLENGE_LEVEL
                    .setDefaultValue(SmallIntegerSingletonFactory
                            .getInstance(4));
            gameConfigurationCentral.SPEED_CHALLENGE_LEVEL.setDefault();

            */

            gameConfigurationCentral.SPEED.setDefaultValue(
                    SmallIntegerSingletonFactory.getInstance().getInstance(9));
            gameConfigurationCentral.SPEED.setDefault();

            GraphicsFeatureFactory graphicsFeatureFactory = 
                GraphicsFeatureFactory.getInstance();
            
            features.addDefault(graphicsFeatureFactory.TRANSPARENT_IMAGE_CREATION);

            features.addDefault(graphicsFeatureFactory.IMAGE_GRAPHICS);

            // Only works for small - large causes unknown problem
            // GameFeatures.getInstance().addDefault(GameFeature.SPRITE_QUARTER_ROTATION_GRAPHICS);
            // Out of memory error
            // GameFeatures.getInstance().addDefault(GameFeature.SPRITE_FULL_ROTATION_GRAPHICS);
            features.addDefault(graphicsFeatureFactory.IMAGE_TO_ARRAY_GRAPHICS);

            // GameFeatures.getInstance().addDefault(GameFeature.HEALTH_BARS);
            // GameFeatures.getInstance().addDefault(GameFeature.DAMAGE_FLOATERS);

            // GameFeatures.getInstance().addDefault(GameFeature.DROPPED_ITEMS);

            features.addDefault(
                    GameFeatureFactory.getInstance().SOUND);

            SensorFeatureFactory sensorFeatureFactory = 
                SensorFeatureFactory.getInstance();

            features.removeDefault(sensorFeatureFactory.ORIENTATION_SENSORS);
            features.addDefault(sensorFeatureFactory.NO_ORIENTATION);
            
            InitEmulatorFactory.getInstance().setInitEmulator(true);
        }
    }

    public void setBackgrounds() throws Exception
    {
        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, "getBackground"));

        final AndroidResources androidResources = AndroidResources.getInstance();
        
        ApplicationConfiguration reloadConfiguration = 
            ApplicationConfiguration.getInstance();
        
        Drawable drawable = this.getResources().getDrawable(
                androidResources.drawable.gd_wait_256_by_256);
        
        if (reloadConfiguration.isProgressBarView())
        {
            // Draws a big progress circle in front of image
            // this.getProgressHelper().getProgressBar().setBackgroundDrawable(drawable);
            // Hides progress circle under image

            this.getProgressHelper().getProgressBar().setIndeterminateDrawable(drawable);
        } else
        {
            DisplayInfoSingleton displayInfo = DisplayInfoSingleton.getInstance();

            View view = this.getRootView();
            //displayInfo.setLastWidth(view.getWidth());
            //displayInfo.setLastHeight(view.getHeight());

            Bitmap bitmap =((BitmapDrawable)drawable).getBitmap();

            Hashtable hashtable = ImageCacheFactory.getInstance().getHashtable();

            hashtable.put(AndroidBasicTitleProgressBar.RESOURCE, new Image(bitmap));
            
            AndroidBasicTitleProgressBar.setBackground(
                    androidResources.drawable.gd_wait_256_by_256
                    );
        }
   }        
}

        /* Generated Code Do Not Modify */
        package org.allbinary.game




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.lcdui.Image
import android.graphics.Bitmap
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import android.os.Bundle
import android.view.View
import org.allbinary.AllBinaryAndroidGameInitializationUtil
import org.allbinary.AndroidResources
import org.allbinary.string.CommonStateStrings
import org.allbinary.android.activity.game.GameMidletActivity
import org.allbinary.android.activity.progress.ProgressHelper
import org.allbinary.business.advertisement.GameAdStateBase
import org.allbinary.business.advertisement.GameAdStateFactory
import org.allbinary.configuration.ApplicationConfiguration
import org.allbinary.emulator.InitEmulatorFactory
import org.allbinary.game.canvas.GDGameSoftwareInfo
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.game.configuration.GameConfigurationCentral
import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.configuration.feature.GameFeatureFactory
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory
import org.allbinary.game.configuration.feature.SensorFeatureFactory
import org.allbinary.graphics.canvas.transition.progress.AndroidBasicTitleProgressBar
import org.allbinary.graphics.displayable.DisplayInfoSingleton
import org.allbinary.image.ImageCacheFactory
import org.allbinary.logic.math.SmallIntegerSingletonFactory
import org.allbinary.util.ABHashtable

open public class GDGameAndroidActivityBase : GameMidletActivity {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!
public constructor ()                        

                            : super(ProgressHelper.NULL_PROGRESS_HELPER){


                            //For kotlin this is before the body of the constructor.
                    

        try {
            
    var gameAdState: GameAdStateBase = GameAdStateFactory.getInstance()!!.getInstanceForApp(GDGameSoftwareInfo.getInstance())!!

gameAdState!!.setOkayToShowAds(true)
} catch(e: Exception)
            {
logUtil!!.put(commonStrings!!.EXCEPTION, this, commonStrings!!.CONSTRUCTOR, e)
}

}


    override fun init()
        //nullable = true from not(false or (false and true)) = true
{
super.init()
AllBinaryAndroidGameInitializationUtil.init()
}


                @Throws(Exception::class)
            
    override fun initViewIds()
        //nullable = true from not(false or (false and true)) = true
{

    var androidResources: AndroidResources = AndroidResources.getInstance()!!

this.initViewIdsFromArrays(intArrayOf(androidResources!!.id.gd,androidResources!!.id.gd_gl), intArrayOf(androidResources!!.layout.gd_layout,androidResources!!.layout.gd_ad_overlay_layout), intArrayOf(androidResources!!.layout.gd_gl_layout), false)
this.setRootViewId(this.getViewId())
}


    override fun onCreate(icicle: Bundle?)
        //nullable = true from not(false or (false and false)) = true
{
var icicle = icicle

        try {
            logUtil!!.putF(commonStrings!!.START, this, CommonStateStrings.getInstance()!!.CREATE)
super.onCreate(icicle)

    
                        if(this.isStartable())
                        
                                    {
                                    this.setBackgrounds()

                                    }
                                
logUtil!!.putF(commonStrings!!.END, this, CommonStateStrings.getInstance()!!.CREATE)
} catch(e: Exception)
            {
logUtil!!.put(commonStrings!!.EXCEPTION, this, CommonStateStrings.getInstance()!!.CREATE, e)
}

}


    override fun onStart()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            logUtil!!.putF(commonStrings!!.START, this, CommonStateStrings.getInstance()!!.START)
super.onStart()
super.onStartMidlet(GDGameMIDletFactory())
logUtil!!.putF(commonStrings!!.END, this, CommonStateStrings.getInstance()!!.START)
} catch(e: Exception)
            {
logUtil!!.put(commonStrings!!.EXCEPTION, this, CommonStateStrings.getInstance()!!.START, e)
}

}


                @Throws(Exception::class)
            
    open fun initEmulator()
        //nullable = true from not(false or (false and true)) = true
{
super.initEmulator()

    
                        if(!InitEmulatorFactory.getInstance()!!.isInitEmulator())
                        
                                    {
                                    logUtil!!.putF("Init Base GameFeatures", this, "initEmulator")

    var features: Features = Features.getInstance()!!


    var gameConfigurationCentral: GameConfigurationCentral = GameConfigurationCentral.getInstance()!!

gameConfigurationCentral!!.VIBRATION.setDefaultValue(SmallIntegerSingletonFactory.getInstance()!!.getAt(1))
gameConfigurationCentral!!.VIBRATION.setDefault()
gameConfigurationCentral!!.SPEED.setDefaultValue(SmallIntegerSingletonFactory.getInstance()!!.getAt(9))
gameConfigurationCentral!!.SPEED.setDefault()

    var graphicsFeatureFactory: GraphicsFeatureFactory = GraphicsFeatureFactory.getInstance()!!

features.addDefault(graphicsFeatureFactory!!.TRANSPARENT_IMAGE_CREATION)
features.addDefault(graphicsFeatureFactory!!.IMAGE_GRAPHICS)
features.addDefault(graphicsFeatureFactory!!.IMAGE_TO_ARRAY_GRAPHICS)
features.addDefault(GameFeatureFactory.getInstance()!!.SOUND)

    var sensorFeatureFactory: SensorFeatureFactory = SensorFeatureFactory.getInstance()!!

features.removeDefault(sensorFeatureFactory!!.ORIENTATION_SENSORS)
features.addDefault(sensorFeatureFactory!!.NO_ORIENTATION)
InitEmulatorFactory.getInstance()!!.setInitEmulator(true)

                                    }
                                
}


                @Throws(Exception::class)
            
    open fun setBackgrounds()
        //nullable = true from not(false or (false and true)) = true
{
logUtil!!.putF(commonStrings!!.START, this, "getBackground")

    var androidResources: AndroidResources = AndroidResources.getInstance()!!


    var reloadConfiguration: ApplicationConfiguration = ApplicationConfiguration.getInstance()!!


    var drawable: Drawable = this.getResources()!!.getDrawable(androidResources!!.drawable.gd_wait_256_by_256)!!


    
                        if(reloadConfiguration!!.isProgressBarView())
                        
                                    {
                                    this.getProgressHelper()!!.getProgressBar()!!.setIndeterminateDrawable(drawable)

                                    }
                                
                        else {
                            
    var displayInfo: DisplayInfoSingleton = DisplayInfoSingleton.getInstance()!!


    var view: View = this.getRootView()!!


    var bitmap: Bitmap = 
                                    (drawable as BitmapDrawable).getBitmap()!!


    var hashtable: ABHashtable = ImageCacheFactory.getInstance()!!.getHashtableP()!!

hashtable.put(AndroidBasicTitleProgressBar.RESOURCE, Image.createImageBitmap(bitmap))
AndroidBasicTitleProgressBar.setBackgroundResource(androidResources!!.drawable.gd_wait_256_by_256)

                        }
                            
}


}
                
            


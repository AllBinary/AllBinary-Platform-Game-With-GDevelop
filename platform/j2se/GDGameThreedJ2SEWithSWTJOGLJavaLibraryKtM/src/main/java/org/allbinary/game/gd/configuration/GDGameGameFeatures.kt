
        /* Generated Code Do Not Modify */
        package org.allbinary.game.gd.configuration




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.input.gyro.OrientationData
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.allbinary.debug.DebugFactory
import org.allbinary.debug.NoDebug
import org.allbinary.game.configuration.GameConfigurationCentral
import org.allbinary.game.configuration.GameConfigurationSingleton
import org.allbinary.game.configuration.feature.GameFeatureChoiceGroups
import org.allbinary.game.configuration.feature.GameFeatureFactory
import org.allbinary.game.configuration.feature.SensorFeatureFactory
import org.allbinary.init.InitInterface
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGameFeature

open public class GDGameGameFeatures
            : Object
        
                , InitInterface {
        
companion object {
            
    private val GRAPHICS_OPTIONS: String = "Graphics Options"

        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    open fun init()
        //nullable = true from not(false or (false and true)) = true
{

    var gameConfigurationSingleton: GameConfigurationSingleton = GameConfigurationSingleton.getInstance()!!


    var gameConfigurationCentral: GameConfigurationCentral = GameConfigurationCentral.getInstance()!!


    var sensorFeatureFactory: SensorFeatureFactory = SensorFeatureFactory.getInstance()!!


    var exclusiveOrientationSensorBasicArrayList: BasicArrayList = BasicArrayListD()

exclusiveOrientationSensorBasicArrayList!!.add(sensorFeatureFactory!!.ORIENTATION_SENSORS)
exclusiveOrientationSensorBasicArrayList!!.add(sensorFeatureFactory!!.NO_ORIENTATION)

    
                        if(DebugFactory.getInstance() != NoDebug.getInstance())
                        
                                    {
                                    gameConfigurationSingleton!!.add(gameConfigurationCentral!!.CHALLENGE_LEVEL)
gameConfigurationSingleton!!.add(gameConfigurationCentral!!.SPEED_CHALLENGE_LEVEL)
gameConfigurationSingleton!!.add(gameConfigurationCentral!!.VIBRATION)
gameConfigurationSingleton!!.add(gameConfigurationCentral!!.ORIENTATION)
gameConfigurationSingleton!!.add(gameConfigurationCentral!!.CONTROL_LEVEL)
gameConfigurationSingleton!!.add(gameConfigurationCentral!!.SPEED)

                                    }
                                

    var multipleBasicArrayList: BasicArrayList = BasicArrayListD()


    var gameFeatureFactory: GameFeatureFactory = GameFeatureFactory.getInstance()!!

multipleBasicArrayList!!.add(gameFeatureFactory!!.SOUND)
multipleBasicArrayList!!.add(gameFeatureFactory!!.SCREEN_SHAKE)
multipleBasicArrayList!!.add(gameFeatureFactory!!.DROPPED_ITEMS)
multipleBasicArrayList!!.add(RaceTrackGameFeature.MINI_MAP)
GameFeatureChoiceGroups.getExclusiveInstance()!!.get()!!.clear()
GameFeatureChoiceGroups.getMultipleInstance()!!.add(GDGameGameFeatures.GRAPHICS_OPTIONS, multipleBasicArrayList)
GameFeatureChoiceGroups.getExclusiveInstance()!!.add(OrientationData.getInstance()!!.ORIENTATION_SENSOR_INPUT, exclusiveOrientationSensorBasicArrayList)
}


}
                
            


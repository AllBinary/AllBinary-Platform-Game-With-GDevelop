
        /* Generated Code Do Not Modify */
        package org.allbinary.game.configuration




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.input.gyro.OrientationData
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.allbinary.game.configuration.GameConfigurationCentral
import org.allbinary.game.configuration.GameConfigurationSingleton
import org.allbinary.game.configuration.feature.GameFeatureChoiceGroups
import org.allbinary.game.configuration.feature.GameFeatureFactory
import org.allbinary.game.configuration.feature.SensorFeatureFactory
import org.allbinary.init.Init

open public class GDGameGameFeatures : Init {
        
public constructor (){
}


                @Throws(Exception::class)
            
    override fun init()
        //nullable = true from not(false or (false and true)) = true
{

    var GRAPHICS_OPTIONS: String = "Graphics Options"


    var exclusiveOrientationSensorList: BasicArrayList = BasicArrayListD()


    var sensorFeatureFactory: SensorFeatureFactory = SensorFeatureFactory.getInstance()!!

exclusiveOrientationSensorList!!.add(sensorFeatureFactory!!.ORIENTATION_SENSORS)
exclusiveOrientationSensorList!!.add(sensorFeatureFactory!!.NO_ORIENTATION)

    var gameConfigurationSingleton: GameConfigurationSingleton = GameConfigurationSingleton.getInstance()!!


    var gameConfigurationCentral: GameConfigurationCentral = GameConfigurationCentral.getInstance()!!

gameConfigurationSingleton!!.add(gameConfigurationCentral!!.VIBRATION)
gameConfigurationSingleton!!.add(gameConfigurationCentral!!.ORIENTATION)
gameConfigurationSingleton!!.add(gameConfigurationCentral!!.SPEED)

    var multipleList: BasicArrayList = BasicArrayListD()

multipleList!!.add(GameFeatureFactory.getInstance()!!.SOUND)
multipleList!!.add(GameFeatureFactory.getInstance()!!.SCREEN_SHAKE)
GameFeatureChoiceGroups.getMultipleInstance()!!.add(GRAPHICS_OPTIONS, multipleList)
GameFeatureChoiceGroups.getExclusiveInstance()!!.add(OrientationData.getInstance()!!.ORIENTATION_SENSOR_INPUT, exclusiveOrientationSensorList)
}


}
                
            


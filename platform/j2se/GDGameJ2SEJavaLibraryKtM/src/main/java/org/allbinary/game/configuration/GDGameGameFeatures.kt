
        /*
                * 
                *  AllBinary Open License Version 1
                *  Copyright (c) 2011 AllBinary
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
        package org.allbinary.game.configuration




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.allbinary.game.configuration.GameConfigurationCentral
import org.allbinary.game.configuration.GameConfigurationSingleton
import org.allbinary.game.configuration.feature.GameFeatureChoiceGroups
import org.allbinary.game.configuration.feature.GameFeatureFactory
import org.allbinary.game.configuration.feature.SensorFeatureFactory
import org.allbinary.init.InitInterface

open public class GDGameGameFeatures
            : Object
        
                , InitInterface {
        

    private val GRAPHICS_OPTIONS: String = "Graphics Options"
public constructor ()
            : super()
        {
}


    open fun init()
        //nullable = true from not(false or (false and true)) = true
{

    var sensorFeatureFactory: SensorFeatureFactory = SensorFeatureFactory.getInstance()!!


    var gameFeatureFactory: GameFeatureFactory = GameFeatureFactory.getInstance()!!


    var gameConfigurationSingleton: GameConfigurationSingleton = GameConfigurationSingleton.getInstance()!!


    var gameConfigurationCentral: GameConfigurationCentral = GameConfigurationCentral.getInstance()!!

gameConfigurationSingleton!!.add(gameConfigurationCentral!!.VIBRATION)
gameConfigurationSingleton!!.add(gameConfigurationCentral!!.ORIENTATION)
gameConfigurationSingleton!!.add(gameConfigurationCentral!!.SPEED)

    var multipleList: BasicArrayList = BasicArrayListD()

multipleList!!.add(gameFeatureFactory!!.SOUND)
multipleList!!.add(gameFeatureFactory!!.SCREEN_SHAKE)
GameFeatureChoiceGroups.getMultipleInstance()!!.add(this.GRAPHICS_OPTIONS, multipleList)
}


}
                
            


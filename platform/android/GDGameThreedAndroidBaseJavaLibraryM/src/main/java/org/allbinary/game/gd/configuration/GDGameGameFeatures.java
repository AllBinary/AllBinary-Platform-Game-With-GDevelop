package org.allbinary.game.gd.configuration;

import org.allbinary.input.gyro.OrientationData;
import org.allbinary.util.BasicArrayList;

import org.allbinary.debug.DebugFactory;
import org.allbinary.debug.NoDebug;
import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.game.configuration.GameConfigurationSingleton;
import org.allbinary.game.configuration.feature.GameFeatureChoiceGroups;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.game.configuration.feature.SensorFeatureFactory;
import org.allbinary.init.InitInterface;
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGameFeature;

public class GDGameGameFeatures implements InitInterface
{
    private static final String GRAPHICS_OPTIONS = "Graphics Options";

    public void init()
    {
        GameConfigurationSingleton gameConfigurationSingleton = 
            GameConfigurationSingleton.getInstance();

        GameConfigurationCentral gameConfigurationCentral = 
            GameConfigurationCentral.getInstance();

        SensorFeatureFactory sensorFeatureFactory = 
            SensorFeatureFactory.getInstance();
        
        BasicArrayList exclusiveOrientationSensorBasicArrayList = new BasicArrayList();
        
        exclusiveOrientationSensorBasicArrayList.add(
                sensorFeatureFactory.ORIENTATION_SENSORS);
        exclusiveOrientationSensorBasicArrayList.add(
                sensorFeatureFactory.NO_ORIENTATION);

        /*
        BasicArrayList exclusiveOrientationTypeBasicArrayList = new BasicArrayList();
        exclusiveKeyInputTypeBasicArrayList.add(GameFeature.YAW_AND_PITCH);
        exclusiveKeyInputTypeBasicArrayList.add(GameFeature.PITCH_AND_ROLL);
        */

        if(DebugFactory.getInstance() != NoDebug.getInstance())
        {
            gameConfigurationSingleton.add(gameConfigurationCentral.CHALLENGE_LEVEL);
            gameConfigurationSingleton.add(gameConfigurationCentral.SPEED_CHALLENGE_LEVEL);

            gameConfigurationSingleton.add(gameConfigurationCentral.VIBRATION);
            gameConfigurationSingleton.add(gameConfigurationCentral.ORIENTATION);
            
            gameConfigurationSingleton.add(gameConfigurationCentral.CONTROL_LEVEL);
            gameConfigurationSingleton.add(gameConfigurationCentral.SPEED);
        }
        
        BasicArrayList multipleBasicArrayList = new BasicArrayList();
        
        GameFeatureFactory gameFeatureFactory = 
            GameFeatureFactory.getInstance();
        
        multipleBasicArrayList.add(gameFeatureFactory.SOUND);
        multipleBasicArrayList.add(gameFeatureFactory.SCREEN_SHAKE);
        multipleBasicArrayList.add(gameFeatureFactory.DROPPED_ITEMS);
        
        multipleBasicArrayList.add(RaceTrackGameFeature.MINI_MAP);
        
        //multipleBasicArrayList.add(gameFeatureFactory.TRANSISTION_ANIMATIONS);

        GameFeatureChoiceGroups.getExclusiveInstance().get().clear();
        
        GameFeatureChoiceGroups.getMultipleInstance().add(GRAPHICS_OPTIONS,
                multipleBasicArrayList);

        GameFeatureChoiceGroups.getExclusiveInstance().add(
                OrientationData.getInstance().ORIENTATION_SENSOR_INPUT,
                exclusiveOrientationSensorBasicArrayList); 
       // GameFeatureChoiceGroups.getExclusiveInstance().add(ORIENTATION_TYPE,
         //     exclusiveOrientationTypeBasicArrayList); 
    }
}

package org.allbinary.game.gd.configuration;

import org.allbinary.input.gyro.OrientationData;
import org.allbinary.util.BasicArrayList;

import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.game.configuration.GameConfigurationSingleton;
import org.allbinary.game.configuration.feature.GameFeatureChoiceGroups;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.game.configuration.feature.SensorFeatureFactory;
import org.allbinary.init.Init;

public class GDGameGameFeatures extends Init
{
    public GDGameGameFeatures()
    {
        
    }
    
    public void init() throws Exception
    {
        final String GRAPHICS_OPTIONS = "Graphics Options";
        
        BasicArrayList exclusiveOrientationSensorList = new BasicArrayList();

        SensorFeatureFactory sensorFeatureFactory = 
            SensorFeatureFactory.getInstance();

        exclusiveOrientationSensorList.add(
                sensorFeatureFactory.ORIENTATION_SENSORS);
        exclusiveOrientationSensorList.add(
                sensorFeatureFactory.NO_ORIENTATION);
        //exclusiveOrientationSensorList.add(
          //      sensorFeatureFactory.SIMULATED_ORIENTATION_SENSORS);

        //Features.getInstance().removeDefault(
          //      SensorFeatureFactory.getInstance().ORIENTATION_SENSORS);
        //Features.getInstance().addDefault(
          //      SensorFeatureFactory.getInstance().SIMULATED_ORIENTATION_SENSORS);
        
        /*
        BasicArrayList exclusiveOrientationTypeList = new BasicArrayList();
        exclusiveOrientationTypeList.add(GameFeature.YAW_AND_PITCH);
        exclusiveOrientationTypeList.add(GameFeature.PITCH_AND_ROLL);
        */
        
        GameConfigurationSingleton gameConfigurationSingleton = 
            GameConfigurationSingleton.getInstance();
        
        GameConfigurationCentral gameConfigurationCentral = 
            GameConfigurationCentral.getInstance();

        gameConfigurationSingleton.add(gameConfigurationCentral.VIBRATION);
        gameConfigurationSingleton.add(gameConfigurationCentral.ORIENTATION);

        // gameConfigurationSingleton.add(gameConfigurationCentral.CONTROL_LEVEL);
        gameConfigurationSingleton.add(gameConfigurationCentral.SPEED);

        BasicArrayList multipleList = new BasicArrayList();

        multipleList.add(GameFeatureFactory.getInstance().SOUND);
        multipleList.add(GameFeatureFactory.getInstance().SCREEN_SHAKE);
        //multipleList.add(GameFeature.OPENGL);

        //multipleBasicArrayList.add(GameFeature.TRANSISTION_ANIMATIONS);

        // graphicsOptionsBasicArrayList.add(GameFeature.);

        GameFeatureChoiceGroups.getMultipleInstance().add(
                GRAPHICS_OPTIONS, multipleList);

        GameFeatureChoiceGroups.getExclusiveInstance().add(
                OrientationData.getInstance().ORIENTATION_SENSOR_INPUT, 
                exclusiveOrientationSensorList);

        //GameFeatureChoiceGroups.getExclusiveInstance().add(ORIENTATION_TYPE,
          //      exclusiveOrientationTypeBasicArrayList);
    }
}

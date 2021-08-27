package org.allbinary.game.gd.resource;

/*
 *  Note that errors may occur even though your importing R correctly
 *  This usually is caused by Duplicate R classes
 *  Solution is usually to move the R class from the org.allbinary.game.game_name 
 *  package into the independent src directory not part of the multi process apk
 *  Remark out for independent Activities
 */ 

import org.allbinary.AndroidResources;

import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.media.audio.GameYouLoseSound;
import org.allbinary.media.audio.GameYouWinSound;

public class GDGameBaseAndroidResources
{
    protected GDGameBaseAndroidResources()
    {
        
    }
    
    public void init() throws Exception
    {
        final ResourceUtil resourceUtil = ResourceUtil.getInstance();
        
        final AndroidResources androidResources = AndroidResources.getInstance();
        
        //resourceUtil.addResource(GameYouLoseSound.getInstance().getResource(),
                //Integer.valueOf(androidResources.raw.youlose));
        //resourceUtil.addResource(GameYouWinSound.getInstance().getResource(),
                //Integer.valueOf(androidResources.raw.youwin));
        
        //resourceUtil.addResource(MineWeaponResources.getInstance().RESOURCE,
          //      Integer.valueOf(androidResources.raw.mine_20_by_20));
        
        /*
        if (!OpenGLFeatureUtil.getInstance().isAnyThreed())
        {

        resourceUtil.addResource(
                MineWeaponResources.getInstance().DROP_RESOURCE,
                Integer.valueOf(androidResources.raw.mine_drop_20_by_20));

        MissileWeaponResources redMissileWeaponResources = 
            MissileWeaponResources.getInstance(BasicColor.RED);
        
        resourceUtil.addResource(
                redMissileWeaponResources.RED_RESOURCE,
                Integer.valueOf(androidResources.raw.missile_red_red_20_by_20));
        resourceUtil.addResource(
                redMissileWeaponResources.YELLOW_RESOURCE,
                Integer.valueOf(androidResources.raw.missile_red_yellow_20_by_20));
        resourceUtil.addResource(
                redMissileWeaponResources.DROP_RESOURCE,
                Integer.valueOf(androidResources.raw.missile_red_drop_20_by_20));

        MissileWeaponResources blueMissileWeaponResources = 
            MissileWeaponResources.getInstance(BasicColor.BLUE);
        
        resourceUtil.addResource(
                blueMissileWeaponResources.RED_RESOURCE,
                Integer.valueOf(androidResources.raw.missile_blue_red_20_by_20));
        resourceUtil.addResource(
                blueMissileWeaponResources.YELLOW_RESOURCE,
                Integer.valueOf(androidResources.raw.missile_blue_yellow_20_by_20));
        resourceUtil.addResource(
                blueMissileWeaponResources.DROP_RESOURCE,
                Integer.valueOf(androidResources.raw.missile_blue_drop_20_by_20));

        BoostEnhancementResources boostEnhancementResources = BoostEnhancementResources.getInstance();
        
        resourceUtil.addResource(boostEnhancementResources.RESOURCE,
                Integer.valueOf(androidResources.raw.boost_20_by_20));
        resourceUtil.addResource(boostEnhancementResources.DROP_RESOURCE,
                Integer.valueOf(androidResources.raw.nitrous_oxide_drop_20_by_20));

        ExplosionResources explosionResources = ExplosionResources.getInstance();

        resourceUtil.addResource(explosionResources.EXPLOSION_60_RESOURCE,
                Integer.valueOf(androidResources.raw.explosion_sprite_60_by_60));
        resourceUtil.addResource(explosionResources.HALF_EXPLOSION_RESOURCE,
                Integer.valueOf(androidResources.raw.explosion_sprite_30_by_30));
        resourceUtil.addResource(explosionResources.THIRD_EXPLOSION_RESOURCE,
                Integer.valueOf(androidResources.raw.explosion_sprite_15_by_15));

        PlayerVehicleResources playerVehicleResources = PlayerVehicleResources.getInstance();        
        BlueVehicleResources blueVehicleResources = BlueVehicleResources.getInstance();
        PinkVehicleResources pinkVehicleResources = PinkVehicleResources.getInstance();
        PurpleVehicleResources purpleVehicleResources = PurpleVehicleResources.getInstance();
        YellowVehicleResources yellowVehicleResources = YellowVehicleResources.getInstance();
        
        String[] RESOURCES =
        { 
                playerVehicleResources.RESOURCE,
                playerVehicleResources.BOOST_RESOURCE,
                blueVehicleResources.RESOURCE,
                blueVehicleResources.BOOST_RESOURCE,
                pinkVehicleResources.RESOURCE,
                pinkVehicleResources.BOOST_RESOURCE,
                purpleVehicleResources.RESOURCE,
                purpleVehicleResources.BOOST_RESOURCE,
                yellowVehicleResources.RESOURCE,
                yellowVehicleResources.BOOST_RESOURCE
        };
        
        this.initImages(RESOURCES);
        }
        */        
    }

    protected void initImages(String[] RESOURCES) throws Exception
    {
        throw new Exception("No Impl");
    }

    /*
    protected void initImageArray(String[] RESOURCES)
    {
        int[] ANDROID_RESOURCES =
        { androidResources.raw.lamb_red_20_by_20,
                androidResources.raw.boost_20_by_20,
                androidResources.raw.lamb_blue_20_by_20,
                androidResources.raw.boost_20_by_20,
                androidResources.raw.lamb_pink_20_by_20,
                androidResources.raw.boost_20_by_20,
                androidResources.raw.lamb_purple_20_by_20,
                androidResources.raw.boost_20_by_20,
                androidResources.raw.lamb_yellow_20_by_20,
                androidResources.raw.boost_20_by_20};

        this.init(RESOURCES, ANDROID_RESOURCES);
    }
    */

    protected void init(String[] RESOURCES, int[] ANDROID_RESOURCES)
    {
        ResourceUtil resourceUtil = 
            ResourceUtil.getInstance();

        for (int index = 0; index < RESOURCES.length; index++)
        {
            resourceUtil.addResource(RESOURCES[index],
                    Integer.valueOf(ANDROID_RESOURCES[index]));
        }
    }

}

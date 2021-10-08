package org.allbinary.game.gd.resource;

/*
 *  Note that errors may occur even though your importing R correctly
 *  This usually is caused by Duplicate R classes
 *  Solution is usually to move the R class from the org.allbinary.game.game_name 
 *  package into the independent src directory not part of the multi process apk
 *  Remark out for independent Activities
 */

import org.allbinary.game.resource.GDThrusterSound;
import org.allbinary.game.resource.GDExplosionSound;
import org.allbinary.game.resource.GDLaserShootSound;
import org.allbinary.game.resource.GDThrusterDownSound;
import org.allbinary.game.resource.GDResources;
import java.io.InputStream;
import org.allbinary.AndroidResources;

import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.game.resource.ResourceInitialization;
import org.allbinary.gdevelop.json.GDLayer;
import org.allbinary.gdevelop.json.GDLayout;
import org.allbinary.gdevelop.json.GDProject;
import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.logic.basic.io.StreamUtil;
import org.allbinary.media.audio.ErrorSound;
import org.allbinary.media.audio.SelectSound;
import org.allbinary.midlet.MidletIcon;
import org.allbinary.util.BasicArrayList;

public class GDGameAndroidEarlyResourceInitialization 
extends ResourceInitialization
{
    public void init() 
    throws Exception
    {
        super.init();

        final ResourceUtil resourceUtil = ResourceUtil.getInstance();

        final AndroidResources androidResources = AndroidResources.getInstance();

        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
                
        resourceUtil.addResource(gdProjectStrings.GAME, Integer
                .valueOf(androidResources.raw.game));
        
        //final GDProject gdProject = new GDProject();

        //final InputStream inputStream = resourceUtil.getResourceAsStream(gdProjectStrings.GAME);
        //final StreamUtil streamUtil = StreamUtil.getInstance();
        //final String gdGameConfiguration = streamUtil.getAsString(inputStream);
        
        //gdProject.load(gdGameConfiguration);
        
        resourceUtil.addResource(MidletIcon.RESOURCE, Integer
                .valueOf(androidResources.drawable.gd_icon));

        resourceUtil.addResource(SelectSound.getInstance().getResource(), Integer
                .valueOf(androidResources.raw.select));

        resourceUtil.addResource(ErrorSound.getInstance().getResource(), Integer
                .valueOf(androidResources.raw.error));
        
        
        resourceUtil.addResource(GDExplosionSound.getInstance().getResource(), Integer.valueOf(androidResources.raw.explosion));

        resourceUtil.addResource(GDLaserShootSound.getInstance().getResource(), Integer.valueOf(androidResources.raw.laser_shoot));

        resourceUtil.addResource(GDThrusterSound.getInstance().getResource(), Integer.valueOf(androidResources.raw.thruster));

        resourceUtil.addResource(GDThrusterDownSound.getInstance().getResource(), Integer.valueOf(androidResources.raw.thruster_down));

        resourceUtil.addResource(GDResources.getInstance().DEBRISH, Integer.valueOf(androidResources.raw.debrish));

        resourceUtil.addResource(GDResources.getInstance().LARG_ASTEROID_1, Integer.valueOf(androidResources.raw.larg_asteroid_1));

        resourceUtil.addResource(GDResources.getInstance().LARG_ASTEROID_2, Integer.valueOf(androidResources.raw.larg_asteroid_2));

        resourceUtil.addResource(GDResources.getInstance().LARG_ASTEROID_3, Integer.valueOf(androidResources.raw.larg_asteroid_3));

        resourceUtil.addResource(GDResources.getInstance().MEDIUM_ASTEROID_1, Integer.valueOf(androidResources.raw.medium_asteroid_1));

        resourceUtil.addResource(GDResources.getInstance().MEDIUM_ASTEROID_2, Integer.valueOf(androidResources.raw.medium_asteroid_2));

        resourceUtil.addResource(GDResources.getInstance().MEDIUM_ASTEROID_3, Integer.valueOf(androidResources.raw.medium_asteroid_3));

        resourceUtil.addResource(GDResources.getInstance().SMALL_ASTEROID_1, Integer.valueOf(androidResources.raw.small_asteroid_1));

        resourceUtil.addResource(GDResources.getInstance().SMALL_ASTEROID_2, Integer.valueOf(androidResources.raw.small_asteroid_2));

        resourceUtil.addResource(GDResources.getInstance().SMALL_ASTEROID_3, Integer.valueOf(androidResources.raw.small_asteroid_3));

        resourceUtil.addResource(GDResources.getInstance().SHIP_1, Integer.valueOf(androidResources.raw.ship_1));

        resourceUtil.addResource(GDResources.getInstance().SHIP_BULLET, Integer.valueOf(androidResources.raw.ship_bullet));

        resourceUtil.addResource(GDResources.getInstance().SHIP_PART_1, Integer.valueOf(androidResources.raw.ship_part_1));

        resourceUtil.addResource(GDResources.getInstance().SHIP_PART_2, Integer.valueOf(androidResources.raw.ship_part_2));

        resourceUtil.addResource(GDResources.getInstance().SHIP_PART_3, Integer.valueOf(androidResources.raw.ship_part_3));

        resourceUtil.addResource(GDResources.getInstance().FLATLIGHT22, Integer.valueOf(androidResources.raw.flatlight22));

        resourceUtil.addResource(GDResources.getInstance().FLATLIGHT23, Integer.valueOf(androidResources.raw.flatlight23));

        resourceUtil.addResource(GDResources.getInstance().FLATLIGHT34, Integer.valueOf(androidResources.raw.flatlight34));

        resourceUtil.addResource(GDResources.getInstance().FLATLIGHT35, Integer.valueOf(androidResources.raw.flatlight35));

        
        //resourceUtil.addResource(TestSound.getInstance().getResource(), Integer
                //.valueOf(androidResources.raw.test));

        //resourceUtil.addResource(ExplosionResources.getInstance().EXPLOSION_60_RESOURCE, Integer
          //      .valueOf(AndroidResources.raw.explosion_sprite_60_by_60));
    }
    
}


package org.allbinary.game.gd.init;

import org.allbinary.AndroidResources;

import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.game.resource.ResourceInitialization;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.media.audio.ErrorSound;
import org.allbinary.media.audio.SelectSound;
import org.allbinary.media.audio.TestSound;
import org.allbinary.midlet.MidletIcon;

public class GDGameAndroidEarlyResourceInitialization
extends ResourceInitialization
{
    public GDGameAndroidEarlyResourceInitialization()
    {
    }

    public void init()
        throws Exception
    {
        super.init();
        
        PreLogUtil.put(CommonStrings.getInstance().START, this, CommonStrings.getInstance().INIT);
        
        final ResourceUtil resourceUtil = ResourceUtil.getInstance();
        
        final AndroidResources androidResources = AndroidResources.getInstance();
        
        resourceUtil.addResource(MidletIcon.RESOURCE,
            Integer.valueOf(androidResources.drawable.gd_icon));

        resourceUtil.addResource(SelectSound.getInstance().getResource(), Integer
                .valueOf(androidResources.raw.select));

        resourceUtil.addResource(ErrorSound.getInstance().getResource(), Integer
                .valueOf(androidResources.raw.error));
        
        resourceUtil.addResource(TestSound.getInstance().getResource(), Integer
                .valueOf(androidResources.raw.test));

        //resourceUtil.addResource(ExplosionResources.getInstance().EXPLOSION_60_RESOURCE, Integer
          //      .valueOf(AndroidResources.raw.explosion_sprite_60_by_60));

        //resourceUtil.addResource(FireworksSound.getInstance().getResource(),
          //      Integer.valueOf(androidResources.raw.fireworks));
    }
}

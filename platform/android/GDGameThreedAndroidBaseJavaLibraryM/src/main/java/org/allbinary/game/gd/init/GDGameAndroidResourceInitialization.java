package org.allbinary.game.gd.init;

import org.allbinary.game.gd.resource.GDGameAndroidResources;

import org.allbinary.android.input.motion.button.TouchButtonAndroidResources;
import org.allbinary.game.gd.init.GDGameResourceInitialization;

public class GDGameAndroidResourceInitialization
extends GDGameResourceInitialization
{
    public GDGameAndroidResourceInitialization()
    {
    }

    public void init()
        throws Exception
    {
        super.init();
        
        //TWB - TouchButton
        new TouchButtonAndroidResources().init();
        
        GDGameAndroidResources.getInstance().init();
    }
}

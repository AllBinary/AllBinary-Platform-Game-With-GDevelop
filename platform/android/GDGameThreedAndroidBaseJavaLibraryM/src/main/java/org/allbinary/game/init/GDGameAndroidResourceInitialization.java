package org.allbinary.game.init;

import org.allbinary.game.resource.GDGameAndroidResources;

import org.allbinary.android.input.motion.button.TouchButtonAndroidResources;

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

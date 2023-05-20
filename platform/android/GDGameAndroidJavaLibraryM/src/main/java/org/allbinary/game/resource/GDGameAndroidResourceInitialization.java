package org.allbinary.game.resource;

/*
 *  Note that errors may occur even though your importing R correctly
 *  This usually is caused by Duplicate R classes
 *  Solution is usually to move the R class from the org.allbinary.game.game_name 
 *  package into the independent src directory not part of the multi process apk
 *  Remark out for independent Activities
 */

import org.allbinary.android.input.motion.button.TouchButtonAndroidResources;
import org.allbinary.game.init.GDGameResourceInitialization;

public class GDGameAndroidResourceInitialization 
extends GDGameResourceInitialization
{
    public void init() 
    throws Exception
    {
        super.init();
        
        new TouchButtonAndroidResources().init();
        
      //GDGameAndroidResources.getInstance().init();
      //GDGameResources.init();
    }
}

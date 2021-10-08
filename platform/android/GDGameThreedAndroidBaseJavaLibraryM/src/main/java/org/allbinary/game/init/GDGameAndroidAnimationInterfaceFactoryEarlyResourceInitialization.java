package org.allbinary.game.init;

import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.animation.image.GDGameEarlyResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory;
//import org.allbinary.game.image.GDGameEarlyResourcesImageArrayBasedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.resource.ResourceInitialization;

public class GDGameAndroidAnimationInterfaceFactoryEarlyResourceInitialization 
extends ResourceInitialization
{
    public GDGameAndroidAnimationInterfaceFactoryEarlyResourceInitialization()
    {
    }

    public void init()
    throws Exception
    {
        FeaturedAnimationInterfaceFactoryInterfaceFactory 
        featuredAnimationInterfaceFactoryInterfaceFactory = 
            FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance();

        //featuredAnimationInterfaceFactoryInterfaceFactory.add(
                //new GDGameEarlyResourcesImageArrayBasedAnimationInterfaceFactoryInterfaceFactory());

        featuredAnimationInterfaceFactoryInterfaceFactory.add(
                new GDGameEarlyResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory());
        
    }
}

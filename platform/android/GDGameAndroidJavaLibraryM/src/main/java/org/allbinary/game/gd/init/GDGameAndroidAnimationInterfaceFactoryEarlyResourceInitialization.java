package org.allbinary.game.gd.init;

import org.allbinary.animation.image.GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.animation.image.GDGameEarlyResourcesOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory;

import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
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

        //Early Loading Here
        featuredAnimationInterfaceFactoryInterfaceFactory.add(
                new GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory());

        featuredAnimationInterfaceFactoryInterfaceFactory.add(
                new GDGameEarlyResourcesOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory());
    }
}

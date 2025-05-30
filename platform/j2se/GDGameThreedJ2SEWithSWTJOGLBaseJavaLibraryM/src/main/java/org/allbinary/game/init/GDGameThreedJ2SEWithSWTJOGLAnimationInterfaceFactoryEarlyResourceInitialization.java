package org.allbinary.game.init;

import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.animation.image.GDGameEarlyResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory;
//import org.allbinary.game.image.GDGameEarlyResourcesImageArrayBasedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.resource.ResourceInitialization;

public class GDGameThreedJ2SEWithSWTJOGLAnimationInterfaceFactoryEarlyResourceInitialization 
extends ResourceInitialization
{
    public GDGameThreedJ2SEWithSWTJOGLAnimationInterfaceFactoryEarlyResourceInitialization()
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

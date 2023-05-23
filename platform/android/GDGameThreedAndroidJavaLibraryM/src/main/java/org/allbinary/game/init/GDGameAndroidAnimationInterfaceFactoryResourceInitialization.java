package org.allbinary.game.init;

import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.animation.image.GD1GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.animation.image.GD1GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory2;
import org.allbinary.animation.image.GDGameGameResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.animation.image.GDGameOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory;
//import org.allbinary.game.image.GDGameGameResourcesImageArrayBasedAnimationInterfaceFactoryInterfaceFactory;
//import org.allbinary.game.image.GDGameImageArrayBasedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.resource.ResourceInitialization;
//import org.allbinary.input.motion.button.TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory;
//import org.allbinary.input.motion.button.TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory;

public class GDGameAndroidAnimationInterfaceFactoryResourceInitialization
extends ResourceInitialization
{
    public GDGameAndroidAnimationInterfaceFactoryResourceInitialization()
    {
    }

    public void init()
    throws Exception
    {
        FeaturedAnimationInterfaceFactoryInterfaceFactory 
        featuredAnimationInterfaceFactoryInterfaceFactory = 
            FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance();
        
        //TWB - TouchButton
        //featuredAnimationInterfaceFactoryInterfaceFactory.add(
                //new TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory());
        
        //featuredAnimationInterfaceFactoryInterfaceFactory.add(
                //new GDGameGameResourcesImageArrayBasedAnimationInterfaceFactoryInterfaceFactory());
        
        //featuredAnimationInterfaceFactoryInterfaceFactory.add(
                //new GDGameImageArrayBasedAnimationInterfaceFactoryInterfaceFactory());

        //featuredAnimationInterfaceFactoryInterfaceFactory.add(
                //new TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory());

        featuredAnimationInterfaceFactoryInterfaceFactory.add(
                new GD1GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory2());
                
        //featuredAnimationInterfaceFactoryInterfaceFactory.add(
                //new GD1GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory());
                
        featuredAnimationInterfaceFactoryInterfaceFactory.add(
                new GDGameGameResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory());
        
        featuredAnimationInterfaceFactoryInterfaceFactory.add(
                new GDGameOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory());
    }
}

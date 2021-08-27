package org.allbinary.game.gd.init;

import org.allbinary.animation.image.GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.animation.image.GDGameOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory;

import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.resource.ResourceInitialization;
import org.allbinary.input.motion.button.TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.input.motion.button.TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory;

public class GDGameAndroidAnimationInterfaceFactoryResourceInitialization 
extends ResourceInitialization
{
    public GDGameAndroidAnimationInterfaceFactoryResourceInitialization()
    {
    }
    
    public void init()
    throws Exception
    //throws Exception
    {
        //Normal Loading Here
        
        FeaturedAnimationInterfaceFactoryInterfaceFactory featuredAnimationInterfaceFactoryInterfaceFactory = 
            FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance();
        
        //TWB - TouchButton
        featuredAnimationInterfaceFactoryInterfaceFactory.add(
                new TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory());
        
        featuredAnimationInterfaceFactoryInterfaceFactory.add(
                new GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory());

        featuredAnimationInterfaceFactoryInterfaceFactory.add(
                new TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory());
        
        featuredAnimationInterfaceFactoryInterfaceFactory.add(
                new GDGameOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory());
    }
}

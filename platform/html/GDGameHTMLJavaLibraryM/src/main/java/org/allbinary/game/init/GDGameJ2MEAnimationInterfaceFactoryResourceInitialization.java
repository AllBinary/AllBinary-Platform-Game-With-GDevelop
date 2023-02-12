/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
* 
* By agreeing to this license you and any business entity you represent are
* legally bound to the AllBinary Open License Version 1 legal agreement.
* 
* You may obtain the AllBinary Open License Version 1 legal agreement from
* AllBinary or the root directory of AllBinary's AllBinary Platform repository.
* 
* Created By: Travis Berthelot
* 
*/
package org.allbinary.game.init;

import org.allbinary.animation.image.GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.animation.image.GDGameOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory;

import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.resource.ResourceInitialization;
import org.allbinary.input.motion.button.TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.input.motion.button.TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory;

public class GDGameJ2MEAnimationInterfaceFactoryResourceInitialization
extends ResourceInitialization
{
    public GDGameJ2MEAnimationInterfaceFactoryResourceInitialization()
    {
    }
    
    public void init()
    throws Exception
    //throws Exception
    {
        //Normal Loading Here
        
        //TWB - TouchButton
        FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().add(
                new TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory());
        
        FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().add(
                new GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory());

        FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().add(
                new TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory());
        
        FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().add(
                new GDGameOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory());
    }
}

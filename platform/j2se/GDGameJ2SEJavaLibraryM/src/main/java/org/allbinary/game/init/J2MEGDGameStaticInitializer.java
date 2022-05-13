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

import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.resource.ResourceInitialization;
import org.allbinary.game.init.GDGameStaticInitializer;

public class J2MEGDGameStaticInitializer
    extends GDGameStaticInitializer
{
    public J2MEGDGameStaticInitializer(
            ResourceInitialization[] resourceInitializationArray, int portion)
    {
        super(resourceInitializationArray, portion);
    }

    protected void initFeatureResources() 
    throws Exception
    {
        FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().add(
                new GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory());
    }
}

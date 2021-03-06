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
package org.allbinary.animation.image;

import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.image.opengles.OpenGLImageCacheFactory;

import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory;

public class GDGameOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory
    extends GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory
{
    public GDGameOpenGLESImageBasedAnimationInterfaceFactoryInterfaceFactory()
    {
        super("OpenGL Image Animations");
    }

    public void init(int level) throws Exception
    {
        super.init(OpenGLImageCacheFactory.getInstance(), level);
    }
    
    public boolean isFeature()
    {
        Features features = Features.getInstance();
        
        if (features.isFeature(
                GraphicsFeatureFactory.getInstance().IMAGE_GRAPHICS) &&
                features.isFeature(
                        GraphicsFeatureFactory.getInstance().IMAGE_TO_ARRAY_GRAPHICS) &&
                features.isDefault(
                        OpenGLFeatureFactory.getInstance().OPENGL))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}
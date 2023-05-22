package org.allbinary.animation.image;

import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.graphics.threed.min3d.Min3dSceneResourcesFactory;
import org.allbinary.image.opengles.OpenGLImageCacheFactory;

import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;

public class GDGameOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory
extends BaseResourceAnimationInterfaceFactoryInterfaceFactory
{
    public GDGameOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory()
    {
        super("GDGame OpenGL ImageArray Animations");
    }

    private final int portion = 120;
    private int index = 1;
    
    public void loadDayTrack(final String loadingString)
    throws Exception
    {
        ProgressCanvas progressCanvas = ProgressCanvasFactory.getInstance();

        Min3dSceneResourcesFactory min3dSceneResourcesFactory = 
            Min3dSceneResourcesFactory.getInstance();
    }

    private boolean[] isInitialized = new boolean[11];
    
    public void init(int level) 
    throws Exception
    {
        super.init(OpenGLImageCacheFactory.getInstance(), level);        
        
        final String loadingString = this.toString() + " Loading: ";

        index = 1;
        
    }
    
    public boolean isFeature()
    {
        final Features features = Features.getInstance();

        final GraphicsFeatureFactory graphicsFeatureFactory = 
            GraphicsFeatureFactory.getInstance();

        final OpenGLFeatureFactory openGLFeatureFactory = 
            OpenGLFeatureFactory.getInstance();

        if (features.isFeature(graphicsFeatureFactory.IMAGE_GRAPHICS) && 
            features.isFeature(graphicsFeatureFactory.IMAGE_TO_ARRAY_GRAPHICS) &&
            features.isDefault(openGLFeatureFactory.OPENGL) &&
            (features.isFeature(openGLFeatureFactory.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory.OPENGL_3D))
            )
        {
            return true;
        } else
        {
            return false;
        }
    }

}

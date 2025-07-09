package org.allbinary.animation.image;

import org.allbinary.animation.threed.ThreedAnimationSingletonFactory;
import org.allbinary.game.resource.ResourceLoadingLevelFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.graphics.threed.min3d.Min3dSceneResourcesFactory;
import org.allbinary.graphics.threed.min3d.TitleThreedResources;

import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.SingletonAnimationInterfaceFactory;
import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.canvas.GDGameTitleAnimationFactory;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory;
import org.allbinary.game.displayable.canvas.TitleResource;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

public class GDGameEarlyResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory
extends 
//GDGameEarlyResourcesImageArrayBasedAnimationInterfaceFactoryInterfaceFactory
BaseResourceAnimationInterfaceFactoryInterfaceFactory
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    public GDGameEarlyResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory()
    {
        super("Early OpenGL Animations");
    }

    public void init(int level) throws Exception
    {
        logUtil.put(this.getName(), this, "init");
        
        //this.init(OpenGLImageCacheFactory.getInstance(), level);

        if(this.isInitialized())
        {
            return;
        }

        super.init(level);
    }

    public boolean isLoadingLevel(int level)
    {
        ResourceLoadingLevelFactory resourceLoadingLevelFactory = 
            ResourceLoadingLevelFactory.getInstance();

        if (level == resourceLoadingLevelFactory.LOAD_EARLY.getLevel())
        {
            logUtil.put(this.getName(), this, "isLoadingLevel");
            return true;
        }
        else
        {
            return super.isLoadingLevel(level);
        }
    }
    
    public boolean isFeature()
    {
        Features features = Features.getInstance();
        
        GraphicsFeatureFactory graphicsFeatureFactory = 
            GraphicsFeatureFactory.getInstance();
        
        OpenGLFeatureFactory openGLFeatureFactory = 
            OpenGLFeatureFactory.getInstance();
        
        if (features.isFeature(graphicsFeatureFactory.IMAGE_GRAPHICS) && 
            features.isFeature(graphicsFeatureFactory.IMAGE_TO_ARRAY_GRAPHICS) &&
            features.isDefault(openGLFeatureFactory.OPENGL) &&
            (features.isFeature(openGLFeatureFactory.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory.OPENGL_3D))
            )
        {
            logUtil.put(this.getName(), this, "isFeature");
            return true;
        } else
        {
            return false;
        }
    }
}

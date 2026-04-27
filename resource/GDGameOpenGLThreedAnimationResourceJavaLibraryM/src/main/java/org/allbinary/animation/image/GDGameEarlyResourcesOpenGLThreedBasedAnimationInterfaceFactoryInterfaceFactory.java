package org.allbinary.animation.image;

import java.util.Hashtable;
import org.allbinary.game.resource.ResourceLoadingLevelFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory;
import org.allbinary.logic.communication.log.LogUtil;

public class GDGameEarlyResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory
extends 
//GDGameEarlyResourcesImageArrayBasedAnimationInterfaceFactoryInterfaceFactory
BaseResourceAnimationInterfaceFactoryInterfaceFactory
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    public GDGameEarlyResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory()
    {
        super("Early OpenGL Animations", new Hashtable(), new Hashtable(), new Hashtable());
    }

    public void init(int level) throws Exception
    {
        logUtil.putF(this.getName(), this, "init");
        
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
            logUtil.putF(this.getName(), this, "isLoadingLevel");
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
            logUtil.putF(this.getName(), this, "isFeature");
            return true;
        } else
        {
            return false;
        }
    }
}

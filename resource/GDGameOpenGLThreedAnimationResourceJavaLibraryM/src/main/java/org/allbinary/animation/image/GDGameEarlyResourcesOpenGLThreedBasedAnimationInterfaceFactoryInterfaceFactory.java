package org.allbinary.animation.image;

import org.allbinary.animation.ThreedAnimationSingletonFactory;
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
//ZeptoRacerEarlyResourcesImageArrayBasedAnimationInterfaceFactoryInterfaceFactory
BaseResourceAnimationInterfaceFactoryInterfaceFactory
{
    public GDGameEarlyResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory()
    {
        super("Early OpenGL Animations");
    }

    public void init(int level) throws Exception
    {
        LogUtil.put(LogFactory.getInstance(this.getName(), this, "init"));
        
        //this.init(OpenGLImageCacheFactory.getInstance(), level);

        if(this.isInitialized())
        {
            return;
        }

        ResourceLoadingLevelFactory resourceLoadingLevelFactory = 
            ResourceLoadingLevelFactory.getInstance();

        int portion = 120;
        if(level == resourceLoadingLevelFactory.LOAD_EARLY.getLevel())
        {
            portion = 10;
        }

        final String loadingString = this.toString() + " Loading: ";

        int index = 1;

        ProgressCanvas progressCanvas =
            ProgressCanvasFactory.getInstance();

        progressCanvas.addPortion(portion, loadingString, index++);

        Min3dSceneResourcesFactory min3dSceneResourcesFactory = 
            Min3dSceneResourcesFactory.getInstance();
        
        IndexedAnimation[] animationInterfaceArrayTemp =
            GDGameTitleAnimationFactory.getInstance().getArrayInstance();
            
        IndexedAnimation[] animationInterfaceArray = new IndexedAnimation[3];
        
        animationInterfaceArray[0] = animationInterfaceArrayTemp[0];
        animationInterfaceArray[1] = animationInterfaceArrayTemp[1];

        TitleThreedResources titleThreedResources = TitleThreedResources.getInstance();

        //final String TIRE = VehicleStrings.getInstance().TIRE;

        /*
        animationInterfaceArray[0] = (IndexedAnimation)
        new ThreedAnimationFactory(min3dSceneResourcesFactory.get(
                titleThreedResources.RESOURCE_TITLE_ONE)).getInstance();
        animationInterfaceArray[1] = (IndexedAnimation)
        new ThreedAnimationFactory(min3dSceneResourcesFactory.get(
                titleThreedResources.RESOURCE_TITLE_TWO)).getInstance();
        */

        animationInterfaceArray[2] = (IndexedAnimation)
            new ThreedAnimationSingletonFactory(min3dSceneResourcesFactory.get(
                    titleThreedResources.RESOURCE_TITLE_THREE)).getInstance();
        
        this.add(TitleResource.RESOURCE_TITLE,
                new SingletonAnimationInterfaceFactory(
                         GDGameThreedTitleAnimationFactory.getIntance().getInstance(
                                animationInterfaceArray)));

        super.init(level);
    }

    public boolean isLoadingLevel(int level)
    {
        ResourceLoadingLevelFactory resourceLoadingLevelFactory = 
            ResourceLoadingLevelFactory.getInstance();

        if (level == resourceLoadingLevelFactory.LOAD_EARLY.getLevel())
        {
            LogUtil.put(LogFactory.getInstance(this.getName(), this, "isLoadingLevel"));
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
            LogUtil.put(LogFactory.getInstance(this.getName(), this, "isFeature"));
            return true;
        } else
        {
            return false;
        }
    }
}

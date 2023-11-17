<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/case.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/indexof.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/replace.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/reverse.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/split.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDNodeId.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDExternalEvents.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectClassProperty.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectAssign.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectAnimations.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectThreedAnimations.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectAtIndex.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventClassPropertyActions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventClassPropertyConditions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObject.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventWithOnceCondition.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventPaint.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventLogicConstruction.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventOpen.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventClose.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventProcess.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">
        <xsl:variable name="windowWidth" select="properties/windowWidth" />

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />

            <xsl:if test="number($layoutIndex) =
                <GD_CURRENT_INDEX>" >
                <!-- Android images assets need to be enlarged if they are not setup to be inside the cirle area needed -->
                <xsl:variable name="enlargeTheImageBackgroundForRotation" >true</xsl:variable>
                <xsl:variable name="layoutName" select="name" />
                <xsl:variable name="instancesAsString" >,<xsl:for-each select="instances" ><xsl:value-of select="layer" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="objectsAsString" >,<xsl:for-each select="objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="createdObjectsAsString" >,<xsl:call-template name="externalEventsCreateActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="externalEventActionModVarSceneAsString" >,<xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />
                //externalEventActionModVarSceneAsString=<xsl:value-of select="$externalEventActionModVarSceneAsString" />
                
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

import javax.microedition.lcdui.Image;

import min3d.core.Object3d;

import org.allbinary.animation.AllBinaryImageArrayRotationAnimationFactory;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.AnimationInterfaceFactoryInterfaceComposite;
import org.allbinary.animation.BaseAnimationInterfaceFactoryInterfaceComposite;
import org.allbinary.animation.NullRotationAnimationFactory;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.animation.ThreedAnimationFactory;
import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources;
import org.allbinary.game.resource.ResourceLoadingLevelFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.graphics.threed.min3d.Min3dSceneResourcesFactory;
import org.allbinary.image.opengles.OpenGLImageCacheFactory;

import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory;
import org.allbinary.game.layer.special.GDConditionWithGroupActions;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.image.ImageCache;
import org.allbinary.image.ImageCacheFactory;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.logic.math.PrimitiveIntUtil;
import org.allbinary.util.BasicArrayList;

public class GD<xsl:value-of select="$layoutIndex" />GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory
    extends BaseResourceAnimationInterfaceFactoryInterfaceFactory {

    private final CommonStrings commonStrings = CommonStrings.getInstance();

    private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources specialAnimationResources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources.getInstance();

    private final int portion = 120;

    public GD<xsl:value-of select="$layoutIndex" />GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory()
    {
        super("GDGame OpenGL ImageArray Animations");
    }

    public GD<xsl:value-of select="$layoutIndex" />GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory(String name)
    {
        super(name);
    }
    
    public void loadDayTrack(final String loadingString) throws Exception
    {
        ProgressCanvas progressCanvas = ProgressCanvasFactory.getInstance();

        Min3dSceneResourcesFactory min3dSceneResourcesFactory = 
            Min3dSceneResourcesFactory.getInstance();
    }

    private boolean[] isInitialized = new boolean[11];
    
    public void init(int level) 
    throws Exception
    {
        if(this.isInitialized())
        {
            return;
        }
    
        super.init(OpenGLImageCacheFactory.getInstance(), level);        
        
        final String loadingString = this.toString() + " Loading: ";
    
        //final int portion = 120;
        
        //int index = 0;

        final Min3dSceneResourcesFactory min3dSceneResourcesFactory = 
            Min3dSceneResourcesFactory.getInstance();
    
        //ProgressCanvas progressCanvas = 
          //  ProgressCanvasFactory.getInstance();

                        try {

                    <xsl:call-template name="threedAnimationFactory" >
                        <xsl:with-param name="enlargeTheImageBackgroundForRotation" >
                            <xsl:value-of select="$enlargeTheImageBackgroundForRotation" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="windowWidth" >
                            <xsl:value-of select="$windowWidth" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                    <xsl:text>&#10;</xsl:text>
                    <xsl:if test="$layoutIndex = 1" >
                    new GD1GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory(this.getHashtable(), this.getRectangleHashtable()).init(-1);
                    //GameAreaBoxUtil.getInstance().addAnimations(this);
                    </xsl:if>

                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().CONSTRUCTOR, e));
                        }

        super.init(level);
    }
    
    public boolean isLoadingLevel(int level)
    {
        if(level == ResourceLoadingLevelFactory.getInstance().LOAD_GAME.getLevel())
        {
            return true;
        }
        else
        {
            return super.isLoadingLevel(level);
        }
    }
    
    public boolean isFeature()
    {
        final Features features = Features.getInstance();

        final GraphicsFeatureFactory graphicsFeatureFactory = 
            GraphicsFeatureFactory.getInstance();

        final OpenGLFeatureFactory openGLFeatureFactory = 
            OpenGLFeatureFactory.getInstance();

        if (features.isFeature(graphicsFeatureFactory.IMAGE_GRAPHICS) <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
            features.isFeature(graphicsFeatureFactory.IMAGE_TO_ARRAY_GRAPHICS) <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
            features.isDefault(openGLFeatureFactory.OPENGL) <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
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

            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

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
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDGlobalCalls.xsl" />
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDScaling.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDNodeId.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDExternalEvents.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectClassProperty.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectAssign.xsl" />
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

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/animation/GDObjectAnimations.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/animation/GDObjectAnimationsHTML.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

                <!-- Android images assets need to be enlarged if they are not setup to be inside the cirle area needed -->
                <xsl:variable name="enlargeTheImageBackgroundForRotation" >true</xsl:variable>
                <xsl:variable name="gameName" select="properties/name" />
                <xsl:variable name="instancesAsString" >,<xsl:for-each select="instances" ><xsl:value-of select="layer" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="objectsAsString" >,<xsl:for-each select="objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="createdObjectsAsString" >,<xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />

                //showAll - START
                <!--
                    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>root<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                    <xsl:call-template name="showAll" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/root<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                -->                
                //showAll - END
                
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
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.AnimationInterfaceFactoryInterfaceComposite;
import org.allbinary.animation.BaseAnimationInterfaceFactoryInterfaceComposite;
import org.allbinary.animation.IndexedAnimationBehavior;
import org.allbinary.animation.NullRotationAnimationFactory;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.animation.image.AllBinaryHTMLImageRotationAnimationFactory;
import org.allbinary.animation.image.sprite.OneRowSpriteIndexedAnimationFactory;
import org.allbinary.animation.image.sprite.OneRowHTMLSpriteIndexedAnimationFactory;
import org.allbinary.game.canvas.GDGlobalSpecialAnimationResources;
import org.allbinary.game.resource.ResourceLoadingLevelFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;

import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory;
import org.allbinary.game.layer.special.GDConditionWithGroupActions;
import org.allbinary.graphics.DisplayUtil;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.image.ImageCache;
import org.allbinary.image.ImageCacheFactory;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

public class GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory
    extends BaseResourceAnimationInterfaceFactoryInterfaceFactory {

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final PointFactory pointFactory = PointFactory.getInstance();

    private final GDGlobalSpecialAnimationResources specialAnimationResources = GDGlobalSpecialAnimationResources.getInstance();

    public GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory()
    {
        super("Game Image Animations");
    }

    public GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory(String name)
    {
        super(name);
    }
    
    public void init(int level)
    throws Exception
    {
        this.init(ImageCacheFactory.getInstance(), level);
    }

    protected void init(ImageCache imageCache, int level)
    throws Exception
    {
        if(this.isInitialized())
        {
            return;
        }

        //final int portion = 120;
        //final String loadingString = this.toString() + " Loading: ";
        
        //int index = 0;

        //ProgressCanvas progressCanvas = 
          //  ProgressCanvasFactory.getInstance();

                        try {

                    <xsl:call-template name="htmlAnimationFactory" >
                        <xsl:with-param name="enlargeTheImageBackgroundForRotation" >
                            <xsl:value-of select="$enlargeTheImageBackgroundForRotation" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >Global</xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:text>&#10;</xsl:text>

                    <xsl:text>&#10;</xsl:text>
                    //new GDGlobalGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory(this.getHashtable(), this.getRectangleHashtable(), this.getRectangleArrayOfArraysHashtable()).init(-1);

                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e));
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
        Features features = Features.getInstance();
        
        if (features.isFeature(
                GraphicsFeatureFactory.getInstance().IMAGE_GRAPHICS) <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
            features.isFeature(
                GraphicsFeatureFactory.getInstance().IMAGE_TO_ARRAY_GRAPHICS) <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
            !features.isDefault(
                OpenGLFeatureFactory.getInstance().OPENGL))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    private void addRectangles() throws Exception
    {
       //this.addRectangle(BossOneShipResources.getInstance().RESOURCE, new Rectangle(PointFactory
         //       .ZERO_ZERO, 52, 52));
    }
}

    </xsl:template>

</xsl:stylesheet>

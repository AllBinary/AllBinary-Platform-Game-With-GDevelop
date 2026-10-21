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

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/case.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/indexof.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/replace.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/reverse.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/split.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDGlobalCallsKt.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDScalingKt.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDNodeIdKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDExternalEventsKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectClassPropertyKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectAssignKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectAtIndexKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventClassPropertyActionsKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventClassPropertyConditionsKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObjectKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventWithOnceConditionKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventLogicConstructionKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventOpenKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventCloseKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventProcessKt.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/animation/GDObjectAnimationsKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/animation/GDObjectAnimationsHTMLKt.xsl" />

    <xsl:output method="text" indent="yes" />

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
package org.allbinary.animation.image

import javax.microedition.lcdui.Image
import javax.microedition.lcdui.Font

import org.allbinary.animation.AnimationBehaviorFactory
import org.allbinary.animation.AnimationInterfaceFactoryInterface
import org.allbinary.animation.AnimationInterfaceFactoryInterfaceComposite
import org.allbinary.animation.BaseAnimationInterfaceFactoryInterfaceComposite
import org.allbinary.animation.IndexedAnimationBehaviorFactory
import org.allbinary.animation.NullRotationAnimationFactory
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
import org.allbinary.animation.compound.SliderAnimationInterfaceFactory
import org.allbinary.animation.compound.SimultaneousCompoundIndexedAnimationInterfaceFactory
import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.animation.image.AllBinaryHTMLImageRotationAnimationFactory
import org.allbinary.animation.image.sprite.OneRowSpriteIndexedAnimationFactory
import org.allbinary.animation.image.sprite.OneRowSpriteIndexedAnimationFactory
import org.allbinary.animation.text.CustomTextAnimationFactory
import org.allbinary.animation.text.CustomTextBoxIndexedAnimationFactory
import org.allbinary.game.canvas.GDGlobalSpecialAnimationResources
import org.allbinary.game.resource.ResourceLoadingLevelFactory
import org.allbinary.graphics.opengles.OpenGLFeatureFactory

import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory
import org.allbinary.game.layer.special.GDConditionWithGroupActions
import org.allbinary.graphics.PointFactory
import org.allbinary.graphics.Rectangle
import org.allbinary.image.ImageCache
import org.allbinary.image.ImageCacheFactory
import org.allbinary.string.CommonStrings
import org.allbinary.logic.math.PrimitiveIntUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.communication.log.LogFactory
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringUtil
import org.allbinary.logic.StdUtil
import org.allbinary.util.ABHashtable
import org.allbinary.AndroidUtil
import org.allbinary.J2MEUtil
import org.allbinary.game.layout.GDConfig

open class GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory : BaseResourceAnimationInterfaceFactoryInterfaceFactory {

    private val pointFactory: PointFactory = PointFactory.getInstance()

    private val specialAnimationResources: GDGlobalSpecialAnimationResources = GDGlobalSpecialAnimationResources.getInstance()

        <xsl:call-template name="scaleProperty" >
            <xsl:with-param name="layoutIndex" >
                Global
            </xsl:with-param>
            <xsl:with-param name="layoutName" >
                Global
            </xsl:with-param>
        </xsl:call-template>

        <xsl:variable name="hasSprite" ><xsl:for-each select="objects" ><xsl:if test="type = 'Sprite'" >found</xsl:if></xsl:for-each></xsl:variable>
        <xsl:if test="contains($hasSprite, 'found')" >
    private val animationScale: Int = 1
        </xsl:if>

    constructor() : super("Game Image Animations", StdUtil.getInstance().createHashtable(), StdUtil.getInstance().createHashtable(), StdUtil.getInstance().createHashtable())
    {
    }

    constructor(name: String) : super(name, StdUtil.getInstance().createHashtable(), StdUtil.getInstance().createHashtable(), StdUtil.getInstance().createHashtable())
    {
    }

    fun init(level: Int)

    {
        this.init(ImageCacheFactory.getInstance(), level)
    }

    protected fun init(imageCache: ImageCache, level: Int)

    {
        if(this.isInitialized())
        {
            return
        }

        //var portion: Int = 120
        //var loadingString: String = this.toString() + " Loading: "

        //var index: Int = 0

        //ProgressCanvas progressCanvas = ProgressCanvasFactory.getInstance()

                        try {

                    <xsl:call-template name="htmlAnimationFactoryCalls" >
                        <xsl:with-param name="enlargeTheImageBackgroundForRotation" >
                            <xsl:value-of select="$enlargeTheImageBackgroundForRotation" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >Global</xsl:with-param>
                        <xsl:with-param name="layoutName" >
                            Global
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:text>&#10;</xsl:text>

                    <xsl:text>&#10;</xsl:text>
                    //GDGlobalGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory(this.getHashtable(), this.getRectangleHashtable(), this.getRectangleArrayOfArraysHashtable()).init(-1)

                        } catch(e: Exception) {
                            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e)
                        }

        super.init(level)
    }

                    <xsl:call-template name="htmlAnimationFactory" >
                        <xsl:with-param name="enlargeTheImageBackgroundForRotation" >
                            <xsl:value-of select="$enlargeTheImageBackgroundForRotation" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >Global</xsl:with-param>
                        <xsl:with-param name="layoutName" >
                            Global
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="lazy" >true</xsl:with-param>
                    </xsl:call-template>

    fun isLoadingLevel(level: Int): Boolean
    {
        if(level == ResourceLoadingLevelFactory.getInstance().LOAD_GAME.getLevel())
        {
            return true
        }
        else
        {
            return super.isLoadingLevel(level)
        }
    }

    fun isFeature(): Boolean
    {
        var features: Features = Features.getInstance()

        if (features.isFeature(
                GraphicsFeatureFactory.getInstance().IMAGE_GRAPHICS) <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
            features.isFeature(
                GraphicsFeatureFactory.getInstance().IMAGE_TO_ARRAY_GRAPHICS) <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
            !features.isDefault(
                OpenGLFeatureFactory.getInstance().OPENGL))
        {
            return true
        }
        else
        {
            return false
        }
    }

    private fun addRectangles()
    {
       //this.addRectangle(BossOneShipResources.getInstance().RESOURCE, Rectangle(PointFactory
         //       .ZERO_ZERO, 52, 52))
    }
}

    </xsl:template>

</xsl:stylesheet>

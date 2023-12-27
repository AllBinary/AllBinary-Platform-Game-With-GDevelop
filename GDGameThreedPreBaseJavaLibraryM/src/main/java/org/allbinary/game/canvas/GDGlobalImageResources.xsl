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
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDGlobalCalls.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDAction.xsl" />
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDNodeId.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDExternalEvents.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassProperty.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassPropertyGDObjects.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAssign.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionZoomCameraGlobal.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectResources.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDThreedObjectResources.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAtIndex.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyActions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyConditions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObject.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventWithOnceCondition.xsl" />
    
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
                
                package org.allbinary.game.canvas;

                import java.util.Hashtable;

                import javax.microedition.lcdui.Image;

                import org.allbinary.animation.image.GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory;
                import org.allbinary.animation.special.SpecialAnimation;
                import org.allbinary.game.resource.GDResources;
                import org.allbinary.graphics.DisplayUtil;
                import org.allbinary.graphics.PointFactory;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.image.ImageCache;
                import org.allbinary.image.ImageCacheFactory;
                import org.allbinary.image.opengles.OpenGLImageCacheFactory;
                import org.allbinary.logic.string.CommonStrings;
                import org.allbinary.logic.string.CommonSeps;
                import org.allbinary.logic.string.StringUtil;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.media.image.ImageCopyUtil;
                import org.allbinary.media.image.ImageScaleUtil;
                import org.allbinary.logic.system.PlatformAssetManager;

                //Game name=<xsl:value-of select="$gameName" />
                public class GDGlobalSpecialAnimationImageResources extends SpecialAnimation
                {

                    private static GDGlobalSpecialAnimationImageResources instance;

                        public static GDGlobalSpecialAnimationImageResources create() throws Exception
                        {
                            instance = new GDGlobalSpecialAnimationImageResources();
                            return instance;
                        }

                        public static GDGlobalSpecialAnimationImageResources getInstance()
                        {
                            return instance;
                        }

                        private final CommonStrings commonStrings = CommonStrings.getInstance();
                        //private final ImageCopyUtil imageCopyUtil = ImageCopyUtil.getInstance();
                        //private final ImageScaleUtil imageScaleUtil = ImageScaleUtil.getInstance();
                        //private final ImageCache imageCache = OpenGLImageCacheFactory.getInstance(); //ImageCacheFactory.getInstance();
                        private final GDResources gdResources = GDResources.getInstance();

                        //private final GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory animationInterfaceFactoryInterfaceFactory = new GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory();

                    <xsl:call-template name="rectangleProperties" >
                        <xsl:with-param name="enlargeTheImageBackgroundForRotation" >
                            <xsl:value-of select="$enlargeTheImageBackgroundForRotation" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            Global
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="touch" >
                            <xsl:value-of select="'false'" />
                        </xsl:with-param>
                    </xsl:call-template>

                    public GDGlobalSpecialAnimationImageResources() throws Exception {

                        //try {
                        
                            LogUtil.put(LogFactory.getInstance(commonStrings.CONSTRUCTOR, this, commonStrings.CONSTRUCTOR));

                            final PointFactory pointFactory = PointFactory.getInstance();
                            final DisplayUtil displayUtil = DisplayUtil.getInstance();
                            <xsl:variable name="windowWidth" select="/game/properties/windowWidth" />
                            <xsl:variable name="windowHeight" select="/game/properties/windowHeight" />        
                            final int scaleWidth = (displayUtil.width / <xsl:value-of select="$windowWidth" />);
                            final int scaleHeight = (displayUtil.height / <xsl:value-of select="$windowHeight" />);
                            final int scale = (scaleWidth <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> scaleHeight) ? scaleWidth : scaleHeight;

                            //final Hashtable hashTable = imageCache.getHashtable();

                    <xsl:call-template name="rectangleCache" >
                        <xsl:with-param name="enlargeTheImageBackgroundForRotation" >
                            <xsl:value-of select="$enlargeTheImageBackgroundForRotation" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            Global
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="touch" >
                            <xsl:value-of select="'false'" />
                        </xsl:with-param>
                    </xsl:call-template>

                    <xsl:text>&#10;</xsl:text>                    

                        //} catch(Exception e) {
                            //LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e));
                        //}

                    }

                }
    </xsl:template>

</xsl:stylesheet>

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
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDScaling.xsl" />
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
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDThreedObjectLoader.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAtIndex.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyActions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyConditions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObject.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventWithOnceCondition.xsl" />
    
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

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
                
                package org.allbinary.game.canvas;

                import min3d.core.Object3d;
                import min3d.core.TextureManager;
                import min3d.parser.ModelType;
                import min3d.parser.ModelTypeFactory;

                import javax.microedition.lcdui.Image;
                import javax.microedition.khronos.opengles.GL10;

                import org.allbinary.animation.image.GD<xsl:value-of select="$layoutIndex" />GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory;
                import org.allbinary.animation.special.SpecialAnimation;
                import org.allbinary.animation.threed.TextureListFactory;
                import org.allbinary.game.gd.resource.GDResources;
                import org.allbinary.graphics.threed.min3d.ThreedLoaderFactory;
                import org.allbinary.graphics.threed.min3d.Min3dSceneResourcesFactory;
                import org.allbinary.graphics.PointFactory;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.image.ImageCache;
                import org.allbinary.image.ImageCacheFactory;
                import org.allbinary.string.CommonStrings;
                import org.allbinary.string.CommonSeps;
                import org.allbinary.logic.string.StringUtil;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.logic.java.bool.BooleanFactory;
                import org.allbinary.logic.math.PrimitiveIntUtil;
                import org.allbinary.media.image.ImageCopyUtil;
                
                import org.allbinary.graphics.opengles.OpenGLCapabilities;
                import org.allbinary.graphics.threed.min3d.renderer.Object3dContainerUtil;
                import org.platform.ThreedObjResources;
                
                //Layout name=<xsl:value-of select="$layoutName" />
                public class GD<xsl:value-of select="$layoutIndex" />GameThreedLevelBuilder extends GDGameThreedLevelBuilder
                {
                        private final CommonStrings commonStrings = CommonStrings.getInstance();
                
                        private final GDResources gdResources = GDResources.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources animationInterfaceFactoryInterfaceFactory = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources.getInstance();

                        private final TextureListFactory textureListFactory = TextureListFactory.getInstance();
                        private final OpenGLCapabilities openGLCapabilities = OpenGLCapabilities.getInstance();
                        private final ThreedObjResources threedObjResources = ThreedObjResources.getInstance();
                        private final Object3dContainerUtil object3dContainerUtil = Object3dContainerUtil.getInstance();
                        private final Min3dSceneResourcesFactory min3dSceneResourcesFactory = 
                            Min3dSceneResourcesFactory.getInstance();
                        private final ThreedLoaderFactory threedLoaderFactory = ThreedLoaderFactory.getInstance();
                        private final ModelTypeFactory modelTypeFactory = ModelTypeFactory.getInstance();
                        private final Boolean FALSE = BooleanFactory.getInstance().FALSE;
                        
                    public void build(final GL10 gl, final String glInstanceVersion) throws Exception {

                        //try {
                        
                            logUtil.put(commonStrings.CONSTRUCTOR, this, commonStrings.CONSTRUCTOR);

                        <xsl:if test="$layoutIndex = 0" >
                            new GDGlobalGameThreedLevelBuilder().build(gl, glInstanceVersion);
                        </xsl:if>
                        
                    <xsl:call-template name="threedResourceLoadingCalls" >
                        <xsl:with-param name="enlargeTheImageBackgroundForRotation" >
                            <xsl:value-of select="$enlargeTheImageBackgroundForRotation" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="touch" >
                            <xsl:value-of select="'false'" />
                        </xsl:with-param>
                        <xsl:with-param name="useExclusionList" >true</xsl:with-param>
                    </xsl:call-template>

                    <xsl:text>&#10;</xsl:text>                    

                        //} catch(Exception e) {
                            //logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
                        //}

                    }

                    <xsl:call-template name="threedResourceLoading" >
                        <xsl:with-param name="enlargeTheImageBackgroundForRotation" >
                            <xsl:value-of select="$enlargeTheImageBackgroundForRotation" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="touch" >
                            <xsl:value-of select="'false'" />
                        </xsl:with-param>
                        <xsl:with-param name="useExclusionList" >true</xsl:with-param>
                    </xsl:call-template>

                    <xsl:text>&#10;</xsl:text>                    

                    protected void addMapCell(final GL10 gl, final Object3d trackObject3dContainer, final String textureName)
                    throws Exception
                    {
                        //final ProgressCanvas progressCanvas = ProgressCanvasFactory.getInstance();

                        //progressCanvas.addEarlyPortion(portion, loadingString, index++);

                        final String glInstanceVersion = openGLCapabilities.glInstanceVersion;

                        final String mappedTexture = threedObjResources.get(textureName);
                        if(TextureManager.getInstance().contains(mappedTexture)) {
                            return;
                        }
                        textureListFactory.loadTexture(gl, glInstanceVersion, mappedTexture);

                        object3dContainerUtil.replaceTextures(trackObject3dContainer, mappedTexture);
                        min3dSceneResourcesFactory.add(mappedTexture, new Object3d[] {trackObject3dContainer});
                    }

                }
            </xsl:if>
        </xsl:for-each>
                
    </xsl:template>

</xsl:stylesheet>

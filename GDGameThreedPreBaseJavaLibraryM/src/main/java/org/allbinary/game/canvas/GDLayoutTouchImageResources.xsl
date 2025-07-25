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

                import java.util.Hashtable;

                import javax.microedition.lcdui.Image;

                import org.allbinary.AndroidUtil;
                import org.allbinary.animation.AnimationBehavior;
                import org.allbinary.animation.special.SpecialAnimation;
                import org.allbinary.game.gd.resource.GDResources;
                import org.allbinary.graphics.PointFactory;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.image.ImageCache;
                import org.allbinary.image.ImageCacheFactory;
                import org.allbinary.image.opengles.OpenGLImageCacheFactory;
                import org.allbinary.string.CommonStrings;
                import org.allbinary.string.CommonSeps;
                import org.allbinary.logic.string.StringUtil;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.logic.string.StringMaker;
                import org.allbinary.logic.system.PlatformAssetManager;
                import org.allbinary.media.image.ImageCopyUtil;
                import org.allbinary.media.image.ImageScaleUtil;
                import org.allbinary.util.BasicArrayList;

                //Layout name=<xsl:value-of select="$layoutName" />
                public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimationTouchImageResources extends SpecialAnimation
                {

                    private static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationTouchImageResources instance = null;

                        public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationTouchImageResources getInstanceOrCreate() throws Exception
                        {
                            if(instance == null) {
                                instance = new GD<xsl:value-of select="$layoutIndex" />SpecialAnimationTouchImageResources();
                            }

                            return instance;
                        }

                        public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationTouchImageResources getInstance()
                        {
                            return instance;
                        }

                        protected final LogUtil logUtil = LogUtil.getInstance();
                        private final CommonStrings commonStrings = CommonStrings.getInstance();
                        private final ImageCopyUtil imageCopyUtil = ImageCopyUtil.getInstance();
                        private final ImageScaleUtil imageScaleUtil = ImageScaleUtil.getInstance();
                        private final ImageCache imageCache = OpenGLImageCacheFactory.getInstance();
                        private final GDResources gdResources = GDResources.getInstance();

                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources animationInterfaceFactoryInterfaceFactory = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources.getInstance();

                    <xsl:call-template name="imageProperties" >
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
                            <xsl:value-of select="'true'" />
                        </xsl:with-param>
                    </xsl:call-template>

                    public GD<xsl:value-of select="$layoutIndex" />SpecialAnimationTouchImageResources() throws Exception {

                        super(AnimationBehavior.getInstance());

                        //try {
                        
                            logUtil.put(commonStrings.CONSTRUCTOR, this, commonStrings.CONSTRUCTOR);

                            final PointFactory pointFactory = PointFactory.getInstance();

                            final Hashtable hashTable = imageCache.getHashtable();

                    <xsl:call-template name="imageCache" >
                        <xsl:with-param name="enlargeTheImageBackgroundForRotation" >
                            <xsl:value-of select="$enlargeTheImageBackgroundForRotation" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="touch" >
                            <xsl:value-of select="'true'" />
                        </xsl:with-param>
                    </xsl:call-template>

                    <xsl:text>&#10;</xsl:text>                    

                    //layout - objectsGroups - LayoutTouchImageResources - START
                    <xsl:for-each select="objectsGroups" >
                        <xsl:variable name="objectGroupName" >
                            <xsl:value-of select="name" />
                        </xsl:variable>
                        <xsl:for-each select="objects" >
                            <xsl:if test="contains(name, 'btn_')" >
                                <xsl:value-of select="$objectGroupName" />ImageArrayList.add(<xsl:value-of select="name" />ImageArray);
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>
                    //layout - objectsGroups - LayoutTouchImageResources - END
                
                        //} catch(Exception e) {
                            //logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
                        //}

                    }

                    public void validateSprites(final String name, final String[] resourceArray, final Image[] imageArray) {
                        final CommonSeps commonSeps = CommonSeps.getInstance();
                        final int size = imageArray.length;
                        Image image;
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            image = imageArray[index];
                            if (image.getWidth() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> image.getHeight() <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> image.getWidth() % image.getHeight() != 0) {
                                logUtil.put(new StringMaker().append(index).append(name).append(image.getWidth()).append(commonSeps.COLON).append(image.getHeight()).toString(), this, commonStrings.PROCESS, new Exception());
                            }
                        }
                    }

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

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
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDNodeId.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDExternalEvents.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassProperty.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassPropertyGDObjects.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAssign.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionCentreCameraGlobal.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionZoomCameraGlobal.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectResources.xsl" />
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
                <xsl:variable name="objectsGroupsAsString" >,<xsl:for-each select="objectsGroups" ><xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="instancesAsString" >,<xsl:for-each select="instances" ><xsl:value-of select="layer" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="objectsAsString" >,<xsl:for-each select="/game/objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each>,<xsl:for-each select="objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="createdObjectsAsString" >,<xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />
                
                package org.allbinary.game.canvas;

                import org.allbinary.animation.AnimationBehavior;
                import org.allbinary.animation.AnimationInterfaceFactoryInterface;
                import org.allbinary.animation.AnimationInterfaceFactoryInterfaceComposite;
                import org.allbinary.animation.BaseAnimationInterfaceFactoryInterfaceComposite;
                import org.allbinary.animation.BasicAnimationInterfaceFactoryInterface;
                import org.allbinary.animation.NullAnimationFactory;
                import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
                import org.allbinary.animation.RotationAnimationFactory;
                import org.allbinary.animation.image.GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory;
                import org.allbinary.animation.special.SpecialAnimation;
                import org.allbinary.animation.text.CustomTextAnimationFactory;
                import org.allbinary.game.identification.Group;
                import org.allbinary.game.layer.GDGameLayerFactory;
                import org.allbinary.game.layer.GDCustomGameLayerFactory;
                import org.allbinary.game.layer.AllBinaryGameLayerManager;
                import org.allbinary.game.layer.GDIndividualAnimationBehavior;
                import org.allbinary.game.layer.GDAnimationBehaviorBase;
                import org.allbinary.game.layer.special.GDConditionWithGroupActions;
                import org.allbinary.game.layout.GDObject;
                import org.allbinary.graphics.GPoint;
                import org.allbinary.graphics.PointFactory;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.graphics.color.BasicColor;
                import org.allbinary.graphics.color.BasicColorUtil;
                import org.allbinary.graphics.color.SmallBasicColorCacheFactory;
                import org.allbinary.string.CommonStrings;
                import org.allbinary.string.CommonSeps;
                import org.allbinary.logic.string.StringUtil;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.util.BasicArrayList;

                public class GDGlobalsGDResources extends SpecialAnimation
                {

                    private static GDGlobalsGDResources instance = null;
                        
                        public static GDGlobalsGDResources getInstanceOrCreate() throws Exception {
                            if(instance == null) {
                                instance = new GDGlobalsGDResources();
                            }
                            return instance;
                        }
                
                        public static GDGlobalsGDResources getInstance()
                        {
                            return instance;
                        }

                        protected final LogUtil logUtil = LogUtil.getInstance();
                        private final CommonStrings commonStrings = CommonStrings.getInstance();
                        private final BasicColorUtil basicColorUtil = BasicColorUtil.getInstance();
                        private final SmallBasicColorCacheFactory smallBasicColorCacheFactory = SmallBasicColorCacheFactory.getInstance();

                        private final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
       
                        private final GDGlobalSpecialAnimationResources specialAnimationResources = GDGlobalSpecialAnimationResources.getInstance();
                        private final GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory animationInterfaceFactoryInterfaceFactory = new GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory();

                    //objectsGroups - START
                    <xsl:for-each select="objectsGroups" >
                        public final BasicArrayList <xsl:value-of select="name" />GDGameLayerFactoryList = new BasicArrayList();
                        <xsl:for-each select="objects" >
                        </xsl:for-each>
                    </xsl:for-each>
                    //objectsGroups - END
                        
                    <xsl:call-template name="objectsProperties" >
                        <xsl:with-param name="enlargeTheImageBackgroundForRotation" >
                            <xsl:value-of select="$enlargeTheImageBackgroundForRotation" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            Global
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                        
                        //objects - all - //resources - properties
                    <xsl:for-each select="objects" >
                        //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>
                        public GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory = null;
                    </xsl:for-each>

                    private GDGlobalsGDResources() throws Exception {
                        
                        super(AnimationBehavior.getInstance());

                        //try {
                        
                            logUtil.put(commonStrings.START, this, commonStrings.CONSTRUCTOR);

                    animationInterfaceFactoryInterfaceFactory.init(-1);
                                        
                    <xsl:call-template name="objectsAssign" >
                        <xsl:with-param name="enlargeTheImageBackgroundForRotation" >
                            <xsl:value-of select="$enlargeTheImageBackgroundForRotation" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            Global
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:text>&#10;</xsl:text>                    
                    
                    //objectsGroups - START
                    <xsl:for-each select="objectsGroups" >
                        <xsl:variable name="name" ><xsl:value-of select="name" /></xsl:variable>
                        <xsl:for-each select="objects" >
                            <xsl:value-of select="$name" />GDGameLayerFactoryList.add(<xsl:value-of select="name" />GDGameLayerFactory);
                        </xsl:for-each>
                    </xsl:for-each>
                    //objectsGroups - END

                    logUtil.put(commonStrings.END, this, commonStrings.CONSTRUCTOR);

                        //} catch(Exception e) {
                            //logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
                        //}

                    }

                }
    </xsl:template>

</xsl:stylesheet>

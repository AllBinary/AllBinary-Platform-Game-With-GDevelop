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

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />

            <xsl:if test="number($layoutIndex) =
                <GD_CURRENT_INDEX>" >
                <!-- Android images assets need to be enlarged if they are not setup to be inside the cirle area needed -->
                <xsl:variable name="enlargeTheImageBackgroundForRotation" >true</xsl:variable>
                <xsl:variable name="layoutName" select="name" />
                <xsl:variable name="objectsGroupsAsString" >,<xsl:for-each select="objectsGroups" ><xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="instancesAsString" >,<xsl:for-each select="instances" ><xsl:value-of select="layer" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="objectsAsString" >,<xsl:for-each select="/game/objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each>,<xsl:for-each select="objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="createdObjectsAsString" >,<xsl:call-template name="externalEventsCreateActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="externalEventActionModVarSceneAsString" >,<xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />
                //externalEventActionModVarSceneAsString=<xsl:value-of select="$externalEventActionModVarSceneAsString" />
                
                package org.allbinary.game.canvas;

                import org.allbinary.animation.AnimationBehavior;
                import org.allbinary.animation.AnimationInterfaceFactoryInterface;
                import org.allbinary.animation.AnimationInterfaceFactoryInterfaceComposite;
                import org.allbinary.animation.BaseAnimationInterfaceFactoryInterfaceComposite;
                import org.allbinary.animation.BasicAnimationInterfaceFactoryInterface;
                import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
                import org.allbinary.animation.RotationAnimationFactory;
                import org.allbinary.animation.image.GD<xsl:value-of select="$layoutIndex" />GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory;
                import org.allbinary.animation.special.SpecialAnimation;
                import org.allbinary.animation.NullAnimationFactory;
                import org.allbinary.animation.NullRotationAnimationFactory;
                import org.allbinary.game.layer.GDGameLayerFactory;
                import org.allbinary.game.layer.GDCustomGameLayerFactory;
                import org.allbinary.game.identification.Group;
                import org.allbinary.game.layer.AllBinaryGameLayerManager;
                import org.allbinary.game.layer.GDSingleAnimationBehavior;
                import org.allbinary.game.layer.GDIndividualAnimationBehavior;
                import org.allbinary.game.layer.GDAnimationBehaviorBase;
                import org.allbinary.game.layer.GDPrimitiveDrawing;
                import org.allbinary.game.layer.GDRectOnlyPrimitiveDrawing;
                import org.allbinary.game.layer.GDPrimitiveDrawingAnimationFactory;
                import org.allbinary.game.layer.GDRectOnlyPrimitiveDrawingAnimationFactory;
                import org.allbinary.game.layer.special.GDConditionWithGroupActions;
                import org.allbinary.graphics.GPoint;
                import org.allbinary.graphics.PointFactory;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.logic.string.CommonStrings;
                import org.allbinary.logic.string.CommonSeps;
                import org.allbinary.logic.string.StringUtil;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.util.BasicArrayList;

                //LayoutGDResources name=<xsl:value-of select="$layoutName" />
                public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources extends SpecialAnimation
                {

                    private static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources instance;

                        public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources getInstance(final AllBinaryGameLayerManager allBinaryGameLayerManager) throws Exception
                        {
                            instance = new GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources(allBinaryGameLayerManager);
                            return instance;
                        }
                        
                        public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources getInstance()
                        {
                            return instance;
                        }

                        private final CommonStrings commonStrings = CommonStrings.getInstance();
                        private final PointFactory pointFactory = PointFactory.getInstance();

                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
       
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources specialAnimationResources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationResources.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory animationInterfaceFactoryInterfaceFactory = new GD<xsl:value-of select="$layoutIndex" />GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory();

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
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                        
                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:if test="$typeValue = 'Sprite'" >
                            <xsl:variable name="name" select="name" />
                            public GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory = null;
                        </xsl:if>
                        <xsl:if test="$typeValue = 'PrimitiveDrawing::Drawer'" >
                            <xsl:variable name="name" select="name" />
                            public GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory = null;
                        </xsl:if>
                        <xsl:if test="$typeValue = 'TileMap::CollisionMask' or $typeValue = 'TileMap::TileMap'" >
                            <xsl:variable name="name" select="name" />
                            public GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory = null;
                        </xsl:if>
                        <xsl:if test="$typeValue = 'ParticleSystem::ParticleEmitter'" >
                            <xsl:variable name="name" select="name" />
                            public GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory = null;
                        </xsl:if>
                        <xsl:if test="$typeValue = 'TextObject::Text'" >
                            <xsl:variable name="name" select="name" />
                            public GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory = null;
                        </xsl:if>
                        <xsl:if test="$typeValue = 'TextEntryObject::TextEntry'" >
                            <xsl:variable name="name" select="name" />
                            public GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory = null;
                        </xsl:if>
                    </xsl:for-each>

                    public GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources(final AllBinaryGameLayerManager allBinaryGameLayerManager) throws Exception {

                        super(AnimationBehavior.getInstance());

                        //try {
                        
                            LogUtil.put(LogFactory.getInstance(commonStrings.CONSTRUCTOR, this, commonStrings.CONSTRUCTOR));

                    animationInterfaceFactoryInterfaceFactory.init(-1);
                                        
                    <xsl:call-template name="objectsAssign" >
                        <xsl:with-param name="enlargeTheImageBackgroundForRotation" >
                            <xsl:value-of select="$enlargeTheImageBackgroundForRotation" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
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

                    <xsl:if test="$layoutIndex = 1" >
                    //GameAreaBoxUtil.getInstance().addGameLayerFactories(animationInterfaceFactoryInterfaceFactory);
                    </xsl:if>

                        //} catch(Exception e) {
                            //LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e));
                        //}

                    }

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

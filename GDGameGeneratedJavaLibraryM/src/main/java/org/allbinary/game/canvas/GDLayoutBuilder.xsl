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

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDScaling.xsl" />    

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionCentreCameraGlobal.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionZoomCameraGlobal.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDNodeId.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDExternalEvents.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassProperty.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassPropertyGDObjects.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAssign.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAtIndex.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyActions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyConditions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObject.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventWithOnceCondition.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/condition/GDEventWithKeyFromTextCondition.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventPaint.xsl" />
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventLogicConstruction.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventOpen.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClose.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventProcess.xsl" />
    
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
                    //$typeValue = 'TileMap::CollisionMask' or 
                    //$typeValue = 'TileMap::TileMap' or //Not excluded anymore.
                    //exclusionObjectsAsStringNotInUse=,<xsl:for-each select="objects" ><xsl:if test="contains(type, 'Collision')" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:if></xsl:for-each>
                <xsl:variable name="exclusionObjectsAsString" ></xsl:variable>
                
                <xsl:variable name="createdObjectsAsString" >,<xsl:call-template name="externalEventsCreateActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="externalEventActionModVarSceneAsString" >,<xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />
                //exclusionObjectsAsString=<xsl:value-of select="$exclusionObjectsAsString" />
                //externalEventActionModVarSceneAsString=<xsl:value-of select="$externalEventActionModVarSceneAsString" />
                
                package org.allbinary.game.canvas;

                import javax.microedition.lcdui.Graphics;
                
                import org.allbinary.animation.AnimationBehavior;
                import org.allbinary.animation.special.SpecialAnimation;
                import org.allbinary.canvas.GameGlobalsFactory;
                import org.allbinary.game.input.GameInputProcessorUtil;
                import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas;
                import org.allbinary.game.layout.GDNode;
                import org.allbinary.game.layer.special.TempGameLayerUtil;
                import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
                import org.allbinary.graphics.displayable.event.DisplayChangeEvent;
                import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler;
                import org.allbinary.graphics.displayable.event.DisplayChangeEventListener;

                import org.allbinary.game.layout.GDObject;
                import org.allbinary.game.layer.AllBinaryGameLayerManager;
                import org.allbinary.game.layer.GDGameLayer;
                import org.allbinary.game.layer.CollidableCompositeLayer;
                import org.allbinary.game.layout.BaseGDNodeStats;
                import org.allbinary.game.layout.GDInitialVariables;
                import org.allbinary.game.layout.GDNodeStatsFactory;
                import org.allbinary.game.layout.GDObjectStrings;
                import org.allbinary.game.rand.MyRandomFactory;
                import org.allbinary.graphics.PointFactory;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.graphics.color.BasicColor;
                import org.allbinary.graphics.color.SmallBasicColorCacheFactory;
                import org.allbinary.graphics.color.BasicColorUtil;
                import org.allbinary.graphics.displayable.MyCanvas;
                import org.allbinary.input.motion.gesture.MotionGestureInput;
                import org.allbinary.input.motion.gesture.TouchMotionGestureFactory;
                import org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener;
                import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.string.CommonStrings;
                import org.allbinary.string.CommonSeps;
                import org.allbinary.logic.string.StringMaker;
                import org.allbinary.logic.util.event.AllBinaryEventObject;
                import org.allbinary.thread.NullRunnable;
                import org.allbinary.util.BasicArrayList;
                import org.allbinary.util.ArrayUtil;
                import org.allbinary.logic.math.SmallIntegerSingletonFactory;

                //LayoutBuilder name=<xsl:value-of select="$layoutName" />
                public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder extends SpecialAnimation
                {
                        private final CommonStrings commonStrings = CommonStrings.getInstance();
                        private final ArrayUtil arrayUtil = ArrayUtil.getInstance();
                        private final PointFactory pointFactory = PointFactory.getInstance();
                        private final BasicColorUtil basicColorUtil = BasicColorUtil.getInstance();
                        private final SmallBasicColorCacheFactory smallBasicColorCacheFactory = SmallBasicColorCacheFactory.getInstance();
                        private final GameTickDisplayInfoSingleton gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();
                        private final SmallIntegerSingletonFactory smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
                        private final GameGlobalsFactory gameGlobalsFactory = GameGlobalsFactory.getInstance();
                        
                        private final GDObjectStrings objectStrings = GDObjectStrings.getInstance();

                        private final BaseGDNodeStats gdNodeStatsFactory = GDNodeStatsFactory.getInstance();                        
                        private final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
                        private final GDGlobalsGDObjectsFactory gdGlobalsObjectsFactory = GDGlobalsGDObjectsFactory.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory gdObjectsFactory = GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.getInstance();

                        public boolean initialized = false;
                        
                        private GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources createSpecialAnimationImageResources() {
                            try {
                                return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources.getInstanceOrCreate();
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources", this, commonStrings.CONSTRUCTOR, e));
                            }
                            return null;
                        }

                        private GD<xsl:value-of select="$layoutIndex" />SpecialAnimationTouchImageResources createSpecialAnimationTouchImageResources() {
                            try {
                                return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationTouchImageResources.getInstanceOrCreate();
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "GD<xsl:value-of select="$layoutIndex" />SpecialAnimationTouchImageResources", this, commonStrings.CONSTRUCTOR, e));
                            }
                            return null;
                        }

                        private GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources createSpecialAnimationGDResources() {
                            try {
                                return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources.getInstanceOrCreate();
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e));
                            }
                            return null;
                        }

                        public GDGlobalSpecialAnimationImageResources createGlobalSpecialAnimationImageResources() {
                            try {
                                return GDGlobalSpecialAnimationImageResources.getInstanceOrCreate();
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "GDGlobalSpecialAnimationImageResources", this, commonStrings.CONSTRUCTOR, e));
                            }
                            return null;
                        }

                        public GDGlobalsGDResources createGlobalsSpecialAnimationGDResources() {
                            try {
                                return GDGlobalsGDResources.getInstanceOrCreate();
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e));
                            }
                            return null;
                        }

                        public GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder() {

                            super(AnimationBehavior.getInstance());

                            <xsl:call-template name="scale" >
                                <xsl:with-param name="layoutIndex" >
                                    <xsl:value-of select="$layoutIndex" />
                                </xsl:with-param>
                                <xsl:with-param name="layoutName" >
                                    <xsl:value-of select="$layoutName" />
                                </xsl:with-param>
                            </xsl:call-template>
                            
                            LogUtil.put(LogFactory.getInstance(new StringMaker().append(commonStrings.START).append(":GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder scale: ").append(scale).toString(), this, commonStrings.CONSTRUCTOR));

                    <xsl:call-template name="findMousePositionNeeded" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                                                    
                            //eventsLogicConstructionMotionGestureEvent - START
                    <xsl:call-template name="eventsLogicConstructionMotionGestureEvent" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                    </xsl:call-template>
                            //eventsLogicConstructionMotionGestureEvent - END

                            GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalEventGDNodes externalEventNodes;
                            GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalActionGDNodes externalActionNodes;
                            GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalConditionGDNodes externalConditionNodes;
                            GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalOtherEventGDNodes externalOtherEventNodes;
                            GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalObjectEventGDNodes externalObjectEventNodes;
                            GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes actionNodes;
                            GD<xsl:value-of select="$layoutIndex" />SpecialAnimationConditionGDNodes conditionNodes;
                            GD<xsl:value-of select="$layoutIndex" />SpecialAnimationOtherEventGDNodes otherEventNodes;
                            GD<xsl:value-of select="$layoutIndex" />SpecialAnimationObjectEventGDNodes objectEventNodes;
                        
                            int size = gameGlobals.nodeArray.length;
                        <!--
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            final int currentIndex = index;
                            gameGlobals.nodeArray[index2][index] = new GDNode() {

                                @Override
                                public boolean process() throws Exception {
                                    super.processStats();
                                    LogUtil.put(LogFactory.getInstance(Integer.toString(currentIndex), this, commonStrings.PROCESS, new Exception()));

                                    return true;
                                }
                            };
                        }
                        -->

                        GDGlobalSpecialAnimationImageResources globalImageResources = this.createGlobalSpecialAnimationImageResources();
                        GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources imageResources = this.createSpecialAnimationImageResources();
                        GD<xsl:value-of select="$layoutIndex" />SpecialAnimationTouchImageResources touchImageResources = this.createSpecialAnimationTouchImageResources();

                    //GDNode processM calls in this class can load resources
                    GDGlobalsGDResources globalResources = this.createGlobalsSpecialAnimationGDResources();
                    GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources resources = this.createSpecialAnimationGDResources();

                    //GDNode - START
                    externalEventNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalEventGDNodes.getInstance();
                    externalActionNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalActionGDNodes.getInstance();
                    externalConditionNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalConditionGDNodes.getInstance();
                    externalOtherEventNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalOtherEventGDNodes.getInstance(); //GDNode processM calls in this class can load resources
                    externalObjectEventNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalObjectEventGDNodes.getInstance();
                    actionNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes.getInstance();
                    conditionNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationConditionGDNodes.getInstance(); //GDNode processM calls in this class can load resources
                    otherEventNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationOtherEventGDNodes.getInstance(); //GDNode processM calls in this class can load resources
                    objectEventNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationObjectEventGDNodes.getInstance();
                    //GDNode - END

                        try {

        <xsl:call-template name="globalCentreCameraActions" >
            <xsl:with-param name="baseLayer" >true</xsl:with-param>
        </xsl:call-template>
                    
        <xsl:call-template name="globalZoomCameraActions" >
            <xsl:with-param name="baseLayer" >true</xsl:with-param>
        </xsl:call-template>
        
        <xsl:variable name="hasCentreCamera" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera'" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
                
                    //instances create - START
                                        
                    <xsl:for-each select="instances" >
                        <xsl:variable name="nodeIdAsString" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                        <xsl:variable name="name" select="name" />
                        <xsl:variable name="colonName" >:<xsl:value-of select="name" /></xsl:variable>

                        //name=<xsl:value-of select="name" /> layer=<xsl:value-of select="layer" />
                                                
                        <xsl:if test="contains($exclusionObjectsAsString, $colonName)" >
                            //Skipping instance name=<xsl:value-of select="name" /> exclusionType=<xsl:value-of select="$exclusionObjectsAsString" />
                        </xsl:if>
                        <xsl:if test="not(contains($exclusionObjectsAsString, $colonName))" >
                            
                        <xsl:text>&#10;</xsl:text>
                        if(true) {
                            //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$name" />", this, commonStrings.CONSTRUCTOR));
                            <xsl:if test="contains(name, 'btn_')" >
                        //btn_ - found
                                <xsl:if test="height = 0 or width = 0 or not(height) or not(width)" >
                        //final int width = (int) (touchImageResources.<xsl:value-of select="name" />ImageArray[0].getWidth() / 1.44f);
                        //final int height = (int) (touchImageResources.<xsl:value-of select="name" />ImageArray[0].getHeight() / 1.44f);
                        final int width = (int) (touchImageResources.<xsl:value-of select="name" />ImageArray[0].getWidth() * scaleTouchButtons);
                        final int height = (int) (touchImageResources.<xsl:value-of select="name" />ImageArray[0].getHeight() * scaleTouchButtons);
                                </xsl:if>
                                <xsl:if test="height != 0 and width != 0" >
                        //final int width = (int) (<xsl:value-of select="width" /> * 1.44f);
                        //final int height = (int) (<xsl:value-of select="height" /> * 1.44f);
                        final int width = (int) (<xsl:value-of select="width" /> * scaleTouchButtons);
                        final int height = (int) (<xsl:value-of select="height" /> * scaleTouchButtons);
                                </xsl:if>
                        final float customScale = scaleTouchButtons;
                            </xsl:if>                            
                            <xsl:if test="not(contains(name, 'btn_'))" >
                        //btn_ - not
                                <xsl:if test="height = 0 or width = 0 or not(height) or not(width)" >
                        //final int width = (int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />Rectangle.getWidth() / 1.44f);
                        //final int height = (int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />Rectangle.getHeight() / 1.44f);
                        final int width = (int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />Rectangle.getWidth());
                        final int height = (int) (<xsl:call-template name="globalImageResource" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />Rectangle.getHeight());
                                </xsl:if>
                                <xsl:if test="height != 0 and width != 0" >
                        //final int width = (int) (<xsl:value-of select="width" /> * 1.44f);
                        //final int height = (int) (<xsl:value-of select="height" /> * 1.44f);
                        final int width = (int) (<xsl:value-of select="width" />);
                        final int height = (int) (<xsl:value-of select="height" />);
                                </xsl:if>
                        final float customScale = 1.0f;

                            </xsl:if>
                            
                        <xsl:if test="contains($hasCentreCamera, 'found')" >
                        final int <xsl:value-of select="name" />X = centerCameraX != 0 ? centerCameraX - width / 2 : (int) (<xsl:value-of select="x" /> * baseLayerScale);
                        final int <xsl:value-of select="name" />Y =
                            <xsl:if test="contains(name, 'btn_')" >
                                //btn_ - Hack - for android orientation change.
                                 (int) <xsl:if test="y = 506" >gameTickDisplayInfoSingleton.getLastHeight() - (touchImageResources.<xsl:value-of select="name" />ImageArray[0].getHeight() + (touchImageResources.<xsl:value-of select="name" />ImageArray[0].getHeight() / 100));</xsl:if>
                                <xsl:if test="y = 415" >gameTickDisplayInfoSingleton.getLastHeight() - (2 * (touchImageResources.<xsl:value-of select="name" />ImageArray[0].getHeight() + (touchImageResources.<xsl:value-of select="name" />ImageArray[0].getHeight() / 100)));</xsl:if>
                            </xsl:if>
                            <xsl:if test="not(contains(name, 'btn_'))" >
                                //btn_ - not 2
                                centerCameraX != 0 ? centerCameraY - height / 2 :  (int) (<xsl:value-of select="y" /> * baseLayerScale);
                            </xsl:if>
                        </xsl:if>

                        <xsl:if test="not(contains($hasCentreCamera, 'found'))" >
                        final int <xsl:value-of select="name" />X = (int) (<xsl:value-of select="x" /> * baseLayerScale);
                        final int <xsl:value-of select="name" />Y = (int) (<xsl:value-of select="y" /> * baseLayerScale);
                        </xsl:if>

                        if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.objectArray == arrayUtil.ZERO_OBJECT_ARRAY) {
                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.ensureCapacity(1);
                        }

                        //LayoutBuilder
                        <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /></xsl:variable>
                        final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="name" />GDobject2 = (<xsl:value-of select="$gdObjectFactory" />) <xsl:call-template name="objectFactoryFromProperty" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectFactory.get(
                        null, <xsl:value-of select="name" />X, 
                        <xsl:value-of select="name" />Y, 
                    //zOrder - <xsl:value-of select="zOrder" />
                    //layer=<xsl:value-of select="layer" /> (Base Layer is emtpy)
                            <xsl:if test="contains(layer, 'Below')" >
                    //Below - zOrder
                    <xsl:value-of select="zOrder" />,
                            </xsl:if>
                            <xsl:if test="contains(layer, 'touch')" >
                    //touch - zOrder
                    <xsl:value-of select="zOrder" />,
                            </xsl:if>
                            <xsl:if test="not(layer) or string-length(layer) = 0 or contains(layer, 'Base Layer')" >
                    //Base Layer - zOrder + 200
                    <xsl:value-of select="zOrder + 200" />,
                            </xsl:if>
                            <xsl:if test="contains(layer, 'Above')" >
                    //Above - zOrder + 400
                    <xsl:value-of select="zOrder + 400" />,
                            </xsl:if>
                            <xsl:if test="contains(layer, 'Overlay') or contains(text(), 'gui')" >
                    //Overlay - zOrder + 600
                    <xsl:value-of select="zOrder + 600" />,
                            </xsl:if>
                            <xsl:if test="contains(layer, 'Top')" >
                    //Top - zOrder + 800
                    <xsl:value-of select="zOrder + 800" />,
                            </xsl:if>
                        width, height,
                        <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME);
                        
                        <xsl:value-of select="name" />GDobject2.customScale = customScale;

                        final int index = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.size();

                        final StringMaker stringBuilder = new StringMaker();
                        //stringBuilder.delete(0, stringBuilder.length());
                                                
                        //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDObjectList.add(<xsl:value-of select="name" />GDobject2);

                            <xsl:if test="initialVariables" >
                            <xsl:value-of select="$name" />GDobject2.initialVariables = new GDInitialVariables() {
                                public void reset() {
                            <xsl:for-each select="initialVariables" >//initialVariables - //<xsl:value-of select="type" /> - //<xsl:value-of select="name" /> - //<xsl:value-of select="value" />
                            <xsl:text>&#10;</xsl:text>
<xsl:text>                  </xsl:text><xsl:value-of select="$name" />GDobject2.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            <xsl:text>&#10;</xsl:text>
                            </xsl:for-each>
                                }
                            };
                            <xsl:value-of select="$name" />GDobject2.initialVariables.reset();
                            </xsl:if>

                        <xsl:if test="contains(name, 'btn_')" >
                        //btn_ - //Rectangle
                        //Touch Rectangle
                        //final Rectangle <xsl:value-of select="name" />Rectangle = new Rectangle(
                        //    pointFactory.getInstance(<xsl:value-of select="name" />GDobject2.x, <xsl:value-of select="name" />GDobject2.y),
                        //    (int) (<xsl:value-of select="name" />GDobject2.Width(globals.graphics) * scaleTouchButtons), (int) (<xsl:value-of select="name" />GDobject2.Height(globals.graphics) * scaleTouchButtons));
                        //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />RectangleList.add(<xsl:value-of select="name" />Rectangle);
                        </xsl:if>
                                                
                        //Create - Instances - START
                        final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
                        final AllBinaryGameLayerManager allBinaryGameLayerManager = abToGBUtil.allBinaryGameLayerManager;
                        
                        final GDGameLayer <xsl:value-of select="name" />GDGameLayer = <xsl:call-template name="globalResource" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerFactory.create(<xsl:value-of select="$layoutIndex" />, stringBuilder.append(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME).append(CommonSeps.getInstance().UNDERSCORE).append(index).toString(), <xsl:value-of select="name" />GDobject2, 
                        scale, scale,     
                        null); //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDConditionWithGroupActions);
                        <xsl:value-of select="name" />GDGameLayer.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
                        LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$nodeIdAsString" /> for <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.add(<xsl:value-of select="name" />GDGameLayer); at: 0", this, commonStrings.PROCESS));
                        <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.add(<xsl:value-of select="name" />GDGameLayer);
                        globals.<xsl:value-of select="name" />GDInstanceGDGameLayerList.add(<xsl:value-of select="name" />GDGameLayer);

                        //updateGDObject - 7
                        <xsl:value-of select="name" />GDGameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta);
                        
                        <xsl:variable name="gameLayer" ><xsl:value-of select="name" />GDGameLayer</xsl:variable>
                        //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$gameLayer" />.gdObject.zOrder" + <xsl:value-of select="$gameLayer" />.gdObject.zOrder, this, commonStrings.PROCESS));
                        //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$gameLayer" />.getZ()" + <xsl:value-of select="$gameLayer" />.getZ(), this, commonStrings.PROCESS));
                        allBinaryGameLayerManager.insert(<xsl:value-of select="name" />GDGameLayer);
                        //Create - Instances - END
                        
                        <xsl:for-each select=".." >
                            <xsl:call-template name="globalUpdateCentreCameraActions" >
                                <xsl:with-param name="baseLayer" >true</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        
                        }
                        </xsl:if>
                    </xsl:for-each>
                    //instances create - END
                    
                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e));
                        }

                        this.build();
                        
                        LogUtil.put(LogFactory.getInstance(commonStrings.END, this, commonStrings.CONSTRUCTOR));
                    }

                    public void build() {
                    
                        try {
                            LogUtil.put(LogFactory.getInstance(commonStrings.START, this, commonStrings.PROCESS));

                            <xsl:call-template name="scale" >
                                <xsl:with-param name="layoutIndex" >
                                    <xsl:value-of select="$layoutIndex" />
                                </xsl:with-param>
                                <xsl:with-param name="layoutName" >
                                    <xsl:value-of select="$layoutName" />
                                </xsl:with-param>
                            </xsl:call-template>
                                                
                        final TempGameLayerUtil tempGameLayerUtil = TempGameLayerUtil.getInstance();

                    <xsl:for-each select="../externalEvents" >
                    <xsl:if test="$layoutName = associatedLayout" >
                    //externalEventsProcess - START
                        <xsl:call-template name="eventIdsLessRecursion" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="caller" >externalEventsProcess</xsl:with-param>
                        </xsl:call-template>
                    //externalEventsProcess - END
                    </xsl:if>
                    </xsl:for-each>

                    //eventsOnceConditionProcessActions - START
                    <xsl:call-template name="eventsOnceConditionProcessActions" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsOnceConditionProcessActions - END

                    //objects - all - //builder
                    <xsl:for-each select="objects" >
                        //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

                        <xsl:if test="type = 'Sprite' or type = 'ParticleSystem::ParticleEmitter'" >
                            <xsl:variable name="stringValue" select="string" />
                            <xsl:variable name="name" select="name" />
                            //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerFactory = <xsl:value-of select="name" />GDGameLayerFactory;
                        </xsl:if>
                    </xsl:for-each>

<!--
                    <xsl:call-template name="externalEventsCreateAssign" >
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                    <xsl:with-param name="conditionToProcess" >
                        <xsl:value-of select="''" />
                    </xsl:with-param>
                    <xsl:with-param name="actionToProcess" >
                        <xsl:value-of select="''" />
                    </xsl:with-param>
                    <xsl:with-param name="otherEventToProcess" >
                        <xsl:value-of select="''" />
                    </xsl:with-param>
                                            
                    </xsl:call-template>
-->

                    //eventsLogicConstructionCollisionNP - START
                    <xsl:call-template name="eventsLogicConstructionCollisionNP" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="exclusionObjectsAsString" >
                            <xsl:value-of select="$exclusionObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsLogicConstructionCollisionNP - END

                    <xsl:if test="$layoutIndex = 1" >
                    //GameAreaBoxUtil.getInstance().append();
                    </xsl:if>

                    //eventsKeyFromTextConditions - START                    
                    <xsl:call-template name="eventsKeyFromTextConditions" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsKeyFromTextConditions - END


                    <xsl:variable name="hasForm" ><xsl:for-each select="objects" ><xsl:if test="type = 'TextInput::TextInputObject' or type = 'PanelSpriteSlider::PanelSpriteSlider'" >found</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="contains($hasForm, 'found')" >
                    final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
                    final AllBinaryGameCanvas abCanvas = (AllBinaryGameCanvas) abToGBUtil.abCanvas;
                    abCanvas.setInputProcessor(abCanvas.getRawInputProcessor());
                    </xsl:if>

                    GameInputProcessorUtil.init(globals.inputProcessorArray);
                    GameInputProcessorUtil.init(globals.unmappedInputProcessorArray);

                        //allBinaryGameLayerManager.log();
                        //groupLayerManagerListener.log();
                        
                        LogUtil.put(LogFactory.getInstance("DepartScene - completed", this, commonStrings.PROCESS));
                        gameGlobalsFactory.newCanvas = false;
                        initialized = true;

                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e));
                        }
                    
                        LogUtil.put(LogFactory.getInstance(commonStrings.END, this, commonStrings.PROCESS));
                    }
                    
                    public int SceneWindowWidth() {
                        return gameTickDisplayInfoSingleton.getLastWidth();
                    }

                    public int SceneWindowHeight() {
                        return gameTickDisplayInfoSingleton.getLastHeight();
                    }

                    public double log2(final int value) {
                        return Math.log(value);
                    }

                    public int Random(final int range) {
                        return MyRandomFactory.getInstance().getAbsoluteNextInt(range + 1);
                    }

                    public int Variable(final int value) {
                        return value;
                    }

                    public double Variable(final double value) {
                        return value;
                    }
                    
                    public String GlobalVariable(final String value) {
                        return value;
                    }
                    
                    public long GlobalVariable(final long value) {
                        return value;
                    }

                    public int GlobalVariable(final int value) {
                        return value;
                    }
                    
                    public String ToString(final int value) {
                        //return Integer.toString(value);
                        return smallIntegerSingletonFactory.getString(value);
                    }

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

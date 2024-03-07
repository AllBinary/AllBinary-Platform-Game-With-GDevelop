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

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDNodeId.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObjectGDNodeCondition.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDExternalEvents.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassProperty.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassPropertyGDObjects.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAssign.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAtIndex.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyActions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyConditions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObject.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventWithOnceCondition.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventPaint.xsl" />
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventLogicConstruction.xsl" />
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
                <xsl:variable name="createdObjectsAsString" >,<xsl:call-template name="externalEventsCreateActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="externalEventActionModVarSceneAsString" >,<xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />
                //externalEventActionModVarSceneAsString=<xsl:value-of select="$externalEventActionModVarSceneAsString" />
                
                package org.allbinary.game.canvas;

                import javax.microedition.lcdui.Canvas;
                import javax.microedition.lcdui.Graphics;
                
                import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas;
                import org.allbinary.animation.AnimationBehavior;
                import org.allbinary.animation.special.SpecialAnimation;
                
                import org.allbinary.game.input.GDRGameInputProcessor;

                import org.allbinary.game.score.HighScore;
                import org.allbinary.game.score.HighScores;
                import org.allbinary.game.input.GameInputProcessor;
                import org.allbinary.game.input.InputFactory;
                import org.allbinary.game.input.event.GameKeyEvent;
                import org.allbinary.game.layer.GDGameLayer;
                import org.allbinary.game.layer.GDCustomGameLayer;
                import org.allbinary.game.layer.GDGameLayerFactory;
                import org.allbinary.game.layout.GDNode;
                import org.allbinary.game.layout.GDNodes;
                import org.allbinary.game.layout.GDNodeUtil;
                import org.allbinary.game.layer.special.TempGameLayerUtil;
                import org.allbinary.game.layout.BaseGDNodeStats;
                import org.allbinary.game.layout.GDNodeStatsFactory;
                import org.allbinary.game.layout.GDObject;
                import org.allbinary.game.layer.AllBinaryGameLayerManager;
                import org.allbinary.game.layer.CollidableCompositeLayer;
                import org.allbinary.game.layer.identification.GroupLayerManagerListener;
                import org.allbinary.game.layout.GDObjectStrings;
                import org.allbinary.game.rand.MyRandomFactory;
                import org.allbinary.graphics.DisplayUtil;
                import org.allbinary.graphics.GPoint;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
                import org.allbinary.graphics.displayable.screen.DisplayPointScalar;
                import org.allbinary.input.motion.gesture.MotionGestureInput;
                import org.allbinary.input.motion.gesture.TouchMotionGestureFactory;
                import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
                import org.allbinary.layer.AllBinaryLayerManager;
                import org.allbinary.logic.string.CommonStrings;
                import org.allbinary.logic.string.CommonSeps;
                import org.allbinary.logic.string.StringMaker;
                import org.allbinary.logic.string.StringUtil;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.input.motion.gesture.TouchMotionGestureFactory;
                import org.allbinary.math.RectangleCollisionUtil;
                import org.allbinary.thread.NullRunnable;
                import org.allbinary.time.GameTickTimeDelayHelperFactory;
                import org.allbinary.time.TimeDelayHelper;
                import org.allbinary.util.BasicArrayList;
                import org.allbinary.util.ArrayUtil;

                //LayoutCondition name=<xsl:value-of select="$layoutName" /> - GDNode processM calls in this class can load resources
                public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimationConditionGDNodes extends SpecialAnimation
                {

                    private static final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationConditionGDNodes instance = new GD<xsl:value-of select="$layoutIndex" />SpecialAnimationConditionGDNodes();

                        public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationConditionGDNodes getInstance()
                        {
                            return instance;
                        }

                        private final CommonStrings commonStrings = CommonStrings.getInstance();
                        private final ArrayUtil arrayUtil = ArrayUtil.getInstance();
                        private final StringUtil stringUtil = StringUtil.getInstance();
                        private final GroupLayerManagerListener groupLayerManagerListener = GroupLayerManagerListener.getInstance();
                        private final TouchMotionGestureFactory touchMotionGestureFactory = TouchMotionGestureFactory.getInstance();
                        private final RectangleCollisionUtil rectangleCollisionUtil = RectangleCollisionUtil.getInstance();
                        
                        private final GDNodes gdNodes = GDNodeUtil.getInstance().getInstance(<xsl:value-of select="$layoutIndex" />);

                        private final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
                        private final BaseGDNodeStats gdNodeStatsFactory = GDNodeStatsFactory.getInstance();
                        private final GameTickTimeDelayHelperFactory gameTickTimeDelayHelperFactory = GameTickTimeDelayHelperFactory.getInstance();
                        private final GameTickDisplayInfoSingleton gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();

                        private final String INDEX = "index: ";

                        private final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory gdObjectsFactory = GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources imageResources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources resources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources.getInstance();
                    private GD<xsl:value-of select="$layoutIndex" />SpecialAnimationConditionGDNodes() {

                        super(AnimationBehavior.getInstance());

                        try {
                        
                            LogUtil.put(LogFactory.getInstance(commonStrings.CONSTRUCTOR, this, commonStrings.CONSTRUCTOR));

                                    <xsl:call-template name="scale" >
                                        <xsl:with-param name="layoutIndex" >
                                            <xsl:value-of select="$layoutIndex" />
                                        </xsl:with-param>
                                        <xsl:with-param name="layoutName" >
                                            <xsl:value-of select="$layoutName" />
                                        </xsl:with-param>
                                    </xsl:call-template>
                                            
                    //conditionLayout - //eventsCreateAssignGDObject - START
                    <xsl:call-template name="eventsCreateAssignGDObjectGDNodesCondition" >
                        <xsl:with-param name="caller" >conditionLayout</xsl:with-param>
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="thisNodeIndex" >
                            <xsl:value-of select="-2" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>

                    </xsl:call-template>
                    //conditionLayout - //eventsCreateAssignGDObject - END

                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e));
                        }

                    }

                    public int SceneWindowWidth() {
                        return gameTickDisplayInfoSingleton.getLastWidth();
                    }

                    public int SceneWindowHeight() {
                        return gameTickDisplayInfoSingleton.getLastHeight();
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

                    public int VariableChildCount(final String[] array) {
                        return array.length;
                    }

                    public int VariableChildCount(final int[] array) {
                        return array.length;
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

                    public String GlobalVariableString(final String value) {
                        return value;
                    }

                    public int GlobalVariableChildCount(final String[] array) {
                        return array.length;
                    }

                    public int GlobalVariableChildCount(final int[] array) {
                        return array.length;
                    }

                    public int GlobalVariableChildCount(final long[] array) {
                        return array.length;
                    }

                    public int MouseX() {
                        final GDGlobalsFactory gdGlobalsFactory = GDGlobalsFactory.getInstance();
                        return gdGlobalsFactory.point.getX();
                    }

                    public int MouseY() {
                        final GDGlobalsFactory gdGlobalsFactory = GDGlobalsFactory.getInstance();
                        return gdGlobalsFactory.point.getY();
                    }

                    public int MouseX(final String string, int value) {
                        final GDGlobalsFactory gdGlobalsFactory = GDGlobalsFactory.getInstance();
                        return gdGlobalsFactory.point.getX();
                    }

                    public int MouseY(final String string, int value) {
                        final GDGlobalsFactory gdGlobalsFactory = GDGlobalsFactory.getInstance();
                        return gdGlobalsFactory.point.getY();
                    }

                    public int floor(final int value) {
                        return value;
                    }

                    public int LastTouchId() {
                        return 0;
                    }

                    public int LastEndedTouchId() {
                        return 0;
                    }

                    public String ToString(final int value) {
                        //this.primitiveLongUtil = new PrimitiveLongUtil(max + 1);
                        return Integer.toString(value);
                    }

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

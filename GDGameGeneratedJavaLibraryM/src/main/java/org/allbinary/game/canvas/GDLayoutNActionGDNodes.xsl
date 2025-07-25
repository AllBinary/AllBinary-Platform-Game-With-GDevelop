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
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionGDNodeAction.xsl" />
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

        <xsl:variable name="selectedNodeIds" ><GD_NODE_IDS></xsl:variable>

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
                
                package org.allbinary.game.canvas.node.action;
                
                import javax.microedition.lcdui.Canvas;
                import javax.microedition.lcdui.Graphics;
                import javax.microedition.lcdui.Image;

                import org.json.me.JSONObject;
                import org.json.me.JSONTokener;

                import org.allbinary.animation.AnimationBehavior;                
                import org.allbinary.animation.special.SpecialAnimation;
                import org.allbinary.canvas.GameGlobalsFactory;
                
                import org.allbinary.game.canvas.ABToGBUtil;
                import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory;
                import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources;
                import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals;
                import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources;
                import org.allbinary.game.canvas.GDGameGlobals;
                import org.allbinary.game.canvas.GDGameSoftwareInfo;
                import org.allbinary.game.canvas.GDGlobalsGDObjectsFactory;
                import org.allbinary.game.canvas.GDGlobalsGDResources;
                
                import org.allbinary.game.commands.GameCommandsFactory;
                import org.allbinary.game.GDGameCommandFactory;
                import org.allbinary.game.GameInfo;
                import org.allbinary.game.configuration.persistance.JSONPersistance;
                import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas;
                import org.allbinary.game.input.GameInputProcessor;
                import org.allbinary.game.input.InputFactory;
                import org.allbinary.game.input.event.GameKeyEvent;
                import org.allbinary.game.layer.GDGameLayer;                
                import org.allbinary.game.layout.GDNode;
                import org.allbinary.game.layer.special.TempGameLayerUtil;
                import org.allbinary.game.layout.GDObject;
                import org.allbinary.game.layer.AllBinaryGameLayerManager;
                import org.allbinary.game.layout.GDObjectFactory;
                import org.allbinary.game.layer.GDGameLayerFactory;
                import org.allbinary.game.layer.identification.GroupLayerManagerListener;
                import org.allbinary.game.layer.special.GDConditionWithGroupActions;
                import org.allbinary.game.layer.GDPrimitiveDrawing;
                import org.allbinary.game.layer.GDRectOnlyPrimitiveDrawing;
                import org.allbinary.game.layer.GDPrimitiveDrawingAnimationFactory;
                import org.allbinary.game.layer.GDRectOnlyPrimitiveDrawingAnimationFactory;
                import org.allbinary.game.physics.velocity.DragVelocityBehavior;
                import org.allbinary.game.physics.velocity.NoDragVelocityBehavior;
                import org.allbinary.game.rand.MyRandomFactory;
                import org.allbinary.game.score.BasicHighScoresFactory;
                import org.allbinary.game.score.HighScore;
                import org.allbinary.game.score.HighScoreNamePersistanceSingleton;
                import org.allbinary.game.score.HighScores;
                import org.allbinary.game.score.HighScoresHelperBase;
                import org.allbinary.game.score.HighScoresResultsListener;
                import org.allbinary.game.score.displayable.HighScoreUtil;
                import org.allbinary.graphics.PointFactory;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
                import org.allbinary.graphics.color.BasicColor;
                import org.allbinary.graphics.color.SmallBasicColorCacheFactory;
                import org.allbinary.graphics.color.BasicColorUtil;
                import org.allbinary.graphics.displayable.MyCanvas;
                import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
                import org.allbinary.graphics.displayable.command.MyCommandsFactory;
                import org.allbinary.input.event.VirtualKeyboardEventHandler;
                import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
                import org.allbinary.layer.AllBinaryLayerManager;
                import org.allbinary.string.CommonStrings;
                import org.allbinary.logic.string.StringMaker;
                import org.allbinary.string.CommonSeps;
                import org.allbinary.logic.string.StringUtil;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
                import org.allbinary.media.audio.Sound;
                import org.allbinary.math.NoDecimalTrigTable;
                import org.allbinary.string.CommonPhoneStrings;
                import org.allbinary.time.GameTickTimeDelayHelper;
                import org.allbinary.time.GameTickTimeDelayHelperFactory;
                import org.allbinary.time.TimeDelayHelper;
                import org.allbinary.logic.NullUtil;
                import org.allbinary.util.ArrayUtil;
                import org.allbinary.util.BasicArrayList;
                import org.allbinary.media.audio.PlayerComposite;
                import org.allbinary.thread.SecondaryThreadPool;
                import org.allbinary.game.layer.behavior.GDBehaviorUtil;
                import org.allbinary.game.layer.behavior.PathFindingBehavior;
                import org.allbinary.thread.PathFindingThreadPool;
                import org.allbinary.logic.math.SmallIntegerSingletonFactory;
                import org.allbinary.game.layout.GDStrings;
                
                <xsl:variable name="selectedNodeIdSet" select="substring(substring($selectedNodeIds, string-length($selectedNodeIds) - 1), 1, 1)" />
                <xsl:variable name="lastDigit2" ><xsl:if test="4 >= $selectedNodeIdSet" >0</xsl:if><xsl:if test="$selectedNodeIdSet > 4" >1</xsl:if></xsl:variable>
                //selectedNodeIdSet=<xsl:value-of select="$selectedNodeIdSet" />
                //LayoutAction name=<xsl:value-of select="$layoutName" />
                public class GD<xsl:value-of select="$layoutIndex" />Action<xsl:value-of select="$lastDigit2" />GDNodes
                {

                    private static final GD<xsl:value-of select="$layoutIndex" />Action<xsl:value-of select="$lastDigit2" />GDNodes instance = 
                        new GD<xsl:value-of select="$layoutIndex" />Action<xsl:value-of select="$lastDigit2" />GDNodes();

                        public static GD<xsl:value-of select="$layoutIndex" />Action<xsl:value-of select="$lastDigit2" />GDNodes getInstance()
                        {
                            return instance;
                        }

                        protected final LogUtil logUtil = LogUtil.getInstance();
                        private final CommonStrings commonStrings = CommonStrings.getInstance();
                        private final NullUtil nullUtil = NullUtil.getInstance();
                        private final ArrayUtil arrayUtil = ArrayUtil.getInstance();
                        private final PointFactory pointFactory = PointFactory.getInstance();
                        private final StringUtil stringUtil = StringUtil.getInstance();
                        private final BasicColorUtil basicColorUtil = BasicColorUtil.getInstance();
                        private final VirtualKeyboardEventHandler virtualKeyboardEventHandler = VirtualKeyboardEventHandler.getInstance();
                        private final SmallBasicColorCacheFactory smallBasicColorCacheFactory = SmallBasicColorCacheFactory.getInstance();
                        private final GameTickTimeDelayHelper gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance();
                        private final GameTickDisplayInfoSingleton gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();
                        private final SmallIntegerSingletonFactory smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
                        private final GameGlobalsFactory gameGlobalsFactory = GameGlobalsFactory.getInstance();
                        private final GDStrings gdStrings = GDStrings.getInstance();
                        
                        private final GDBehaviorUtil gdBehaviorUtil = GDBehaviorUtil.getInstance();
                        private final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
                        private final GDGlobalsGDResources globalResources = GDGlobalsGDResources.getInstance();
                        private final GDGlobalsGDObjectsFactory gdGlobalsObjectsFactory = GDGlobalsGDObjectsFactory.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory gdObjectsFactory = GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources imageResources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources resources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources.getInstance();

                        private final AbeClientInformationInterface abeClientInformation = GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION;
                    
                        //private final GDGlobalSpecialAnimationImageResources globalImageResources = GDGlobalSpecialAnimationImageResources.getInstanceOrCreate();
                                                                
        <xsl:call-template name="scaleProperty" >
            <xsl:with-param name="layoutIndex" >
                <xsl:value-of select="$layoutIndex" />
            </xsl:with-param>
            <xsl:with-param name="layoutName" >
                <xsl:value-of select="$layoutName" />
            </xsl:with-param>
        </xsl:call-template>
                                                
                    //actionLayout - //eventsCreateAssignGDObjectGDNodesAction - START
                    <xsl:call-template name="actionGDNodes" >
                        <xsl:with-param name="caller" >actionLayout</xsl:with-param>
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="selectedNodeIds" >
                            <xsl:value-of select="$selectedNodeIds" />
                        </xsl:with-param>
                        <xsl:with-param name="thisNodeIndex" >
                            <xsl:value-of select="-1" />
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
                    //actionLayout - //eventsCreateAssignGDObjectGDNodesAction - END                    

                    public double TimeDelta() {
                        return globals.globalsGameTickTimeDelayHelper.timeDelta * .001;
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

                    public float RandomFloatInRange(final double min, final double max) {
                        final double next = (max - min);
                        //logUtil.put("NEXT: " + next, this, commonStrings.PROCESS);
                        final float nextF = (float) next * 1000;
                        //logUtil.put("NEXTF: " + nextF, this, commonStrings.PROCESS);
                        final int nextI = Math.round(nextF);
                        //logUtil.put("NEXTI: " + nextI, this, commonStrings.PROCESS);
                        final int random = MyRandomFactory.getInstance().getAbsoluteNextInt(nextI);
                        //logUtil.put("RANDOM: " + random, this, commonStrings.PROCESS);
                        final float randomF = (float) random;
                        //logUtil.put("RANDOMF: " + randomF, this, commonStrings.PROCESS);
                        final float result = (float) min + (randomF / 1000);
                        //logUtil.put("RESULT: " + result, this, commonStrings.PROCESS);
                        return result;
                    }
                    
                    public float RandomFloatInRange(final float min, final float max) {
                        final float nextF = (float) (max - min) * 1000;
                        //logUtil.put("NEXTF: " + nextF, this, commonStrings.PROCESS);
                        final int nextI = Math.round(nextF);
                        //logUtil.put("NEXTI: " + nextI, this, commonStrings.PROCESS);
                        final int random = MyRandomFactory.getInstance().getAbsoluteNextInt(nextI);
                        //logUtil.put("RANDOM: " + random, this, commonStrings.PROCESS);
                        final float randomF = (float) random;
                        //logUtil.put("RANDOMF: " + randomF, this, commonStrings.PROCESS);
                        final float result = (float) min + (randomF / 1000);
                        //logUtil.put("RESULT: " + result, this, commonStrings.PROCESS);
                        return result;
                    }

                    public int Variable(final int value) {
                        return value;
                    }

                    public double Variable(final double value) {
                        return value;
                    }

                    public String VariableString(final String string) {
                        return string;
                    }

                    public String VariableString(final Object object) {
                        return object.toString();
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

                    public String GlobalVarToJSON(final String value) {
                        return value;
                    }

                    public String GlobalVarToJSON(final int value) {
                        return Integer.toString(value);
                    }

                    public String GlobalVarToJSON(final long value) {
                        return Long.toString(value);
                    }
                                        
                    public int SceneInstancesCount(final int size) {
                        return size;
                    }

                    public int MouseX() {
                        
                        return gameGlobalsFactory.point.getX();
                    }

                    public int MouseY() {
                        
                        return gameGlobalsFactory.point.getY();
                    }

                    public int MouseX(final String string, int value) {
                        
                        return gameGlobalsFactory.point.getX();
                    }

                    public int MouseY(final String string, int value) {
                        
                        return gameGlobalsFactory.point.getY();
                    }
                    
                    public long TimerElapsedTime(final TimeDelayHelper timeDelayHelper) {
                        return timeDelayHelper.getElapsed(globals.globalsGameTickTimeDelayHelper.lastStartTime) / 1000;
                    }

                    public int floor(final int value) {
                        return value;
                    }
                                        
                    public long round(final long value) {
                        return value;
                    }
                    
                    public long abs(final long value) {
                        return Math.abs(value);
                    }

                    public double log2(final int value) {
                        return Math.log(value);
                    }

                    public double sin(final double angle) {
                        return Math.sin(angle);
                    }

                    public double cos(final double angle) {
                        return Math.cos(angle);
                    }
                    
                    public double ToRad(final double angdeg) {
                        //return Math.toRadians(angdeg);
                        return angdeg;
                    }
                    
                    public long TimeFromStart() {
                        return globals.globalsGameTickTimeDelayHelper.getTimeFromStart() / 100;
                    }

                    public String NewLine() {
                        return CommonSeps.getInstance().NEW_LINE;
                    }

                    public int LastTouchId() {
                        return 0;
                    }

                    public int LastEndedTouchId() {
                        return 0;
                    }

                    public int TouchX(final int touchId, final String name, final int unknown) {
                        return 0;
                    }

                    public int TouchY(final int touchId, final String name, final int unknown) {
                        return 0;
                    }

                    public String ToString(final String value) {
                        return value;
                    }

                    public String ToString(final int value) {
                        //return Integer.toString(value);
                        return smallIntegerSingletonFactory.getString(value);
                    }

                    public String ToString(final long value) {
                        //this.primitiveLongUtil = new PrimitiveLongUtil(max + 1);
                        return Long.toString(value);
                    }

                    public int ToNotString(final int value) {
                        return value;
                    }

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

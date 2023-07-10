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
        
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDAction.xsl" />
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDNodeId.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObjectGDNodeAction.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDExternalEvents.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassProperty.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassPropertyGDObjects.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAssign.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAnimations.xsl" />
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
        <xsl:variable name="windowWidth" select="properties/windowWidth" />

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

                import javax.microedition.lcdui.Canvas;
                import javax.microedition.lcdui.Graphics;

                import org.json.me.JSONObject;
                import org.json.me.JSONTokener;
                
                import org.allbinary.animation.special.SpecialAnimation;
                import org.allbinary.game.commands.GameCommandsFactory;
                import org.allbinary.game.GDGameCommandFactory;
                import org.allbinary.game.input.GameInputProcessor;
                import org.allbinary.game.input.InputFactory;
                import org.allbinary.game.input.event.GameKeyEvent;
                import org.allbinary.game.layer.GDGameLayer;
                import org.allbinary.game.layout.GDNode;
                import org.allbinary.graphics.displayable.DisplayInfoSingleton;
                import org.allbinary.game.layout.GDObject;
                import org.allbinary.game.layer.AllBinaryGameLayerManager;
                import org.allbinary.game.layer.identification.GroupLayerManagerListener;
                import org.allbinary.game.rand.MyRandomFactory;
                import org.allbinary.graphics.color.BasicColor;
                import org.allbinary.graphics.PointFactory;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
                import org.allbinary.graphics.displayable.MyCanvas;
                import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
                import org.allbinary.layer.AllBinaryLayerManager;
                import org.allbinary.logic.basic.string.CommonStrings;
                import org.allbinary.logic.basic.string.StringMaker;
                import org.allbinary.logic.basic.string.CommonSeps;
                import org.allbinary.logic.basic.string.StringUtil;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.media.audio.Sound;
                import org.allbinary.util.BasicArrayList;
                import org.allbinary.math.NoDecimalTrigTable;
                import org.allbinary.time.TimeDelayHelper;
                import org.allbinary.util.ArrayUtil;
                
                //LayoutAction name=<xsl:value-of select="$layoutName" />
                public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes extends SpecialAnimation
                {

                    private static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes instance;

                    public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes getInstance(final MyCanvas canvas, final AllBinaryGameLayerManager allBinaryGameLayerManager)
                    {
                        instance = new GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes(canvas, allBinaryGameLayerManager);
                        return instance;
                    }

                        public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes getInstance()
                        {
                            return instance;
                        }

                        private final CommonStrings commonStrings = CommonStrings.getInstance();                        
                        private final ArrayUtil arrayUtil = ArrayUtil.getInstance();
                        private final StringUtil stringUtil = StringUtil.getInstance();

                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory gdObjectsFactory = GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources imageResources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources resources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources.getInstance();

                        private final MyCanvas canvas;
                        
                    public GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes(final MyCanvas canvas, final AllBinaryGameLayerManager allBinaryGameLayerManager) {

                        this.canvas = canvas;

                        try {
                        
                            LogUtil.put(LogFactory.getInstance(commonStrings.CONSTRUCTOR, this, commonStrings.CONSTRUCTOR));

                    //actionLayout - //eventsCreateAssignGDObjectGDNodesAction - START
                    <xsl:call-template name="eventsCreateAssignGDObjectGDNodesAction" >
                        <xsl:with-param name="caller" >actionLayout</xsl:with-param>
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
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
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>

                    </xsl:call-template>
                    //actionLayout - //eventsCreateAssignGDObjectGDNodesAction - END                    
                    

                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e));
                        }

                    }

                    public double TimeDelta() {
                        return globals.timeDelta * .001;
                    }

                    public int SceneWindowWidth() {
                        return DisplayInfoSingleton.getInstance().getLastWidth();
                    }

                    public int SceneWindowHeight() {
                        return DisplayInfoSingleton.getInstance().getLastHeight();
                    }

                    public int Random(final int range) {
                        return MyRandomFactory.getInstance().getAbsoluteNextInt(range + 1);
                    }

                    public float RandomFloatInRange(final double min, final double max) {
                        final double next = (max - min);
                        //LogUtil.put(LogFactory.getInstance("NEXT: " + next, this, commonStrings.PROCESS));
                        final float nextF = (float) next * 1000;
                        //LogUtil.put(LogFactory.getInstance("NEXTF: " + nextF, this, commonStrings.PROCESS));
                        final int nextI = Math.round(nextF);
                        //LogUtil.put(LogFactory.getInstance("NEXTI: " + nextI, this, commonStrings.PROCESS));
                        final int random = MyRandomFactory.getInstance().getAbsoluteNextInt(nextI);
                        //LogUtil.put(LogFactory.getInstance("RANDOM: " + random, this, commonStrings.PROCESS));
                        final float randomF = (float) random;
                        //LogUtil.put(LogFactory.getInstance("RANDOMF: " + randomF, this, commonStrings.PROCESS));
                        final float result = (float) min + (randomF / 1000);
                        //LogUtil.put(LogFactory.getInstance("RESULT: " + result, this, commonStrings.PROCESS));
                        return result;
                    }
                    
                    public float RandomFloatInRange(final float min, final float max) {
                        final float nextF = (float) (max - min) * 1000;
                        //LogUtil.put(LogFactory.getInstance("NEXTF: " + nextF, this, commonStrings.PROCESS));
                        final int nextI = Math.round(nextF);
                        //LogUtil.put(LogFactory.getInstance("NEXTI: " + nextI, this, commonStrings.PROCESS));
                        final int random = MyRandomFactory.getInstance().getAbsoluteNextInt(nextI);
                        //LogUtil.put(LogFactory.getInstance("RANDOM: " + random, this, commonStrings.PROCESS));
                        final float randomF = (float) random;
                        //LogUtil.put(LogFactory.getInstance("RANDOMF: " + randomF, this, commonStrings.PROCESS));
                        final float result = (float) min + (randomF / 1000);
                        //LogUtil.put(LogFactory.getInstance("RESULT: " + result, this, commonStrings.PROCESS));
                        return result;
                    }

                    public int Variable(final int value) {
                        return value;
                    }

                    public double Variable(final double value) {
                        return value;
                    }

                    public int GlobalVariable(final int value) {
                        return value;
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
                    
                    public long TimerElapsedTime(final TimeDelayHelper timeDelayHelper) {
                        return timeDelayHelper.getElapsed(globals.lastStartTime) / 1000;
                    }
                    
                    public long round(final long value) {
                        return value;
                    }
                    
                    public long abs(final long value) {
                        return Math.abs(value);
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
                        return (globals.startTime - globals.lastStartTime) / 100;
                    }

                    public String NewLine() {
                        return CommonSeps.getInstance().NEW_LINE;
                    }

                    public String VariableString(final Object object) {
                        return object.toString();
                    }
                    
                    public String ToString(final int value) {
                        //this.primitiveLongUtil = new PrimitiveLongUtil(max + 1);
                        return Integer.toString(value);
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

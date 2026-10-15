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

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDNodeIdKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObjectGDNodeActionKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDExternalEventsKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassPropertyKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassPropertyGDObjectsKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAssignKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAtIndexKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyActionsKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyConditionsKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObjectKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventWithOnceConditionKt.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventLogicConstructionKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventProcessKt.xsl" />

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

                package org.allbinary.game.canvas

                import javax.microedition.lcdui.Canvas
                import javax.microedition.lcdui.Graphics
                import javax.microedition.lcdui.Image

                import org.json.me.JSONArray
                import org.json.me.JSONObject
                import org.json.me.JSONTokener

                import org.allbinary.AndroidUtil
                import org.allbinary.J2MEUtil
                import org.allbinary.animation.AnimationBehavior
                import org.allbinary.animation.special.SpecialAnimation
                import org.allbinary.canvas.GameGlobalsFactory
                import org.allbinary.game.commands.GameCommandsFactory
                import org.allbinary.game.GDGameCommandFactory
                import org.allbinary.game.GameInfo
                import org.allbinary.game.canvas.GDExtensionGDNodes
                import org.allbinary.game.configuration.persistance.GDStructure
                import org.allbinary.game.configuration.persistance.JSONPersistance
                import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
                import org.allbinary.game.input.GameInputProcessor
                import org.allbinary.game.input.InputFactory
                import org.allbinary.game.input.event.GameKeyEvent
                import org.allbinary.game.layer.GDGameLayer
                import org.allbinary.game.layout.GDNode
                import org.allbinary.game.layer.special.TempGameLayerUtil
                import org.allbinary.game.layout.GDObject
                import org.allbinary.game.layer.AllBinaryGameLayerManager
                import org.allbinary.game.layout.GDObjectFactory
                import org.allbinary.game.layer.GDGameLayerFactory
                import org.allbinary.game.layer.identification.GroupLayerManagerListener
                import org.allbinary.game.layer.special.GDConditionWithGroupActions
                import org.allbinary.game.layer.GDPrimitiveDrawing
                import org.allbinary.game.layer.GDRectOnlyPrimitiveDrawing
                import org.allbinary.game.layer.GDPrimitiveDrawingLinesOnly
                import org.allbinary.game.layer.GDPrimitiveDrawingLinesOnlyAnimationFactory
                import org.allbinary.game.layer.GDPrimitiveDrawingAnimationFactory
                import org.allbinary.game.layer.GDRectOnlyPrimitiveDrawingAnimationFactory
                import org.allbinary.game.physics.velocity.DragVelocityBehavior
                import org.allbinary.game.physics.velocity.NoDragVelocityBehavior
                import org.allbinary.game.rand.MyRandomFactory
                import org.allbinary.game.score.BasicHighScoresFactory
                import org.allbinary.game.score.HighScore
                import org.allbinary.game.score.HighScoreNamePersistanceSingleton
                import org.allbinary.game.score.HighScores
                import org.allbinary.game.score.HighScoresHelperBase
                import org.allbinary.game.score.HighScoresResultsListener
                import org.allbinary.game.score.displayable.HighScoreUtil
                import org.allbinary.graphics.PointFactory
                import org.allbinary.graphics.Rectangle
                import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
                import org.allbinary.graphics.color.BasicColor
                import org.allbinary.graphics.color.SmallBasicColorCacheFactory
                import org.allbinary.graphics.color.BasicColorUtil
                import org.allbinary.graphics.displayable.MyCanvas
                import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton
                import org.allbinary.graphics.displayable.command.MyCommandsFactory
                import org.allbinary.input.event.VirtualKeyboardEventHandler
                import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
                import org.allbinary.layer.AllBinaryLayerManager
                import org.allbinary.string.CommonStrings
                import org.allbinary.logic.string.StringMaker
                import org.allbinary.string.CommonSeps
                import org.allbinary.logic.string.StringUtil
                import org.allbinary.logic.communication.log.LogUtil
                import org.allbinary.logic.io.file.FileSystem
                import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
                import org.allbinary.media.audio.Sound
                import org.allbinary.math.NoDecimalTrigTable
                import org.allbinary.time.GameTickTimeDelayHelper
                import org.allbinary.time.GameTickTimeDelayHelperFactory
                import org.allbinary.time.TimeDelayHelper
                import org.allbinary.util.ArrayUtil
                import org.allbinary.util.BasicArrayList
                import org.allbinary.util.BasicArrayListD
                import org.allbinary.media.audio.PlayerComposite
                import org.allbinary.thread.SecondaryThreadPool
                import org.allbinary.game.layer.behavior.GDBehaviorUtil
                import org.allbinary.game.layer.behavior.PathFindingBehavior
                import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
                import org.allbinary.thread.PathFindingThreadPool
                import org.allbinary.logic.math.SmallIntegerSingletonFactory

                //LayoutAction name=<xsl:value-of select="$layoutName" />
                open public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes : SpecialAnimation
                {

                    private val instance: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes =
                        GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes()

                        open public fun getInstance(): GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes {
                            return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes.instance
                        }

                        private val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
                        private val gdExtensionGDNodes: GDExtensionGDNodes = GDExtensionGDNodes.getInstance()

                        //private val gd<xsl:value-of select="$layoutIndex" />ActionGDNodes: GD<xsl:value-of select="$layoutIndex" />ActionGDNodes = GD<xsl:value-of select="$layoutIndex" />ActionGDNodes.getInstance()

                        private val abeClientInformation: AbeClientInformationInterface = GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION as AbeClientInformationInterface

                    private constructor() : super(AnimationBehavior.getInstance()) {

                        try {

                            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR)

                                    <xsl:call-template name="scale" >
                                        <xsl:with-param name="layoutIndex" >
                                            <xsl:value-of select="$layoutIndex" />
                                        </xsl:with-param>
                                        <xsl:with-param name="layoutName" >
                                            <xsl:value-of select="$layoutName" />
                                        </xsl:with-param>
                                    </xsl:call-template>

                            val globalImageResources: GDGlobalSpecialAnimationImageResources = GDGlobalSpecialAnimationImageResources.getInstanceOrCreate()

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
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>

                    </xsl:call-template>
                    //actionLayout - //eventsCreateAssignGDObjectGDNodesAction - END

                            this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.CONSTRUCTOR)

                        } catch (e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e)
                        }

                    }

<!--                    open fun TimeDelta(): Double {
                        return globals.globalsGameTickTimeDelayHelper.timeDelta * .001
                    }

                    open fun SceneWindowWidth(): Int {
                        return gameTickDisplayInfoSingleton.getLastWidth()
                    }

                    open fun SceneWindowHeight(): Int {
                        return gameTickDisplayInfoSingleton.getLastHeight()
                    }


                    open fun Random(range: Int): Int {
                        return MyRandomFactory.getInstance().getAbsoluteNextInt(range + 1)
                    }

                    open fun RandomFloatInRange(min: Double, max: Double): Float {
                        var next: Double = (max - min)
                        //this.logUtil.putF("NEXT: " + next, this, this.commonStrings.PROCESS)
                        var nextF: Float = next.toFloat() * 1000
                        //this.logUtil.putF("NEXTF: " + nextF, this, this.commonStrings.PROCESS)
                        var nextI: Int = Math.round(nextF)
                        //this.logUtil.putF("NEXTI: " + nextI, this, this.commonStrings.PROCESS)
                        var random: Int = MyRandomFactory.getInstance().getAbsoluteNextInt(nextI)
                        //this.logUtil.putF("RANDOM: " + random, this, this.commonStrings.PROCESS)
                        var randomF: Float = random.toFloat()
                        //this.logUtil.putF("RANDOMF: " + randomF, this, this.commonStrings.PROCESS)
                        var result: Float = min.toFloat() + (randomF / 1000)
                        //this.logUtil.putF("RESULT: " + result, this, this.commonStrings.PROCESS)
                        return result
                    }

                    open fun RandomFloatInRange(min: Float, max: Float): Float {
                        var nextF: Float = (max - min).toFloat() * 1000
                        //this.logUtil.putF("NEXTF: " + nextF, this, this.commonStrings.PROCESS)
                        var nextI: Int = Math.round(nextF)
                        //this.logUtil.putF("NEXTI: " + nextI, this, this.commonStrings.PROCESS)
                        var random: Int = MyRandomFactory.getInstance().getAbsoluteNextInt(nextI)
                        //this.logUtil.putF("RANDOM: " + random, this, this.commonStrings.PROCESS)
                        var randomF: Float = random.toFloat()
                        //this.logUtil.putF("RANDOMF: " + randomF, this, this.commonStrings.PROCESS)
                        var result: Float = min.toFloat() + (randomF / 1000)
                        //this.logUtil.putF("RESULT: " + result, this, this.commonStrings.PROCESS)
                        return result
                    }

                    open fun Variable(value: Int): Int {
                        return value
                    }

                    open fun Variable(value: Float): Float {
                        return value
                    }

                    open fun Variable(value: Double): Double {
                        return value
                    }

                    open fun VariableString(string: String): String {
                        return string
                    }

                    open fun VariableString(`object`: Object): String {
                        return `object`.toString()
                    }

                    open fun VariableChildCount(array: Array&lt;String?&gt;): Int {
                        return array.size
                    }

                    open fun VariableChildCount(array: IntArray): Int {
                        return array.size
                    }

                    open fun GlobalVariable(value: String): String {
                        return value
                    }

                    open fun GlobalVariable(value: Float): Float {
                        return value
                    }

                    open fun GlobalVariable(value: Long): Long {
                        return value
                    }

                    open fun GlobalVariable(value: Int): Int {
                        return value
                    }

                    open fun GlobalVariableString(value: String): String {
                        return value
                    }

                    open fun GlobalVariableChildCount(array: Array&lt;String?&gt;): Int {
                        return array.size
                    }

                    open fun GlobalVariableChildCount(array: IntArray): Int {
                        return array.size
                    }

                    open fun GlobalVariableChildCount(array: LongArray): Int {
                        return array.size
                    }

                    open fun GlobalVarToJSON(value: String): String {
                        return value
                    }

                    open fun GlobalVarToJSON(value: Int): String {
                        return value.toString()
                    }

                    open fun GlobalVarToJSON(value: Long): String {
                        return (value).toString()
                    }

                    open fun ToJSONType(value: GDStructure): Int {
                        return value.getJSONType()
                    }

                    open fun ToJSON(value: GDStructure): String {
                        return value.toJSONAsString()
                    }

                    open fun ToJSON(value: String): String {
                        return value
                    }

                    open fun ToJSON(value: Int): String {
                        return value.toString()
                    }

                    open fun ToJSON(value: Long): String {
                        return (value).toString()
                    }

                    open fun SceneInstancesCount(size: Int): Int {
                        return size
                    }

                    open fun MouseX(): Int {

                        return gameGlobalsFactory.point.getX()
                    }

                    open fun MouseY(): Int {

                        return gameGlobalsFactory.point.getY()
                    }

                    open fun MouseX(string: String, value: Int): Int {
                        var value = value

                        return gameGlobalsFactory.point.getX()
                    }

                    open fun MouseY(string: String, value: Int): Int {
                        var value = value

                        return gameGlobalsFactory.point.getY()
                    }

                    open fun TimerElapsedTime(timeDelayHelper: TimeDelayHelper): Long {
                        return timeDelayHelper.getElapsed(globals.globalsGameTickTimeDelayHelper.lastStartTime) / 1000
                    }

                    open fun floor(value: Int): Int {
                        return value
                    }

                    open fun floor(value: Float): Float {
                        return Math.floor(value.toDouble()).toFloat()
                    }

                    open fun mod(value: Int, mod: Int): Int {
                        return value % mod
                    }

                    open fun round(value: Int): Int {
                        return value
                    }

                    open fun round(value: Long): Long {
                        return value
                    }

                    open fun round(value: Float): Float {
                        return Math.round(value)
                    }

                    open fun abs(value: Int): Int {
                        return Math.abs(value)
                    }

                    open fun abs(value: Float): Float {
                        return Math.abs(value)
                    }

                    open fun log2(value: Int): Double {
                        return Math.log(value)
                    }

                    open fun sin(angle: Double): Double {
                        return Math.sin(angle)
                    }

                    open fun cos(angle: Double): Double {
                        return Math.cos(angle)
                    }

                    open fun min(min: Int, max: Int): Int {
                        return Math.min(min, max)
                    }

                    open fun max(min: Int, max: Int): Int {
                        return Math.max(min, max)
                    }

                    open fun ceil(value: Double): Int {
                        return Math.ceil(value).toInt()
                    }

                    open fun ToRad(angdeg: Double): Double {
                        //return Math.toRadians(angdeg)
                        return angdeg
                    }

                    open fun TimeFromStart(): Long {
                        return globals.globalsGameTickTimeDelayHelper.getTimeFromStart() / 100
                    }

                    open fun NewLine(): String {
                        return CommonSeps.getInstance().NEW_LINE
                    }

                    open fun LastTouchId(): Int {
                        return 0
                    }

                    open fun LastEndedTouchId(): Int {
                        return 0
                    }

                    open fun TouchX(touchId: Int, name: String, unknown: Int): Int {
                        return 0
                    }

                    open fun TouchY(touchId: Int, name: String, unknown: Int): Int {
                        return 0
                    }

                    open fun ToString(value: String): String {
                        return value
                    }

                    open fun ToString(value: Int): String {
                        if(this.abs(value) <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 499) {
                            return value.toString()
                        } else {
                            return smallIntegerSingletonFactory.getString(value)
                        }
                    }

                    open fun ToString(value: Long): String {
                        //this.primitiveLongUtil = PrimitiveLongUtil(max + 1)
                        return (value).toString()
                    }

                    open fun ToNotString(value: Int): Int {
                        return value
                    }-->

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

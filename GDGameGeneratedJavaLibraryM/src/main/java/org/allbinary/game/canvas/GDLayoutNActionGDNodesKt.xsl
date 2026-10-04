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

                package org.allbinary.game.canvas.node.action

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
                import org.allbinary.game.canvas.ABToGBUtil
                import org.allbinary.game.canvas.GDExtensionGDNodes
                import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />LayoutUtil
                import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory
                import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources
                import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals
                import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources
                import org.allbinary.game.canvas.GDGameGlobals
                import org.allbinary.game.canvas.GDGameSoftwareInfo
                import org.allbinary.game.canvas.GDGlobalsGDObjectsFactory
                import org.allbinary.game.canvas.GDGlobalsGDResources

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
                import org.allbinary.input.motion.gesture.MotionGestureInput
                import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
                import org.allbinary.layer.AllBinaryLayerManager
                import org.allbinary.string.CommonStrings
                import org.allbinary.logic.string.StringMaker
                import org.allbinary.string.CommonSeps
                import org.allbinary.logic.string.StringUtil
                import org.allbinary.logic.communication.log.LogUtil
                import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface
                import org.allbinary.media.audio.Sound
                import org.allbinary.math.NoDecimalTrigTable
                import org.allbinary.string.CommonPhoneStrings
                import org.allbinary.time.GameTickTimeDelayHelper
                import org.allbinary.time.GameTickTimeDelayHelperFactory
                import org.allbinary.time.TimeDelayHelper
                import org.allbinary.logic.NullUtil
                import org.allbinary.util.ArrayUtil
                import org.allbinary.util.BasicArrayList
                import org.allbinary.util.BasicArrayListD
                import org.allbinary.media.audio.PlayerComposite
                import org.allbinary.thread.SecondaryThreadPool
                import org.allbinary.game.layer.behavior.GDBehaviorUtil
                import org.allbinary.game.layer.behavior.PathFindingBehavior
                import org.allbinary.thread.PathFindingThreadPool
                import org.allbinary.logic.io.file.FileSystem
                import org.allbinary.logic.math.SmallIntegerSingletonFactory
                import org.allbinary.game.layout.GDStrings

                <xsl:variable name="selectedNodeIdSet" select="substring(substring($selectedNodeIds, string-length($selectedNodeIds) - 1), 1, 1)" />
                <xsl:variable name="lastDigit2" ><xsl:if test="4 >= $selectedNodeIdSet" >0</xsl:if><xsl:if test="$selectedNodeIdSet > 4" >1</xsl:if></xsl:variable>
                //selectedNodeIdSet=<xsl:value-of select="$selectedNodeIdSet" />
                //LayoutAction name=<xsl:value-of select="$layoutName" />
                open public class GD<xsl:value-of select="$layoutIndex" />Action<xsl:value-of select="$lastDigit2" />GDNodes
                {

                    private val instance: GD<xsl:value-of select="$layoutIndex" />Action<xsl:value-of select="$lastDigit2" />GDNodes =
                        GD<xsl:value-of select="$layoutIndex" />Action<xsl:value-of select="$lastDigit2" />GDNodes()

                        open public fun getInstance(): GD<xsl:value-of select="$layoutIndex" />Action<xsl:value-of select="$lastDigit2" />GDNodes {
                            return GD<xsl:value-of select="$layoutIndex" />Action<xsl:value-of select="$lastDigit2" />GDNodes.instance
                        }

                        protected val logUtil: LogUtil = LogUtil.getInstance()
                        private val commonStrings: CommonStrings = CommonStrings.getInstance()
                        private val nullUtil: NullUtil = NullUtil.getInstance()
                        private val arrayUtil: ArrayUtil = ArrayUtil.getInstance()
                        private val pointFactory: PointFactory = PointFactory.getInstance()
                        private val stringUtil: StringUtil = StringUtil.getInstance()
                        private val EMPTY_STRING: String = stringUtil.EMPTY_STRING
                        private val basicColorUtil: BasicColorUtil = BasicColorUtil.getInstance()
                        private val virtualKeyboardEventHandler: VirtualKeyboardEventHandler = VirtualKeyboardEventHandler.getInstance()
                        private val smallBasicColorCacheFactory: SmallBasicColorCacheFactory = SmallBasicColorCacheFactory.getInstance()
                        private val gameTickTimeDelayHelper: GameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
                        private val gameTickDisplayInfoSingleton: GameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance()
                        private val smallIntegerSingletonFactory: SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
                        private val gameGlobalsFactory: GameGlobalsFactory = GameGlobalsFactory.getInstance()
                        private val gdStrings: GDStrings = GDStrings.getInstance()

                        private val gdBehaviorUtil: GDBehaviorUtil = GDBehaviorUtil.getInstance()
                        private val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
                        private val gdExtensionGDNodes: GDExtensionGDNodes = GDExtensionGDNodes.getInstance()
                        private val globalResources: GDGlobalsGDResources = GDGlobalsGDResources.getInstance()

                        private val gdGlobalsObjectsFactory: GDGlobalsGDObjectsFactory = GDGlobalsGDObjectsFactory.getInstance()
                        private val globals: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance()
                        private val gdObjectsFactory: GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory = GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.getInstance()
                        private val imageResources: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources.getInstance()
                        private val resources: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources.getInstance()

                        private val abeClientInformation: AbeClientInformationInterface = GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION

                        //private final GDGlobalSpecialAnimationImageResources globalImageResources = GDGlobalSpecialAnimationImageResources.getInstanceOrCreate()

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

                    open public fun TimeDelta(): Double {
                        return globals.globalsGameTickTimeDelayHelper.timeDelta * .001
                    }

                    open public fun SceneWindowWidth(): Int {
                        return gameTickDisplayInfoSingleton.getLastWidth()
                    }

                    open public fun SceneWindowHeight(): Int {
                        return gameTickDisplayInfoSingleton.getLastHeight()
                    }


                    open public fun Random(range: Int): Int {
                        return MyRandomFactory.getInstance().getAbsoluteNextInt(range + 1)
                    }

                    open public fun RandomFloatInRange(min: Double, max: Double): Float {
                        val next: Double = (max - min)
                        //this.logUtil.putF("NEXT: " + next, this, this.commonStrings.PROCESS)
                        val nextF: Float = next.toFloat() * 1000
                        //this.logUtil.putF("NEXTF: " + nextF, this, this.commonStrings.PROCESS)
                        val nextI: Int = Math.round(nextF)
                        //this.logUtil.putF("NEXTI: " + nextI, this, this.commonStrings.PROCESS)
                        val random: Int = MyRandomFactory.getInstance().getAbsoluteNextInt(nextI)
                        //this.logUtil.putF("RANDOM: " + random, this, this.commonStrings.PROCESS)
                        val randomF: Float = random.toFloat()
                        //this.logUtil.putF("RANDOMF: " + randomF, this, this.commonStrings.PROCESS)
                        val result: Float = min.toFloat() + (randomF / 1000)
                        //this.logUtil.putF("RESULT: " + result, this, this.commonStrings.PROCESS)
                        var result: return
                    }

                    open public fun RandomFloatInRange(min: Float, max: Float): Float {
                        val nextF: Float = (max - min).toFloat() * 1000
                        //this.logUtil.putF("NEXTF: " + nextF, this, this.commonStrings.PROCESS)
                        val nextI: Int = Math.round(nextF)
                        //this.logUtil.putF("NEXTI: " + nextI, this, this.commonStrings.PROCESS)
                        val random: Int = MyRandomFactory.getInstance().getAbsoluteNextInt(nextI)
                        //this.logUtil.putF("RANDOM: " + random, this, this.commonStrings.PROCESS)
                        val randomF: Float = random.toFloat()
                        //this.logUtil.putF("RANDOMF: " + randomF, this, this.commonStrings.PROCESS)
                        val result: Float = min.toFloat() + (randomF / 1000)
                        //this.logUtil.putF("RESULT: " + result, this, this.commonStrings.PROCESS)
                        var result: return
                    }

                    open public fun Variable(value: Int): Int {
                        var value: return
                    }

                    open public fun Variable(value: Float): Float {
                        var value: return
                    }

                    open public fun Variable(value: Double): Double {
                        var value: return
                    }

                    open public fun VariableString(string: String): String {
                        var string: return
                    }

                    open public fun VariableString(object: Object): String {
                        return object.toString()
                    }

                    open public fun VariableChildCount(array: Array&lt;String&gt;): Int {
                        return array.length
                    }

                    open public fun VariableChildCount(array: IntArray): Int {
                        return array.length
                    }

                    open public fun GlobalVariable(value: String): String {
                        var value: return
                    }

                    open public fun GlobalVariable(value: Float): Float {
                        var value: return
                    }

                    open public fun GlobalVariable(value: Long): Long {
                        var value: return
                    }

                    open public fun GlobalVariable(value: Int): Int {
                        var value: return
                    }

                    open public fun GlobalVariableString(value: String): String {
                        var value: return
                    }

                    open public fun GlobalVariableChildCount(array: Array&lt;String&gt;): Int {
                        return array.length
                    }

                    open public fun GlobalVariableChildCount(array: IntArray): Int {
                        return array.length
                    }

                    open public fun GlobalVariableChildCount(array: LongArray): Int {
                        return array.length
                    }

                    open public fun GlobalVarToJSON(value: String): String {
                        var value: return
                    }

                    open public fun GlobalVarToJSON(value: Int): String {
                        return Integer.toString(value)
                    }

                    open public fun GlobalVarToJSON(value: Long): String {
                        return Long.toString(value)
                    }

                    open public fun ToJSONType(value: GDStructure): Int {
                        return value.getJSONType()
                    }

                    open public fun ToJSON(value: GDStructure): String {
                        return value.toJSONAsString()
                    }

                    open public fun ToJSON(value: String): String {
                        var value: return
                    }

                    open public fun ToJSON(value: Int): String {
                        return Integer.toString(value)
                    }

                    open public fun ToJSON(value: Long): String {
                        return Long.toString(value)
                    }

                    open public fun SceneInstancesCount(size: Int): Int {
                        var size: return
                    }

                    open public fun MouseX(): Int {
                        return gameGlobalsFactory.point.getX()
                    }

                    open public fun MouseY(): Int {
                        return gameGlobalsFactory.point.getY()
                    }

                    open public fun MouseX(string: String, value: Int): Int {
                        return gameGlobalsFactory.point.getX()
                    }

                    open public fun MouseY(string: String, value: Int): Int {
                        return gameGlobalsFactory.point.getY()
                    }

                    open public fun CameraX(string: String, value: Int): Int {
                        var 0: return
                    }

                    open public fun CameraY(string: String, value: Int): Int {
                        var 0: return
                    }

                    open public fun CameraWidth(string: String, value: Int): Int {
                        return gameTickDisplayInfoSingleton.getLastWidth()
                    }

                    open public fun TimerElapsedTime(timeDelayHelper: TimeDelayHelper): Long {
                        return timeDelayHelper.getElapsed(globals.globalsGameTickTimeDelayHelper.lastStartTime) / 1000
                    }

                    open public fun floor(value: Int): Int {
                        var value: return
                    }

                    open public fun floor(value: Float): Float {
                        return Math.floor(value.toDouble()).toFloat()
                    }

                    open public fun mod(value: Int, mod: Int): Int {
                        return value % mod
                    }

                    open public fun round(value: Int): Int {
                        var value: return
                    }

                    open public fun round(value: Long): Long {
                        var value: return
                    }

                    open public fun round(value: Float): Float {
                        return Math.round(value)
                    }

                    open public fun abs(value: Int): Int {
                        return Math.abs(value)
                    }

                    open public fun abs(value: Float): Float {
                        return Math.abs(value)
                    }

                    open public fun log2(value: Int): Double {
                        return Math.log(value)
                    }

                    open public fun sin(angle: Double): Double {
                        return Math.sin(angle)
                    }

                    open public fun cos(angle: Double): Double {
                        return Math.cos(angle)
                    }

                    open public fun min(min: Int, max: Int): Int {
                        return Math.min(min, max)
                    }

                    open public fun max(min: Int, max: Int): Int {
                        return Math.max(min, max)
                    }

                    open public fun ceil(value: Double): Int {
                        return Math.ceil(value).toInt()
                    }

                    open public fun ToRad(angdeg: Double): Double {
                        //return Math.toRadians(angdeg)
                        var angdeg: return
                    }

                    open public fun TimeFromStart(): Long {
                        return globals.globalsGameTickTimeDelayHelper.getTimeFromStart() / 100
                    }

                    open public fun NewLine(): String {
                        return CommonSeps.getInstance().NEW_LINE
                    }

                    open public fun LastTouchId(): Int {
                        var 0: return
                    }

                    open public fun LastEndedTouchId(): Int {
                        var 0: return
                    }

                    open public fun TouchX(touchId: Int, name: String, unknown: Int): Int {
                        var 0: return
                    }

                    open public fun TouchY(touchId: Int, name: String, unknown: Int): Int {
                        var 0: return
                    }

                    open public fun ToNumber(string: String): Float {
                        return Float.parseFloat(string)
                    }

                    open public fun StrLength(string: String): Int {
                        return string.length
                    }

                    open public fun StrReplaceAll(string: String, find: String, replace: String): String {
                        return string.replace(find, replace)
                    }

                    open public fun SubStr(string: String, startIndex: Int, endIndex: Int): String {
                        return string.substring(startIndex, endIndex)
                    }

                    open public fun ToString(value: String): String {
                        var value: return
                    }

                    open public fun ToString(value: Int): String {
                        if(this.abs(value) <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 499) {
                            return Integer.toString(value)
                        } else {
                            return smallIntegerSingletonFactory.getString(value)
                        }
                    }

                    open public fun ToString(value: Long): String {
                        //this.primitiveLongUtil = PrimitiveLongUtil(max + 1)
                        return Long.toString(value)
                    }

                    open public fun LargeNumberToString(value: Long): String {
                        //this.primitiveLongUtil = PrimitiveLongUtil(max + 1)
                        return Long.toString(value)
                    }

                    open public fun LargeNumberToString(value: Float): String {
                        //this.primitiveLongUtil = PrimitiveLongUtil(max + 1)
                        return Long.toString(value.toLong())
                    }

                    open public fun ToString(value: Float): String {
                        return Float.toString(value)
                    }

                    open public fun ToNotString(value: Int): Int {
                        var value: return
                    }

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

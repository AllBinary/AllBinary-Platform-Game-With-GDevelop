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
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventOpen.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClose.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventProcess.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/PaintDebugButtons.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template name="resetRectForPrimitiveDrawingDrawer" >
        <xsl:param name="layoutIndex" />

        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            <xsl:if test="$typeValue = 'PrimitiveDrawing::Drawer'" >
                <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="name" /></xsl:variable>
                //clearBetweenFrames=<xsl:value-of select="clearBetweenFrames" />
                <xsl:if test="clearBetweenFrames = 'true'" >
                </xsl:if>
            </xsl:if>
        </xsl:for-each>

    </xsl:template>

    <xsl:template match="/game" >

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
                //layoutName=<xsl:value-of select="$layoutName" />
                //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />
                //externalEventActionModVarSceneAsString=<xsl:value-of select="$externalEventActionModVarSceneAsString" />

                package org.allbinary.game.canvas

                import javax.microedition.lcdui.Graphics

                import org.json.me.JSONArray
                import org.json.me.JSONObject

                import org.allbinary.animation.special.SpecialAnimation
                import org.allbinary.game.canvas.GDExtensionGDNodes
                import org.allbinary.game.input.event.RawKeyEventHandler
                import org.allbinary.game.layer.AllBinaryGameLayerManager
                import org.allbinary.game.layer.GDGameLayer
                import org.allbinary.game.layer.form.GDFormInputProcessor
                import org.allbinary.game.layout.BaseGDNodeStats
                import org.allbinary.game.layout.GDNode
                import org.allbinary.game.layout.GDNodes
                import org.allbinary.game.layout.GDNodeUtil
                import org.allbinary.game.layer.special.TempGameLayerUtil
                import org.allbinary.game.layout.GDNodeStatsFactory
                import org.allbinary.game.layout.GDObject
                import org.allbinary.graphics.GPoint
                import org.allbinary.graphics.PointFactory
                import org.allbinary.graphics.Rectangle
                import org.allbinary.graphics.color.BasicColor
                import org.allbinary.graphics.color.BasicColorFactory
                import org.allbinary.graphics.color.BasicColorSetUtil
                import org.allbinary.graphics.displayable.MyCanvas
                import org.allbinary.input.motion.gesture.MotionGestureInput
                import org.allbinary.input.motion.gesture.TouchMotionGestureFactory
                import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler
                import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
                import org.allbinary.input.motion.gesture.observer.MovedMotionGesturesHandler
                import org.allbinary.input.motion.gesture.observer.ScrolledMotionGesturesHandler
                import org.allbinary.logic.communication.log.LogUtil
                import org.allbinary.math.RectangleCollisionUtil
                import org.allbinary.string.CommonStrings
                import org.allbinary.logic.string.StringMaker
                import org.allbinary.time.GameTickTimeDelayHelper
                import org.allbinary.time.GameTickTimeDelayHelperFactory
                import org.allbinary.logic.io.file.FileSystem
                import org.allbinary.logic.NullUtil
                import org.allbinary.util.ArrayUtil
                import org.allbinary.util.BasicArrayList
                import org.allbinary.util.BasicArrayListD

                //Layout name=<xsl:value-of select="$layoutName" />
                open public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimation : GDSpecialAnimation
                {
                    private var instance: GD<xsl:value-of select="$layoutIndex" />SpecialAnimation = null

                    open public fun getInstance(abCanvas: MyCanvas, allBinaryGameLayerManager: AllBinaryGameLayerManager): GD<xsl:value-of select="$layoutIndex" />SpecialAnimation {
                        val abToGBUtil: ABToGBUtil = ABToGBUtil.getInstance()

                        abToGBUtil.abCanvas = abCanvas
                        abToGBUtil.allBinaryGameLayerManager = allBinaryGameLayerManager

                        if(GD<xsl:value-of select="$layoutIndex" />SpecialAnimation.instance == null) {
                            GD<xsl:value-of select="$layoutIndex" />SpecialAnimation.instance = GD<xsl:value-of select="$layoutIndex" />SpecialAnimation()
                        } else {
                            GD<xsl:value-of select="$layoutIndex" />SpecialAnimation.instance.reinitInstances()
                        }
                        return GD<xsl:value-of select="$layoutIndex" />SpecialAnimation.instance

                    }

                        open public fun getInstance(): GD<xsl:value-of select="$layoutIndex" />SpecialAnimation {
                            return GD<xsl:value-of select="$layoutIndex" />SpecialAnimation.instance
                        }

                        protected val logUtil: LogUtil = LogUtil.getInstance()
                        private val commonStrings: CommonStrings = CommonStrings.getInstance()
                        private val nullUtil: NullUtil = NullUtil.getInstance()
                        private val arrayUtil: ArrayUtil = ArrayUtil.getInstance()
                        private val pointFactory: PointFactory = PointFactory.getInstance()
                        private val rectangleCollisionUtil: RectangleCollisionUtil = RectangleCollisionUtil.getInstance()
                        private val gameTickTimeDelayHelper: GameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()

                        private val gdNodeStatsFactory: BaseGDNodeStats = GDNodeStatsFactory.getInstance()

                        private val stringBuilder: StringMaker = StringMaker()

                        private val gdNodes: GDNodes = GDNodeUtil.getInstance().getInstance(<xsl:value-of select="$layoutIndex" />)

                        private val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
                        private val gdExtensionGDNodes: GDExtensionGDNodes = GDExtensionGDNodes.getInstance()

                        private val gdGlobalsSpecialAnimation: GDGlobalsSpecialAnimation = GDGlobalsSpecialAnimation.getInstance()

                        private val globals: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals
                        private val builder: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder

                        //layers=<xsl:for-each select="layers" ><xsl:value-of select="name" />,</xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        //behaviorsSharedData=<xsl:for-each select="behaviorsSharedData" >type=<xsl:value-of select="type" />,</xsl:for-each>
                        <xsl:text>&#10;</xsl:text>

                    private val touchMotionGestureFactory: TouchMotionGestureFactory = TouchMotionGestureFactory.getInstance()

                    private var clear: Boolean = false

                    private constructor() {

                        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR)

                        <xsl:call-template name="scale" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="layoutName" >
                                <xsl:value-of select="$layoutName" />
                            </xsl:with-param>
                        </xsl:call-template>

                        gdNodeStatsFactory.reset()

                        globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstanceOrCreate()
                        GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.getInstanceOrCreate()
                        builder = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder()

<!--                        try {

                        } catch(Exception e) {
                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
                        }-->

                        //allBinaryGameLayerManager.log()
                        //groupLayerManagerListener.log()

                        gdNodeStatsFactory.log(stringBuilder, this)

                        this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.CONSTRUCTOR)
                    }

                    private fun processMotionEvents() {
                        <xsl:for-each select="objects" >
                            <xsl:if test="type = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick'" >
                        var point: GPoint
                        var gameLayer: GDGameLayer
                        val size2: Int = globals.<xsl:value-of select="name" />GDGameLayerList.size()
                            </xsl:if>
                        </xsl:for-each>

                        val motionEventList: BasicArrayList = globals.motionEventListOfList[globals.processingMotionEventListIndex] as BasicArrayList
                        var motionEventSize: Int = motionEventList.size()
                        var motionGestureEvent: MotionGestureEvent
                        var motionGestureInput: MotionGestureInput
                        var pressedAlready: Boolean = false
                        for(index in 0 until motionEventSize) {

                            motionGestureEvent = motionEventList.get(index) as MotionGestureEvent
                            motionGestureInput = motionGestureEvent.getMotionGesture()

                            if (motionGestureInput == touchMotionGestureFactory.PRESSED) {
                                globals.lastMotionGestureInput = motionGestureInput
                                pressedAlready = true
                            } else if(motionGestureInput == touchMotionGestureFactory.RELEASED) {

                        <xsl:for-each select="objects" >
                            <xsl:if test="type = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick'" >
                            for(index2 in 0 until size2) {
                                //SpriteMultitouchJoystick::SpriteMultitouchJoystick
                                gameLayer = globals.<xsl:value-of select="name" />GDGameLayerList.get(index2) as GDGameLayer
                                val <xsl:value-of select="name" />: GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /> = gameLayer.gdObject as GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />
                                if(motionGestureEvent.getId() == <xsl:value-of select="name" />.getId()) {
                                    <xsl:value-of select="name" />.setId(-1)
                                    <xsl:value-of select="name" />.setPoint(pointFactory.getInstance().ZERO_ZERO)
                                }
                            }
                            </xsl:if>
                        </xsl:for-each>

                                if(pressedAlready) {
                                    motionEventSize = index
                                    break
                                }
                                globals.lastMotionGestureInput = motionGestureInput
                            }

                        <xsl:for-each select="objects" >
                            <xsl:if test="type = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick'" >
                            for(index2 in 0 until size2) {
                                //SpriteMultitouchJoystick::SpriteMultitouchJoystick
                                gameLayer = globals.<xsl:value-of select="name" />GDGameLayerList.get(index2) as GDGameLayer
                                point = motionGestureEvent.getCurrentPoint()
                                if (rectangleCollisionUtil.isInside(gameLayer.getXP(), gameLayer.getYP() - 2, gameLayer.getX2(), gameLayer.getY2() + 2, point.getX(), point.getY())) {
                                    val <xsl:value-of select="name" />: GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /> = gameLayer.gdObject as GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />

                                    <xsl:value-of select="name" />.setId(motionGestureEvent.getId())
                                    <xsl:value-of select="name" />.setPoint(point)
                                    val portionOfX: Float = (point.getX().toFloat() - gameLayer.getXP() - gameLayer.getHalfWidth()) / gameLayer.getWidth().toFloat() * 2
                                    val portionOfY: Float = -(point.getY().toFloat() - gameLayer.getYP() - gameLayer.getHalfHeight()) / gameLayer.getHeight().toFloat() * 2
                                    //this.logUtil.put(StringMaker().append(portionOfX).append("portionOfX: ").append(point.getX()).append(" - ").append(gameLayer.getXP()).append(" / ").append(gameLayer.getWidth()).toString(), this, this.commonStrings.CONSTRUCTOR)
                                    //this.logUtil.put(StringMaker().append(portionOfY).append("portionOfY: ").append(point.getY()).append(" - ").append(gameLayer.getYP()).append(" / ").append(gameLayer.getHeight()).toString(), this, this.commonStrings.CONSTRUCTOR)
                                    <xsl:value-of select="name" />.setStickForceX(portionOfX)
                                    <xsl:value-of select="name" />.setStickForceY(portionOfY)
                                    gameLayer.getDimensionalBehavior().getAnimationBehavior().set(gameLayer, <xsl:value-of select="name" />)
                                }
                            }
                            </xsl:if>
                        </xsl:for-each>

                            //final MotionGestureInput motionGestureInput = motionGestureEvent.getMotionGesture()
                            globals.lastPointGDNode.process(motionGestureEvent, globals.lastMotionGestureInput)

                            //MouseButton
                        <xsl:call-template name="processNodesForMotionGestureEvent" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>

                        }

                        for(index in 0 until motionEventSize) {
                            motionEventList.removeAt(0)
                        }

                        //Scrolling - START
                        val scrollingMotionEventList: BasicArrayList = globals.scrollingMotionEventListOfList[globals.processingMotionEventListIndex] as BasicArrayList
                        motionEventSize = scrollingMotionEventList.size()
                        pressedAlready = false
                        for(index in 0 until motionEventSize) {

                            motionGestureEvent = scrollingMotionEventList.get(index) as MotionGestureEvent
                            motionGestureInput = motionGestureEvent.getMotionGesture()

                            if (motionGestureInput == touchMotionGestureFactory.PRESSED) {
                                globals.lastMotionGestureInput = motionGestureInput
                                pressedAlready = true
                            } else if(motionGestureInput == touchMotionGestureFactory.RELEASED) {

                                if(pressedAlready) {
                                    motionEventSize = index
                                    break
                                }
                                globals.lastScrollingMotionGestureInput = motionGestureInput
                            }

                            //MouseButton
                        <xsl:call-template name="processNodesForScrollingMotionGestureEvent" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>

                        }

                        for(index in 0 until motionEventSize) {
                            scrollingMotionEventList.removeAt(0)
                        }
                        //Scrolling - END

                    }

                    open public fun process() {
                        try {

                        globals.globalsGameTickTimeDelayHelper.loop()

                        if(globals.processingMotionEventListIndex == 0) {
                            globals.processingMotionEventListIndex = 1
                            globals.inUseMotionEventListIndex = 0
                        } else {
                            globals.processingMotionEventListIndex = 0
                            globals.inUseMotionEventListIndex = 1
                        }

                        if(globals.processingScrollingMotionEventListIndex == 0) {
                            globals.processingScrollingMotionEventListIndex = 1
                            globals.inUseScrollingMotionEventListIndex = 0
                        } else {
                            globals.processingScrollingMotionEventListIndex = 0
                            globals.inUseScrollingMotionEventListIndex = 1
                        }

                    //PrimitiveDrawing::Drawer - clearBetweenFrames - START
                    <xsl:call-template name="resetRectForPrimitiveDrawingDrawer" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //PrimitiveDrawing::Drawer - clearBetweenFrames - END

                        this.processMotionEvents()

                        gdNodes.process()

                        gdGlobalsSpecialAnimation.process(globals.globalsGameTickTimeDelayHelper.timeDelta)

                    //eventsProcess - START
                    <xsl:call-template name="eventsProcess" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsProcess - END

                    var size: Int
                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="objectName" select="name" />

                        if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.objectArray != nullUtil.NULL_OBJECT_ARRAY) {
                        <xsl:if test="behaviors" >
                        //Behavior - animation
                        //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>
                        //if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList != null) {
                           val removeList: BasicArrayList = BasicArrayListD()
                           size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.size()
                           for(index in 0 until size) {
                           <xsl:for-each select="behaviors" >
                               //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />
                               <xsl:if test="type = 'DestroyOutsideBehavior::DestroyOutside'" >
                               //this.logUtil.putF("Behavior objectName=<xsl:value-of select="$objectName" /> name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />: check", this, this.commonStrings.PROCESS)
                               if(globals.destroyOutsideBehavior.process(globals.<xsl:value-of select="$objectName" />GDGameLayerList, index, globals.graphics)) {
                                   //this.logUtil.putF("Behavior objectName=<xsl:value-of select="$objectName" /> name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />: remove", this, this.commonStrings.PROCESS)
                                   removeList.add(globals.<xsl:value-of select="$objectName" />GDGameLayerList.get(index))
                               }
                               </xsl:if>
                           </xsl:for-each>
                           }

                           var gdGameLayer: GDGameLayer
                           for(index in 0 until removeList.size()) {
                               gdGameLayer = removeList.get(index) as GDGameLayer
                               //This removes itself from the list
                               gdGameLayer.setDestroyed(true)
                               //this.logUtil.putF("Behavior objectName=<xsl:value-of select="name" /> size=<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList size: " + <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.size(), this, this.commonStrings.PROCESS)
                           }

                        </xsl:if>
                        <xsl:if test="not(behaviors)" >
                           //Behavior - animation without behaviors
                        </xsl:if>

                           size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.size()
                           var gameLayer: GDGameLayer
                           for(index in 0 until size) {
                               gameLayer = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.get(index) as GDGameLayer)
                               gameLayer.process(globals.globalsGameTickTimeDelayHelper.timeDelta)
                               gameLayer.animate(globals.globalsGameTickTimeDelayHelper.timeDelta)
                           }

                        }
                    </xsl:for-each>

                        globals.globalsGameTickTimeDelayHelper.lastStartTime = gameTickTimeDelayHelper.startTime

                        } catch (e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e)
                        }

                    }

                    open public fun paint(graphics: Graphics, x: Int, y: Int) {
                        //gdNodeStatsFactory.reset()

                    <xsl:call-template name="paintDebugButtons" >
                        <xsl:with-param name="caller" >paint</xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
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

                    //instances - START - layout
                    <xsl:for-each select="instances" >
                        <xsl:variable name="textObjectTextName" >TextObject::Text:<xsl:value-of select="name" /></xsl:variable>
                        <xsl:if test="contains($objectsAsString, $textObjectTextName)" >
                        //TextObject::Text instance - layout
                        this.textObjectText<xsl:value-of select="position()" />(x, y)
                        </xsl:if>
                    </xsl:for-each>
                    //instances - END - layout

                        //gdNodeStatsFactory.log(stringBuilder, this)
                    }

                    //instances - START - layout
                    <xsl:for-each select="instances" >
                        <xsl:variable name="textObjectTextName" >TextObject::Text:<xsl:value-of select="name" /></xsl:variable>
                        <xsl:if test="contains($objectsAsString, $textObjectTextName)" >
                        //TextObject::Text instance - layout
                        private fun textObjectText<xsl:value-of select="position()" />(x: Int, y: Int) {
                            val <xsl:value-of select="name" />Size: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />RectangleList.size()
                            if(<xsl:value-of select="name" />Size != 0) {

                            <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="name" /></xsl:variable>

                                final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="name" />GDobject = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.get(0) as GDGameLayer) as <xsl:value-of select="$gdObjectFactory" />.gdObject
                                val <xsl:value-of select="name" />X: Int = x + <xsl:value-of select="name" />GDobject.x
                                val <xsl:value-of select="name" />Y: Int = y + <xsl:value-of select="name" />GDobject.y

                                //Rectangle 2
                                val <xsl:value-of select="name" />Rectangle: Rectangle = Rectangle(
                                    pointFactory.createXY(<xsl:value-of select="name" />X, <xsl:value-of select="name" />Y),
                                    <xsl:value-of select="name" />GDobject.Width(globals.graphics), <xsl:value-of select="name" />GDobject.Height(globals.graphics))
                                <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />RectangleList.add(<xsl:value-of select="name" />Rectangle)
                            }
                        }
                        </xsl:if>
                    </xsl:for-each>
                    //instances - END - layout

                    open public fun open() {
                        //this.logUtil.putF("scene - open", this, this.commonStrings.PROCESS)

                    <xsl:variable name="foundMousePositionNeeded" >found</xsl:variable>
                    <xsl:if test="contains($foundMousePositionNeeded, 'found')" >
                        BasicMotionGesturesHandler.getInstance().addListenerInterface(globals.eventListenerInterfaceLastPoint)
                        MovedMotionGesturesHandler.getInstance().addListenerInterface(globals.eventListenerInterfaceLastPoint)
                        ScrolledMotionGesturesHandler.getInstance().addListenerInterface(globals.eventListenerInterfaceLastPoint)
                    </xsl:if>

                        GDFormInputProcessor.getInstance().open()

                    //eventsOpen - START
                    <xsl:call-template name="eventsOpen" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsOpen - END
                    }

                    open public fun close() {
                        //this.logUtil.putF("scene - close", this, this.commonStrings.PROCESS)

                        GDFormInputProcessor.getInstance().close()

                    <xsl:if test="contains($foundMousePositionNeeded, 'found')" >
                        MovedMotionGesturesHandler.getInstance().removeListener(globals.eventListenerInterfaceLastPoint)
                        BasicMotionGesturesHandler.getInstance().removeListener(globals.eventListenerInterfaceLastPoint)
                        ScrolledMotionGesturesHandler.getInstance().removeListener(globals.eventListenerInterfaceLastPoint)
                    </xsl:if>

                        val size: Int = globals.motionEventListOfList.length
                        for(index in 0 until size) {
                            val motionEventList: BasicArrayList = globals.motionEventListOfList[index] as BasicArrayList
                            motionEventList.clear()
                        }

                        globals.lastMotionGestureInput = null

                    //eventsClose - START
                    <xsl:call-template name="eventsClose" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsClose - END
                    }

                    open public fun reinitInstances() {
                        if(!clear) {
                            //this.logUtil.putF("scene - reinitInstances - duplicate", this, this.commonStrings.PROCESS)
                            //throw RuntimeException()
                            return
                        }

                        //this.logUtil.putF("scene - reinitInstances", this, this.commonStrings.PROCESS)

                    this.globals.reset()

                    <xsl:call-template name="addFromInstancesCache" >
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
                        </xsl:with-param>
                    </xsl:call-template>

                        builder.build()

                        <xsl:variable name="hasHighscoreSubmissionComplete" >
                            <xsl:for-each select="variables" >
                                <xsl:if test="name = 'highscoreSubmissionComplete'" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:if test="not(contains($hasHighscoreSubmissionComplete, 'found'))" >
                        //This layout should not be the highscore layout
                        this.logUtil.putF("This layout should not be the highscore layout", this, this.commonStrings.PROCESS)
                        globals.highscoreSubmissionComplete = false
                        </xsl:if>

                        clear = false
                    }

                    open public fun reset() {
                        //this.logUtil.putF("scene - clear", this, this.commonStrings.PROCESS)

                        clear = true

                        GDFormInputProcessor.getInstance().reset()

                        //objects - all - //layout - reset
            <xsl:for-each select="objects" >

                <xsl:variable name="initialVariablesValue" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="initialVariables/value" /></xsl:with-param><xsl:with-param name="find" >-</xsl:with-param><xsl:with-param name="replacementText" >Neg</xsl:with-param></xsl:call-template></xsl:variable>

                        //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>
                        //<xsl:value-of select="name" />GDObjectList<xsl:value-of select="$initialVariablesValue" />.clear()
                        globals.<xsl:value-of select="name" />GDGameLayerList<xsl:value-of select="$initialVariablesValue" />.clear()
                        <xsl:if test="type = 'TextObject::Text'" >
                        globals.<xsl:value-of select="name" />RectangleList<xsl:value-of select="$initialVariablesValue" />.clear()
                        </xsl:if>

                        globals.<xsl:value-of select="name" />CacheGDGameLayerList.clear()

            </xsl:for-each>

                        gdNodes.clear()

                    }

                    open public fun getGlobals(): GDSceneGlobals {
                        return this.globals
                    }

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

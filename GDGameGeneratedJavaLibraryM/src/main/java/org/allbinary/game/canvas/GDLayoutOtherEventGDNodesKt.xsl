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
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObjectGDNodeOtherEvent.xsl" />
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

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/event/GDJsCodeEventGDNode.xsl" />

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

                import javax.microedition.lcdui.Graphics
                import javax.microedition.lcdui.Image

                import org.json.me.JSONArray
                import org.json.me.JSONObject

                import org.allbinary.AndroidUtil
                import org.allbinary.J2MEUtil
                import org.allbinary.animation.AnimationBehavior
                import org.allbinary.animation.special.SpecialAnimation
                import org.allbinary.game.configuration.persistance.JSONPersistance
                import org.allbinary.game.canvas.GDExtensionGDNodes
                import org.allbinary.game.layer.GDGameLayer
                import org.allbinary.game.layer.GDGameLayerFactory
                import org.allbinary.game.layout.GDNode
                import org.allbinary.game.layer.special.TempGameLayerUtil
                import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton
                import org.allbinary.game.layout.GDObject
                import org.allbinary.game.layout.GDObjectStrings
                import org.allbinary.game.layer.AllBinaryGameLayerManager
                import org.allbinary.game.layer.CollidableCompositeLayer
                import org.allbinary.game.layer.identification.GroupLayerManagerListener
                import org.allbinary.game.rand.MyRandomFactory
                import org.allbinary.input.motion.gesture.MotionGestureInput
                import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
                import org.allbinary.string.CommonStrings
                import org.allbinary.string.CommonSeps
                import org.allbinary.logic.string.StringUtil
                import org.allbinary.logic.string.StringMaker
                import org.allbinary.logic.io.file.FileSystem
                import org.allbinary.logic.communication.log.LogUtil
                import org.allbinary.util.BasicArrayList
                import org.allbinary.util.BasicArrayListD
                import org.allbinary.logic.NullUtil
                import org.allbinary.util.ArrayUtil
                import org.allbinary.logic.math.SmallIntegerSingletonFactory

                //LayoutOtherEvent name=<xsl:value-of select="$layoutName" />
                open public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimationOtherEventGDNodes : SpecialAnimation
                {

                    private val instance: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationOtherEventGDNodes =
                       GD<xsl:value-of select="$layoutIndex" />SpecialAnimationOtherEventGDNodes()

                        open public fun getInstance(): GD<xsl:value-of select="$layoutIndex" />SpecialAnimationOtherEventGDNodes {
                            return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationOtherEventGDNodes.instance
                        }

                        protected val logUtil: LogUtil = LogUtil.getInstance()
                        private val commonStrings: CommonStrings = CommonStrings.getInstance()
                        private val stringUtil: StringUtil = StringUtil.getInstance()
                        private val nullUtil: NullUtil = NullUtil.getInstance()
                        private val arrayUtil: ArrayUtil = ArrayUtil.getInstance()
                        private val gameTickDisplayInfoSingleton: GameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance()
                        private val smallIntegerSingletonFactory: SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()

                        private val objectStrings: GDObjectStrings = GDObjectStrings.getInstance()
                        private val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
                        private val gdExtensionGDNodes: GDExtensionGDNodes = GDExtensionGDNodes.getInstance()

                        private val globals: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance()
                        private val gdObjectsFactory: GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory = GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.getInstance()
                        private val imageResources: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources.getInstance()
                        private val resources: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources.getInstance()

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

                    //otherEventLayout - //eventsCreateAssignGDObjectGDNodesOtherEvent - START
                    <xsl:call-template name="eventsCreateAssignGDObjectGDNodesOtherEvent" >
                        <xsl:with-param name="caller" >otherEventLayout</xsl:with-param>
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="thisNodeIndex" >
                            <xsl:value-of select="-4" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>

                    </xsl:call-template>
                    //otherEventLayout - //eventsCreateAssignGDObjectGDNodesOtherEvent - END

                    this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.CONSTRUCTOR)

                        } catch (e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e)
                        }

                    }

                    //public long TimeDelta() {
                        //return globals.globalsGameTickTimeDelayHelper.timeDelta
                    //}

                    open public fun SceneWindowWidth(): Int {
                        return gameTickDisplayInfoSingleton.getLastWidth()
                    }

                    open public fun SceneWindowHeight(): Int {
                        return gameTickDisplayInfoSingleton.getLastHeight()
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

                    open public fun Random(range: Int): Int {
                        return MyRandomFactory.getInstance().getAbsoluteNextInt(range + 1)
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

                    open public fun ToString(value: Int): String {
                        if(this.abs(value) <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 499) {
                            return Integer.toString(value)
                        } else {
                            return smallIntegerSingletonFactory.getString(value)
                        }
                    }

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

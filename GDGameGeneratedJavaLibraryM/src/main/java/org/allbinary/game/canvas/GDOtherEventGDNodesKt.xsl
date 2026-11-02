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

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/kotlin.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/case.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/indexof.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/replace.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/reverse.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/split.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDGlobalCallsKt.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDScalingKt.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDNodeIdKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDBuiltinCommonInstructionsGDNodeKt.xsl" />
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

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/event/GDJsCodeEventGDNodeKt.xsl" />

    <xsl:output method="text" indent="yes" />

    <xsl:template match="/game">

        <xsl:variable name="selectedLayoutIndex" ><GD_CURRENT_INDEX></xsl:variable>
        <xsl:variable name="selectedNodeIds" ><GD_NODE_IDS></xsl:variable>

package org.allbinary.game.canvas.node.builtin

import javax.microedition.lcdui.Graphics
import javax.microedition.lcdui.Image

import org.json.me.JSONArray
import org.json.me.JSONObject

<!--import org.allbinary.animation.AnimationBehavior;-->
import org.allbinary.canvas.GameGlobalsFactory
import org.allbinary.game.canvas.GDGameGlobals

import org.allbinary.game.canvas.GD<xsl:value-of select="$selectedLayoutIndex" />LayoutUtil
import org.allbinary.game.canvas.GD<xsl:value-of select="$selectedLayoutIndex" />GDObjectsFactory
import org.allbinary.game.canvas.GD<xsl:value-of select="$selectedLayoutIndex" />SpecialAnimationGlobals
import org.allbinary.game.canvas.GD<xsl:value-of select="$selectedLayoutIndex" />SpecialAnimationImageResources

import org.allbinary.game.canvas.GDExtensionGDNodes
import org.allbinary.game.configuration.persistance.GDStructure
import org.allbinary.game.layer.GDGameLayer
import org.allbinary.game.layer.CollidableCompositeLayer
import org.allbinary.game.layout.GDNode
import org.allbinary.game.layout.GDObject
import org.allbinary.game.layout.GDStrings
import org.allbinary.game.layout.GDObjectStrings
import org.allbinary.game.rand.MyRandomFactory
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton
import org.allbinary.input.motion.gesture.MotionGestureInput
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
import org.allbinary.logic.math.SmallIntegerSingletonFactory
import org.allbinary.string.CommonStrings
import org.allbinary.string.CommonSeps
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.io.file.FileSystem
import org.allbinary.logic.string.StringUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.allbinary.logic.NullUtil
import org.allbinary.time.TimeDelayHelper
import org.allbinary.util.ArrayUtil
import org.allbinary.game.layout.GDUtil

<!--import org.allbinary.game.configuration.persistance.JSONPersistance
import org.allbinary.game.layer.GDGameLayerFactory
import org.allbinary.game.layer.special.TempGameLayerUtil
import org.allbinary.game.layer.AllBinaryGameLayerManager
import org.allbinary.game.layer.identification.GroupLayerManagerListener
-->

<xsl:variable name="selectedNodeIdSet" select="substring(substring($selectedNodeIds, string-length($selectedNodeIds) - 1), 1, 1)" />
<xsl:variable name="lastDigit2" ><xsl:if test="4 >= $selectedNodeIdSet" >0</xsl:if><xsl:if test="$selectedNodeIdSet > 4" >1</xsl:if></xsl:variable>
//selectedNodeIdSet=<xsl:value-of select="$selectedNodeIdSet" />
open public class GD<xsl:value-of select="$selectedLayoutIndex" />BuiltIn<xsl:value-of select="$lastDigit2" />GDNodes
{

    companion object {

    private val instance: GD<xsl:value-of select="$selectedLayoutIndex" />BuiltIn<xsl:value-of select="$lastDigit2" />GDNodes = GD<xsl:value-of select="$selectedLayoutIndex" />BuiltIn<xsl:value-of select="$lastDigit2" />GDNodes()

    open public fun getInstance(): GD<xsl:value-of select="$selectedLayoutIndex" />BuiltIn<xsl:value-of select="$lastDigit2" />GDNodes {
        return GD<xsl:value-of select="$selectedLayoutIndex" />BuiltIn<xsl:value-of select="$lastDigit2" />GDNodes.instance
    }

    }

    val logUtil: LogUtil = LogUtil.getInstance()
    private val commonStrings: CommonStrings = CommonStrings.getInstance()
    private val nullUtil: NullUtil = NullUtil.getInstance()
    private val arrayUtil: ArrayUtil = ArrayUtil.getInstance()
    private val smallIntegerSingletonFactory: SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
    private val gameTickDisplayInfoSingleton: GameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance()
    private val gameGlobalsFactory: GameGlobalsFactory = GameGlobalsFactory.getInstance()

<!--
    private val stringUtil: StringUtil = StringUtil.getInstance()
    private val smallIntegerSingletonFactory: SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()

    private val objectStrings: GDObjectStrings = GDObjectStrings.getInstance()
-->

    private val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
    private val gdExtensionGDNodes: GDExtensionGDNodes = GDExtensionGDNodes.getInstance()

    private val gdObjectsFactory: GD<xsl:value-of select="$selectedLayoutIndex" />GDObjectsFactory = GD<xsl:value-of select="$selectedLayoutIndex" />GDObjectsFactory.getInstance()
    private val globals: GD<xsl:value-of select="$selectedLayoutIndex" />SpecialAnimationGlobals = GD<xsl:value-of select="$selectedLayoutIndex" />SpecialAnimationGlobals.getInstance()
    private val imageResources: GD<xsl:value-of select="$selectedLayoutIndex" />SpecialAnimationImageResources = GD<xsl:value-of select="$selectedLayoutIndex" />SpecialAnimationImageResources.getInstance()

    public constructor() {

    }

        <xsl:for-each select="externalEvents" >

            <xsl:variable name="associatedLayout" select="associatedLayout" />

            <xsl:variable name="layoutIndex" ><xsl:for-each select="../layouts" ><xsl:variable name="layoutIndex" select="position() - 1" /><xsl:if test="name = $associatedLayout" ><xsl:value-of select="$layoutIndex" /></xsl:if></xsl:for-each></xsl:variable>

            <xsl:if test="$selectedLayoutIndex = $layoutIndex" >

                <xsl:variable name="enlargeTheImageBackgroundForRotation" >true</xsl:variable>
                <xsl:variable name="layoutName" select="$associatedLayout" />
                <xsl:variable name="objectsGroupsAsString" >thiswasnullbefore,<xsl:for-each select="../layouts" ><xsl:if test="name = $layoutName" ><xsl:for-each select="objectsGroups" ><xsl:value-of select="name" />,</xsl:for-each></xsl:if></xsl:for-each></xsl:variable>
                <xsl:variable name="instancesAsString" >,<xsl:for-each select="../layouts" ><xsl:if test="name = $layoutName" ><xsl:for-each select="instances" ><xsl:value-of select="layer" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:if></xsl:for-each></xsl:variable>
                <xsl:variable name="objectsAsString" >,<xsl:for-each select="/game/objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each>,<xsl:for-each select="../layouts" ><xsl:if test="name = $layoutName" ><xsl:for-each select="objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:if></xsl:for-each></xsl:variable>
                <xsl:variable name="createdObjectsAsString" >thiswasnullbefore,<xsl:call-template name="externalEventsCreateActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="externalEventActionModVarSceneAsString" >thiswasnullbefore,<xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>

                    <xsl:call-template name="builtinCommonInstructionsGDNode" >
                        <xsl:with-param name="caller" >otherEventLayout</xsl:with-param>
                        <xsl:with-param name="selectedNodeIds" >
                            <xsl:value-of select="$selectedNodeIds" />
                        </xsl:with-param>
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
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

            </xsl:if>

        </xsl:for-each>

        <xsl:for-each select="externalLayouts" >

            <xsl:variable name="associatedLayout" select="associatedLayout" />

            <xsl:variable name="layoutIndex" ><xsl:for-each select="../layouts" ><xsl:variable name="layoutIndex" select="position() - 1" /><xsl:if test="name = $associatedLayout" ><xsl:value-of select="$layoutIndex" /></xsl:if></xsl:for-each></xsl:variable>

            <xsl:if test="$selectedLayoutIndex = $layoutIndex" >

                <xsl:variable name="enlargeTheImageBackgroundForRotation" >true</xsl:variable>
                <xsl:variable name="layoutName" select="$associatedLayout" />
                <xsl:variable name="objectsGroupsAsString" >thiswasnullbefore,<xsl:for-each select="../layouts" ><xsl:if test="name = $layoutName" ><xsl:for-each select="objectsGroups" ><xsl:value-of select="name" />,</xsl:for-each></xsl:if></xsl:for-each></xsl:variable>
                <xsl:variable name="instancesAsString" >,<xsl:for-each select="../layouts" ><xsl:if test="name = $layoutName" ><xsl:for-each select="instances" ><xsl:value-of select="layer" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:if></xsl:for-each></xsl:variable>
                <xsl:variable name="objectsAsString" >,<xsl:for-each select="/game/objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each>,<xsl:for-each select="../layouts" ><xsl:if test="name = $layoutName" ><xsl:for-each select="objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:if></xsl:for-each></xsl:variable>
                <xsl:variable name="createdObjectsAsString" >thiswasnullbefore,<xsl:call-template name="externalEventsCreateActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="externalLayoutActionModVarSceneAsString" >thiswasnullbefore,<xsl:call-template name="externalLayoutActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>

                    <xsl:call-template name="builtinCommonInstructionsGDNode" >
                        <xsl:with-param name="caller" >otherEventLayout</xsl:with-param>
                        <xsl:with-param name="selectedNodeIds" >
                            <xsl:value-of select="$selectedNodeIds" />
                        </xsl:with-param>
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
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

            </xsl:if>

        </xsl:for-each>

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />

            <xsl:if test="$selectedLayoutIndex = $layoutIndex" >

                <!-- Android images assets need to be enlarged if they are not setup to be inside the cirle area needed -->
                <xsl:variable name="enlargeTheImageBackgroundForRotation" >true</xsl:variable>
                <xsl:variable name="layoutName" select="name" />
                <xsl:variable name="objectsGroupsAsString" >,<xsl:for-each select="objectsGroups" ><xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="instancesAsString" >,<xsl:for-each select="instances" ><xsl:value-of select="layer" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="objectsAsString" >,<xsl:for-each select="/game/objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each>,<xsl:for-each select="objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="createdObjectsAsString" >,<xsl:call-template name="externalEventsCreateActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
<!--                <xsl:variable name="externalEventActionModVarSceneAsString" >,<xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>-->
                //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />

                    //builtinCommonInstructionsGDNode - START
                    <xsl:call-template name="builtinCommonInstructionsGDNode" >
                        <xsl:with-param name="caller" >otherEventLayout</xsl:with-param>
                        <xsl:with-param name="selectedNodeIds" >
                            <xsl:value-of select="$selectedNodeIds" />
                        </xsl:with-param>
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
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
                    //builtinCommonInstructionsGDNode - END

            </xsl:if>

        </xsl:for-each>

}

    </xsl:template>

    <xsl:key name="objectsByName" match="objects" use="name" />

    <xsl:key name="objectsGroupsByName" match="objectsGroups" use="name" />

</xsl:stylesheet>

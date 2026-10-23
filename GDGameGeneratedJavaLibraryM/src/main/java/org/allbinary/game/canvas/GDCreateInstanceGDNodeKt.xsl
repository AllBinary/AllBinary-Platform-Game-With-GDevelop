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

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionCentreCameraGlobalKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionZoomCameraGlobalKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDCreateInstancesKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDNodeIdKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDExternalEventsKt.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDExternalEventsGDNodesKt.xsl" />
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

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/event/GDExternalLinkEventGDNodeKt.xsl" />

    <xsl:output method="text" indent="yes" />

    <xsl:template match="/game">

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:if test="number($layoutIndex) =
                <GD_CURRENT_INDEX>" >
                    //layoutIndex=<xsl:value-of select="$layoutIndex" />
                    <xsl:variable name="layoutName" select="name" />
                <xsl:variable name="createInstanceIndex" select="<GD_CREATE_INSTANCE_INDEX>" />

                            //externalLayouts - externalLayoutsGDNodes

                package org.allbinary.game.canvas

                import javax.microedition.lcdui.Graphics

                import org.json.me.JSONArray
                import org.json.me.JSONObject

                import org.allbinary.AndroidUtil
                import org.allbinary.J2MEUtil
                import org.allbinary.game.layout.GDConfig
                import org.allbinary.animation.AnimationBehavior
                import org.allbinary.animation.special.SpecialAnimation
                import org.allbinary.game.canvas.GDExtensionGDNodes
                import org.allbinary.game.configuration.persistance.JSONPersistance
                import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton
                import org.allbinary.game.layer.special.GDConditionWithGroupActions
                import org.allbinary.game.layer.AllBinaryGameLayerManager
                import org.allbinary.game.layer.GDGameLayer
                import org.allbinary.game.layout.BaseGDNodeStats
                import org.allbinary.game.layout.GDNodeStatsFactory
                import org.allbinary.game.layout.GDNode
                import org.allbinary.game.layer.special.TempGameLayerUtil
                import org.allbinary.game.rand.MyRandomFactory
                import org.allbinary.string.CommonStrings
                import org.allbinary.string.CommonSeps
                import org.allbinary.logic.string.StringUtil
                import org.allbinary.logic.communication.log.LogUtil
                import org.allbinary.logic.NullUtil
                import org.allbinary.logic.string.StringMaker
                import org.allbinary.util.ArrayUtil
                import org.allbinary.util.BasicArrayList
                import org.allbinary.util.BasicArrayListD

                //CreateInstance name=<xsl:value-of select="$layoutName" />
                open public class GD<xsl:value-of select="$layoutIndex" />Game<xsl:value-of select="$createInstanceIndex" />CreateInstance
                {

                    companion object {

                    private val instance: GD<xsl:value-of select="$layoutIndex" />Game<xsl:value-of select="$createInstanceIndex" />CreateInstance =
                       GD<xsl:value-of select="$layoutIndex" />Game<xsl:value-of select="$createInstanceIndex" />CreateInstance()

                    open public fun getInstance(): GD<xsl:value-of select="$layoutIndex" />Game<xsl:value-of select="$createInstanceIndex" />CreateInstance {
                        return GD<xsl:value-of select="$layoutIndex" />Game<xsl:value-of select="$createInstanceIndex" />CreateInstance.instance
                    }
                    }

                    val logUtil: LogUtil = LogUtil.getInstance()

                    private val commonStrings: CommonStrings = CommonStrings.getInstance()
                    private val stringUtil: StringUtil = StringUtil.getInstance()
                    private val nullUtil: NullUtil = NullUtil.getInstance()
                    private val arrayUtil: ArrayUtil = ArrayUtil.getInstance()

                    //private val gdNodeStatsFactory: BaseGDNodeStats = GDNodeStatsFactory.getInstance()
                    private val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
                    //private val gdExtensionGDNodes: GDExtensionGDNodes = GDExtensionGDNodes.getInstance()

                    private val globals: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance()
                    //private val gdGlobalsObjectsFactory: GDGlobalsGDObjectsFactory = GDGlobalsGDObjectsFactory.getInstance()
                    private val gdObjectsFactory: GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory = GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.getInstance()

                    //private val CREATE_INSTANCES: String = "createInstances"

                    private constructor() {
                    }

                    open public fun init(imageResources: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources, resources: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources) {
                        try {

                    <xsl:call-template name="scale" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
                        </xsl:with-param>
                    </xsl:call-template>

                        <xsl:call-template name="createInstance" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="createInstanceIndex" >
                                <xsl:value-of select="$createInstanceIndex" />
                            </xsl:with-param>
                        </xsl:call-template>

                        } catch (e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e)
                        }

                    }
                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:key name="objectsByName" match="objects" use="name" />

    <xsl:key name="objectsGroupsByName" match="objectsGroups" use="name" />

</xsl:stylesheet>

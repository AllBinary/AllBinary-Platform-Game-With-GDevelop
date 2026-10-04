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
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDCreateInstances.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDNodeId.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDExternalEvents.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDExternalEventsGDNodes.xsl" />
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

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/event/GDExternalLinkEventGDNode.xsl" />

    <xsl:output method="html" indent="yes" />

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
                import org.allbinary.animation.AnimationBehavior
                import org.allbinary.animation.special.SpecialAnimation
                import org.allbinary.game.canvas.GDExtensionGDNodes
                import org.allbinary.game.configuration.persistance.JSONPersistance
                import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton
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

                    private val instance: GD<xsl:value-of select="$layoutIndex" />Game<xsl:value-of select="$createInstanceIndex" />CreateInstance =
                       GD<xsl:value-of select="$layoutIndex" />Game<xsl:value-of select="$createInstanceIndex" />CreateInstance()

                    open public fun getInstance(): GD<xsl:value-of select="$layoutIndex" />Game<xsl:value-of select="$createInstanceIndex" />CreateInstance {
                        return GD<xsl:value-of select="$layoutIndex" />Game<xsl:value-of select="$createInstanceIndex" />CreateInstance.instance
                    }

                    protected val logUtil: LogUtil = LogUtil.getInstance()

                    private val commonStrings: CommonStrings = CommonStrings.getInstance()
                    private val stringUtil: StringUtil = StringUtil.getInstance()
                    private val nullUtil: NullUtil = NullUtil.getInstance()
                    private val arrayUtil: ArrayUtil = ArrayUtil.getInstance()

                    //private final BaseGDNodeStats gdNodeStatsFactory = GDNodeStatsFactory.getInstance()
                    private val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
                    //private final GDExtensionGDNodes gdExtensionGDNodes = GDExtensionGDNodes.getInstance()

                    private val globals: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance()
                    //private final GDGlobalsGDObjectsFactory gdGlobalsObjectsFactory = GDGlobalsGDObjectsFactory.getInstance()
                    private val gdObjectsFactory: GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory = GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.getInstance()

                    private val CREATE_INSTANCES: String = "createInstances"

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

</xsl:stylesheet>

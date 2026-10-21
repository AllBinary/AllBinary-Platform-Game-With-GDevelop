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
                <!-- Android images assets need to be enlarged if they are not setup to be inside the cirle area needed -->
                <xsl:variable name="enlargeTheImageBackgroundForRotation" >true</xsl:variable>
                <xsl:variable name="layoutName" select="name" />

                package org.allbinary.game.canvas

                import org.allbinary.animation.AnimationBehavior
                import org.allbinary.animation.special.SpecialAnimation
                import org.allbinary.logic.communication.log.LogUtil
                import org.allbinary.logic.string.StringMaker
                import org.allbinary.string.CommonStrings
                import org.allbinary.util.BasicArrayList
                import org.allbinary.util.BasicArrayListD

                //LayoutExternalEvent name=<xsl:value-of select="$layoutName" />
                open public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalLayoutGDNodes : SpecialAnimation
                {

                    companion object {

                    private val instance: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalLayoutGDNodes =
                       GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalLayoutGDNodes()

                    open public fun getInstance(): GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalLayoutGDNodes {
                        return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalLayoutGDNodes.instance
                    }

                    }

<!--                private val stringUtil: StringUtil = StringUtil.getInstance()
                    private val nullUtil: NullUtil = NullUtil.getInstance()
                    private val arrayUtil: ArrayUtil = ArrayUtil.getInstance()

                    private val gdNodeStatsFactory: BaseGDNodeStats = GDNodeStatsFactory.getInstance()
                    private val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
                    private val gdExtensionGDNodes: GDExtensionGDNodes = GDExtensionGDNodes.getInstance()-->

                    private val globals: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance()
<!--                private val gdGlobalsObjectsFactory: GDGlobalsGDObjectsFactory = GDGlobalsGDObjectsFactory.getInstance()
                    private val gdObjectsFactory: GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory = GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.getInstance()-->

                    public val layoutNameList: BasicArrayList = BasicArrayListD()
                    public val layoutGDNodeList: BasicArrayList = BasicArrayListD()

                    open fun createSpecialAnimationImageResources(): GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources? {
                        try {
                            return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources.getInstanceOrCreate()
                        } catch (e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + "GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources", this, this.commonStrings.CONSTRUCTOR, e)
                        }
                        return null
                    }

                    open fun createSpecialAnimationGDResources(): GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources? {
                        try {
                            return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources.getInstanceOrCreate()
                        } catch (e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e)
                        }
                        return null
                    }

                    private constructor() : super(AnimationBehavior.getInstance()) {

                        try {

                            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR)

<!--                    <xsl:call-template name="scale" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
                        </xsl:with-param>
                    </xsl:call-template>-->

                            val imageResources: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources = this.createSpecialAnimationImageResources()!!

                            val resources: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources = this.createSpecialAnimationGDResources()!!

                            <xsl:for-each select="../externalLayouts" >
                                <xsl:if test="$layoutName = associatedLayout" >
                                    //externalLayouts - externalLayoutsGDNodes
                                    <xsl:call-template name="externalLinkLayoutGDNodeCall" >
                                        <xsl:with-param name="layoutIndex" >
                                            <xsl:value-of select="$layoutIndex" />
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:if>
                            </xsl:for-each>

                            this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.CONSTRUCTOR)

                        } catch (e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e)
                        }

                    }

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

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

                    private val instance: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalLayoutGDNodes =
                       GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalLayoutGDNodes()

                    open public fun getInstance(): GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalLayoutGDNodes {
                        return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalLayoutGDNodes.instance
                    }

                    protected val logUtil: LogUtil = LogUtil.getInstance()

                    private val commonStrings: CommonStrings = CommonStrings.getInstance()
<!--                private final StringUtil stringUtil = StringUtil.getInstance();
                    private final NullUtil nullUtil = NullUtil.getInstance();
                    private final ArrayUtil arrayUtil = ArrayUtil.getInstance();

                    private final BaseGDNodeStats gdNodeStatsFactory = GDNodeStatsFactory.getInstance();
                    private final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
                    private final GDExtensionGDNodes gdExtensionGDNodes = GDExtensionGDNodes.getInstance();-->

                    private val globals: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance()
<!--                private final GDGlobalsGDObjectsFactory gdGlobalsObjectsFactory = GDGlobalsGDObjectsFactory.getInstance();
                    private final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory gdObjectsFactory = GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.getInstance();-->

                    public val layoutNameList: BasicArrayList = BasicArrayListD()
                    public val layoutGDNodeList: BasicArrayList = BasicArrayListD()

                    private fun createSpecialAnimationImageResources(): GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources {
                        try {
                            return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources.getInstanceOrCreate()
                        } catch (e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + "GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources", this, this.commonStrings.CONSTRUCTOR, e)
                        }
                        var null: return
                    }

                    private fun createSpecialAnimationGDResources(): GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources {
                        try {
                            return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources.getInstanceOrCreate()
                        } catch (e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e)
                        }
                        var null: return
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

                            val imageResources: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources = this.createSpecialAnimationImageResources()

                            val resources: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources = this.createSpecialAnimationGDResources()

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

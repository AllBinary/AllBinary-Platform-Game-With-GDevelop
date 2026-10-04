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
                import org.allbinary.game.layout.GDNode
                import org.allbinary.game.layer.special.TempGameLayerUtil
                import org.allbinary.game.rand.MyRandomFactory
                import org.allbinary.input.motion.gesture.MotionGestureInput
                import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
                import org.allbinary.string.CommonStrings
                import org.allbinary.string.CommonSeps
                import org.allbinary.logic.string.StringUtil
                import org.allbinary.logic.communication.log.LogUtil
                import org.allbinary.logic.NullUtil
                import org.allbinary.util.ArrayUtil

                //LayoutExternalEvent name=<xsl:value-of select="$layoutName" />
                open public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalEventGDNodes : SpecialAnimation
                {

                    private val instance: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalEventGDNodes =
                       GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalEventGDNodes()

                    open public fun getInstance(): GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalEventGDNodes {
                        return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalEventGDNodes.instance
                    }

                    protected val logUtil: LogUtil = LogUtil.getInstance()
                    private val commonStrings: CommonStrings = CommonStrings.getInstance()
                    private val stringUtil: StringUtil = StringUtil.getInstance()
                    private val nullUtil: NullUtil = NullUtil.getInstance()
                    private val arrayUtil: ArrayUtil = ArrayUtil.getInstance()

                    private val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
                    private val gdExtensionGDNodes: GDExtensionGDNodes = GDExtensionGDNodes.getInstance()

                    private val globals: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance()

                    private constructor() : super(AnimationBehavior.getInstance()) {

                        try {

                            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR)

                            <xsl:for-each select="../externalEvents" >
                                <xsl:if test="$layoutName = associatedLayout" >
                                    //externalEvents - externalLinkEventGDNodes
                                    <xsl:call-template name="externalLinkEventGDNode" />
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

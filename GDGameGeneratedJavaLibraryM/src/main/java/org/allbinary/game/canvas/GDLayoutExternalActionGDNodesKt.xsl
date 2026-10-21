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

    <xsl:output method="text" indent="yes" />

    <xsl:template match="/game">

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutName" select="name" />
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
                import org.json.me.JSONTokener

                import org.allbinary.AndroidUtil
                import org.allbinary.J2MEUtil
                import org.allbinary.animation.AnimationBehavior
                import org.allbinary.animation.special.SpecialAnimation
                import org.allbinary.game.canvas.GDExtensionGDNodes
                import org.allbinary.game.configuration.persistance.GDStructure
                import org.allbinary.game.configuration.persistance.JSONPersistance
                import org.allbinary.game.layer.GDGameLayer
                import org.allbinary.game.layout.GDNode
                import org.allbinary.game.layer.special.TempGameLayerUtil
                import org.allbinary.game.layout.GDObject
                import org.allbinary.game.layer.AllBinaryGameLayerManager
                import org.allbinary.game.layer.behavior.GDBehaviorUtil
                import org.allbinary.game.layer.behavior.PathFindingBehavior
                import org.allbinary.game.rand.MyRandomFactory
                import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton
                import org.allbinary.logic.communication.log.LogUtil
                import org.allbinary.string.CommonStrings
                import org.allbinary.string.CommonSeps
                import org.allbinary.logic.string.StringMaker
                import org.allbinary.logic.string.StringUtil
                import org.allbinary.time.GameTickTimeDelayHelper
                import org.allbinary.time.GameTickTimeDelayHelperFactory
                import org.allbinary.util.BasicArrayList
                import org.allbinary.util.BasicArrayListD
                import org.allbinary.util.ArrayUtil
                import org.allbinary.media.audio.PlayerComposite
                import org.allbinary.media.audio.Sound
                import org.allbinary.logic.math.SmallIntegerSingletonFactory
                import org.allbinary.thread.PathFindingThreadPool
                import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

                //LayoutExternalAction name=<xsl:value-of select="$layoutName" />
                open public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalActionGDNodes : SpecialAnimation
                {

                    private val instance: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalActionGDNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalActionGDNodes()

                        open public fun getInstance(): GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalActionGDNodes {
                            return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalActionGDNodes.instance
                        }

                        private val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
                        private val gdExtensionGDNodes: GDExtensionGDNodes = GDExtensionGDNodes.getInstance()

                        //private val gd<xsl:value-of select="$layoutIndex" />ExternalActionGDNodes: GD<xsl:value-of select="$layoutIndex" />ExternalActionGDNodes = GD<xsl:value-of select="$layoutIndex" />ExternalActionGDNodes.getInstance()

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

                    <xsl:call-template name="externalEventsCreateAssignGDObjectAction" >
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
                        </xsl:with-param>
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>

                    </xsl:call-template>

                    this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.CONSTRUCTOR)

                        } catch (e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e)
                        }

                    }

<!--
                    open fun SceneWindowWidth(): Int {
                        return gameTickDisplayInfoSingleton.getLastWidth()
                    }

                    open fun SceneWindowHeight(): Int {
                        return gameTickDisplayInfoSingleton.getLastHeight()
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

                    open fun Random(range: Int): Int {
                        return MyRandomFactory.getInstance().getAbsoluteNextInt(range + 1)
                    }

                    open fun VariableString(string: String): String {
                        return string
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

                    open fun ToString(value: Int): String {
                        if(this.abs(value) <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 499) {
                            return value.toString()
                        } else {
                            return smallIntegerSingletonFactory.getString(value)
                        }
                    }
                    -->

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

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

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDBuiltinCommonInstructionsExtensionGDNode.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionGDNodeAction.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/event/GDExtensionGDNode.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

                package org.allbinary.game.canvas

                import javax.microedition.lcdui.Graphics

                import org.json.me.JSONArray
                import org.json.me.JSONObject

                import org.allbinary.AndroidUtil
                import org.allbinary.J2MEUtil
                import org.allbinary.animation.AnimationBehavior
                import org.allbinary.animation.special.SpecialAnimation
                import org.allbinary.game.configuration.persistance.JSONPersistance
                import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton
                import org.allbinary.game.layer.AllBinaryGameLayerManager
                import org.allbinary.game.layer.GDGameLayer
                import org.allbinary.game.layout.GDNode
                import org.allbinary.game.layout.GDObject
                import org.allbinary.game.layout.BaseGDNodeStats
                import org.allbinary.game.layout.GDNodeStatsFactory
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

                //Search for "//extensionNames"
                //Current exclusion list (Used by RPG) - TextInputVirtualKeyboard, TouchScreen, PanelSpriteSlider, MirrorFillBarExtension, SpriteMultitouchJoystick'
                open public class GDExtensionGDNodes : SpecialAnimation
                {

                    private val instance: GDExtensionGDNodes = GDExtensionGDNodes()

                    open public fun getInstance(): GDExtensionGDNodes {
                        return GDExtensionGDNodes.instance
                    }

                    protected val logUtil: LogUtil = LogUtil.getInstance()
                    private val commonStrings: CommonStrings = CommonStrings.getInstance()
                    private val stringUtil: StringUtil = StringUtil.getInstance()
                    private val nullUtil: NullUtil = NullUtil.getInstance()
                    private val arrayUtil: ArrayUtil = ArrayUtil.getInstance()

                    private val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
                    private val gdNodeStatsFactory: BaseGDNodeStats = GDNodeStatsFactory.getInstance()

        <xsl:for-each select="eventsFunctionsExtensions" >
            <xsl:variable name="extensionName" ><xsl:value-of select="name" /></xsl:variable>
            <xsl:for-each select="eventsFunctions" >
                <xsl:variable name="eventsFunctionsName" ><xsl:value-of select="name" /></xsl:variable>
                    <xsl:if test="$extensionName = 'TextInputVirtualKeyboard' or $extensionName = 'TouchScreen' or $extensionName = 'PanelSpriteSlider' or $extensionName = 'MirrorFillBarExtension' or $extensionName = 'SpriteMultitouchJoystick'" >//</xsl:if>public val <xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode: GDNode
            </xsl:for-each>
            <xsl:for-each select="eventsBasedObjects" >
                <xsl:variable name="eventsBasedObjectsName" ><xsl:value-of select="name" /></xsl:variable>
                <xsl:for-each select="eventsFunctions" >
                    <xsl:variable name="eventsFunctionsName" ><xsl:value-of select="name" /></xsl:variable>
                    <xsl:if test="$extensionName = 'TextInputVirtualKeyboard' or $extensionName = 'TouchScreen' or $extensionName = 'PanelSpriteSlider' or $extensionName = 'MirrorFillBarExtension' or $extensionName = 'SpriteMultitouchJoystick'" >//</xsl:if>public val <xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsBasedObjectsName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode: GDNode
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="globalVariables" >
                    //<xsl:value-of select="name" /> - //version=<xsl:value-of select="version" /> - //globalVariables
            </xsl:for-each>
            <xsl:for-each select="sceneVariables" >
                    //<xsl:value-of select="name" /> - //version=<xsl:value-of select="version" /> - //sceneVariables
            </xsl:for-each>
        </xsl:for-each>

        <xsl:for-each select="eventsFunctionsExtensions" >
            <xsl:variable name="extensionName" ><xsl:value-of select="name" /></xsl:variable>
            //Map calls to extensions
            open public class <xsl:value-of select="$extensionName" /> {
            <xsl:for-each select="eventsFunctions" >
                <xsl:variable name="eventsFunctionsName" ><xsl:value-of select="name" /></xsl:variable>
                <xsl:if test="not(functionType = 'Action' or functionType = 'Condition')" >
                //functionType=<xsl:value-of select="functionType" />
                <xsl:if test="functionType = 'StringExpression'" >
                //<xsl:for-each select="parameters" >type=<xsl:value-of select="type" /></xsl:for-each>
                open public fun <xsl:value-of select="$eventsFunctionsName" />(<xsl:for-each select="parameters" ><xsl:value-of select="type" />: <xsl:if test="type = 'scenevar'" >String</xsl:if></xsl:for-each>): String {
                    return stringUtil.EMPTY_STRING
                }
                </xsl:if>
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="eventsBasedObjects" >
                <xsl:variable name="eventsBasedObjectsName" ><xsl:value-of select="name" /></xsl:variable>
                open public class <xsl:value-of select="$eventsBasedObjectsName" />EventBasedObject {
                <xsl:for-each select="eventsFunctions" >
                    <xsl:variable name="eventsFunctionsName" ><xsl:value-of select="name" /></xsl:variable>
                    <xsl:if test="not(functionType = 'Action' or functionType = 'Condition')" >
                    //functionType=<xsl:value-of select="functionType" />
                    <xsl:if test="functionType = 'StringExpression'" >
                        //<xsl:for-each select="parameters" >type=<xsl:value-of select="type" /></xsl:for-each>
                        public <xsl:value-of select="expressionType" /><xsl:text> </xsl:text><xsl:value-of select="$eventsFunctionsName" />(<xsl:for-each select="parameters" ><xsl:if test="type = 'scenevar'" >String</xsl:if><xsl:text> </xsl:text><xsl:value-of select="type" /></xsl:for-each>) {
                        return stringUtil.EMPTY_STRING
                    }
                    </xsl:if>
                    </xsl:if>
                </xsl:for-each>
                }

                public final <xsl:value-of select="$eventsBasedObjectsName" />EventBasedObject<xsl:text> </xsl:text><xsl:value-of select="$eventsBasedObjectsName" />EventBasedObject = <xsl:value-of select="$eventsBasedObjectsName" />EventBasedObject()
            </xsl:for-each>

            }

            public final <xsl:value-of select="$extensionName" /><xsl:text> </xsl:text><xsl:value-of select="$extensionName" /> = <xsl:value-of select="$extensionName" />()

        </xsl:for-each>

                    private constructor() : super(AnimationBehavior.getInstance()) {

        <xsl:for-each select="eventsFunctionsExtensions" >
            <xsl:variable name="extensionName" ><xsl:value-of select="name" /></xsl:variable>
            <xsl:for-each select="eventsFunctions" >
                <xsl:variable name="eventsFunctionsName" ><xsl:value-of select="name" /></xsl:variable>
                        <xsl:if test="$extensionName = 'TextInputVirtualKeyboard' or $extensionName = 'TouchScreen' or $extensionName = 'PanelSpriteSlider' or $extensionName = 'MirrorFillBarExtension' or $extensionName = 'SpriteMultitouchJoystick'" >//</xsl:if>var <xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode: GDNode = null
            </xsl:for-each>
            <xsl:for-each select="eventsBasedObjects" >
                <xsl:variable name="eventsBasedObjectsName" ><xsl:value-of select="name" /></xsl:variable>
                <xsl:for-each select="eventsFunctions" >
                    <xsl:variable name="eventsFunctionsName" ><xsl:value-of select="name" /></xsl:variable>
                        <xsl:if test="$extensionName = 'TextInputVirtualKeyboard' or $extensionName = 'TouchScreen' or $extensionName = 'PanelSpriteSlider' or $extensionName = 'MirrorFillBarExtension' or $extensionName = 'SpriteMultitouchJoystick'" >//</xsl:if>var <xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsBasedObjectsName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode: GDNode = null
                </xsl:for-each>
            </xsl:for-each>

        </xsl:for-each>

                        try {

                            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR)

                            <xsl:for-each select="eventsFunctionsExtensions" >
                                <xsl:variable name="extensionName" ><xsl:value-of select="name" /></xsl:variable>
                            //eventsFunctionsExtensions - //extensionNames - <xsl:value-of select="$extensionName" /> <xsl:if test="$extensionName = 'TextInputVirtualKeyboard' or $extensionName = 'TouchScreen' or $extensionName = 'PanelSpriteSlider' or $extensionName = 'MirrorFillBarExtension' or $extensionName = 'SpriteMultitouchJoystick'" >- excluded</xsl:if>
                                <xsl:if test="not($extensionName = 'TextInputVirtualKeyboard' or $extensionName = 'TouchScreen' or $extensionName = 'PanelSpriteSlider' or $extensionName = 'MirrorFillBarExtension' or $extensionName = 'SpriteMultitouchJoystick')" >
                            <xsl:call-template name="extensionGDNode" />
                                </xsl:if>
                            </xsl:for-each>

                            this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.CONSTRUCTOR)

                        } catch (e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e)
                        }

        <xsl:for-each select="eventsFunctionsExtensions" >
            <xsl:variable name="extensionName" ><xsl:value-of select="name" /></xsl:variable>
            <xsl:for-each select="eventsFunctions" >
                <xsl:variable name="eventsFunctionsName" ><xsl:value-of select="name" /></xsl:variable>
                        <xsl:if test="$extensionName = 'TextInputVirtualKeyboard' or $extensionName = 'TouchScreen' or $extensionName = 'PanelSpriteSlider' or $extensionName = 'MirrorFillBarExtension' or $extensionName = 'SpriteMultitouchJoystick'" >//</xsl:if>this.<xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode = <xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode
            </xsl:for-each>
            <xsl:for-each select="eventsBasedObjects" >
                <xsl:variable name="eventsBasedObjectsName" ><xsl:value-of select="name" /></xsl:variable>
                <xsl:for-each select="eventsFunctions" >
                    <xsl:variable name="eventsFunctionsName" ><xsl:value-of select="name" /></xsl:variable>
                        <xsl:if test="$extensionName = 'TextInputVirtualKeyboard' or $extensionName = 'TouchScreen' or $extensionName = 'PanelSpriteSlider' or $extensionName = 'MirrorFillBarExtension' or $extensionName = 'SpriteMultitouchJoystick'" >//</xsl:if>this.<xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsBasedObjectsName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode = <xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsBasedObjectsName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode
                </xsl:for-each>
            </xsl:for-each>

        </xsl:for-each>

                    }

        <xsl:for-each select="eventsFunctionsExtensions" >
            <xsl:variable name="extensionName" ><xsl:value-of select="name" /></xsl:variable>
            <xsl:if test="not($extensionName = 'TextInputVirtualKeyboard' or $extensionName = 'TouchScreen' or $extensionName = 'PanelSpriteSlider' or $extensionName = 'MirrorFillBarExtension' or $extensionName = 'SpriteMultitouchJoystick')" >
            <xsl:for-each select="eventsFunctions" >
                <xsl:call-template name="eventsFunctions" />
            </xsl:for-each>
            <xsl:for-each select="eventsBasedObjects" >
                <xsl:for-each select="eventsFunctions" >
                    <xsl:call-template name="eventsFunctions" />
                </xsl:for-each>
            </xsl:for-each>
            </xsl:if>
        </xsl:for-each>

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

                    open public fun GetArgumentAsNumber(value: Int): Int {
                        var value: return
                    }

                }
    </xsl:template>

    <xsl:template name="eventsFunctions" >
                <xsl:variable name="objectsGroupsAsString" >,<xsl:for-each select="objectsGroups" ><xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="instancesAsString" >,<xsl:for-each select="instances" ><xsl:value-of select="layer" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="objectsAsString" >,<xsl:for-each select="/game/objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each>,<xsl:for-each select="objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="createdObjectsAsString" >,<xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />

                    <xsl:for-each select="events" >
<!--                    //extension - childevents - START-->
                    <xsl:call-template name="builtinCommonInstructionsExtensionGDNode" >
                        <xsl:with-param name="caller" >eventLayout</xsl:with-param>
                        <xsl:with-param name="selectedNodeIds" >All</xsl:with-param>
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >Extension</xsl:with-param>
                        <xsl:with-param name="layoutName" >Extension</xsl:with-param>
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
<!--                    //extension - childevents - END-->
                    </xsl:for-each>

                    //extension - conditions - START
                    <xsl:call-template name="eventsCreateAssignGDObjectGDNodesCondition" >
                        <xsl:with-param name="caller" >conditionLayout</xsl:with-param>
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="forExtension" >found</xsl:with-param>
                        <xsl:with-param name="layoutIndex" >Extension</xsl:with-param>
                        <xsl:with-param name="thisNodeIndex" >
                            <xsl:value-of select="-2" />
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
                    //extension - conditions - END

                    <xsl:variable name="selectedNodeIds" ></xsl:variable>

                    //extension - actions - START
                    <xsl:call-template name="actionGDNodes" >
                        <xsl:with-param name="caller" >actionLayout</xsl:with-param>
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="forExtension" >found</xsl:with-param>
                        <xsl:with-param name="layoutIndex" >Extension</xsl:with-param>
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
                    //extension - actions - END

    </xsl:template>

</xsl:stylesheet>

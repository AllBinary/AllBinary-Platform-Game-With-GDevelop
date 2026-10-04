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

    <xsl:template match="/game">

                <!-- Android images assets need to be enlarged if they are not setup to be inside the cirle area needed -->
                <xsl:variable name="enlargeTheImageBackgroundForRotation" >true</xsl:variable>
                <xsl:variable name="gameName" select="properties/name" />
                <xsl:variable name="layoutIndex" >Global</xsl:variable>
                <xsl:variable name="objectsGroupsAsString" >,<xsl:for-each select="objectsGroups" ><xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="instancesAsString" >,<xsl:for-each select="instances" ><xsl:value-of select="layer" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="objectsAsString" >,<xsl:for-each select="/game/objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each>,<xsl:for-each select="objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="createdObjectsAsString" >,<xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />

                package org.allbinary.game.canvas

                import javax.microedition.lcdui.Graphics

                import org.json.me.JSONArray
                import org.json.me.JSONObject

                import org.allbinary.game.canvas.GDExtensionGDNodes
                import org.allbinary.game.layer.GDGameLayer
                import org.allbinary.graphics.PointFactory
                import org.allbinary.graphics.color.BasicColorFactory
                import org.allbinary.graphics.color.BasicColorSetUtil
                import org.allbinary.logic.communication.log.LogUtil
                import org.allbinary.logic.io.file.FileSystem
                import org.allbinary.string.CommonStrings
                import org.allbinary.logic.NullUtil
                import org.allbinary.util.ArrayUtil
                import org.allbinary.util.BasicArrayList
                import org.allbinary.util.BasicArrayListD

                //Game name=<xsl:value-of select="$gameName" />
                open public class GDGlobalsSpecialAnimation : GDSpecialAnimation
                {

                    private val instance: GDGlobalsSpecialAnimation = GDGlobalsSpecialAnimation()
<!--
                    private static GDGlobalsSpecialAnimation instance;

                    public static GDGlobalsSpecialAnimation create()
                    {
                        GDGlobalsSpecialAnimation.instance = new GDGlobalsSpecialAnimation();
                        return GDGlobalsSpecialAnimation.instance;
                    }
-->

                        open public fun getInstance(): GDGlobalsSpecialAnimation {
                            return GDGlobalsSpecialAnimation.instance
                        }

                        protected val logUtil: LogUtil = LogUtil.getInstance()
                        private val commonStrings: CommonStrings = CommonStrings.getInstance()
                        private val nullUtil: NullUtil = NullUtil.getInstance()
                        private val arrayUtil: ArrayUtil = ArrayUtil.getInstance()
                        private val pointFactory: PointFactory = PointFactory.getInstance()

                        private val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
                        private val gdExtensionGDNodes: GDExtensionGDNodes = GDExtensionGDNodes.getInstance()

                        //layers=<xsl:for-each select="layers" ><xsl:value-of select="name" />,</xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        //behaviorsSharedData=<xsl:for-each select="behaviorsSharedData" >type=<xsl:value-of select="type" />,</xsl:for-each>
                        <xsl:text>&#10;</xsl:text>

                    public constructor() {

                        this.logUtil.putF(this.commonStrings.CONSTRUCTOR, this, this.commonStrings.CONSTRUCTOR)
                    }

                    open public fun process(timeDelta: Long) {
                        try {

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
                           size = removeList.size()
                           for(index in 0 until size) {
                               gdGameLayer = removeList.get(index) as GDGameLayer
                               gdGameLayer.setDestroyed(true)
                               //this.logUtil.putF("Behavior objectName=<xsl:value-of select="name" /> size=<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList size: " + <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.size(), this, this.commonStrings.PROCESS)
                           }

                           size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.size()
                           var gameLayer: GDGameLayer
                           for(index in 0 until size) {
                               gameLayer = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.get(index) as GDGameLayer)
                               gameLayer.process(timeDelta)
                               gameLayer.animate(timeDelta)
                           }

                        </xsl:if>
                        <xsl:if test="not(behaviors)" >
                           //Behavior - non animation
                           size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.size()
                           for(index in 0 until size) {
                               (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.get(index) as GDGameLayer).animate(timeDelta)
                           }
                        </xsl:if>
                        }
                    </xsl:for-each>

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

                    //instances - START
                    <xsl:for-each select="instances" >
                        <xsl:variable name="textObjectTextName" >TextObject::Text:<xsl:value-of select="name" /></xsl:variable>
                        <xsl:if test="contains($objectsAsString, $textObjectTextName)" >
                        //TextObject::Text instance
                        val <xsl:value-of select="name" />Size: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />RectangleList.size()
                        if(<xsl:value-of select="name" />Size != 0) {

                        <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="name" /></xsl:variable>

                            final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="name" />GDobject = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.get(0) as GDGameLayer) as <xsl:value-of select="$gdObjectFactory" />.gdObject
                            val <xsl:value-of select="name" />X: Int = x + <xsl:value-of select="name" />GDobject.x
                            val <xsl:value-of select="name" />Y: Int = y + <xsl:value-of select="name" />GDobject.y

                            //TextObject::Text - //Rectangle 1
                            val <xsl:value-of select="name" />Rectangle: Rectangle = Rectangle(
                                pointFactory.createXY(<xsl:value-of select="name" />X, <xsl:value-of select="name" />Y),
                                <xsl:value-of select="name" />GDobject.Width(globals.graphics) * scale, <xsl:value-of select="name" />GDobject.Height(globals.graphics) * scale)
                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />RectangleList.add(<xsl:value-of select="name" />Rectangle)
                        }
                        </xsl:if>
                    </xsl:for-each>
                    //instances - END

                    }

                }

    </xsl:template>

</xsl:stylesheet>

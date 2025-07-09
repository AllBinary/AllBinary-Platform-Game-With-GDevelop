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
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDHack.xsl" />
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDScaling.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDNodeId.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDBuiltinCommonInstructionsGDNode.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDExternalEvents.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassProperty.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassPropertyGDObjects.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAssign.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAtIndex.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyActions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyConditions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObject.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventWithOnceCondition.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventPaint.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventLogicConstruction.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventProcess.xsl" />
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/event/GDJsCodeEventGDNode.xsl" />
    
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">
        
        <xsl:variable name="selectedLayoutIndex" ><GD_CURRENT_INDEX></xsl:variable>
        <xsl:variable name="selectedNodeIds" ><GD_NODE_IDS></xsl:variable>

package org.allbinary.game.canvas.node.builtin;

import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;

<!--import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.special.SpecialAnimation;-->
import org.allbinary.game.canvas.GDGameGlobals;

import org.allbinary.game.canvas.GD<xsl:value-of select="$selectedLayoutIndex" />GDObjectsFactory;
import org.allbinary.game.canvas.GD<xsl:value-of select="$selectedLayoutIndex" />SpecialAnimationGlobals;
import org.allbinary.game.canvas.GD<xsl:value-of select="$selectedLayoutIndex" />SpecialAnimationImageResources;

import org.allbinary.game.layer.GDGameLayer;
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.game.layout.GDNode;
import org.allbinary.game.layout.GDObject;
import org.allbinary.game.layout.GDObjectStrings;
import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
import org.allbinary.input.motion.gesture.MotionGestureInput;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.string.CommonStrings;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.logic.NullUtil;
import org.allbinary.util.ArrayUtil;

<!--import org.allbinary.game.configuration.persistance.JSONPersistance;
import org.allbinary.game.layer.GDGameLayerFactory;
import org.allbinary.game.layer.special.TempGameLayerUtil;
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
import org.allbinary.game.layout.GDObject;
import org.allbinary.game.layout.GDObjectStrings;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.game.layer.identification.GroupLayerManagerListener;
-->

<xsl:variable name="selectedNodeIdSet" select="substring(substring($selectedNodeIds, string-length($selectedNodeIds) - 1), 1, 1)" />
<xsl:variable name="lastDigit2" ><xsl:if test="4 >= $selectedNodeIdSet" >0</xsl:if><xsl:if test="$selectedNodeIdSet > 4" >1</xsl:if></xsl:variable>
//selectedNodeIdSet=<xsl:value-of select="$selectedNodeIdSet" />
public class GD<xsl:value-of select="$selectedLayoutIndex" />BuiltIn<xsl:value-of select="$lastDigit2" />GDNodes
{

    private static final GD<xsl:value-of select="$selectedLayoutIndex" />BuiltIn<xsl:value-of select="$lastDigit2" />GDNodes instance = new GD<xsl:value-of select="$selectedLayoutIndex" />BuiltIn<xsl:value-of select="$lastDigit2" />GDNodes();

    public static final GD<xsl:value-of select="$selectedLayoutIndex" />BuiltIn<xsl:value-of select="$lastDigit2" />GDNodes getInstance() {
        return instance;
    }

    protected final LogUtil logUtil = LogUtil.getInstance();
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final NullUtil nullUtil = NullUtil.getInstance();
    private final ArrayUtil arrayUtil = ArrayUtil.getInstance();
    private final GameTickDisplayInfoSingleton gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();
    
<!--
    private final StringUtil stringUtil = StringUtil.getInstance();
    private final SmallIntegerSingletonFactory smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();

    private final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
-->
    
    private final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
    
    private final GD<xsl:value-of select="$selectedLayoutIndex" />GDObjectsFactory gdObjectsFactory = GD<xsl:value-of select="$selectedLayoutIndex" />GDObjectsFactory.getInstance();
    private final GD<xsl:value-of select="$selectedLayoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$selectedLayoutIndex" />SpecialAnimationGlobals.getInstance();
    private final GD<xsl:value-of select="$selectedLayoutIndex" />SpecialAnimationImageResources imageResources = GD<xsl:value-of select="$selectedLayoutIndex" />SpecialAnimationImageResources.getInstance();
    
    public GD<xsl:value-of select="$selectedLayoutIndex" />BuiltIn<xsl:value-of select="$lastDigit2" />GDNodes() {

    }    

        <xsl:for-each select="externalEvents" >

            <xsl:variable name="associatedLayout" select="associatedLayout" />
            
            <xsl:variable name="layoutIndex" ><xsl:for-each select="../layouts" ><xsl:variable name="layoutIndex" select="position() - 1" /><xsl:if test="name = $associatedLayout" ><xsl:value-of select="$layoutIndex" /></xsl:if></xsl:for-each></xsl:variable>

            <xsl:if test="$selectedLayoutIndex = $layoutIndex" >

                <xsl:variable name="enlargeTheImageBackgroundForRotation" >true</xsl:variable>
                <xsl:variable name="layoutName" select="null" />
                <xsl:variable name="objectsGroupsAsString" >null</xsl:variable>
                <xsl:variable name="instancesAsString" >null</xsl:variable>
                <xsl:variable name="objectsAsString" >null</xsl:variable>
                <xsl:variable name="createdObjectsAsString" >null</xsl:variable>
                <xsl:variable name="externalEventActionModVarSceneAsString" >null</xsl:variable>
                        
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
                <xsl:variable name="externalEventActionModVarSceneAsString" >,<xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
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

    public int SceneWindowWidth() {
        return gameTickDisplayInfoSingleton.getLastWidth();
    }

    public int SceneWindowHeight() {
        return gameTickDisplayInfoSingleton.getLastHeight();
    }

    public int Variable(final int value) {
        return value;
    }

    public double Variable(final double value) {
        return value;
    }

    public String VariableString(final String string) {
        return string;
    }

    public String VariableString(final Object object) {
        return object.toString();
    }

    public int VariableChildCount(final String[] array) {
        return array.length;
    }

    public int VariableChildCount(final int[] array) {
        return array.length;
    }

    public String GlobalVariable(final String value) {
        return value;
    }

    public long GlobalVariable(final long value) {
        return value;
    }

    public int GlobalVariable(final int value) {
        return value;
    }

    public int Random(final int range) {
        return MyRandomFactory.getInstance().getAbsoluteNextInt(range + 1);
    }

}

    </xsl:template>

</xsl:stylesheet>

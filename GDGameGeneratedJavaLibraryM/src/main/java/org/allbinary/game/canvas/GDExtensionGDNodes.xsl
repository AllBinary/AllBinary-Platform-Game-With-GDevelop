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
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventPaint.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventLogicConstruction.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventProcess.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionGDNodeAction.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/event/GDExtensionGDNode.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

                package org.allbinary.game.canvas;

                import javax.microedition.lcdui.Graphics;
                
                import org.allbinary.animation.AnimationBehavior;
                import org.allbinary.animation.special.SpecialAnimation;
                import org.allbinary.game.configuration.persistance.JSONPersistance;
                import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
                import org.allbinary.game.layer.AllBinaryGameLayerManager;
                import org.allbinary.game.layer.GDGameLayer;
                import org.allbinary.game.layout.GDNode;
                import org.allbinary.game.layout.GDObject;
                import org.allbinary.game.layer.special.TempGameLayerUtil;
                import org.allbinary.game.rand.MyRandomFactory;
                import org.allbinary.string.CommonStrings;
                import org.allbinary.string.CommonSeps;
                import org.allbinary.logic.string.StringUtil;
                
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.logic.NullUtil;
                import org.allbinary.util.ArrayUtil;

                public class GDExtensionGDNodes extends SpecialAnimation
                {

                    private static final GDExtensionGDNodes instance = new GDExtensionGDNodes();

                    public static GDExtensionGDNodes getInstance()
                    {
                        return instance;
                    }

                    protected final LogUtil logUtil = LogUtil.getInstance();
                    private final CommonStrings commonStrings = CommonStrings.getInstance();
                    private final StringUtil stringUtil = StringUtil.getInstance();
                    private final NullUtil nullUtil = NullUtil.getInstance();
                    private final ArrayUtil arrayUtil = ArrayUtil.getInstance();
   
                    private final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();

        <xsl:for-each select="eventsFunctionsExtensions" >
            <xsl:variable name="extensionName" ><xsl:value-of select="name" /></xsl:variable>
            <xsl:for-each select="eventsFunctions" >
                <xsl:variable name="eventsFunctionsName" ><xsl:value-of select="name" /></xsl:variable>
                    public final GDNode <xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode;
            </xsl:for-each>
            <xsl:for-each select="eventsBasedObjects" >
                <xsl:variable name="eventsBasedObjectsName" ><xsl:value-of select="name" /></xsl:variable>
                <xsl:for-each select="eventsFunctions" >
                    <xsl:variable name="eventsFunctionsName" ><xsl:value-of select="name" /></xsl:variable>
                    public final GDNode <xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsBasedObjectsName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode;
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="globalVariables" >
                    //<xsl:value-of select="name" /> - //version=<xsl:value-of select="version" /> - //globalVariables
            </xsl:for-each>
            <xsl:for-each select="sceneVariables" >
                    //<xsl:value-of select="name" /> - //version=<xsl:value-of select="version" /> - //sceneVariables
            </xsl:for-each>
        </xsl:for-each>
                 
                    private GDExtensionGDNodes() {

                        super(AnimationBehavior.getInstance());

        <xsl:for-each select="eventsFunctionsExtensions" >
            <xsl:variable name="extensionName" ><xsl:value-of select="name" /></xsl:variable>
            <xsl:for-each select="eventsFunctions" >
                <xsl:variable name="eventsFunctionsName" ><xsl:value-of select="name" /></xsl:variable>
                        GDNode <xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode = null;
            </xsl:for-each>
            <xsl:for-each select="eventsBasedObjects" >
                <xsl:variable name="eventsBasedObjectsName" ><xsl:value-of select="name" /></xsl:variable>
                <xsl:for-each select="eventsFunctions" >
                    <xsl:variable name="eventsFunctionsName" ><xsl:value-of select="name" /></xsl:variable>
                        GDNode <xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsBasedObjectsName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode = null;
                </xsl:for-each>
            </xsl:for-each>
            
        </xsl:for-each>

                        try {
                        
                            logUtil.put(commonStrings.START, this, commonStrings.CONSTRUCTOR);

                            <xsl:for-each select="eventsFunctionsExtensions" >
                                //eventsFunctionsExtensions
                                <xsl:call-template name="extensionGDNode" />
                            </xsl:for-each>
                            
                            logUtil.put(commonStrings.END, this, commonStrings.CONSTRUCTOR);

                        } catch(Exception e) {
                            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
                        }

        <xsl:for-each select="eventsFunctionsExtensions" >
            <xsl:variable name="extensionName" ><xsl:value-of select="name" /></xsl:variable>
            <xsl:for-each select="eventsFunctions" >
                <xsl:variable name="eventsFunctionsName" ><xsl:value-of select="name" /></xsl:variable>
                        this.<xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode = <xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode;
            </xsl:for-each>
            <xsl:for-each select="eventsBasedObjects" >
                <xsl:variable name="eventsBasedObjectsName" ><xsl:value-of select="name" /></xsl:variable>
                <xsl:for-each select="eventsFunctions" >
                    <xsl:variable name="eventsFunctionsName" ><xsl:value-of select="name" /></xsl:variable>
                        this.<xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode = <xsl:value-of select="$extensionName" />__<xsl:value-of select="$eventsFunctionsName" />GDNode;
                </xsl:for-each>
            </xsl:for-each>
            
        </xsl:for-each>

                    }

        <xsl:for-each select="eventsFunctionsExtensions" >
            <xsl:for-each select="eventsFunctions" >
                <xsl:call-template name="eventsFunctions" />
            </xsl:for-each>
            <xsl:for-each select="eventsBasedObjects" >
                <xsl:for-each select="eventsFunctions" >
                    <xsl:call-template name="eventsFunctions" />
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>

                    public int round(final int value) {
                        return value;
                    }

                    public long round(final long value) {
                        return value;
                    }
                    
                    public float round(final float value) {
                        return Math.round(value);
                    }
                    
                    public int GetArgumentAsNumber(final int value) {
                        return value;
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

                <xsl:variable name="selectedNodeIds" ></xsl:variable>

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
    </xsl:template>
    
</xsl:stylesheet>

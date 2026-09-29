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
                    <xsl:variable name="layoutName" select="name" />
                    <xsl:for-each select="../externalLayouts" >
            <xsl:if test="number(position() - 1) =
                <GD_EXTERNAL_LAYOUT_INDEX>" >
                        <xsl:if test="$layoutName = associatedLayout" >
                            //externalLayouts - externalLayoutsGDNodes

                package org.allbinary.game.canvas;

                import javax.microedition.lcdui.Graphics;

                import org.json.me.JSONArray;
                import org.json.me.JSONObject;
        
                import org.allbinary.AndroidUtil;
                import org.allbinary.J2MEUtil;
                import org.allbinary.animation.AnimationBehavior;
                import org.allbinary.animation.special.SpecialAnimation;
                import org.allbinary.game.canvas.GDExtensionGDNodes;
                import org.allbinary.game.configuration.persistance.JSONPersistance;
                import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
                import org.allbinary.game.layer.AllBinaryGameLayerManager;
                import org.allbinary.game.layer.GDGameLayer;
                import org.allbinary.game.layout.BaseGDNodeStats;
                import org.allbinary.game.layout.GDNodeStatsFactory;
                import org.allbinary.game.layout.GDNode;
                import org.allbinary.game.layer.special.TempGameLayerUtil;
                import org.allbinary.game.rand.MyRandomFactory;
                import org.allbinary.string.CommonStrings;
                import org.allbinary.string.CommonSeps;
                import org.allbinary.logic.string.StringUtil;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.logic.NullUtil;
                import org.allbinary.logic.string.StringMaker;
                import org.allbinary.util.ArrayUtil;
                import org.allbinary.util.BasicArrayList;
                import org.allbinary.util.BasicArrayListD;

                //LayoutExternalEvent name=<xsl:value-of select="$layoutName" />
                public class GD<xsl:value-of select="$layoutIndex" />Game<xsl:value-of select="position() - 1" />ExternalLinkLayoutGDNode
                {

                    private static final GD<xsl:value-of select="$layoutIndex" />Game<xsl:value-of select="position() - 1" />ExternalLinkLayoutGDNode instance = 
                       new GD<xsl:value-of select="$layoutIndex" />Game<xsl:value-of select="position() - 1" />ExternalLinkLayoutGDNode();

                    public static GD<xsl:value-of select="$layoutIndex" />Game<xsl:value-of select="position() - 1" />ExternalLinkLayoutGDNode getInstance()
                    {
                        return GD<xsl:value-of select="$layoutIndex" />Game<xsl:value-of select="position() - 1" />ExternalLinkLayoutGDNode.instance;
                    }

                    protected final LogUtil logUtil = LogUtil.getInstance();

                    private final CommonStrings commonStrings = CommonStrings.getInstance();
                    private final StringUtil stringUtil = StringUtil.getInstance();
                    private final NullUtil nullUtil = NullUtil.getInstance();
                    private final ArrayUtil arrayUtil = ArrayUtil.getInstance();
                    
                    //private final BaseGDNodeStats gdNodeStatsFactory = GDNodeStatsFactory.getInstance();
                    private final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
                    //private final GDExtensionGDNodes gdExtensionGDNodes = GDExtensionGDNodes.getInstance();
                    
                    private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
                    //private final GDGlobalsGDObjectsFactory gdGlobalsObjectsFactory = GDGlobalsGDObjectsFactory.getInstance();
                    private final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory gdObjectsFactory = GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.getInstance();

                    private final String CREATE_INSTANCES = "createInstances";

                    private GD<xsl:value-of select="$layoutIndex" />Game<xsl:value-of select="position() - 1" />ExternalLinkLayoutGDNode() {
                    }

                    public void init(final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources imageResources, final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources resources) {
                    
                        try {
                        
                            logUtil.putF(commonStrings.START, this, commonStrings.CONSTRUCTOR);

                    <xsl:call-template name="scale" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
                        </xsl:with-param>
                    </xsl:call-template>
                                        
                                    <xsl:call-template name="externalLinkLayoutGDNode" >
                                        <xsl:with-param name="layoutIndex" >
                                            <xsl:value-of select="$layoutIndex" />
                                        </xsl:with-param>
                                    </xsl:call-template>
                            
                            logUtil.putF(commonStrings.END, this, commonStrings.CONSTRUCTOR);

                        } catch(Exception e) {
                            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
                        }

                    }
                }
                        </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

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
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDAction.xsl" />
    
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
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventPaint.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventLogicConstruction.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventProcess.xsl" />
    
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />

            <xsl:if test="number($layoutIndex) =
                <GD_CURRENT_INDEX>" >
                <!-- Android images assets need to be enlarged if they are not setup to be inside the cirle area needed -->
                <xsl:variable name="enlargeTheImageBackgroundForRotation" >true</xsl:variable>
                <xsl:variable name="layoutName" select="name" />
                <xsl:variable name="instancesAsString" >,<xsl:for-each select="instances" ><xsl:value-of select="layer" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="objectsAsString" >,<xsl:for-each select="/game/objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each>,<xsl:for-each select="objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="createdObjectsAsString" >,<xsl:call-template name="externalEventsCreateActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="externalEventActionModVarSceneAsString" >,<xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />
                //externalEventActionModVarSceneAsString=<xsl:value-of select="$externalEventActionModVarSceneAsString" />
                
                package org.allbinary.game.canvas;

                import javax.microedition.lcdui.Graphics;

                import org.allbinary.game.layer.GDGameLayer;
                import org.allbinary.game.layout.GDObject;
                import org.allbinary.game.layout.GDObjectFactory;
                
                import org.allbinary.logic.string.StringMaker;
                
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                
                import org.allbinary.logic.string.StringUtil;
                import org.allbinary.util.BasicArrayList;
                
                //LayoutGDObjects name=<xsl:value-of select="$layoutName" />
                public class GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory
                {

                    private static GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory instance = null;

                    public static GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory create()
                    {
                        instance = new GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory();
                        return instance;
                    }
                    
                    public static GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory getInstance()
                    {
                        return instance;
                    }

                    private final StringUtil stringUtil = StringUtil.getInstance();
                    
                    private final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
                    private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
                    
                    <xsl:call-template name="objectsClassPropertyGDObjects" >
                    </xsl:call-template>
                    <xsl:text>&#10;</xsl:text>
                    
                    <xsl:variable name="hasObjectsGroup" ><xsl:for-each select="objectsGroups" >found</xsl:for-each></xsl:variable>
                    <xsl:if test="contains($hasObjectsGroup, 'found')" >
                    public final BasicArrayList gdObjectFactoryList = new BasicArrayList();
                    </xsl:if>
                    
                    private GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory() {
                    
                    //objectsGroups - START
                    <xsl:for-each select="objectsGroups" >
                        <xsl:variable name="name" ><xsl:value-of select="name" /></xsl:variable>
                        <xsl:for-each select="objects" >
                        gdObjectFactoryList.add(<xsl:value-of select="name" />GDObjectFactory);
                        </xsl:for-each>
                    </xsl:for-each>
                    //objectsGroups - END

                    }
                    
                    //objectsGroups - START
                    <xsl:for-each select="objectsGroups" >
                        <xsl:variable name="name" ><xsl:value-of select="name" /></xsl:variable>
                    public int get<xsl:value-of select="name" />Index(final String name) {
                        <xsl:for-each select="objects" >
                            <xsl:if test="position() != 1" >} else </xsl:if>if(name == globals.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_OBJECT_NAME) {
                            return <xsl:value-of select="position() - 1" />;
                        </xsl:for-each>
                        }
                        throw new RuntimeException("Missing Name: " + name);
                    }
                    </xsl:for-each>
                    //objectsGroups - END
                    
                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

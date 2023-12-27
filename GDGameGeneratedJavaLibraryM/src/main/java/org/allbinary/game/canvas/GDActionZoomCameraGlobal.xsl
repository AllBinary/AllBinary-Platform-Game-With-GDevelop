<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="globalZoomCameraActions" >
        <xsl:param name="baseLayer" />
        <xsl:param name="tileMap" />
        
        <xsl:for-each select="events" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'ZoomCamera'" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        
        <xsl:variable name="baseLayerScale" ><xsl:if test="$baseLayer = 'true'" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'ZoomCamera'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3 and text() = '&quot;&quot;'" ><xsl:for-each select="../parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:for-each></xsl:if></xsl:variable>
        <xsl:variable name="tileMapScale" ><xsl:if test="$tileMap = 'true'" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'ZoomCamera'" ><xsl:for-each select="parameters" ><xsl:if test="text() = '&quot;TileMap&quot;'" ><xsl:for-each select="../parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:for-each></xsl:if></xsl:variable>

        <xsl:if test="string-length($baseLayerScale) > 0" >
                    //ZoomCamera - Base layer
                    //final float baseLayerScale = (float) Math.ceil(<xsl:value-of select="$baseLayerScale" /> * 1.44f);
                    final float baseLayerScale = (float) <xsl:value-of select="$baseLayerScale" /> * scale;
        </xsl:if>
        <xsl:if test="$baseLayer = 'true'" >
        <xsl:if test="string-length($baseLayerScale) = 0" >
                    final float baseLayerScale = (float) 1f;
        </xsl:if>
        </xsl:if>
        
        <xsl:if test="string-length($tileMapScale) > 0" >
                    //ZoomCamera - TileMap
                    //final float tileMapScale = (float) Math.ceil(<xsl:value-of select="$tileMapScale" /> * 1.44f);
                    final float tileMapScale = (float) <xsl:value-of select="$tileMapScale" /> * scale;
        </xsl:if>
        <xsl:if test="$tileMap = 'true'" >
        <xsl:if test="string-length($tileMapScale) = 0" >
                    final float tileMapScale = (float) 1f;
        </xsl:if>
        </xsl:if>

    </xsl:template>

</xsl:stylesheet>

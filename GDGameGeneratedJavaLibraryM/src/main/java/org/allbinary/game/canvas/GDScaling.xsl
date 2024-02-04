<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : GDLayoutInstances.xsl
    Created on : July 9, 2023, 2:37 PM
    Author     : User
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template name="scale" >
        <xsl:param name="layoutIndex" />
                            final DisplayUtil displayUtil = DisplayUtil.getInstance();
                            <xsl:variable name="windowWidth" select="/game/properties/windowWidth" />
                            <xsl:variable name="windowHeight" select="/game/properties/windowHeight" />
                            final int scaleWidth = (displayUtil.width2 / <xsl:value-of select="$windowWidth" />);
                            final int scaleHeight = (displayUtil.height2 / <xsl:value-of select="$windowHeight" />);
                            final int scale = (scaleWidth <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> scaleHeight) ? scaleWidth : scaleHeight;
    </xsl:template>

    <xsl:template name="scaleGlobal" >
        <xsl:param name="layoutIndex" />
        final DisplayUtil displayUtil = DisplayUtil.getInstance();
        <xsl:variable name="windowWidth" select="/game/properties/windowWidth" />
        <xsl:variable name="windowHeight" select="/game/properties/windowHeight" />
        <xsl:if test="not($layoutIndex = 'Global')" >
        final int scaleWidth = (displayUtil.width2 / <xsl:value-of select="$windowWidth" />);
        final int scaleHeight = (displayUtil.height2 / <xsl:value-of select="$windowHeight" />);
        final int scale = (scaleWidth <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> scaleHeight) ? scaleWidth : scaleHeight;
        </xsl:if>
        <xsl:if test="$layoutIndex = 'Global'" >
        final int scaleWidth = (displayUtil.width / <xsl:value-of select="$windowWidth" />);
        final int scaleHeight = (displayUtil.height / <xsl:value-of select="$windowHeight" />);
        final int scale = (scaleWidth <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> scaleHeight) ? scaleWidth : scaleHeight;
        </xsl:if>
        //LogUtil.put(LogFactory.getInstance(new StringMaker().append("scaleGlobal - scale: ").append(scale).toString(), this, commonStrings.PROCESS));
    </xsl:template>

    <xsl:template name="scaleTouchButtons" >
        <xsl:param name="layoutIndex" />
                            final DisplayUtil displayUtil = DisplayUtil.getInstance();
                            <xsl:variable name="windowWidth" select="/game/properties/windowWidth" />
                            <xsl:variable name="windowHeight" select="/game/properties/windowHeight" />
                            final int scaleTouchButtons = <xsl:if test="$layoutIndex = 0" >1</xsl:if><xsl:if test="$layoutIndex > 0" >2</xsl:if>;
                            final int scaleLayout = <xsl:if test="$layoutIndex = 0" >1</xsl:if><xsl:if test="$layoutIndex > 0" >2</xsl:if>;
                            final int scaleWidth = (scaleLayout * displayUtil.width / <xsl:value-of select="$windowWidth" />);
                            final int scaleHeight = (scaleLayout * displayUtil.height / <xsl:value-of select="$windowHeight" />);
                            final int scale = (scaleWidth <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> scaleHeight) ? scaleWidth * scaleTouchButtons : scaleHeight * scaleTouchButtons;
                            //LogUtil.put(LogFactory.getInstance(new StringMaker().append("scaleTouchButtons - scale: ").append(scale).toString(), this, commonStrings.PROCESS));
    </xsl:template>

</xsl:stylesheet>

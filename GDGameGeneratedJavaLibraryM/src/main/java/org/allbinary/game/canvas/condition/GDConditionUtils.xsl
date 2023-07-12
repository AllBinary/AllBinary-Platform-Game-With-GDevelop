<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : GDConditionUtils.xsl
    Created on : June 9, 2023, 1:55 AM
    Author     : User
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template name="generateCanvasKeyFromGDNameHack" >
        <xsl:param name="key" />
        <xsl:variable name="key2" ><xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="$key" /></xsl:with-param></xsl:call-template></xsl:variable>

        <xsl:choose>
        <xsl:when test="contains($key2, 'up')" >Canvas.UP</xsl:when>
        <xsl:when test="contains($key2, 'thrust')" >Canvas.UP</xsl:when>
        <xsl:when test="contains($key2, 'forward')" >Canvas.UP</xsl:when>
        <xsl:when test="contains($key2, 'down')" >Canvas.DOWN</xsl:when>
        <xsl:when test="contains($key2, 'left')" >Canvas.LEFT</xsl:when>
        <xsl:when test="contains($key2, 'right')" >Canvas.RIGHT</xsl:when>
        <xsl:when test="contains($key2, 'fire')" >Canvas.KEY_NUM0</xsl:when>
        <xsl:when test="contains($key2, 'shoot')" >Canvas.KEY_NUM0</xsl:when>
        <xsl:when test="contains($key2, 'secondary')" >Canvas.KEY_NUM7</xsl:when>
        <xsl:when test="contains($key2, 'return')" >Canvas.KEY_NUM0</xsl:when>
        <xsl:otherwise>Canvas.UNKNOWN</xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>

</xsl:stylesheet>

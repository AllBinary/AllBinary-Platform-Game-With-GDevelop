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
        <xsl:choose>
        <xsl:when test="contains($key, 'up')" >Canvas.UP</xsl:when>
        <xsl:when test="contains($key, 'thrust')" >Canvas.UP</xsl:when>
        <xsl:when test="contains($key, 'forward')" >Canvas.UP</xsl:when>
        <xsl:when test="contains($key, 'down')" >Canvas.DOWN</xsl:when>
        <xsl:when test="contains($key, 'left')" >Canvas.LEFT</xsl:when>
        <xsl:when test="contains($key, 'right')" >Canvas.RIGHT</xsl:when>
        <xsl:when test="contains($key, 'fire')" >Canvas.KEY_NUM0</xsl:when>
        <xsl:when test="contains($key, 'shoot')" >Canvas.KEY_NUM0</xsl:when>
        <xsl:when test="contains($key, 'secondary')" >Canvas.KEY_NUM7</xsl:when>
        <xsl:when test="contains($key, 'special')" >Canvas.KEY_NUM9</xsl:when>
        <xsl:otherwise>Canvas.UNKNOWN</xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>

</xsl:stylesheet>

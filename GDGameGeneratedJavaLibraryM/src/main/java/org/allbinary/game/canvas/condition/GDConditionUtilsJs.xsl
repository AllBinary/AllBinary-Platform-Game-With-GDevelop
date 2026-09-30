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

    <xsl:template name="alreadyUsedCondition" >
        <xsl:for-each select="conditions" ><xsl:if test="(type/value = 'SourisSurObjet' or type/value = 'IsCursorOnObject' or type/value = '(Used when using the AllBinary Collision Processing) CollisionNP' or type/value = 'MouseButtonReleased' or type/value = 'MouseButtonFromTextReleased' or type/value = 'SourisBouton' or type/value = 'MouseButtonPressed' or type/value = 'MouseButtonFromTextPressed' or type/value = 'AnyKeyPressed' or type/value = 'KeyPressed' or type/value = 'KeyReleased' or type/value = 'KeyFromTextPressed' or type/value = 'KeyFromTextReleased')" >found</xsl:if></xsl:for-each>
    </xsl:template>
    
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
        
        <!-- these are for testing -->
        <xsl:when test="contains($key2, 'num0')" >Canvas.KEY_NUM0</xsl:when>
        <xsl:when test="contains($key2, 'num1')" >Canvas.KEY_NUM1</xsl:when>
        <xsl:when test="contains($key2, 'num2')" >Canvas.KEY_NUM2</xsl:when>
        <xsl:when test="contains($key2, 'num3')" >Canvas.KEY_NUM3</xsl:when>
        <xsl:when test="contains($key2, 'num4')" >Canvas.KEY_NUM4</xsl:when>
        <xsl:when test="contains($key2, 'num5')" >Canvas.KEY_NUM5</xsl:when>
        <xsl:when test="contains($key2, 'num6')" >Canvas.KEY_NUM6</xsl:when>
        <xsl:when test="contains($key2, 'num7')" >Canvas.KEY_NUM7</xsl:when>
        <xsl:when test="contains($key2, 'num8')" >Canvas.KEY_NUM8</xsl:when>
        <xsl:when test="contains($key2, 'num9')" >Canvas.KEY_NUM9</xsl:when>
        
        <xsl:otherwise>Canvas.UNKNOWN</xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>

</xsl:stylesheet>

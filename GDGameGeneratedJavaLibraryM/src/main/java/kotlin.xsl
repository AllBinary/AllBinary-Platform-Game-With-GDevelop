<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2026 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- Java array initializers allow a trailing comma. For arrayOf(...) the items are collected and the trailing comma is removed. -->
    <xsl:template name="kotlinRemoveTrailingComma">
        <xsl:param name="text" />
        <xsl:variable name="trimmed" >
            <xsl:call-template name="kotlinRightTrim" >
                <xsl:with-param name="text" select="$text" />
            </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="substring($trimmed, string-length($trimmed)) = ','" >
                <xsl:value-of select="substring($trimmed, 1, string-length($trimmed) - 1)" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="kotlinRightTrim">
        <xsl:param name="text" />
        <xsl:variable name="last" select="substring($text, string-length($text))" />
        <xsl:choose>
            <xsl:when test="string-length($text) > 0 and normalize-space($last) = ''" >
                <xsl:call-template name="kotlinRightTrim" >
                    <xsl:with-param name="text" select="substring($text, 1, string-length($text) - 1)" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="windows-1252"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template name="after-lastIndexOf">
        <xsl:param name="string" />
        <xsl:param name="char" />

        <xsl:choose>
            <xsl:when test="contains($string, $char)">
                <xsl:call-template name="after-lastIndexOf">
                    <xsl:with-param name="string" select="substring-after($string, $char)" />
                    <xsl:with-param name="char" select="$char" />
                </xsl:call-template>
            </xsl:when>

            <xsl:otherwise>
                <xsl:value-of select="$string" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="ends-with">
        <xsl:param name="string" />
        <xsl:param name="token" />
        <xsl:if test="$token = substring($string, string-length($string) - string-length($token) + 1)" >found</xsl:if>
    </xsl:template>

    <xsl:template name="count">
        <xsl:param name="text" />
        <xsl:param name="char" />
        <xsl:value-of select="string-length($text) - string-length(translate($text, $char, ''))"/>
    </xsl:template>

    <xsl:template name="count-string">
        <xsl:param name="text"/>
        <xsl:param name="substring"/>
        <xsl:param name="count" select="0"/>
    
        <xsl:choose>
            <xsl:when test="contains($text, $substring)">
                <xsl:call-template name="count-string">
                    <xsl:with-param name="text" select="substring-after($text, $substring)"/>
                    <xsl:with-param name="substring" select="$substring"/>
                    <xsl:with-param name="count" select="$count + 1"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$count"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>

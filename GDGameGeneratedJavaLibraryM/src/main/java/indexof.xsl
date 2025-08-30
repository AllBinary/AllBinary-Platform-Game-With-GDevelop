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
        <xsl:value-of select="$token = substring($string, string-length($string) - string-length($token) + 1)"/>
    </xsl:template>

</xsl:stylesheet>

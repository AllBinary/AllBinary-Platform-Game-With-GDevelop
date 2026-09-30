<?xml version="1.0" encoding="windows-1252"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template name="reverse">
        <xsl:param name="input"/>
        <xsl:variable name="len" select="string-length($input)"/>
        <xsl:choose>
            <xsl:when test="$len &lt; 2">
                <xsl:value-of select="$input"/>
            </xsl:when>
            <xsl:when test="$len = 2">
                <xsl:value-of select="substring($input,2,1)"/>
                <xsl:value-of select="substring($input,1,1)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="mid" select="floor($len div 2)"/>
                <xsl:call-template name="reverse">
                    <xsl:with-param name="input" select="substring($input,$mid+1,$mid+1)"/>
                </xsl:call-template>
                <xsl:call-template name="reverse">
                    <xsl:with-param name="input" select="substring($input,1,$mid)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="windows-1252"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

    <xsl:template name="upper-case">
        <xsl:param name="text"/>
        <xsl:value-of select="translate($text, $lowercase, $uppercase)"/>
    </xsl:template>

    <xsl:template name="lower-case">
        <xsl:param name="text"/>
        <xsl:value-of select="translate($text, $uppercase, $lowercase)"/>
    </xsl:template>

    <xsl:template match="text()" name="camelcase" >
        <xsl:param name="text" />
        <xsl:variable name="word" select="substring-before(concat($text, ' '), ' ')" />
        <xsl:value-of select="translate(substring($word, 1, 1), $lowercase, $uppercase)" />
        <xsl:value-of select="translate(substring($word, 2), $uppercase, $lowercase)" />
        <xsl:if test="contains($text, ' ')" >
            <xsl:text> </xsl:text>
            <xsl:call-template name="camelcase" >
                <xsl:with-param name="text" select="substring-after($text, ' ')" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>

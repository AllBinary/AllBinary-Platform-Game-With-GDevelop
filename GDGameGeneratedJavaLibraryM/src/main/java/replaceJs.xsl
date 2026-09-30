<?xml version="1.0" encoding="windows-1252"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template name="string-replace-all">
        <xsl:param name="text" />
        <xsl:param name="find" />
        <xsl:param name="replacementText" />
        <xsl:choose>
            <xsl:when test="$text = '' or $find = '' or not($find)" >
                <xsl:value-of select="$text" />
            </xsl:when>
            <xsl:when test="contains($text, $find)">
                <xsl:value-of select="substring-before($text, $find)" />
                <xsl:value-of select="$replacementText" />
                <xsl:call-template name="string-replace-all">
                    <xsl:with-param name="text" select="substring-after($text, $find)" />
                    <xsl:with-param name="find" select="$find" />
                    <xsl:with-param name="replacementText" select="$replacementText" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="replace-escaped-conditionals">
        <xsl:param name="text" />
        
<!--        //text=<xsl:value-of select="$text" />
        <xsl:text>&#10;</xsl:text>-->
        
        <xsl:if test="$text != '>' and $text != '&lt;' and $text != '&lt;=' and $text != '&gt;' and $text != '&gt;='" >
            <xsl:value-of select="$text" />
        </xsl:if>
        <xsl:if test="$text = '&lt;'" >
            <xsl:text disable-output-escaping="yes" > &lt; </xsl:text>
        </xsl:if>
        <xsl:if test="$text = '&lt;='" >
            <xsl:text disable-output-escaping="yes" > &lt;= </xsl:text>
        </xsl:if>
        <xsl:if test="$text = '>' or $text = '&gt;'" >
            <xsl:text disable-output-escaping="yes" > &gt; </xsl:text>
        </xsl:if>
        <xsl:if test="$text = '&gt;='" >
            <xsl:text disable-output-escaping="yes" > &gt;= </xsl:text>
        </xsl:if>
        <xsl:if test="$text = '='" >=</xsl:if>
        <xsl:if test="$text = '+'" >=</xsl:if>
        <xsl:if test="$text = '-'" >=</xsl:if>
    </xsl:template>

</xsl:stylesheet>

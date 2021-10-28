<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!--
            //split - names=<xsl:value-of select="$names"/> iteration=<xsl:value-of select="$iteration"/> templateName=<xsl:value-of select="$templateName"/>
            //split - nextName=<xsl:value-of select="$nextName" />
    -->        
    <xsl:template name="split">
        <xsl:param name="names" select="."/>
        <xsl:param name="iteration" />
        <xsl:param name="templateName" />
        
        <xsl:if test="string-length($names) > 0">
            <xsl:variable name="nextName" select="substring-before(concat($names, ','), ',')" />

            <xsl:if test="$templateName = 'gameLayer'" >
                <xsl:call-template name="gameLayer" >
                    <xsl:with-param name="name" >
                        <xsl:value-of select="$nextName"/>
                    </xsl:with-param>
                    <xsl:with-param name="iteration" select="$iteration" />   
                </xsl:call-template>
            </xsl:if>

            <xsl:call-template name="split">
                <xsl:with-param name="names" select="substring-after($names, ',')"/>
                <xsl:with-param name="iteration" select="number($iteration) + 1" />
                <xsl:with-param name="templateName" select="$templateName" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>

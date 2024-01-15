<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : GDLayoutInstances.xsl
    Created on : July 9, 2023, 2:37 PM
    Author     : User
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template name="layoutInstances" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="name" />

        <xsl:for-each select="/game" >
            <xsl:for-each select="layouts" >
                <xsl:variable name="layoutIndex" select="position() - 1" />
                //instances - START
                <xsl:for-each select="instances" >
                    <xsl:if test="not(contains(name, $name))" >
                        final GDObject <xsl:value-of select="name" /> = (GDObject) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$layoutIndex" /><xsl:value-of select="name" />GDObjectList.get(0);
                    </xsl:if>
                </xsl:for-each>
                //instances - END
            </xsl:for-each>
        </xsl:for-each>
        
    </xsl:template>

</xsl:stylesheet>

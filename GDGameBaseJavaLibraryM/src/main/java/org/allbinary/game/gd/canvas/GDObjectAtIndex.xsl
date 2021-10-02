<?xml version="1.0" encoding="windows-1252"?>

<!--
    Document   : GDObjectClassProperty.xsl
    Created on : September 26, 2021, 10:02 PM
    Author     : User
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template name="objectGDObjectAtIndex" >
        <xsl:param name="layoutIndex" />

        //objectGDObjectAtIndex - START
        <xsl:for-each select="/game">
            <xsl:for-each select="layouts" >
                <xsl:variable name="index" select="position() - 1" />
                <xsl:if test="number($index) = $layoutIndex" >
        
                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />

                        <xsl:if test="$typeValue = 'Sprite'" >
                            final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />Array[index];
                        </xsl:if>
                        <xsl:if test="$typeValue = 'TextObject::Text'" >
                            final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />Array[index];
                        </xsl:if>

                    </xsl:for-each>
        
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        //objectGDObjectAtIndex - END
        
    </xsl:template>

</xsl:stylesheet>

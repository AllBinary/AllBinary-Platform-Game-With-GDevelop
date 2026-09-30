<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDNodeIdXml.xsl" />
    
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

        <gdVersion>
        <xsl:for-each select="gdVersion" >
        <xsl:value-of select="text()" />
        </xsl:for-each>
        </gdVersion>

        <externalEvents>
        <xsl:for-each select="externalEvents" >
            <xsl:call-template name="showAll" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="0" />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
        </externalEvents>

        <externalLayouts>
        <xsl:for-each select="externalLayouts" >
            <xsl:call-template name="showAll" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="0" />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
        </externalLayouts>

        <resources>
        <xsl:for-each select="resources" >
        <xsl:value-of select="text()" />
        </xsl:for-each>
        </resources>
        
        <properties>
        <xsl:for-each select="properties" >
        <xsl:value-of select="text()" />
        </xsl:for-each>
        </properties>
        
        <variables>
        <xsl:for-each select="variables" >
        <xsl:value-of select="text()" />
        </xsl:for-each>
        </variables>

    </xsl:template>

</xsl:stylesheet>

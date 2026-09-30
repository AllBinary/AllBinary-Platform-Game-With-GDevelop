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

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game" ><xsl:for-each select="layouts" ><xsl:if test="position() = last()" ><xsl:value-of select="position()" /></xsl:if></xsl:for-each><xsl:text> </xsl:text><xsl:for-each select="layouts" ><xsl:value-of select="count(/game/externalLayouts[associatedLayout = current()/name])" /><xsl:if test="position() != last()" ><xsl:text>,</xsl:text></xsl:if></xsl:for-each><xsl:text> </xsl:text><xsl:for-each select="layouts" ><xsl:for-each select="/game/externalLayouts[associatedLayout = current()/name]" ><xsl:value-of select="count(preceding-sibling::externalLayouts)" /><xsl:if test="position() != last()" ><xsl:text>,</xsl:text></xsl:if></xsl:for-each><xsl:text>;</xsl:text></xsl:for-each><xsl:text> </xsl:text><xsl:for-each select="layouts" ><xsl:value-of select="count(instances)" /><xsl:if test="position() != last()" ><xsl:text>,</xsl:text></xsl:if></xsl:for-each><xsl:text> </xsl:text><xsl:for-each select="/game/externalLayouts" ><xsl:value-of select="count(instances)" /><xsl:if test="position() != last()" ><xsl:text>,</xsl:text></xsl:if></xsl:for-each></xsl:template>

</xsl:stylesheet>

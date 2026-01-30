<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    
    <xsl:template name="eventsCreateAssignGDObjectGDNodesObjectEvent" >
        <xsl:param name="caller" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="conditionEventPosition" />
         
        <xsl:variable name="quote" >"</xsl:variable>
        
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />

            <xsl:variable name="actionTypesAsString" ><xsl:for-each select="actions" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="type/value" />,</xsl:for-each></xsl:variable>

<!--
            <xsl:variable name="actionParametersAsString0" ><xsl:for-each select="actions" ><xsl:for-each select="parameters" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="text()" />,</xsl:for-each></xsl:for-each></xsl:variable>
            <xsl:variable name="actionParametersAsString" ><xsl:value-of select="translate(translate($actionParametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

            <xsl:call-template name="objectGDObjectGDNodes" >
                <xsl:with-param name="caller" >
                    <xsl:value-of select="$caller" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
                <xsl:with-param name="actionParametersAsString" >
                    <xsl:value-of select="$actionParametersAsString" />
                </xsl:with-param>
                <xsl:with-param name="actionTypesAsString" >
                    <xsl:value-of select="$actionTypesAsString" />
                </xsl:with-param>
            </xsl:call-template>
-->

            <xsl:call-template name="eventsCreateAssignGDObjectGDNodesObjectEvent" >
                <xsl:with-param name="caller" >
                    <xsl:value-of select="$caller" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
                <xsl:with-param name="thisNodeIndex" >
                    <xsl:value-of select="$thisNodeIndex" />
                </xsl:with-param>
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="instancesAsString" >
                    <xsl:value-of select="$instancesAsString" />
                </xsl:with-param>
                <xsl:with-param name="objectsAsString" >
                    <xsl:value-of select="$objectsAsString" />
                </xsl:with-param>
                <xsl:with-param name="createdObjectsAsString" >
                    <xsl:value-of select="$createdObjectsAsString" />
                </xsl:with-param>
                <xsl:with-param name="conditionEventPosition" >
                    <xsl:value-of select="$eventPosition" />
                </xsl:with-param>

            </xsl:call-template>

        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>

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

    <xsl:template name="showAll" >
        <xsl:param name="totalRecursions" />
        <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>showAll totalRecursions="<xsl:value-of select="$totalRecursions" />" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
        
        <xsl:for-each select="stopSoundsOnStartup" ><stopSoundsOnStartup><xsl:value-of select="text()" /></stopSoundsOnStartup></xsl:for-each>
        <xsl:for-each select="b" ><b><xsl:value-of select="text()" /></b></xsl:for-each>
        <xsl:for-each select="disableInputWhenNotFocused" ><disableInputWhenNotFocused><xsl:value-of select="text()" /></disableInputWhenNotFocused></xsl:for-each>
        <xsl:for-each select="instances" ><xsl:text disable-output-escaping="yes" >&lt;</xsl:text>instances nodeId="<xsl:value-of select="generate-id()" /> - [<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]" position="<xsl:value-of select="position()" />" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text></xsl:for-each>
        <xsl:for-each select="objects" ><xsl:text disable-output-escaping="yes" >&lt;</xsl:text>objects nodeId="<xsl:value-of select="generate-id()" /> - [<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]" position="<xsl:value-of select="position()" />" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text></xsl:for-each>
        <xsl:for-each select="uiSettings" ><uiSettings><xsl:value-of select="text()" /></uiSettings></xsl:for-each>
        <xsl:for-each select="title" ><title><xsl:value-of select="text()" /></title></xsl:for-each>
        <xsl:for-each select="r" ><r><xsl:value-of select="text()" /></r></xsl:for-each>
        <xsl:for-each select="v" ><v><xsl:value-of select="text()" /></v></xsl:for-each>
        <xsl:for-each select="name" ><name><xsl:value-of select="text()" /></name></xsl:for-each>
        <xsl:for-each select="layers" ><xsl:text disable-output-escaping="yes" >&lt;</xsl:text>layers nodeId="<xsl:value-of select="generate-id()" /> - [<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]" position="<xsl:value-of select="position()" />" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text></xsl:for-each>
        <xsl:for-each select="standardSortMethod" ><standardSortMethod><xsl:value-of select="text()" /></standardSortMethod></xsl:for-each>
        <xsl:for-each select="mangledName" ><mangledName><xsl:value-of select="text()" /></mangledName></xsl:for-each>
                
        <xsl:for-each select="events" >
            
            <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>event nodeId="<xsl:value-of select="generate-id()" /> - [<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]" position="<xsl:value-of select="position()" />" type="<xsl:value-of select="type" />" <xsl:if test="target" >target="<xsl:value-of select="target" />"</xsl:if> disable="<xsl:value-of select="disabled" />" <xsl:if test="object" >object="<xsl:value-of select="object" />"</xsl:if> <xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
            <xsl:for-each select="repeatExpression" ><repeatExpression><xsl:value-of select="text()" /></repeatExpression></xsl:for-each>
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>action nodeId="<xsl:value-of select="generate-id()" /> - [<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]" type="<xsl:value-of select="$typeValue" />" inverted="<xsl:value-of select="type/inverted" />" <xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>parameters <xsl:for-each select="parameters" >nodeId<xsl:value-of select="position()" />="<xsl:value-of select="generate-id()" /> - [<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]" </xsl:for-each> <xsl:text disable-output-escaping="yes" >&gt;</xsl:text><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each><xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/parameters<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/action<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
            </xsl:for-each>
            <xsl:for-each select="conditions" >
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>condition nodeId="<xsl:value-of select="generate-id()" /> - [<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]" type="<xsl:value-of select="type/value" />" inverted="<xsl:value-of select="type/inverted" />" <xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>parameters <xsl:for-each select="parameters" >nodeId<xsl:value-of select="position()" />="<xsl:value-of select="generate-id()" /> - [<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]" </xsl:for-each> <xsl:text disable-output-escaping="yes" >&gt;</xsl:text><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each><xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/parameters<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/condition<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                <xsl:for-each select="subInstructions" >
                    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>subInstructions nodeId="<xsl:value-of select="generate-id()" /> - [<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]" type="<xsl:value-of select="type/value" />" <xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>parameters <xsl:for-each select="parameters" >nodeId<xsl:value-of select="position()" />="<xsl:value-of select="generate-id()" /> - [<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]" </xsl:for-each> <xsl:text disable-output-escaping="yes" >&gt;</xsl:text><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each><xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/parameters<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/subInstructions<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="whileConditions" >
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>whileCondition nodeId="<xsl:value-of select="generate-id()" /> - [<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]" type="<xsl:value-of select="type/value" />" <xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>parameters <xsl:for-each select="parameters" >nodeId<xsl:value-of select="position()" />="<xsl:value-of select="generate-id()" /> - [<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]" </xsl:for-each> <xsl:text disable-output-escaping="yes" >&gt;</xsl:text><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each><xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/parameters<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/whileCondition<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
            </xsl:for-each>
            <xsl:call-template name="showAll" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
            </xsl:call-template>
            <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/event<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>

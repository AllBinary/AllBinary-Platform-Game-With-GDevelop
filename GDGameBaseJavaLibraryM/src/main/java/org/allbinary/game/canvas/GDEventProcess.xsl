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

    <xsl:template name="eventsProcess" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="conditionEventPosition" />

        //eventsProcess
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />

            <xsl:call-template name="eventsProcess" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="conditionEventPosition" >
                    <xsl:value-of select="$eventPosition" />
                </xsl:with-param>
            </xsl:call-template>

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />

            //totalRecursions=<xsl:value-of select="number($totalRecursions)" /> eventPosition=<xsl:value-of select="$eventPosition" /> conditionEventPosition=<xsl:value-of select="$conditionEventPosition" />

            <xsl:if test="type = 'BuiltinCommonInstructions::Group'" >
                //BuiltinCommonInstructions::Group
                this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
            </xsl:if>

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>

            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'Timer'" >
                    //
                </xsl:if>
                <xsl:if test="$typeValue = 'PosX'" >
                    //PosX
                    this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'PosY'" >
                    //PosY
                    this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'NbObjet'" >
                    //NbObjet
                    this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'VarObjet'" >
                    //VarObjet
                    this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'VarScene'" >
                    //VarScene
                    this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
            </xsl:for-each>

        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

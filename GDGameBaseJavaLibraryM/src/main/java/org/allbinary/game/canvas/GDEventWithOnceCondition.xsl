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

    <xsl:template name="eventsOnceConditionProcessActions" >
        <xsl:param name="totalRecursions" />

        //eventsOnceConditionProcessActions totalRecursions=<xsl:value-of select="$totalRecursions" />
        <xsl:for-each select="events" >
            <xsl:variable name="eventId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />

            <xsl:variable name="conditionsAsString" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'CollisionNP'" >CollisionNP</xsl:if></xsl:for-each></xsl:variable>
            <xsl:if test="contains($conditionsAsString, 'CollisionNP')" >
                //CollisionNP - Found - The AllBinary collision processing will kick this off instead so skipping the collision testing here
            </xsl:if>

            <xsl:for-each select="conditions" >
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="not(contains($conditionsAsString, 'CollisionNP'))" >
                    <xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" >
                        //<xsl:value-of select="type/value" /> - Found
                        <xsl:for-each select=".." >
                            <xsl:call-template name="eventIds" >
                                <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="type/value = 'DepartScene'" >
                //<xsl:value-of select="type/value" /> - Found
                    <xsl:for-each select=".." >
                        <xsl:call-template name="eventIds" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>

            <xsl:call-template name="eventsOnceConditionProcessActions" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="showAll" >
        <xsl:param name="totalRecursions" />
        <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>showAll totalRecursions="<xsl:value-of select="$totalRecursions" />" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
        <xsl:for-each select="events" >
            
            <xsl:variable name="eventId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
            <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>event nodeId="<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />" position="<xsl:value-of select="position()" />" type="<xsl:value-of select="type" />" disable="<xsl:value-of select="disabled" />" <xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>action nodeId="<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />" type="<xsl:value-of select="$typeValue" />" inverted="<xsl:value-of select="type/inverted" />" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>parameters<xsl:text disable-output-escaping="yes" >&gt;</xsl:text><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each><xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/parameters<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
            <xsl:for-each select="conditions" >
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>condition nodeId="<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />" type="<xsl:value-of select="type/value" />" /<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>parameters<xsl:text disable-output-escaping="yes" >&gt;</xsl:text><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each><xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/parameters<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                <xsl:text>&#10;</xsl:text>
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

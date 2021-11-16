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
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
            <xsl:for-each select="conditions" >
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" >
                //Found - <xsl:value-of select="type/value" />
                    <xsl:for-each select=".." >
                        <xsl:call-template name="eventIds" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>                                
                        </xsl:call-template>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="type/value = 'DepartScene'" >
                //Found - <xsl:value-of select="type/value" />
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

</xsl:stylesheet>

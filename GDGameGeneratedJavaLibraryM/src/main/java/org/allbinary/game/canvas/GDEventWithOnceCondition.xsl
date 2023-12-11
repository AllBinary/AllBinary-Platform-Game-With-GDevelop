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

        <xsl:for-each select="events" >
            <xsl:variable name="eventId" >[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:variable>
            <xsl:variable name="hasCollisionCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = '(Used when using the AllBinary Collision Processing) CollisionNP'" >found</xsl:if></xsl:for-each></xsl:variable>

            <xsl:variable name="hasNeededCondition" ><xsl:for-each select="conditions" ><xsl:if test="not(contains($hasCollisionCondition, 'found'))" ><xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" >found</xsl:if></xsl:if><xsl:if test="type/value = 'DepartScene'" >found</xsl:if></xsl:for-each></xsl:variable>

            <xsl:if test="contains($hasNeededCondition, 'found')" >
            //Event nodeId=<xsl:value-of select="generate-id()" /> - [<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
            </xsl:if>

            <!--
            <xsl:if test="contains($hasCollisionCondition, 'found')" >
                //CollisionNP - Found - The AllBinary collision processing will kick this off instead so skipping the collision testing here
            </xsl:if>
            -->

            <xsl:for-each select="conditions" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    
                <xsl:if test="not(contains($hasCollisionCondition, 'found'))" >
                    <xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" >
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - [<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
                        //eventsOnceConditionProcessActions - //Condition - //BuiltinCommonInstructions::Once - builder
                        <xsl:for-each select=".." >
                            <xsl:call-template name="eventIds" >
                                <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                <xsl:with-param name="caller" >onceCondition</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="type/value = 'DepartScene'" >
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - [<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
                    //eventsOnceConditionProcessActions - //Condition - //DepartScene - builder
                    <xsl:for-each select=".." >
                        <xsl:call-template name="eventIds" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="caller" >onceCondition</xsl:with-param>
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

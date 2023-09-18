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

    <xsl:template name="mouseButtonPressedConditionGDNode" >
        <xsl:param name="caller" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="parametersAsString" />
        <xsl:variable name="quote" >"</xsl:variable>
                //mouseButtonPressedConditionGDNode - //Condition - //MouseButtonPressed - GDNode
                if(globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                    throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                }
                globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                    //mouseButtonPressedConditionGDNode - action
                    //MouseButtonPressed - condition
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();
                        
                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            <xsl:for-each select=".." >
                            <xsl:for-each select="events" >
                                <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                                //caller=<xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodes - //Event - //BuiltinCommonInstructions::Standard - call
                                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:for-each>
                            
                            <xsl:call-template name="actionsProcess" >
                                <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                                <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                                <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                            </xsl:call-template>
                        
                        return true;
                    }

                };
    </xsl:template>

</xsl:stylesheet>

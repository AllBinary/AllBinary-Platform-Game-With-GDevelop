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

    <xsl:template name="mouseButtonReleasedConditionGDNode" >
        <xsl:param name="parametersAsString" />
        <xsl:variable name="quote" >"</xsl:variable>
        
        <xsl:variable name="thisNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />
        
                    //mouseButtonReleasedConditionGDNode - //Condition - //MouseButtonReleased - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        //MouseButtonReleased - condition
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                            
                            <xsl:variable name="hasSourisSurObjet" ><xsl:for-each select="../conditions" ><xsl:if test="type/value = 'SourisSurObjet'" >found</xsl:if></xsl:for-each></xsl:variable>

                            <xsl:if test="not(contains($hasSourisSurObjet, 'found'))" >
                                <xsl:for-each select="../actions" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                            <xsl:text>&#10;</xsl:text>
                            //Action - //<xsl:value-of select="type/value" /> - call
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                </xsl:for-each>
                            </xsl:if>
                            
                            return true;
                        }
                        
                        public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                            <xsl:for-each select=".." >

                            <xsl:for-each select="conditions" >
                                <xsl:if test="type/value = 'SourisSurObjet'" >
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                                </xsl:if>
                            </xsl:for-each>
                            
                            <xsl:variable name="hasAnotherCondition" ><xsl:for-each select="conditions" ><xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >found</xsl:if></xsl:for-each></xsl:variable>
                            <xsl:if test="not(contains($hasAnotherCondition, 'found'))" >
                                <xsl:for-each select="actions" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                            <xsl:text>&#10;</xsl:text>
                            //Action - //<xsl:value-of select="type/value" /> - call
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                </xsl:for-each>

                                <xsl:for-each select="events" >
                                    <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                    </xsl:if>
                                    <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call
                            globals.<xsl:value-of select="target" />GDNode.process();
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:if>
                            
                            </xsl:for-each>
                            
                            return true;
                        }

                        
                    };

    </xsl:template>

</xsl:stylesheet>

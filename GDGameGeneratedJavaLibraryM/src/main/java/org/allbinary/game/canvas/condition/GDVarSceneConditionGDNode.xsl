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

    <xsl:template name="varSceneCnditionGDNode" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="caller" />
        <xsl:param name="conditionNodeIndex" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="actionAsStringsStrings" />
        
        <xsl:variable name="quote" >"</xsl:variable>
                    //varSceneCnditionGDNode - //Condition - //VarScene - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="thisNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />: ";
                        <xsl:variable name="logString" >CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                        <xsl:text>&#10;</xsl:text>

                        //D:
                        <xsl:value-of select="$actionAsStringsStrings" disable-output-escaping="yes" />

                        //VarScene - condition
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >globals.<xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                            if(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" >globals.</xsl:if><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                                //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "VarScene processing", this, commonStrings.PROCESS));
                                <xsl:for-each select=".." >
                                    
                                    <xsl:variable name="hadConditionOtherThanThis" ><xsl:for-each select="conditions" ><xsl:if test="type/value != 'BuiltinCommonInstructions::Once'" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                                    <xsl:if test="contains($hadConditionOtherThanThis, 'found')" >
                                        <xsl:variable name="otherConditions" ><xsl:for-each select="conditions" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >found</xsl:if></xsl:for-each></xsl:variable>
                                        <xsl:if test="contains($otherConditions, 'foundfound')" >
                                            This only works for 2 conditions - Fix Me
                                        </xsl:if>
                                        <xsl:for-each select="conditions" >
                                            <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                                                //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Condition - //<xsl:value-of select="type/value" /> - call - <xsl:value-of select="$thisNodeIndex" />
                                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                            </xsl:if>
                                        </xsl:for-each>                                        
                                    </xsl:if>
                                    <xsl:if test="not(contains($hadConditionOtherThanThis, 'found'))" >
                                    <xsl:for-each select="actions" >
                                        <xsl:variable name="typeValue" select="type/value" />
                                        <xsl:text>&#10;</xsl:text>
                                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                        //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                    </xsl:for-each>
                                    
                                    <xsl:for-each select="events" >
                                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                        <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                                            //caller=<xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodes - //Event - //BuiltinCommonInstructions::Link - call
                                            <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                            globals.<xsl:value-of select="target" />GDNode.process();
                                        </xsl:if>
                                        <xsl:if test="type != 'BuiltinCommonInstructions::Link'" >
                                            //caller=<xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodes - //Event - //<xsl:value-of select="type" /> - call
                                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                        </xsl:if>
                                    </xsl:for-each>

                                    </xsl:if>
                                </xsl:for-each>
                                
                                super.processStatsE();
                                
                                return true;
                            }
                            
                            super.processStatsE();
                                
                            return false;
                        }

                        @Override
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                            super.processGDStats(gameLayer);
                        
                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >globals.<xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                            if(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" >globals.</xsl:if><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                                //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "VarScene processing", this, commonStrings.PROCESS));
                                <xsl:for-each select=".." >
                                    
                                    <xsl:variable name="hadConditionOtherThanThis" ><xsl:for-each select="conditions" ><xsl:if test="type/value != 'BuiltinCommonInstructions::Once'" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                                    <xsl:if test="contains($hadConditionOtherThanThis, 'found')" >
                                        <xsl:variable name="otherConditions" ><xsl:for-each select="conditions" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >found</xsl:if></xsl:for-each></xsl:variable>
                                        <xsl:if test="contains($otherConditions, 'foundfound')" >
                                            This only works for 2 conditions - Fix Me
                                        </xsl:if>
                                        <xsl:for-each select="conditions" >
                                            <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                                                //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Condition - //<xsl:value-of select="type/value" /> - call - <xsl:value-of select="$thisNodeIndex" />
                                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameLayer2, graphics);
                                            </xsl:if>
                                        </xsl:for-each>                                        
                                    </xsl:if>
                                    <xsl:if test="not(contains($hadConditionOtherThanThis, 'found'))" >
                                    <xsl:for-each select="actions" >
                                        <xsl:variable name="typeValue" select="type/value" />
                                        <xsl:text>&#10;</xsl:text>
                                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                        //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameLayer2, graphics);
                                    </xsl:for-each>
                                    
                                    <xsl:for-each select="events" >
                                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                        <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                                            //caller=<xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodes - //Event - //BuiltinCommonInstructions::Link - call
                                            <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                            globals.<xsl:value-of select="target" />GDNode.processGD(gameLayer, gameLayer2, graphics);
                                        </xsl:if>
                                        <xsl:if test="type != 'BuiltinCommonInstructions::Link'" >
                                            //caller=<xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodes - //Event - //<xsl:value-of select="type" /> - call
                                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameLayer2, graphics);
                                        </xsl:if>
                                    </xsl:for-each>

                                    </xsl:if>
                                </xsl:for-each>
                                
                                super.processStatsE();
                                
                                return true;
                            }
                            
                            super.processStatsE();
                                
                            return false;
                        }

                    };

    </xsl:template>

</xsl:stylesheet>

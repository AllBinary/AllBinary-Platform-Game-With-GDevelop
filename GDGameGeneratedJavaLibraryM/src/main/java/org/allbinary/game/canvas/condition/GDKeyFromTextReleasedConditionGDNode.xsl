<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:import href="./GDConditionUtils.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template name="keyFromTextReleasedConditionGDNode" >
        <xsl:param name="parametersAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
                    //keyFromTextReleasedConditionGDNode - //Condition - //KeyFromTextReleased - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                                        
                        //KeyFromTextReleased - condition
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                            logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                            //<xsl:value-of select="parameters[2]" />
                            
                            final GDRGameInputProcessor gameInputProcessor = new GDRGameInputProcessor() {
                                
                                private boolean hasPressed = false;
                                
                                public void process(final AllBinaryLayerManager allbinaryLayerManager, final GameKeyEvent gameKeyEvent) throws Exception {
                                    hasPressed = true;
                                }

                                public void processReleased(final AllBinaryLayerManager allbinaryLayerManager, final GameKeyEvent gameKeyEvent) throws Exception
                                {
                                    if(hasPressed) {
                                        hasPressed = false;

                            <xsl:for-each select="../events" >
                                <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                                    //...Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> 
                                    //Event - //BuiltinCommonInstructions::Standard - call
                                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                                </xsl:if>
                                <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
                                    //Event - //BuiltinCommonInstructions::ForEach
                                </xsl:if>
                            </xsl:for-each>

                            <xsl:for-each select="conditions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" >
                                    <xsl:value-of select="text()" />,</xsl:for-each>
                                    //Condition - //<xsl:value-of select="type/value" /> - call
                                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                            </xsl:for-each>

                            <xsl:for-each select="../actions" >
                                //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                                <xsl:text>&#10;</xsl:text>
                                //Action - //<xsl:value-of select="type/value" /> - call
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                            </xsl:for-each>
                                    }
                                    
                                }
                            };
                        
                            if(globals.inputProcessorArray[<xsl:call-template name="generateCanvasKeyFromGDNameHack" ><xsl:with-param name="key" select="parameters[2]" /></xsl:call-template>] != null) {
                                final GDRGameInputProcessor gameInputProcessor2 = (GDRGameInputProcessor) globals.inputProcessorArray[<xsl:call-template name="generateCanvasKeyFromGDNameHack" ><xsl:with-param name="key" select="parameters[2]" /></xsl:call-template>];
                                gameInputProcessor2.releasedGameInputProcessor = gameInputProcessor;
                            } else {
                                globals.inputProcessorArray[<xsl:call-template name="generateCanvasKeyFromGDNameHack" ><xsl:with-param name="key" select="parameters[2]" /></xsl:call-template>] = gameInputProcessor;

                                //Make sure we only call this 1 time
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />);
                            }

                            return true;
                        }
                    };
    </xsl:template>

</xsl:stylesheet>

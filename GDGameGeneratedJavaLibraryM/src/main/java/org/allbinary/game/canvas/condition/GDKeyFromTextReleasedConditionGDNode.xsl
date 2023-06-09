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
    
    <xsl:import href="./GDConditionUtils.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template name="keyFromTextReleasedConditionGDNode" >
        <xsl:variable name="quote" >"</xsl:variable>
                    //keyFromTextReleasedConditionGDNode - //Condition - //KeyFromTextReleased - GDNode
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                                        
                        //KeyFromTextReleased - condition
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                            LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            //<xsl:value-of select="parameters[2]" />
                            globals.inputProcessorArray[<xsl:call-template name="generateCanvasKeyFromGDNameHack" ><xsl:with-param name="key" select="parameters[2]" /></xsl:call-template>] = new GameInputProcessor() {
                                
                                private boolean hasPressed = false;
                                
                                public void process(final AllBinaryLayerManager allbinaryLayerManager, final GameKeyEvent gameKeyEvent) throws Exception {
                                    hasPressed = true;
                                }

                                public void processReleased(final AllBinaryLayerManager allbinaryLayerManager, final GameKeyEvent gameKeyEvent) throws Exception
                                {
                                    if(hasPressed) {
                            <xsl:for-each select="../events" >
                                <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                                    <xsl:variable name="childEventWithUsedEvent" >
                                        <xsl:call-template name="childEventWithUsedEvent" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                            <xsl:with-param name="motionGestureEvent" >true</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:if test="$childEventWithUsedEvent != ''" >//<xsl:value-of select="$childEventWithUsedEvent" /></xsl:if>
                                    <xsl:if test="contains($childEventWithUsedEvent, 'found')" >
                                    //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> 
                                    <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if>
                                    //Event - //BuiltinCommonInstructions::Standard - call
                                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                                    </xsl:if>                  
                                </xsl:if>
                                <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
                                    //Event - //BuiltinCommonInstructions::ForEach
                                </xsl:if>
                            </xsl:for-each>

                            <xsl:for-each select="conditions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" >
                                    <xsl:value-of select="text()" />,</xsl:for-each>
                                    //Action - //<xsl:value-of select="type/value" /> - call
                                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                            </xsl:for-each>

                            <xsl:for-each select="../actions" >
                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, new Exception()));
                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                                //Action - //<xsl:value-of select="type/value" /> - call
                                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                            </xsl:for-each>
                                    }
                                }
                            };
                            
                            return true;
                        }
                    };
    </xsl:template>

</xsl:stylesheet>

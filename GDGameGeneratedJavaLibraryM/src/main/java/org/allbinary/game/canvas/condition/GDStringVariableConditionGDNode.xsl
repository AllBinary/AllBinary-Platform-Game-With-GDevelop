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

    <xsl:output method="html" indent="yes" />

    <xsl:template name="stringVariableConditionGDNode" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />

        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
        
        <xsl:variable name="quote" >"</xsl:variable>
                    //stringVariableConditionGDNode - //Condition - //StringVariable - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        //private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        <xsl:variable name="param3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="param3WithoutQuotes" ><xsl:value-of select="translate($param3, $quote, '')" /></xsl:variable>
                        <xsl:variable name="param3Updated" ><xsl:value-of select="translate(translate(translate(translate(translate($param3WithoutQuotes, '=', 'equal'), '+', 'plus'), '-', 'minus'), '*', 'multiply'), '/', 'divide')" /></xsl:variable>
                        <xsl:variable name="param3AsFinalString" >__<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$param3Updated" /></xsl:with-param></xsl:call-template></xsl:variable>

                        private final String <xsl:value-of select="$param3AsFinalString" /> = <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>;
                        
                        //StringVariable - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                            //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                            
                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if>(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template></xsl:if><xsl:if test="position() = 2" ><xsl:if test="text() = '='" >.compareTo(<xsl:value-of select="$param3AsFinalString" />) == 0</xsl:if><xsl:if test="text() = '!='" ></xsl:if></xsl:if><xsl:text> </xsl:text></xsl:for-each>)) {
                                //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "<xsl:if test="$inverted = 'true'" >!</xsl:if>(<xsl:for-each select="parameters" ><xsl:if test="position() != 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 2" ><xsl:call-template name="replace-escaped-conditionals" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template></xsl:if><xsl:text> </xsl:text></xsl:for-each>", this, commonStrings.PROCESS);
                                return true;
                            }
                            return false;
                        }
                        
                        @Override
                        public boolean process(final int index) throws Exception {
                            super.processStats(index);

                            ////logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "index", this, commonStrings.PROCESS);

                            return this.process();
                        }

                        @Override
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                            super.processGDStats(gameLayer);

                            ////logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, commonStrings.PROCESS);

                            return this.process();
                        }
                        </xsl:if>

                        <xsl:if test="contains($forExtension, 'found')" >
                        @Override
                        public boolean process(final Object[] objectArray, final int[] intArray, final long[] longArray, final float[] floatArray) {
                            
                            //Map from object array with action params
                            final GDGameLayer gameLayer = (GDGameLayer) objectArray[1];
                            this.process(gameLayer, intArray[3], intArray[5]);

                            return true;
                        }
                        </xsl:if>

                        public void process(final GDGameLayer gameLayer, final int x, final int y) {
                            final GDObject gdObject = gameLayer.gdObject;
                            this.process(gdObject, x, y);
                        }

                        public void process(final GDObject gdObject, final int x, final int y) {
                            throw new RuntimeException();
                        }

                    };
        
    </xsl:template>

</xsl:stylesheet>

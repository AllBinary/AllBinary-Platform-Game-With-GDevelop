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

    <xsl:template name="varObjetConditionGDNode" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
                    //varObjetConditionGDNode - //Condition - //VarObjet - GDNode
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                        <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                    
                        //VarObjet - condition
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            //LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(globals.<xsl:value-of select="text()" />GroupInterface)</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>"));

                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            final int size = globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            
                                final GDGameLayer gdGameLayer = ((GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index));
                                if(this.processG(gdGameLayer.gdObject, globals.graphics)) {
                                    <xsl:for-each select=".." >
                                        <xsl:call-template name="actionIdsGDObject" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                            <xsl:with-param name="gdGameLayer" >gdGameLayer</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                }
                            }
                           
                                    <xsl:for-each select=".." >
                                        <xsl:call-template name="delete" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                            <xsl:with-param name="gdGameLayer" >gdGameLayer</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                           
                            super.processStatsE();
                            
                            return true;
                        }

                        //VarObjet
                        @Override
                        public boolean processG(final GDObject <xsl:value-of select="$gdObjectName" />, final Graphics graphics) {

                            try {
                                super.processGStats(<xsl:value-of select="$gdObjectName" />, graphics);
                        
                                return this.processGPaint(<xsl:value-of select="$gdObjectName" />, graphics);
                            } catch(Exception e) {
                                //2
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return false;
                        }

                        @Override
                        public boolean processGPaint(final GDObject <xsl:value-of select="$gdObjectName" />, final Graphics graphics) {

                            try {

                        
                        <xsl:variable name="hasGameLayer" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), 'LastEndedTouchId')" >found</xsl:if></xsl:for-each></xsl:variable>

                        <xsl:if test="not(contains($hasGameLayer, 'found'))" >
                                if(<xsl:for-each select="parameters" ><xsl:if test="text() = 'rotation'" >.</xsl:if><xsl:if test="position() != 1 and  text() != 'rotation'" ><xsl:text> </xsl:text></xsl:if><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="text() = '='" >=</xsl:if></xsl:for-each>) {
                        </xsl:if>

                        <xsl:if test="contains($hasGameLayer, 'found')" >
                                if(<xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 1" >((GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="text()" />) <xsl:value-of select="text()" />).</xsl:if>
                                    <xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if>
                                    <xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if>
                                    <xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>) {
                        </xsl:if>
                                    //LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "VarObjet processing"));
                                    return true;
                                }

                            } catch(Exception e) {
                                //2
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }
                            return false;
                        }
                    };

    </xsl:template>

</xsl:stylesheet>

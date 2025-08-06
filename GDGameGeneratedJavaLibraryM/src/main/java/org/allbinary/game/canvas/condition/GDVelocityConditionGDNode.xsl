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

    <xsl:template name="velocityConditionGDNode" >
        <xsl:param name="parametersAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
        
        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
        
                    //velocityConditionGDNode - //Condition - //Vitesse - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        //private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                        //private final String ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Else: " + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        //private final StringMaker stringBuilder = new StringMaker();

                        //Vitesse - condition
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gdObjectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            GDGameLayer <xsl:value-of select="$gdObjectName" />GDGameLayer;
                            GDObject <xsl:value-of select="$gdObjectName" />;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                                <xsl:value-of select="$gdObjectName" /><xsl:text>GDGameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gdObjectName" /></xsl:with-param></xsl:call-template>.</xsl:text><xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index);
                                <xsl:value-of select="$gdObjectName" /><xsl:text> = </xsl:text><xsl:value-of select="$gdObjectName" />GDGameLayer.gdObject;
                                <xsl:variable name="closedValueForGDObject" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '&lt;' or text() = '&lt;='" >.x</xsl:if><xsl:if test="text() = '&gt;' or text() = '&gt;='" >.X2()</xsl:if></xsl:if></xsl:for-each></xsl:variable>
                                
                                //stringBuilder.delete(0, stringBuilder.length());
                                //logUtil.put(stringBuilder.append("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> ").append(commonLabels.INDEX_LABEL).append(index)
                                    //.append("<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if></xsl:for-each>: ")
                                    //.append(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if></xsl:for-each>)
                                    //.append(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if></xsl:for-each>GDGameLayer.getVelocityProperties().getVelocityXBasicDecimalP())
                                    //.append(':')
                                    //.append(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if></xsl:for-each>GDGameLayer.getVelocityProperties().getVelocityYBasicDecimalP())
                                    //.toString(), this, commonStrings.PROCESS);

                                if(<xsl:if test="$inverted = 'true'" >!</xsl:if>(<xsl:for-each select="parameters" ><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="position() = 1" ><xsl:value-of select="$closedValueForGDObject" />GDGameLayer.getVelocityProperties().getVelocityXBasicDecimalP().getScaled()</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each> <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                                   <xsl:for-each select="parameters" ><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="position() = 1" ><xsl:value-of select="$closedValueForGDObject" />GDGameLayer.getVelocityProperties().getVelocityYBasicDecimalP().getScaled()</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>)) {
                                    //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                    <xsl:for-each select=".." >
                                        <xsl:call-template name="actionIdsGDObjectPos" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                            <xsl:with-param name="gdObjectName" ><xsl:value-of select="$gdObjectName" /></xsl:with-param>
                                            <xsl:with-param name="gdGameLayer" ><xsl:value-of select="$gdObjectName" />GDGameLayer</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                } //else {
                                    //logUtil.put(ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                //}
                                //logUtil.put(<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index).toString(), this, commonStrings.PROCESS);
                            }
                                
                            super.processStatsE();

                            return true;
                        }

                    };

    </xsl:template>

</xsl:stylesheet>

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

    <xsl:template name="opacityConditionGDNode" >
        <xsl:param name="parametersAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
                    //opacityConditionGDNode - //Condition - //Opacity - GDNode
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                    
                        //Opacity - condition
                        @Override
                        public boolean process() throws Exception {

                            //final StringBuilder stringBuilder = new StringBuilder();
                            //LogUtil.put(LogFactory.getInstance(stringBuilder.append(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(globals.<xsl:value-of select="text()" />GroupInterface)</xsl:if></xsl:for-each>: ").append(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(globals.<xsl:value-of select="text()" />GroupInterface)</xsl:if></xsl:for-each>).toString(), this, commonStrings.PROCESS));

                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            final int size = globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            
                                //stringBuilder.delete(0, stringBuilder.length());
                                //LogUtil.put(LogFactory.getInstance(stringBuilder.append(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(' ').append(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" >(((GDGameLayer) globals.<xsl:value-of select="text()" disable-output-escaping="yes" />GDGameLayerList.get(index))).gdObject.opacity</xsl:if><xsl:if test="position() != 1" ><xsl:text> </xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if></xsl:for-each>).toString(), this, commonStrings.PROCESS));
                                <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final GDGameLayer gdGameLayer = (((GDGameLayer) globals.<xsl:value-of select="text()" disable-output-escaping="yes" />GDGameLayerList.get(index)));</xsl:if></xsl:for-each>
                                if(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" >gdGameLayer.gdObject.opacity</xsl:if><xsl:if test="position() != 1" ><xsl:text> </xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if></xsl:for-each>) {
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
                                    
                            return true;
                        }

                    };

    </xsl:template>

</xsl:stylesheet>

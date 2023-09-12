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

    <xsl:template name="setObjectVariableAsBooleanActionProcess" >
        <xsl:param name="layoutIndex" />
        
                        //SetObjectVariableAsBoolean - action - START
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            final int size = globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            GDGameLayer <xsl:value-of select="$gdObjectName" />GDGameLayer;
                            GDObject <xsl:value-of select="$gdObjectName" />;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                                <xsl:value-of select="$gdObjectName" /><xsl:text>GDGameLayer = (GDGameLayer) globals.</xsl:text><xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index);
                                this.processGD(<xsl:value-of select="$gdObjectName" /><xsl:text>GDGameLayer</xsl:text>, null);
                            }
                            
                            return true;
                        }
                        
                        @Override
                        public void processGD(final GDGameLayer gameLayer, final Graphics graphics) {
                            super.processGDStats(gameLayer);

                            final GDObject <xsl:value-of select="$gdObjectName" /><xsl:text> = </xsl:text>gameLayer.gdObject;                            
                            <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >((GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="text()" />) <xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 2" >).<xsl:value-of select="text()" /></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="string-length(text()) = 0" > = false;</xsl:if><xsl:if test="string-length(text()) > 0" > = <xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>;</xsl:if></xsl:if></xsl:for-each>

                        }
                        //SetObjectVariableAsBoolean - action - END

    </xsl:template>

</xsl:stylesheet>

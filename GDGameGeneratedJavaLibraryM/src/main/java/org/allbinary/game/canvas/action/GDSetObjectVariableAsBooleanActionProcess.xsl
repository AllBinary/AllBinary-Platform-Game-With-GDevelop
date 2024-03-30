<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

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
        
                    <xsl:variable name="param1" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    
                        <xsl:variable name="hasObject" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $param1" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObjectGroup" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $param1" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
        
                        //SetObjectVariableAsBoolean - action - START
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        <xsl:if test="contains($hasObjectGroup, 'found')" >
                            final int size3 = <xsl:call-template name="globals" >
                                <xsl:with-param name="name" >
                                    <xsl:value-of select="$param1" />
                                </xsl:with-param>
                            </xsl:call-template>.<xsl:value-of select="$param1" />GDGameLayerListOfList.size();
                            for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; index3++) {
                            final BasicArrayList gdGameLayerList = (BasicArrayList) <xsl:call-template name="globals" >
                                <xsl:with-param name="name" >
                                    <xsl:value-of select="$param1" />
                                </xsl:with-param>
                            </xsl:call-template>.<xsl:value-of select="$param1" />GDGameLayerListOfList.get(index3);
                        </xsl:if>
                        <xsl:if test="not(contains($hasObjectGroup, 'found'))" >
                            final BasicArrayList gdGameLayerList = <xsl:call-template name="globals" >
                                <xsl:with-param name="name" >
                                    <xsl:value-of select="$param1" />
                                </xsl:with-param>
                            </xsl:call-template>.<xsl:value-of select="$param1" />GDGameLayerList;
                        </xsl:if>
                            
                            final int size = gdGameLayerList.size();
                            GDGameLayer <xsl:value-of select="$param1" />GDGameLayer;
                            GDObject <xsl:value-of select="$param1" />;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                                <xsl:value-of select="$param1" />GDGameLayer = (GDGameLayer) gdGameLayerList.get(index);
                                this.processGD(<xsl:value-of select="$param1" /><xsl:text>GDGameLayer</xsl:text>, null, null);
                            }

                        <xsl:if test="contains($hasObjectGroup, 'found')" >
                            }
                        </xsl:if>
                                                        
                            return true;
                        }
                        
                        @Override
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                            super.processGDStats(gameLayer);

                            final GDObject <xsl:value-of select="$param1" /><xsl:text> = </xsl:text>gameLayer.gdObject;                            
                            <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) <xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 2" >).<xsl:value-of select="text()" /></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="string-length(text()) = 0" > = false;</xsl:if><xsl:if test="string-length(text()) > 0" > = <xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>;</xsl:if></xsl:if></xsl:for-each>

                            return true;
                        }
                        //SetObjectVariableAsBoolean - action - END

    </xsl:template>

</xsl:stylesheet>

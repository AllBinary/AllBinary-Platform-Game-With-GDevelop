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

    <xsl:template name="textObjectChangeColorActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        
                    <xsl:variable name="hasBuiltinCommonInstructionsForEachToProcessGD" >
                        <xsl:call-template name="hasBuiltinCommonInstructionsForEachToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>

                        //TextObject::ChangeColor - action
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            try {

                                //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                                <xsl:if test="contains($hasBuiltinCommonInstructionsForEachToProcessGD, 'found')" >
                                    if(true) throw new RuntimeException();
                                </xsl:if>
                                <xsl:if test="not(contains($hasBuiltinCommonInstructionsForEachToProcessGD, 'found'))" >
                                
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            final int colorAsInt = basicColorUtil.get(255, </xsl:if>
                                        <xsl:if test="position() = 2" >
                                            <xsl:if test="contains(text(), ';')" >
                                                <xsl:value-of select="translate(substring(text(), 2, string-length(text()) - 2), ';', ',')" />
                                            </xsl:if>
                                            <xsl:if test="not(contains(text(), ';'))" >
                                                <xsl:value-of select="text()" />
                                            </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >); //, "<xsl:value-of select="type/value" />"));</xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>
                                    
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                        final BasicColor basicColor = smallBasicColorCacheFactory.getInstance(colorAsInt);
                                        final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size();
                                        GDGameLayer gameLayer;
                                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                            gameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                                            gameLayer.setBasicColor(basicColor);
                                            //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />TextAnimation.setBasicColor(smallBasicColorCacheFactory.getInstance(colorAsInt));
                                        }
                                        </xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>

                                </xsl:if>


                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }

                            return true;
                        }

                        @Override
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                            this.processGDStats(gameLayer);

                            try {

                                //logUtil.put(ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                
                                <xsl:if test="contains($hasBuiltinCommonInstructionsForEachToProcessGD, 'found')" >
                                    <xsl:variable name="objectInForEach" >
                                        <xsl:call-template name="objectBuiltinCommonInstructionsForEachToProcessGD" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    //ForEach as parent with object=<xsl:value-of select="$objectInForEach" />
                                    GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$objectInForEach" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$objectInForEach" /><xsl:text> </xsl:text><xsl:value-of select="$objectInForEach" /> = 
                                        (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$objectInForEach" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$objectInForEach" />) gameLayer.gdObject;
                                </xsl:if>

                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            final int colorAsInt = basicColorUtil.get(255, </xsl:if>
                                        <xsl:if test="position() = 2" >
                                            <xsl:if test="contains(text(), ';')" >
                                                <xsl:value-of select="translate(substring(text(), 2, string-length(text()) - 2), ';', ',')" />
                                            </xsl:if>
                                            <xsl:if test="not(contains(text(), ';'))" >
                                                <xsl:value-of select="text()" />
                                            </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >); //, "<xsl:value-of select="type/value" />"));</xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>
                                    
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            
                                        final BasicColor basicColor = smallBasicColorCacheFactory.getInstance(colorAsInt);
                                        gameLayer.setBasicColor(basicColor);
                                        //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />TextAnimation.setBasicColor(smallBasicColorCacheFactory.getInstance(colorAsInt));

                                        </xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>

                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }

                            return true;
                        }

    </xsl:template>

</xsl:stylesheet>

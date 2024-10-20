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

    <xsl:template name="modVarObjetTxtActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="createdObjectsAsString" />
                    <xsl:variable name="secondParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //ModVarObjetTxt - //<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                        
                            <xsl:variable name="thirdParam0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        
                            <!-- TWBTWB - temp hack - replace hardcoded TextEntry -->
                            <xsl:variable name="thirdParam" >
                                <xsl:if test="contains($thirdParam0, 'TextEntry.')" >
                            <xsl:call-template name="string-replace-all" >
                                <xsl:with-param name="text" >
                                    <xsl:value-of select="$thirdParam0" />
                                </xsl:with-param>
                                <xsl:with-param name="find" >TextEntry.</xsl:with-param>
                                <xsl:with-param name="replacementText" >((GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.TextEntry) ((GDGameLayer) globals.TextEntryGDGameLayerist.get(0)).gdObject).</xsl:with-param>
                            </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="not(contains($thirdParam0, 'TextEntry.'))" ><xsl:value-of select="$thirdParam0" /></xsl:if>
                            </xsl:variable>

                        <xsl:variable name="firstParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="string-length($firstParam) > 0" >
                            //firstParam=<xsl:value-of select="$firstParam" />
                            <xsl:variable name="gameLayerName" ><xsl:value-of select="$firstParam" /></xsl:variable>
                            <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gameLayerName" /></xsl:variable>
                            final GDGameLayer <xsl:value-of select="$gameLayerName" />GDGameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(0);
                            final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$gameLayerName" /> = (<xsl:value-of select="$gdObjectFactory" />) <xsl:value-of select="$gameLayerName" />GDGameLayer.gdObject;
                        </xsl:if>

                            <xsl:variable name="fourthParam0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>                           
                            <xsl:variable name="fourthParam1" >
                            <xsl:call-template name="string-replace-all" >
                                <xsl:with-param name="text" >
                                    <xsl:value-of select="$fourthParam0" />
                                </xsl:with-param>
                                <xsl:with-param name="find" >VariableString(</xsl:with-param>
                                <xsl:with-param name="replacementText" ></xsl:with-param>
                            </xsl:call-template>
                            </xsl:variable>
                            <xsl:variable name="fourthParam2" >
                            <xsl:call-template name="string-replace-all" >
                                <xsl:with-param name="text" >
                                    <xsl:value-of select="$fourthParam1" />
                                </xsl:with-param>
                                <xsl:with-param name="find" >Variable(</xsl:with-param>
                                <xsl:with-param name="replacementText" ></xsl:with-param>
                            </xsl:call-template>
                            </xsl:variable>
                            <xsl:variable name="fourthParam3" >
                            <xsl:call-template name="string-replace-all" >
                                <xsl:with-param name="text" >
                                    <xsl:value-of select="$fourthParam2" />
                                </xsl:with-param>
                                <xsl:with-param name="find" >)])</xsl:with-param>
                                <xsl:with-param name="replacementText" >]</xsl:with-param>
                            </xsl:call-template>
                            </xsl:variable>

                            <xsl:for-each select="parameters" >
<!--                                <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.-->
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.</xsl:if>
                                <xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if>
                                <xsl:if test="position() = 3" ><xsl:value-of select="$thirdParam" /></xsl:if>
                                <xsl:if test="position() = 4" ><xsl:value-of select="$fourthParam3" /></xsl:if>
                                <xsl:if test="position() = last()" >;</xsl:if>
                            </xsl:for-each>

                        return true;
                    }        

                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                        
                        return this.process();
                    }

                    @Override
                    public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                        super.processGDStats(gameLayer);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                        
                        return this.process();
                    }

    </xsl:template>

</xsl:stylesheet>

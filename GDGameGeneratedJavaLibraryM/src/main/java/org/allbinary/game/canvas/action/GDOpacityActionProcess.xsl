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

    <xsl:template name="opacityActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
    
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //Opacity - action
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();
                        
                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size();</xsl:if></xsl:for-each>
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final GDGameLayer gameLayer = (((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index)));</xsl:if></xsl:for-each>
                            this.processGD(gameLayer, null, globals.graphics);
                            gameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta);
                        }

                        return true;
                    }

                    @Override
                    public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                        super.processGDStats(gameLayer);

                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final GDObject <xsl:value-of select="text()" /> = gameLayer.gdObject;</xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
<xsl:text>                        </xsl:text><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.opacity</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /><xsl:if test="text() = '+' or text() = '-'" >=</xsl:if></xsl:if><xsl:if test="position() = 3" ><xsl:if test="not(contains(text(), 'Variable('))" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="contains(text(), 'Variable(')" ><xsl:value-of select="substring-before(text(), 'Variable(')" />Variable(<xsl:value-of select="$name" />.<xsl:value-of select="substring-after(text(), 'Variable(')" /></xsl:if></xsl:if><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >(((GDGameLayer) globals.<xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>GDGameLayerList.get(index))).gdObject.<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_IS_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.opacity</xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                        
                        return true;
                    }

                    @Override
                    public boolean processU(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final GDGameLayer gameLayer = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index));</xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final GDObject <xsl:value-of select="text()" /> = gameLayer.gdObject;</xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>

<xsl:text>                        </xsl:text><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.opacity</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /><xsl:if test="text() = '+' or text() = '-'" >=</xsl:if></xsl:if><xsl:if test="position() = 3" ><xsl:if test="not(contains(text(), 'Variable('))" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="contains(text(), 'Variable(')" ><xsl:value-of select="substring-before(text(), 'Variable(')" />Variable(<xsl:value-of select="$name" />.<xsl:value-of select="substring-after(text(), 'Variable(')" /></xsl:if></xsl:if><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >(((GDGameLayer) globals.<xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>GDGameLayerList.get(index))).gdObject.<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        gameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta);
                        <xsl:text>&#10;</xsl:text>
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_IS_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.opacity</xsl:if></xsl:for-each>, this, commonStrings.PROCESS));

                        return true;
                    }
                                                                                      
                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final GDObject <xsl:value-of select="text()" /> = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index)).gdObject;</xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>

<xsl:text>                        </xsl:text><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.opacity</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /><xsl:if test="text() = '+' or text() = '-'" >=</xsl:if></xsl:if><xsl:if test="position() = 3" ><xsl:if test="not(contains(text(), 'Variable('))" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="contains(text(), 'Variable(')" ><xsl:value-of select="substring-before(text(), 'Variable(')" />Variable(<xsl:value-of select="$name" />.<xsl:value-of select="substring-after(text(), 'Variable(')" /></xsl:if></xsl:if><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >(((GDGameLayer) globals.<xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>GDGameLayerList.get(index))).gdObject.<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_IS_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.opacity</xsl:if></xsl:for-each>, this, commonStrings.PROCESS));

                        return true;
                    }
        
    </xsl:template>

</xsl:stylesheet>

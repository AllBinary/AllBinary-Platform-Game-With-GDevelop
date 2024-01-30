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

    <xsl:template name="objectVariablePushNumberActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="createdObjectsAsString" />
                    <xsl:variable name="secondParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //ObjectVariablePushNumber - //<xsl:value-of select="$secondParam" /> - this is slow and creates a new array each time.
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size();</xsl:if>
                        </xsl:for-each>
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            this.process(index);
                        }
                        return true;
                    }
                    
                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                        
                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" /><xsl:text> </xsl:text><xsl:value-of select="text()" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index)).gdObject;</xsl:if></xsl:for-each>
                        <xsl:variable name="gdObject" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:text>&#10;</xsl:text>
                        
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >final GDGameLayer paramOneGameLayer = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index));</xsl:if>
                        </xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:variable name="paramTwoName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>
<xsl:text>                        </xsl:text>
                        <xsl:if test="$paramTwoName != ''" >final GDGameLayer paramTwoGameLayer = ((GDGameLayer) globals.<xsl:value-of select="$paramTwoName" />GDGameLayerList.get(index));</xsl:if>
                        <xsl:text>&#10;</xsl:text>
<xsl:text>                        </xsl:text><xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >final int oldSize = ((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) paramOneGameLayer.gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" />.length;</xsl:if>
                        </xsl:for-each>
                        <xsl:text>&#10;</xsl:text>         
<xsl:text>                        </xsl:text><xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) paramOneGameLayer.gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if>
                        </xsl:for-each> = <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >arrayUtil.copyOf(((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) paramOneGameLayer.gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" />, </xsl:if>
                        </xsl:for-each><xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) paramOneGameLayer.gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" />.length + 1);</xsl:if>
                        </xsl:for-each>

<xsl:text>                        </xsl:text>
                        <xsl:if test="$paramTwoName != ''" >final GDGameLayer paramTwoGameLayer = ((GDGameLayer) globals.<xsl:value-of select="$paramTwoName" />GDGameLayerList.get(index));</xsl:if>
                        <xsl:text>&#10;</xsl:text>
<xsl:text>                        </xsl:text><xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) paramOneGameLayer.gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" />[oldSize] = </xsl:if><xsl:if test="position() = 3" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" >.VariableChildCount(</xsl:with-param><xsl:with-param name="replacementText" >.VariableChildCount(<xsl:value-of select="$gdObject" />.</xsl:with-param></xsl:call-template><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if><xsl:if test="position() = 4" ><xsl:if test="$paramTwoName != ''" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >paramTwoGameLayer.gdObject.<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="$paramTwoName = ''" ><xsl:value-of select="text()" /></xsl:if></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>

                        <xsl:text>&#10;</xsl:text>
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_IS_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) (((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                        return true;
                    }        

    </xsl:template>

</xsl:stylesheet>

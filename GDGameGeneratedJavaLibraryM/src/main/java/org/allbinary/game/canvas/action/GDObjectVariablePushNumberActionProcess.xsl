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

    <xsl:template name="objectVariablePushNumberActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        
                    <xsl:variable name="firstParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="secondParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="thirdParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                    <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$firstParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$firstParam" /></xsl:variable>

                    //ObjectVariablePushNumber - //<xsl:value-of select="$secondParam" /> - this is slow and creates a new array each time.
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$firstParam" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$firstParam" />GDGameLayerList.size();
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            this.process(index);
                        }
                        return true;
                    }
                    
                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                        
                        final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$firstParam" /> = (<xsl:value-of select="$gdObjectFactory" />) ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$firstParam" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$firstParam" />GDGameLayerList.get(index)).gdObject;
                        <xsl:variable name="gdObject" ><xsl:value-of select="$firstParam" /></xsl:variable>
                        <xsl:text>&#10;</xsl:text>
                        
                        final GDGameLayer paramOneGameLayer = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$firstParam" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$firstParam" />GDGameLayerList.get(index));
                        <xsl:text>&#10;</xsl:text>
                        <xsl:variable name="paramTwoName" ><xsl:if test="substring-before($fourthParam, '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:variable>
<xsl:text>                        </xsl:text>
                        <xsl:if test="$paramTwoName != ''" >final GDGameLayer paramTwoGameLayer = ((GDGameLayer) globals.<xsl:value-of select="$paramTwoName" />GDGameLayerList.get(index));</xsl:if>
                        <xsl:text>&#10;</xsl:text>
<xsl:text>                        </xsl:text>final int oldSize = ((<xsl:value-of select="$gdObjectFactory" />) paramOneGameLayer.gdObject).<xsl:value-of select="$secondParam" />.length;
                        <xsl:text>&#10;</xsl:text>         
<xsl:text>                        </xsl:text>((<xsl:value-of select="$gdObjectFactory" />) paramOneGameLayer.gdObject).<xsl:value-of select="$secondParam" /> = 
                                      arrayUtil.copyOf(((<xsl:value-of select="$gdObjectFactory" />) paramOneGameLayer.gdObject).<xsl:value-of select="$secondParam" />, 
                                      ((<xsl:value-of select="$gdObjectFactory" />) paramOneGameLayer.gdObject).<xsl:value-of select="$secondParam" />.length + 1);

<xsl:text>                        </xsl:text>
                        <xsl:if test="$paramTwoName != ''" >final GDGameLayer paramTwoGameLayer = ((GDGameLayer) globals.<xsl:value-of select="$paramTwoName" />GDGameLayerList.get(index));</xsl:if>
                        <xsl:text>&#10;</xsl:text>
<xsl:text>                        </xsl:text>((<xsl:value-of select="$gdObjectFactory" />) paramOneGameLayer.gdObject).<xsl:value-of select="$secondParam" />[oldSize] = <xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$thirdParam" /></xsl:with-param><xsl:with-param name="find" >.VariableChildCount(</xsl:with-param><xsl:with-param name="replacementText" >.VariableChildCount(<xsl:value-of select="$gdObject" />.</xsl:with-param></xsl:call-template><xsl:if test="$thirdParam = '+'" >=</xsl:if><xsl:if test="$thirdParam = '-'" >=</xsl:if><xsl:if test="$paramTwoName != ''" ><xsl:if test="substring-before($fourthParam, '.') = ''" ><xsl:value-of select="$fourthParam" /></xsl:if><xsl:if test="substring-before($fourthParam, '.') != ''" >paramTwoGameLayer.gdObject.<xsl:value-of select="substring-after($fourthParam, '.')" /></xsl:if></xsl:if><xsl:if test="$paramTwoName = ''" ><xsl:value-of select="$fourthParam" /></xsl:if>;

                        <xsl:text>&#10;</xsl:text>
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + ((<xsl:value-of select="$gdObjectFactory" />) (((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$firstParam" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$firstParam" />GDGameLayerList.get(index))).gdObject).<xsl:value-of select="$secondParam" />, this, commonStrings.PROCESS));
                        return true;
                    }        

    </xsl:template>

</xsl:stylesheet>

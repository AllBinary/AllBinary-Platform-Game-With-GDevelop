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

    <xsl:template name="modVarObjetActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="createdObjectsAsString" />
                    <xsl:variable name="secondParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //ModVarObjet - //<xsl:value-of select="$secondParam" />
                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        <!-- <xsl:if test="$secondParam = 'opacity'" > -->
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                        <!-- </xsl:if> -->
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >final GDGameLayer paramOneGameLayer = ((GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index));</xsl:if>
                        </xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:variable name="paramTwoName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>
<xsl:text>                        </xsl:text>
                        <xsl:if test="$paramTwoName != ''" >final GDGameLayer paramOneGameLayer = ((GDGameLayer) globals.<xsl:value-of select="$paramTwoName" />GDGameLayerList.get(index));</xsl:if>
                        <xsl:text>&#10;</xsl:text>
<xsl:text>                        </xsl:text><xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="text()" />) paramOneGameLayer.gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="$paramTwoName != ''" ><xsl:if test="substring-before(text(), '.') != ''" >paramTwoGameLayer.gdObject.<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="$paramTwoName = ''" ><xsl:value-of select="text()" /></xsl:if></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        <!-- <xsl:if test="$secondParam = 'opacity'" > -->
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_IS_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >((GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="text()" />) (((GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                        <!-- </xsl:if> -->
                        return true;
                    }        

    </xsl:template>

</xsl:stylesheet>

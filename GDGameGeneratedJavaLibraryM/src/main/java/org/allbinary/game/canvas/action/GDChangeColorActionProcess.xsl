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

    <xsl:template name="changeColorActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

                    //ChangeColor - index
                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >(((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject.basicColor = smallBasicColorCacheFactory.getInstance(
                        </xsl:if>
                        <xsl:if test="position() != 1" >basicColorUtil.get(255, 
                            <xsl:call-template name="string-replace-all" >
                                <xsl:with-param name="text" >
                                    <xsl:value-of select="translate(translate(translate(text(), '\&quot;', ''), ';', ','), '+', '')" />
                                </xsl:with-param>
                                <xsl:with-param name="find" >ToString(</xsl:with-param>
                                <xsl:with-param name="replacementText" >ToNotString(</xsl:with-param>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="position() = last()" >));</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                        return true;
                    }
        
    </xsl:template>

</xsl:stylesheet>

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

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!--
                    <xsl:if test="not(preceding-sibling::actions[type/value/text() = 'Create'])">
                        //No preceding action with Create
                        <xsl:call-template name="objectGDObjectAtIndex" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="parametersAsString" >
                                <xsl:for-each select="parameters" ><xsl:if test="position() > 2" ><xsl:value-of select="text()" />,</xsl:if></xsl:for-each>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>                        
    -->

    <xsl:template name="objectGDObjectAtIndex" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />

        //objectGDObjectAtIndex - START
        //layoutIndex=<xsl:value-of select="$layoutIndex" /> parametersAsString=<xsl:value-of select="$parametersAsString" />
        <xsl:for-each select="/game">
            <xsl:for-each select="layouts" >
                <xsl:variable name="index" select="position() - 1" />
                <xsl:if test="number($index) = $layoutIndex" >

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="name" ><xsl:value-of select="name" />.</xsl:variable>

                        <xsl:if test="contains($parametersAsString, $name) = text()" >
                            <xsl:if test="$typeValue = 'Sprite'" >
                                    final GDObject <xsl:value-of select="name" /> = ((GDGameLayer) gameLayer).gdObject;
                            </xsl:if>
                            <xsl:if test="$typeValue = 'TextObject::Text'" >
                                    final GDObject <xsl:value-of select="name" /> = ((GDGameLayer) gameLayer).gdObject;
                            </xsl:if>
                        </xsl:if>

                    </xsl:for-each>

                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        //objectGDObjectAtIndex - END

    </xsl:template>

    <xsl:template name="objectGDObjectAtIndex2" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />

        <xsl:for-each select="/game">
            <xsl:for-each select="layouts" >
                <xsl:variable name="index" select="position() - 1" />
                <xsl:if test="number($index) = $layoutIndex" >

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="name" ><xsl:value-of select="name" />.</xsl:variable>

                        <xsl:if test="contains($parametersAsString, $name) = text()" >
                            <xsl:if test="$typeValue = 'Sprite'" >
                        //final GDObject <xsl:value-of select="name" /> = ((GDGameLayer) <xsl:value-of select="name" />GDGameLayerList.get(0)).gdObject;
                        this.process(((GDGameLayer) <xsl:value-of select="name" />GDGameLayerList.get(0)), null);
                            </xsl:if>
                            <xsl:if test="$typeValue = 'TextObject::Text'" >
                        //final GDObject <xsl:value-of select="name" /> = ((GDGameLayer) <xsl:value-of select="name" />GDGameLayerList.get(0)).gdObject;
                        this.process(((GDGameLayer) <xsl:value-of select="name" />GDGameLayerList.get(0)), null);
                            </xsl:if>
                        </xsl:if>

                    </xsl:for-each>

                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>

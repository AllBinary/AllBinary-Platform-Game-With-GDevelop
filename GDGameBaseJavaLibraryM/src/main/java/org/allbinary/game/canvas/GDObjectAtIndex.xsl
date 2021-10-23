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

    <xsl:template name="gameLayer" >
        <xsl:param name="name" />
        <xsl:param name="iteration" />
        
        <xsl:if test="$iteration = 0" >
                                    final GDGameLayer <xsl:value-of select="$name" />GDGameLayer = ((GDGameLayer) gameLayer);
                                    GDObject <xsl:value-of select="$name" /> = null;
                                    if(<xsl:value-of select="$name" />GDGameLayer != null) {
                                        <xsl:value-of select="$name" /> = <xsl:value-of select="$name" />GDGameLayer.gdObject;
                                    } else {
                                        final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: not initialized";
                                        LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                                    }

        </xsl:if>
        <xsl:if test="$iteration = 1" >
                                    final GDGameLayer <xsl:value-of select="$name" />GDGameLayer = ((GDGameLayer) gameLayer2);
                                    GDObject <xsl:value-of select="$name" /> = null;
                                    if(<xsl:value-of select="$name" />GDGameLayer != null) {
                                        <xsl:value-of select="$name" /> = <xsl:value-of select="$name" />GDGameLayer.gdObject;
                                    } else {
                                        final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> not initialized";
                                        LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                                    }
        </xsl:if>

    </xsl:template>

    <xsl:template name="objectGDObjectAtIndex" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />

        //objectGDObjectAtIndex - START
        //objectGDObjectAtIndex - layoutIndex=<xsl:value-of select="$layoutIndex" /> parametersAsString=<xsl:value-of select="$parametersAsString" />
        <xsl:for-each select="/game">
            <xsl:for-each select="layouts" >
                <xsl:variable name="index" select="position() - 1" />
                <xsl:if test="number($index) = $layoutIndex" >

                    <xsl:variable name="names" >
                        <xsl:for-each select="objects" >
                            <xsl:variable name="typeValue" select="type" />
                            <xsl:variable name="name" >
                                <xsl:value-of select="name" />.</xsl:variable>
                            <xsl:variable name="name_comma" >
                                <xsl:value-of select="name" />,</xsl:variable>

                            <xsl:if test="contains($parametersAsString, $name) = text() or contains($parametersAsString, $name_comma) = text()" >
                                <xsl:if test="$typeValue = 'Sprite'" ><xsl:value-of select="name" />,</xsl:if>
                                <xsl:if test="$typeValue = 'TextObject::Text'" ><xsl:value-of select="name" />,</xsl:if>
                            </xsl:if>

                        </xsl:for-each>
                    </xsl:variable>

                    //names=<xsl:value-of select="$names" />
                    <xsl:call-template name="split" >
                        <xsl:with-param name="names" >
                            <xsl:value-of select="$names" />
                        </xsl:with-param>                      
                        <xsl:with-param name="iteration" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>                      
                        <xsl:with-param name="templateName" >gameLayer</xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        //objectGDObjectAtIndex - END

    </xsl:template>

    <xsl:template name="objectGDObjectAtIndex2" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />

        //objectGDObjectAtIndex2 - layoutIndex=<xsl:value-of select="$layoutIndex" /> parametersAsString=<xsl:value-of select="$parametersAsString" />
        <xsl:for-each select="/game">
            <xsl:for-each select="layouts" >
                <xsl:variable name="index" select="position() - 1" />
                <xsl:if test="number($index) = $layoutIndex" >

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="name" ><xsl:value-of select="name" />.</xsl:variable>

                        <xsl:if test="contains($parametersAsString, $name) = text()" >
                            <xsl:if test="$typeValue = 'Sprite'" >
                        //objectGDObjectAtIndex2 - collide - Sprite
                        GDGameLayer <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" /> = null;
                        if(<xsl:value-of select="name" />GDGameLayerList != null) {
                            if(<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" /> = ((GDGameLayer) <xsl:value-of select="name" />GDGameLayerList.get(0));
                            } else {
                                final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: list size was 0";
                                LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                            }
                        } else {
                            final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: was null";
                            LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                        }
                        //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />.gdObject;
                            </xsl:if>
                            <xsl:if test="$typeValue = 'TextObject::Text'" >
                        //objectGDObjectAtIndex2 - collide - TextObject::Text
                        GDGameLayer <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" /> = null;
                        if(<xsl:value-of select="name" />GDGameLayerList != null) {
                            if(<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" /> = ((GDGameLayer) <xsl:value-of select="name" />GDGameLayerList.get(0));
                            } else {
                                final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: list size was 0";
                                LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                            }
                        } else {
                            final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: was null";
                            LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                        }
                        //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />.gdObject;
                            </xsl:if>
                        </xsl:if>

                    </xsl:for-each>

                    <xsl:variable name="params" >
                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="name" ><xsl:value-of select="name" />.</xsl:variable>

                        <xsl:if test="contains($parametersAsString, $name) = text()" >
                            <xsl:if test="$typeValue = 'Sprite'" >
                        <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />,
                            </xsl:if>
                            <xsl:if test="$typeValue = 'TextObject::Text'" >
                        <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />,
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    </xsl:variable>
                    
                    <xsl:if test="string-length($params) > 0" >
                    this.process(<xsl:value-of select="$params" /> null);
                    </xsl:if>

                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>

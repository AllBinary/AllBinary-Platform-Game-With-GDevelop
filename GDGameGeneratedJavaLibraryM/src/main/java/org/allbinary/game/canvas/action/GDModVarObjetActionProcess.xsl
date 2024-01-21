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
                    
                    <xsl:variable name="paramTwoName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                    //paramTwoName=<xsl:value-of select="$paramTwoName" />
                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        <!-- <xsl:if test="$secondParam = 'opacity'" > -->
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                        <!-- </xsl:if> -->
                        <xsl:for-each select="parameters" >
                        //parameter1
                        <xsl:if test="position() = 1" >final GDGameLayer paramOneGameLayer = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index));</xsl:if>
                        </xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
<xsl:text>                        </xsl:text>
                        <xsl:if test="$paramTwoName != ''" >final GDGameLayer paramTwoGameLayer = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramTwoName" />GDGameLayerList.get(index));</xsl:if>
                        <xsl:text>&#10;</xsl:text>
<xsl:text>                        </xsl:text><xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) paramOneGameLayer.gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="text() = '*'" >=</xsl:if><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if>
                        //parameter4
                        <xsl:if test="position() = 4" >
                            <xsl:variable name="param" >
                                <xsl:if test="not(contains(text(), 'SceneInstancesCount('))" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                                <xsl:if test="contains(text(), 'SceneInstancesCount(')" >
                                    <xsl:variable name="objectName" >
                                        <xsl:value-of select="substring-before(substring-after(text(), 'SceneInstancesCount('), ')')" />
                                    </xsl:variable>
                                    <xsl:call-template name="string-replace-all" >
                                        <xsl:with-param name="text" >
                                            <xsl:value-of select="text()" />
                                        </xsl:with-param>
                                        <xsl:with-param name="find" >
                                            <xsl:value-of select="$objectName" />
                                        </xsl:with-param>
                                        <xsl:with-param name="replacementText" >SceneInstancesCount(gameGlobals.<xsl:value-of select="$objectName" />GDGameLayerList.size())</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:if>
                            </xsl:variable>
                            
                            <xsl:if test="$paramTwoName != ''" >
                                <xsl:if test="substring-before($param, '.') = ''" >
                                    <xsl:value-of select="$param" />
                                </xsl:if>
                                <xsl:if test="substring-before($param, '.') != ''" >paramTwoGameLayer.gdObject.<xsl:value-of select="substring-after($param, '.')" /></xsl:if>
                            </xsl:if>
                            <xsl:if test="$paramTwoName = ''" >
                                
                                <xsl:variable name="before" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>
                                <xsl:variable name="hasObject" >
                                    <xsl:for-each select="//objects" >
                                        <xsl:if test="name = $before" >found</xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>

                                <xsl:if test="$before != ''" >
                                    //<xsl:value-of select="$before" /> - <xsl:value-of select="$hasObject" /><xsl:text>&#10;</xsl:text>
                                    <xsl:if test="contains($hasObject, 'found')" >
                                    ((GD<xsl:call-template name="objectFactory" >
                                        <xsl:with-param name="name" >
                                            <xsl:value-of select="$before" />
                                        </xsl:with-param>
                                        <xsl:with-param name="layoutIndex" >
                                            <xsl:value-of select="$layoutIndex" />
                                        </xsl:with-param>
                                    </xsl:call-template>GDObjectsFactory.<xsl:value-of select="$before" />) paramOneGameLayer.gdObject).<xsl:value-of select="substring-after($param, '.')" />
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(contains($hasObject, 'found'))" >
                                <xsl:value-of select="$param" />
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        <!-- <xsl:if test="$secondParam = 'opacity'" > -->
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_IS_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) (((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                        <!-- </xsl:if> -->
                        return true;
                    }        

                    @Override
                    public void processGD(final GDGameLayer gameLayer, final Graphics graphics) {
                        super.processGDStats(gameLayer);

                        <!-- <xsl:if test="$secondParam = 'opacity'" > -->
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                        <!-- </xsl:if> -->
<xsl:text>                        </xsl:text>
                        <xsl:if test="$paramTwoName != ''" >final GDGameLayer paramTwoGameLayer = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramTwoName" />GDGameLayerList.get(0));</xsl:if>
                        <xsl:text>&#10;</xsl:text>
<xsl:text>                        </xsl:text><xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) gameLayer.gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="text() = '*'" >=</xsl:if><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if>
                        <xsl:if test="position() = 4" >
                            <xsl:variable name="param" >
                                <xsl:if test="not(contains(text(), 'SceneInstancesCount('))" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                                <xsl:if test="contains(text(), 'SceneInstancesCount(')" >
                                    <xsl:variable name="objectName" >
                                        <xsl:value-of select="substring-before(substring-after(text(), 'SceneInstancesCount('), ')')" />
                                    </xsl:variable>
                                    <xsl:call-template name="string-replace-all" >
                                        <xsl:with-param name="text" >
                                            <xsl:value-of select="text()" />
                                        </xsl:with-param>
                                        <xsl:with-param name="find" >
                                            <xsl:value-of select="$objectName" />
                                        </xsl:with-param>
                                        <xsl:with-param name="replacementText" >SceneInstancesCount(gameGlobals.<xsl:value-of select="$objectName" />GDGameLayerList.size())</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:if>
                            </xsl:variable>

                            <xsl:if test="$paramTwoName != ''" >
                                <xsl:if test="substring-before($param, '.') = ''" >
                                    <xsl:value-of select="$param" />
                                </xsl:if>
                                <xsl:if test="substring-before($param, '.') != ''" >paramTwoGameLayer.gdObject.<xsl:value-of select="substring-after($param, '.')" /></xsl:if>
                            </xsl:if>
                            <xsl:if test="$paramTwoName = ''" >
                                <xsl:variable name="before" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>
                                <xsl:variable name="hasObject" >
                                    <xsl:for-each select="//objects" >
                                        <xsl:if test="name = $before" >found</xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>

                                <xsl:if test="$before != ''" >
                                    //<xsl:value-of select="$before" /> - <xsl:value-of select="$hasObject" /><xsl:text>&#10;</xsl:text>
                                    <xsl:if test="contains($hasObject, 'found')" >
                                    ((GD<xsl:call-template name="objectFactory" >
                                        <xsl:with-param name="name" >
                                            <xsl:value-of select="$before" />
                                        </xsl:with-param>
                                        <xsl:with-param name="layoutIndex" >
                                            <xsl:value-of select="$layoutIndex" />
                                        </xsl:with-param>
                                    </xsl:call-template>GDObjectsFactory.<xsl:value-of select="$before" />) gameLayer.gdObject).<xsl:value-of select="substring-after($param, '.')" />
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(contains($hasObject, 'found'))" >
                                <xsl:value-of select="$param" />
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        <!-- <xsl:if test="$secondParam = 'opacity'" > -->
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_IS_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) gameLayer.gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                        <!-- </xsl:if> -->
                        //return true;
                    }        

    </xsl:template>

</xsl:stylesheet>

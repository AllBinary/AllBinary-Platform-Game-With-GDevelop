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

    <xsl:template name="gameLayer" >
        <xsl:param name="name" />
        <xsl:param name="iteration" />
        
                                    final GDGameLayer <xsl:value-of select="$name" />GDGameLayer = ((GDGameLayer) gameLayer);
                                    GDObject <xsl:value-of select="$name" /> = null;
                                    if(<xsl:value-of select="$name" />GDGameLayer != null) {
                                        <xsl:value-of select="$name" /> = <xsl:value-of select="$name" />GDGameLayer.gdObject;
                                    } else {
                                        final String message = "<xsl:value-of select="$name" /> warning: not initialized";
                                        LogUtil.put(LogFactory.getInstance(message, this, message));
                                    }
        
    </xsl:template>

    <xsl:template name="gameLayerList" >
        <xsl:param name="name" />
        
                                    final GDGameLayer <xsl:value-of select="$name" />GDGameLayer = ((GDGameLayer) <xsl:value-of select="$name" />GDGameLayerList.get(index));
                                    final GDObject <xsl:value-of select="$name" /> = <xsl:value-of select="$name" />GDGameLayer.gdObject;
        
    </xsl:template>
    
    <!--
        <xsl:if test="$iteration = 0" >
        </xsl:if>
    
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

                        final GDAction gdAction = this;
                        final BasicArrayList gdActionList = new BasicArrayList();

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="name" ><xsl:value-of select="name" />.</xsl:variable>

                        <xsl:if test="contains($parametersAsString, $name) = text()" >
                            <xsl:if test="$typeValue = 'Sprite'" >
                        //objectGDObjectAtIndex2 - collide - Sprite
                        
                        gdActionList.add(new GDAction() {
                                
                            public void process() {
                                this.process(null, null);
                            }

                            public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2) {

                        if(<xsl:value-of select="name" />GDGameLayerList != null) {
                            if(<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                final int size = <xsl:value-of select="name" />GDGameLayerList.size();
                                GDGameLayer gdGameLayer = null;
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    //<xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />
                                    gdGameLayer = ((GDGameLayer) <xsl:value-of select="name" />GDGameLayerList.get(index));
                                    <xsl:if test="string-length($params) > 0" >
                                    /*<xsl:value-of select="$params" />*/
                                    final int indexOfGDAction = gdActionList.indexOf(this) + 1;
                                    if(indexOfGDAction == 1) {
                                        ((GDAction) gdActionList.get(indexOfGDAction)).process(gdGameLayer, null, null);
                                    } else if(indexOfGDAction == 2) {
                                        ((GDAction) gdActionList.get(indexOfGDAction)).process(gameLayer, gdGameLayer, null); 
                                    }
                                    </xsl:if>                                    
                                }
                            } else {
                                final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: list size was 0";
                                LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                            }
                        } else {
                            final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: was null";
                            LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                            final int indexOfGDAction = gdActionList.indexOf(this) + 1;
                            if(indexOfGDAction == 1) {
                                ((GDAction) gdActionList.get(indexOfGDAction)).process(null, null, null);
                            } else if(indexOfGDAction == 2) {
                                ((GDAction) gdActionList.get(indexOfGDAction)).process(gameLayer, null, null); 
                            }
                        }
                        //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />.gdObject;
                            }
                        });
                            </xsl:if>
                            <xsl:if test="$typeValue = 'TextObject::Text'" >
                        //objectGDObjectAtIndex2 - collide - TextObject::Text
                        gdActionList.add(new GDAction() {

                            public void process() {
                                this.process(null, null);
                            }

                            public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2) {

                        if(<xsl:value-of select="name" />GDGameLayerList != null) {
                            if(<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                final int size = <xsl:value-of select="name" />GDGameLayerList.size();
                                GDGameLayer gdGameLayer = null;
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    //<xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />
                                    gdGameLayer = ((GDGameLayer) <xsl:value-of select="name" />GDGameLayerList.get(index));
                                    <xsl:if test="string-length($params) > 0" >
                                    /*<xsl:value-of select="$params" />*/
                                    final int indexOfGDAction = gdActionList.indexOf(this) + 1;
                                    if(indexOfGDAction == 1) {
                                        ((GDAction) gdActionList.get(indexOfGDAction)).process(gdGameLayer, null, null);
                                    } else if(indexOfGDAction == 2) {
                                        ((GDAction) gdActionList.get(indexOfGDAction)).process(gameLayer, gdGameLayer, null); 
                                    }
                                    </xsl:if>                                    
                                }
                            } else {
                                final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: list size was 0";
                                LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                            }
                        } else {
                            final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: was null";
                            LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                            final int indexOfGDAction = gdActionList.indexOf(this) + 1;
                            if(indexOfGDAction == 1) {
                                ((GDAction) gdActionList.get(indexOfGDAction)).process(null, null, null);
                            } else if(indexOfGDAction == 2) {
                                ((GDAction) gdActionList.get(indexOfGDAction + 1)).process(gameLayer, null, null); 
                            }
                        }
                        //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />.gdObject;
                            }
                        });
                            </xsl:if>
                        </xsl:if>
                        <xsl:variable name="name2" ><xsl:value-of select="name" />,</xsl:variable>
                        <xsl:if test="contains($parametersAsString, $name2)" >
                            <xsl:if test="not(contains($parametersAsString, $name) = text()) and name = 'player'" >
                        //Hack for GDevelop player with GDAction
                        gdActionList.add(new GDAction() {

                            public void process() {
                                if(<xsl:value-of select="name" />GDGameLayerList != null) {
                                    if(<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                        this.process((CollidableCompositeLayer) <xsl:value-of select="name" />GDGameLayerList.get(0), null);
                                    }
                                }
                            }
                                                            
                            public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2) {
                                gdAction.process(gameLayer, gameLayer2, null);
                            }
                        });
                                
                            </xsl:if>
                        </xsl:if>

                    </xsl:for-each>

                        gdActionList.add(new GDAction() {
                            public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2) {
                                gdAction.process(gameLayer, gameLayer2, null);
                            }
                        });

                        //When gdActionList size is 1 with only the 1 object above then nothing occurs
                        ((GDAction) gdActionList.get(0)).process();

                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>

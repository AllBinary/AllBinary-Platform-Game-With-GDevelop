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

    <xsl:template name="addForceXYActionProcess" >

                                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //AddForceXY - action
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        try {
                
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

            <xsl:if test="../actions" >
                            //if(globals.<xsl:value-of select="$name" />GDGameLayerList != null) {
                            if(globals.<xsl:value-of select="$name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            final int size = globals.<xsl:value-of select="$name" />GDGameLayerList.size();

                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                                //LogUtil.put(LogFactory.getInstance(CommonLabels.getInstance().INDEX_LABEL + index, this, commonStrings.PROCESS));
            </xsl:if>
                <xsl:call-template name="gameLayerList" >
                    <xsl:with-param name="name" >
                        <xsl:value-of select="$name"/>
                    </xsl:with-param>
                </xsl:call-template>

                                this.processGD(<xsl:value-of select="$name" />GDGameLayer, globals.graphics);

            <xsl:if test="../actions" >
                                }
                            } else {
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> <xsl:value-of select="$name" />GDGameLayerList was null", this, commonStrings.PROCESS));
                            }
            </xsl:if>

                        } catch(Exception e) {
                        //12
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                        }

                        return true;
                    }

                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);
                
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

            <xsl:if test="../actions" >
                        //if(globals.<xsl:value-of select="$name" />GDGameLayerList != null) {
                        if(globals.<xsl:value-of select="$name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            if(globals.<xsl:value-of select="$name" />GDGameLayerList.size() != 0) {

                            //LogUtil.put(LogFactory.getInstance(CommonLabels.getInstance().INDEX_LABEL + index, this, commonStrings.PROCESS));
            </xsl:if>
                <xsl:call-template name="gameLayerList" >
                    <xsl:with-param name="name" >
                        <xsl:value-of select="$name"/>
                    </xsl:with-param>
                </xsl:call-template>

                            this.processGD(<xsl:value-of select="$name" />GDGameLayer, globals.graphics);
                            return true;

            <xsl:if test="../actions" >
                            } else {
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> <xsl:value-of select="$name" />GDGameLayerList was empty", this, commonStrings.PROCESS));
                            }
                        } else {
                            //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> <xsl:value-of select="$name" />GDGameLayerList was null", this, commonStrings.PROCESS));
                        }                
            </xsl:if>
                        return false;
                    }

                        private final String ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "processGD - " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        @Override
                        public void processGD(final GDGameLayer <xsl:value-of select="$name" />GDGameLayer, final Graphics graphics) {
                            super.processGDStats(<xsl:value-of select="$name" />GDGameLayer);

                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                                    //name=<xsl:value-of select="$name" />
                                    final GDObject <xsl:value-of select="$name" /> = <xsl:value-of select="$name" />GDGameLayer.gdObject;
                                    <xsl:text>&#10;</xsl:text>

                                    <!--
                                    <xsl:variable name="length" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="substring-before(substring-after(text(), 'Variable('), ')')" /></xsl:if></xsl:for-each></xsl:variable>
                                    <xsl:if test="string-length($length) > 0" >
                                    if(<xsl:value-of select="$length" />_updated) {
                                        <xsl:value-of select="$length" />_updated = false;
                                    </xsl:if>
                                    -->
                                    //Parameters - 6
                                    
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            <xsl:value-of select="text()" />GDGameLayer.AddForce(</xsl:if>
                                        <xsl:if test="position() != 1 and position() != last()" >
                                            <xsl:value-of select="text()" /><xsl:if test="position() = 2" >,</xsl:if>
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >
                                            );
                                        </xsl:if>
                                    </xsl:for-each>
                                    <!--
                                    <xsl:if test="string-length($length) > 0" >
                                    }
                                    </xsl:if>
                                    -->
                                
                                    <!--
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 3" >

                                            <xsl:if test="contains(text(), 'Variable(')" >
                                                <xsl:variable name="end" >
                                                    <xsl:call-template name="string-replace-all" >
                                                        <xsl:with-param name="text" >
                                                            <xsl:value-of select="text()" />
                                                        </xsl:with-param>
                                                        <xsl:with-param name="find" >Variable(</xsl:with-param>
                                                        <xsl:with-param name="replacementText" >
                                                        </xsl:with-param>
                                                    </xsl:call-template>
                                                </xsl:variable>
                                            
                                                <xsl:call-template name="string-replace-all" >
                                                    <xsl:with-param name="text" >
                                                        //<xsl:value-of select="$end" /> = 0;
                                                    </xsl:with-param>
                                                    <xsl:with-param name="find" >)</xsl:with-param>
                                                    <xsl:with-param name="replacementText" ></xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:if>

                                        </xsl:if>
                                    </xsl:for-each>
                                    -->
                                    
                                    <xsl:text>&#10;</xsl:text>
                                    //updateGDObject - 4
                                    <xsl:value-of select="$name" />GDGameLayer.updateGDObject(globals.timeDelta);
                                    <xsl:text>&#10;</xsl:text>

                            } catch(Exception e) {
                            //13
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                        }
        
    </xsl:template>

</xsl:stylesheet>

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

    <xsl:template name="textObjectChangeColorActionProcess" >
        
                        //TextObject::ChangeColor - action
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            final int colorAsInt = basicColorUtil.get(255, </xsl:if>
                                        <xsl:if test="position() = 2" >
                                            <xsl:value-of select="translate(substring(text(), 2, string-length(text()) - 2), ';', ',')" />
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >); //, "<xsl:value-of select="type/value" />"));</xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>
                                    
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />TextAnimation.setBasicColor(smallBasicColorCacheFactory.getInstance(colorAsInt));
                                        </xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>


                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

                        @Override
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                            this.processGDStats(gameLayer);

                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            final int colorAsInt = basicColorUtil.get(255, </xsl:if>
                                        <xsl:if test="position() = 2" >
                                            <xsl:value-of select="translate(substring(text(), 2, string-length(text()) - 2), ';', ',')" />
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >); //, "<xsl:value-of select="type/value" />"));</xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>
                                    
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />TextAnimation.setBasicColor(smallBasicColorCacheFactory.getInstance(colorAsInt));
                                        </xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

    </xsl:template>

</xsl:stylesheet>

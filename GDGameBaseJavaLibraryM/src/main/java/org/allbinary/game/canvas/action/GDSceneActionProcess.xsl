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

    <xsl:template name="sceneActionProcess" >
        
                        //Scene
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            <xsl:if test="type/value = 'Scene'" >
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                            //<xsl:value-of select="translate(text(), '\&quot;', '')" />
                            </xsl:if>
                            </xsl:for-each>
                            </xsl:if>

                            <xsl:variable name="command" >
                            <xsl:if test="type/value = 'Scene'" >
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), '\&quot;', '')" /></xsl:with-param></xsl:call-template>_GD_LAYOUT</xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                            </xsl:variable>

                            try {

                                LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                                canvas.getCustomCommandListener().commandAction(GDGameCommandFactory.getInstance().<xsl:value-of select="$command" />, ProgressCanvasFactory.getInstance());

                            } catch(Exception e) {
                                //3
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }
        
    </xsl:template>

</xsl:stylesheet>

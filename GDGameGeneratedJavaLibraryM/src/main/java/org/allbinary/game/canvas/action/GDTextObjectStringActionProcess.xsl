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

    <xsl:template name="textObjectStringActionProcess" >
        <xsl:param name="layoutIndex" />
        
                        //TextObject::String - action - START
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            //Parameters - 2
                            <xsl:variable name="thirdParam0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                           
                            <xsl:variable name="thirdParam1" >
                            <xsl:call-template name="string-replace-all" >
                                <xsl:with-param name="text" >
                                    <xsl:value-of select="$thirdParam0" />
                                </xsl:with-param>
                                <xsl:with-param name="find" >VariableString(</xsl:with-param>
                                <xsl:with-param name="replacementText" >VariableString(globals.</xsl:with-param>
                            </xsl:call-template>
                            </xsl:variable>
                            
                            <xsl:variable name="thirdParam2" >
                            <xsl:call-template name="string-replace-all" >
                                <xsl:with-param name="text" >
                                    <xsl:value-of select="$thirdParam1" />
                                </xsl:with-param>
                                <xsl:with-param name="find" >[</xsl:with-param>
                                <xsl:with-param name="replacementText" >JSONObject.get(</xsl:with-param>
                            </xsl:call-template>
                            </xsl:variable>
                            
                            <xsl:variable name="thirdParam3" >
                            <xsl:call-template name="string-replace-all" >
                                <xsl:with-param name="text" >
                                    <xsl:value-of select="$thirdParam2" />
                                </xsl:with-param>
                                <xsl:with-param name="find" >TimerElapsedTime("</xsl:with-param>
                                <xsl:with-param name="replacementText" >TimerElapsedTime(globals.</xsl:with-param>
                            </xsl:call-template>
                            </xsl:variable>

                            <xsl:variable name="thirdParam4" >
                                <xsl:if test="contains($thirdParam3, 'TimerElapsedTime(globals.')" >
                            <xsl:call-template name="string-replace-all" >
                                <xsl:with-param name="text" >
                                    <xsl:value-of select="$thirdParam3" />
                                </xsl:with-param>
                                <xsl:with-param name="find" >")</xsl:with-param>
                                <xsl:with-param name="replacementText" >TimeDelayHelper)</xsl:with-param>
                            </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="not(contains($thirdParam3, 'TimerElapsedTime(globals.'))" ><xsl:value-of select="$thirdParam3" /></xsl:if>
                            </xsl:variable>

                            <!-- TWBTWB - temp hack - replace hardcoded TextEntry -->
                            <xsl:variable name="thirdParam5" >
                                <xsl:if test="contains($thirdParam4, 'TextEntry.')" >
                            <xsl:call-template name="string-replace-all" >
                                <xsl:with-param name="text" >
                                    <xsl:value-of select="$thirdParam4" />
                                </xsl:with-param>
                                <xsl:with-param name="find" >TextEntry.</xsl:with-param>
                                <xsl:with-param name="replacementText" >((GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.TextEntry) globals.TextEntryGDObjectList.get(0)).</xsl:with-param>
                            </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="not(contains($thirdParam4, 'TextEntry.'))" ><xsl:value-of select="$thirdParam4" /></xsl:if>
                            </xsl:variable>

                            <xsl:variable name="thirdParam" >
                            <xsl:call-template name="string-replace-all" >
                                <xsl:with-param name="text" >
                                    <xsl:value-of select="$thirdParam5" />
                                </xsl:with-param>
                                <xsl:with-param name="find" >]</xsl:with-param>
                                <xsl:with-param name="replacementText" >)</xsl:with-param>
                            </xsl:call-template>
                            </xsl:variable>
                            
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />TextAnimation</xsl:if>
                                <xsl:if test="position() = 2" ><xsl:if test="text() = '='" >.setText(</xsl:if></xsl:if>
                                <xsl:if test="position() = 3" ><xsl:value-of select="$thirdParam" /></xsl:if>
                                <xsl:if test="position() = last()" >);</xsl:if>
                            </xsl:for-each>
                            
                            return true;
                        }
                        //TextObject::String - action - END

    </xsl:template>

</xsl:stylesheet>

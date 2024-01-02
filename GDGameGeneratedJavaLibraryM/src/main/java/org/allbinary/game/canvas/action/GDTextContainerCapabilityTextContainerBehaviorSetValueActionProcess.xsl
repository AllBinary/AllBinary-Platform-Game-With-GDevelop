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

    <xsl:template name="textContainerCapabilityTextContainerBehaviorSetValueActionProcess" >
        <xsl:param name="layoutIndex" />
        
                        //TextContainerCapability::TextContainerBehavior::SetValue - action - START
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template><xsl:value-of select="text()" />TextAnimation</xsl:if>
                                <xsl:if test="position() = 3" ><xsl:if test="text() = '='" >.setText(</xsl:if></xsl:if>
                                <xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if>
                                <xsl:if test="position() = last()" >);</xsl:if>
                            </xsl:for-each>
                            
                            return true;
                        }
                        //TextContainerCapability::TextContainerBehavior::SetValue - action - END

    </xsl:template>

</xsl:stylesheet>

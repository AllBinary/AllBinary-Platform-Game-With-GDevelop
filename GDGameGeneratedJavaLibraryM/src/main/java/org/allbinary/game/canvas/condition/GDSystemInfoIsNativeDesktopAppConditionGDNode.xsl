<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" indent="yes" />

    <xsl:template name="systemInfoIsNativeDesktopAppConditionGDNode" >
        <xsl:param name="parametersAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
                    //systemInfoIsNativeDesktopAppConditionGDNode - //Condition - //SystemInfo::IsNativeDesktopApp - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                                        
                        //SystemInfo::IsNativeDesktopApp - condition
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                            LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            
                            //TWB - This is not implemented the same as GDevelop.  Currently it is just inverse Android.
                            <xsl:if test="$inverted = 'true'" >
                                //Inverted
                            </xsl:if>                            
                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if>AndroidUtil.isAndroid()) {
                                return false;
                            }
                            return true;
                        }
                    };
        
    </xsl:template>

</xsl:stylesheet>

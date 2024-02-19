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

    <xsl:template name="sceneBackgroundActionProcess" >
        
        <xsl:variable name="quote" >"</xsl:variable>
        <xsl:variable name="rgbParam1" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" /></xsl:for-each></xsl:variable>
        <xsl:variable name="rgbParam2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$rgbParam1" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="rgbParam" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$rgbParam2" /></xsl:with-param><xsl:with-param name="find" >;</xsl:with-param><xsl:with-param name="replacementText" >,</xsl:with-param></xsl:call-template></xsl:variable>

                        private final String ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "processGD - " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;
                        <xsl:variable name="ACTION_AS_STRING_GD_" >ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        //SceneBackground - action
                        @Override
                        public boolean process() throws Exception {

                            LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                            final BasicColor backgroundBasicColor = smallBasicColorCacheFactory.getInstance(
                                basicColorUtil.get(255,
                                    <xsl:value-of select="$rgbParam" />));
                                    //ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />
                            final BasicColor foregroundBasicColor = smallBasicColorCacheFactory.getInstance(
                                basicColorUtil.get(255, 
                                    255-backgroundBasicColor.red, 255-backgroundBasicColor.green, 255-backgroundBasicColor.blue));
                                    //ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />

                            final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
                            final AllBinaryGameLayerManager allBinaryGameLayerManager = abToGBUtil.allBinaryGameLayerManager;
                            allBinaryGameLayerManager.setBackgroundBasicColor(backgroundBasicColor);
                            allBinaryGameLayerManager.setForegroundBasicColor(foregroundBasicColor);

                            return true;
                        }
                
    </xsl:template>

</xsl:stylesheet>

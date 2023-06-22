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

    <xsl:template name="jsonToVariableStructureActionProcess" >
        
                    //JSONToVariableStructure
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
        <xsl:variable name="firstParametersAsString0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        <xsl:variable name="firstParametersAsString" ><xsl:value-of select="translate($firstParametersAsString0, '&#10;', '')" /></xsl:variable>
                        final JSONTokener jsonTokener = new JSONTokener(<xsl:value-of select="$firstParametersAsString" />);
                        
                        final JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
                        globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>JSONObject = jsonObject;

                        return true;
                    }

    </xsl:template>

</xsl:stylesheet>

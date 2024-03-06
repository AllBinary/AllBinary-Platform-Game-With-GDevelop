<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="jsonToGlobalVariableStructureActionProcess" >
        <xsl:param name="layoutIndex" />
        
                        //JSONToGlobalVariableStructure - action - START
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            
        <xsl:variable name="firstParametersAsString0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        <xsl:variable name="firstParametersAsString" ><xsl:value-of select="translate($firstParametersAsString0, '&#10;', '')" /></xsl:variable>
                            //final JSONTokener jsonTokener = new JSONTokener(globals.<xsl:value-of select="$firstParametersAsString" />);
                        
                            //final JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();

                            <xsl:variable name="param2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>                            
                            
                            <xsl:variable name="start" ><xsl:for-each select="//variables" ><xsl:if test="name = $param2" ><xsl:if test="type = 'number'" >Integer.parseInt(</xsl:if><xsl:if test="type = 'boolean'" ></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                            <xsl:variable name="end" ><xsl:for-each select="//variables" ><xsl:if test="name = $param2" ><xsl:if test="type = 'number'" >)</xsl:if><xsl:if test="type = 'boolean'" >)</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                            //gameGlobals.<xsl:value-of select="$param2" />JSONObject = jsonObject;
                            //gameGlobals.<xsl:value-of select="$param2" /> = <xsl:value-of select="$start" />jsonObject.getString("<xsl:value-of select="$param2" />")<xsl:value-of select="$end" />;
                            if(globals.<xsl:value-of select="$firstParametersAsString" /> != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> globals.<xsl:value-of select="$firstParametersAsString" />.length() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                gameGlobals.<xsl:value-of select="$param2" /> = <xsl:value-of select="$start" />globals.<xsl:value-of select="$firstParametersAsString" /><xsl:value-of select="$end" />;
                                LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + gameGlobals.<xsl:value-of select="$param2" />, this, commonStrings.PROCESS));
                            } else {
                                LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "null or empty", this, commonStrings.PROCESS));
                            }

                            return true;
                        }
                        //JSONToGlobalVariableStructure - action - END

    </xsl:template>

</xsl:stylesheet>

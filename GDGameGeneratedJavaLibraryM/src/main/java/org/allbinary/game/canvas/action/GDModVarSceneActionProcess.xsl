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

    <xsl:template name="modVarSceneActionProcess" >
        <xsl:param name="objectsAsString" />

                        //ModVarScene - action
                    <xsl:for-each select="parameters" >
                        <xsl:if test="contains(text(), 'angle')" >
                        //Update angle with rotation
                        </xsl:if>
                    </xsl:for-each>
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                            
                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                                
                    <xsl:variable name="gameObjectNames" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() > 2" >
                            <xsl:if test="contains(text(), '.')" >
                                <xsl:variable name="objectNameWithSeps" >:<xsl:value-of select="substring-before(text(), '.')" />,</xsl:variable>
                                <xsl:if test="contains($objectsAsString, $objectNameWithSeps)" >
                                    <xsl:value-of select="substring-before(text(), '.')" />,
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>                    
                    </xsl:variable>
                    
                    <xsl:if test="$gameObjectNames != ''" >
                        <xsl:variable name="gameObjectName" ><xsl:value-of select="substring-before($gameObjectNames, ',')" /></xsl:variable>
                                //This may need to loop through more than 1 game object found 2: <xsl:value-of select="$gameObjectName" /> 
                                GDGameLayer <xsl:value-of select="$gameObjectName" />GDGameLayer = null;
                                GDObject <xsl:value-of select="$gameObjectName" />  = null;
                                if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameObjectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameObjectName" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                    <xsl:value-of select="$gameObjectName" />GDGameLayer = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameObjectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameObjectName" />GDGameLayerList.get(0));
                                    <xsl:value-of select="$gameObjectName" /> = (GDObject) <xsl:value-of select="$gameObjectName" />GDGameLayer.gdObject;
                                } else {
                                    return false;
                                }
                    </xsl:if>

                    <xsl:text>&#10;</xsl:text>
                        //Parameters
                    <xsl:for-each select="parameters" >
                        <xsl:variable name="textTurnArrayToGet" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" >[</xsl:with-param><xsl:with-param name="replacementText" >.get(</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="textTurnArrayToGet2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$textTurnArrayToGet" /></xsl:with-param><xsl:with-param name="find" >]</xsl:with-param><xsl:with-param name="replacementText" >)</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="contains($textTurnArrayToGet2, '9223372036854776000')" >
                        //Long.MAX_VALUE = 9223372036854776000 GD does not like the real value 9223372036854775807L
                        </xsl:if>
                    </xsl:for-each>

                    <xsl:for-each select="parameters" >
                        <xsl:variable name="textTurnArrayToGet" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" >[</xsl:with-param><xsl:with-param name="replacementText" >.get(</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="textTurnArrayToGet2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$textTurnArrayToGet" /></xsl:with-param><xsl:with-param name="find" >]</xsl:with-param><xsl:with-param name="replacementText" >)</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="textValue0" ><xsl:if test="contains($textTurnArrayToGet2, '9223372036854776000')" >9223372036854775807L</xsl:if><xsl:if test="not(contains($textTurnArrayToGet2, '9223372036854776000'))" ><xsl:value-of select="$textTurnArrayToGet2" /></xsl:if></xsl:variable>
                        <xsl:variable name="textValue" ><xsl:value-of select="$textValue0" /></xsl:variable>
                        <xsl:variable name="textValue3" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" >player_</xsl:with-param><xsl:with-param name="replacementText" >globals.player_</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="textValue2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:if test="position() = 1" >globals.</xsl:if><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" >(</xsl:with-param><xsl:with-param name="replacementText" >(globals.</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="textValue4" ></xsl:variable>

                        <xsl:if test="position() = 1" >globals.</xsl:if><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$textValue" /></xsl:with-param><xsl:with-param name="find" >Angle()</xsl:with-param><xsl:with-param name="replacementText" >Angle(playerGDGameLayer)</xsl:with-param></xsl:call-template><xsl:if test="$textValue = '+'" >=</xsl:if><xsl:if test="$textValue = '-'" >=</xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                    <!--
                    <xsl:if test="((number(parameters[3]) = 0 or number(parameters[3])) and substring-after(parameters[3]/text(), '.') = '') or not(number(parameters[3]))" >
                    <xsl:for-each select="parameters" >
                        //<xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />_updated = true;</xsl:if>
                    </xsl:for-each>
                    </xsl:if>
                    -->

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }
                                
                            return true;
                        }
        
    </xsl:template>

</xsl:stylesheet>

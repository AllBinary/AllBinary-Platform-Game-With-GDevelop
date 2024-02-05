<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" indent="yes" />

    <xsl:template name="globalVariableAsBooleanConditionGDNode" >
        <xsl:param name="conditionNodeIndex" />
        <xsl:param name="parametersAsString" />
    
        <xsl:param name="caller" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="createdObjectsAsString" />
                
        <xsl:variable name="quote" >"</xsl:variable>
                    //globalVariableAsBooleanConditionGDNode - //Condition - //VarGlobal - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                    
                        //GlobalVariableAsBoolean - condition
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            boolean result = false;

                            //final StringMaker stringBuilder = new StringMaker();
                            //LogUtil.put(LogFactory.getInstance(stringBuilder.append(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).toString(), this, commonStrings.PROCESS));

                            if(<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = 'False' or string-length(text()) = 0" >!</xsl:if></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 1" >gameGlobals.<xsl:value-of select="text() " /></xsl:if></xsl:for-each>) {

                                //stringBuilder.delete(0, stringBuilder.length());
                                //LogUtil.put(LogFactory.getInstance(stringBuilder.append(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).toString(), this, commonStrings.PROCESS));
                                
                                <xsl:variable name="hasOtherConditions" ><xsl:for-each select="preceding-sibling::conditions" >found</xsl:for-each></xsl:variable>

                                <xsl:if test="not(contains($hasOtherConditions, 'found'))" >

                                <xsl:for-each select="../actions" >
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                </xsl:for-each>
                                
                                </xsl:if>

                                <xsl:if test="contains($hasOtherConditions, 'found')" >
                                <xsl:for-each select="../actions" >
                                    //TWBTWB
                                </xsl:for-each>
                                </xsl:if>

                                <xsl:for-each select="../events" >
                                    <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                                //Event - call - under NbObjet nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> parameters=<xsl:value-of select="$parametersAsString" />
                                //Condition - //NbObjet - //Event - //<xsl:value-of select="type" /> - call
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                    </xsl:if>
                                    <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                //Event - //BuiltinCommonInstructions::Link - call
                                globals.<xsl:value-of select="target" />GDNode.process();
                                    </xsl:if>
                                </xsl:for-each>
                            
                                <xsl:variable name="position" ><xsl:value-of select="position()" /></xsl:variable>

                                <xsl:for-each select="../conditions" >
                                    <xsl:if test="position() = $position + 1" >
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                                //Condition - //NbObjet - //Condition - //<xsl:value-of select="type/value" /> - call - <xsl:value-of select="$conditionNodeIndex" />
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                    </xsl:if>
                                </xsl:for-each>
                                
                                result = true;
                            } else {
                                //LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "Else: <xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GroupInterface)</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>"));
                            }
                            
                            super.processStatsE();
                            
                            return result;
                        }

                    };

    </xsl:template>

</xsl:stylesheet>

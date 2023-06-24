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

    <xsl:template name="sceneVariableAsBooleanConditionGDNode" >
        <xsl:param name="conditionNodeIndex" />
        <xsl:param name="parametersAsString" />
    
        <xsl:param name="caller" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="createdObjectsAsString" />
        
        <xsl:param name="thisNodeArray" />
        <xsl:param name="conditionPosition" />
        <xsl:param name="logString" />
                
        <xsl:variable name="quote" >"</xsl:variable>
                    //sceneVariableAsBooleanConditionGDNode - //Condition - //NbObjet - GDNode
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                    
                        //SceneVariableAsBoolean - condition
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            //final StringBuilder stringBuilder = new StringBuilder();
                            //LogUtil.put(LogFactory.getInstance(stringBuilder.append(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(globals.<xsl:value-of select="text()" />GroupInterface)</xsl:if></xsl:for-each>: ").append(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(globals.<xsl:value-of select="text()" />GroupInterface)</xsl:if></xsl:for-each>).toString(), this, commonStrings.PROCESS));

                            if(<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = 'False'" >!</xsl:if></xsl:if><xsl:if test="position() = 1" >globals.<xsl:value-of select="text()" /></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {

                                <xsl:for-each select="../actions" >
                                    <xsl:if test="type/value = 'Create'" >
                                        
                                        <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                    //createGDObject - START                    
                    <xsl:call-template name="createGDObject" >
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="nodeAsString" >
                            <xsl:value-of select="$nodeId" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //createGDObject - END
                                        
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="typs/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //Create - call
                                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processCreate(<xsl:value-of select="$name" />2);
                                final int index = globals.<xsl:value-of select="$name" />GDGameLayerList.size() - 1;
                                    </xsl:if>
                                    <xsl:if test="type/value != 'Create' and type/value != 'SetSceneVariableAsBoolean'" >
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
                                    </xsl:if>
                                </xsl:for-each>

                                <xsl:for-each select="../actions" >
                                    <xsl:if test="type/value = 'Create'" >
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processEnd(index);
                                    </xsl:if>
                                    <xsl:if test="type/value = 'SetSceneVariableAsBoolean'" >
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                    </xsl:if>
                                </xsl:for-each>
                                                        
                            } else {
                                //LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "Else: <xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(globals.<xsl:value-of select="text()" />GroupInterface)</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>"));
                            }
                            
                            super.processStatsE();
                            
                            return true;
                        }

                    };

    </xsl:template>

</xsl:stylesheet>

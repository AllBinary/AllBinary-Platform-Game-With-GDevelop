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

    <xsl:template name="compareNumbersConditionGDNode" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="objectsGroupsAsString" />

        <xsl:variable name="quote" >"</xsl:variable>

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>        
        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
        
                    //compareNumbersConditionGDNode - //Condition - //BuiltinCommonInstructions::CompareNumbers - //CompareNumbers - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                        <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="paramOneNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="paramTwoNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                        //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                        //paramOneNameObjectsGroups=<xsl:value-of select="$paramOneNameObjectsGroups" />
                        //paramTwoNameObjectsGroups=<xsl:value-of select="$paramTwoNameObjectsGroups" />
                        //BuiltinCommonInstructions::CompareNumbers - //CompareNumbers - condition
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            //NOT_IMPLEMENTED
                            throw new RuntimeException();
                            //super.processStatsE();
                            
                            //return result;
                        }
                        
                        <xsl:variable name="param" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 4" >
                                    <xsl:if test="not(contains(text(), 'SceneInstancesCount('))" >
                                        <xsl:value-of select="text()" />
                                    </xsl:if>
                                    <xsl:if test="contains(text(), 'SceneInstancesCount(')" >
                                        <xsl:variable name="objectName" >
                                            <xsl:value-of select="substring-before(substring-after(text(), 'SceneInstancesCount('), ')')" />
                                        </xsl:variable>
                                        <xsl:call-template name="string-replace-all" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="text()" />
                                            </xsl:with-param>
                                            <xsl:with-param name="find" >SceneInstancesCount(<xsl:value-of select="$objectName" /></xsl:with-param>
                                            <xsl:with-param name="replacementText" >SceneInstancesCount(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$objectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$objectName" />GDGameLayerList.size()</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                                                
                        <xsl:variable name="beforeFourthParam" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>

                        <xsl:variable name="hasObject" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $beforeFourthParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObjectGroup" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $beforeFourthParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup, 'found')" >
                        //beforeFourthParam=<xsl:value-of select="$beforeFourthParam" />
                        </xsl:if>

                        <xsl:variable name="firstOrBeforeFourthParam" >
                            <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup, 'found')" >
                                <xsl:value-of select="$beforeFourthParam" />
                            </xsl:if>
                            <xsl:if test="not(contains($hasObject, 'found') or contains($hasObjectGroup, 'found'))" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                        </xsl:variable>

                    <xsl:variable name="hasForEachProcessGD" >
                        <xsl:call-template name="hasBuiltinCommonInstructionsForEachToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasCollisionProcessGD" >
                        <xsl:call-template name="hasCollisionProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasDistanceProcessGD" >
                        <xsl:call-template name="hasDistanceProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                        <xsl:call-template name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
<!--                    <xsl:if test="$paramOneNameObjectsGroups != '' or $paramTwoNameObjectsGroups != ''" >-->
                    <xsl:call-template name="parentSelectionNodeProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                    </xsl:call-template>

<!--
                    <xsl:if test="not(contains($hasForEachProcessGD, 'found') or contains($hasCollisionProcessGD, 'found') or contains($hasDistanceProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >
                        //Not from parent collision - //CompareNumbers
                        public boolean processGD(final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                    
                            super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                    </xsl:if>
                    </xsl:if>
                    <xsl:if test="$paramOneNameObjectsGroups = '' and $paramTwoNameObjectsGroups = ''" >
                        public boolean processGD(final GDGameLayer <xsl:value-of select="$gdObjectName" />GDGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {

                            super.processGDStats(<xsl:value-of select="$gdObjectName" />GDGameLayer);
                    </xsl:if>
-->
                    <xsl:if test="not(contains($hasForEachProcessGD, 'found') or contains($hasCollisionProcessGD, 'found') or contains($hasDistanceProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >
                        //Not from parent collision - //CompareNumbers
                        public boolean processGD(final GDGameLayer gdGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                    
                            super.processGDStats(gdGameLayer);
                    </xsl:if>

                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                            <xsl:if test="contains($hasDistanceProcessGD, 'found')" >
                                <xsl:variable name="distanceProcessGDParamOne" ><xsl:call-template name="distanceProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                                <xsl:variable name="distanceProcessGDParamTwo" ><xsl:call-template name="distanceProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                                final GDObject <xsl:value-of select="$distanceProcessGDParamOne" /> = <xsl:value-of select="$distanceProcessGDParamOne" />GDGameLayer.gdObject;
                                final GDObject <xsl:value-of select="$distanceProcessGDParamTwo" /> = <xsl:value-of select="$distanceProcessGDParamTwo" />GDGameLayer.gdObject;
                            </xsl:if>
                            
                            
                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if>(<xsl:for-each select="parameters" ><xsl:if test="position() != 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 2" ><xsl:if test="text() = '&gt;'" ><xsl:text disable-output-escaping="yes" >&gt;</xsl:text></xsl:if><xsl:if test="text() = '&lt;'" ><xsl:text disable-output-escaping="yes" >&lt;</xsl:text></xsl:if><xsl:if test="text() != '&gt;' and text() != '&lt;'" ><xsl:value-of select="text()" /></xsl:if></xsl:if><xsl:text> </xsl:text></xsl:for-each>)) {
                                //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "<xsl:if test="$inverted = 'true'" >!</xsl:if>(<xsl:for-each select="parameters" ><xsl:if test="position() != 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 2" ><xsl:if test="text() = '&gt;'" ><xsl:text disable-output-escaping="yes" >&gt;</xsl:text></xsl:if><xsl:if test="text() = '&lt;'" ><xsl:text disable-output-escaping="yes" >&lt;</xsl:text></xsl:if><xsl:if test="text() != '&gt;' and text() != '&lt;'" ><xsl:value-of select="text()" /></xsl:if></xsl:if><xsl:text> </xsl:text></xsl:for-each>", this, commonStrings.PROCESS));
                                return true;
                            }
                            return false;
                        }                                

                    };

    </xsl:template>

</xsl:stylesheet>

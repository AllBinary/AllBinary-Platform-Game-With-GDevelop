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
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="quote" >"</xsl:variable>

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>        
        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>

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
                                    <xsl:if test="not(contains(text(), 'abs('))" >
                                        <xsl:value-of select="text()" />
                                    </xsl:if>
                                    <xsl:if test="contains(text(), 'abs(')" >
                                        <xsl:value-of select="substring-before(substring-after(text(), 'abs('), '.')" />
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                        </xsl:variable>

                        <xsl:variable name="hasObject2" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $firstOrBeforeFourthParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObjectGroup2" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $firstOrBeforeFourthParam" >found</xsl:if>
                            </xsl:for-each>
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
                
                    /*hasForEachProcessGD=<xsl:value-of select="$hasForEachProcessGD" /> hasCollisionProcessGD=<xsl:value-of select="$hasCollisionProcessGD" /> hasDistanceProcessGD=<xsl:value-of select="$hasDistanceProcessGD" /> hasLinkedObjectsPickObjectsLinkedToProcessGD=<xsl:value-of select="$hasLinkedObjectsPickObjectsLinkedToProcessGD" />*/
                
                    //compareNumbersConditionGDNode - //Condition - //BuiltinCommonInstructions::CompareNumbers - //CompareNumbers - GDNode
                    <xsl:if test="contains($forExtension, 'found')" >public </xsl:if>final GDNode NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                        <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="paramOneNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="paramTwoNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                        //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                        //gdObjectName=<xsl:value-of select="$gdObjectName" />
                        //firstOrBeforeFourthParam=<xsl:value-of select="$firstOrBeforeFourthParam" /> <xsl:if test="contains($hasObject2, 'found')" > found as Object</xsl:if><xsl:if test="contains($hasObjectGroup2, 'found')" > found as ObjectGroup</xsl:if>
                        //paramOneNameObjectsGroups=<xsl:value-of select="$paramOneNameObjectsGroups" />
                        //paramTwoNameObjectsGroups=<xsl:value-of select="$paramTwoNameObjectsGroups" />
                        //BuiltinCommonInstructions::CompareNumbers - //CompareNumbers - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                        <xsl:if test="contains($hasForEachProcessGD, 'found') or contains($hasCollisionProcessGD, 'found') or contains($hasDistanceProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >
                            //NOT_IMPLEMENTED
                            throw new RuntimeException();
                        </xsl:if>

                        <xsl:if test="not(contains($hasForEachProcessGD, 'found') or contains($hasCollisionProcessGD, 'found') or contains($hasDistanceProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >
                            <xsl:if test="contains($hasDistanceProcessGD, 'found')" >
                                <xsl:variable name="distanceProcessGDParamOne" ><xsl:call-template name="distanceProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                                <xsl:variable name="distanceProcessGDParamTwo" ><xsl:call-template name="distanceProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>

                                <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$distanceProcessGDParamOne" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$distanceProcessGDParamOne" /></xsl:variable>
                                final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$distanceProcessGDParamOne" /> = (<xsl:value-of select="$gdObjectFactory" />) <xsl:value-of select="$distanceProcessGDParamOne" />GDGameLayer.gdObject;
                                <xsl:variable name="gdObjectFactoryTwo" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$distanceProcessGDParamTwo" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$distanceProcessGDParamTwo" /></xsl:variable>
                                final <xsl:value-of select="$gdObjectFactoryTwo" /><xsl:text> </xsl:text><xsl:value-of select="$distanceProcessGDParamTwo" /> = (<xsl:value-of select="$gdObjectFactoryTwo" />) <xsl:value-of select="$distanceProcessGDParamTwo" />GDGameLayer.gdObject;
                            </xsl:if>
                                                    
                            <xsl:if test="contains($hasObject2, 'found') or contains($hasObjectGroup2, 'found')" >
                                if(globals.<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayerList.size() == 0) {
                                    return false;
                                }
                                final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer = (GDGameLayer) globals.<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayerList.get(0);
                                final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$firstOrBeforeFourthParam" /><xsl:text> </xsl:text><xsl:value-of select="$firstOrBeforeFourthParam" /> = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$firstOrBeforeFourthParam" />) <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer.gdObject;
                            </xsl:if>

                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if>(<xsl:for-each select="parameters" ><xsl:if test="position() != 2" ><xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template></xsl:if><xsl:if test="position() = 2" ><xsl:call-template name="replace-escaped-conditionals" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template></xsl:if><xsl:text> </xsl:text></xsl:for-each>)) {
                                //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "<xsl:if test="$inverted = 'true'" >!</xsl:if>(<xsl:for-each select="parameters" ><xsl:if test="position() != 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 2" ><xsl:call-template name="replace-escaped-conditionals" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template></xsl:if><xsl:text> </xsl:text></xsl:for-each>", this, commonStrings.PROCESS);
                                return true;
                            }
                            return false;
                        </xsl:if>
                        
                            //super.processStatsE();
                            
                            //return result;
                        }
                        
<!--                    <xsl:if test="$paramOneNameObjectsGroups != '' or $paramTwoNameObjectsGroups != ''" >-->
                    <xsl:call-template name="parentSelectionNodeProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                    </xsl:call-template>

<!--
                    <xsl:if test="not(contains($hasForEachProcessGD, 'found') or contains($hasCollisionProcessGD, 'found') or contains($hasDistanceProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >
                        //Not from parent - //CompareNumbers
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
                        //Not from parent - //CompareNumbers
                        public boolean processGD(final GDGameLayer gdGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                    
                            super.processGDStats(gdGameLayer);
                    </xsl:if>

                            //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, commonStrings.PROCESS);

                            <xsl:if test="contains($hasDistanceProcessGD, 'found')" >
                                <xsl:variable name="distanceProcessGDParamOne" ><xsl:call-template name="distanceProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                                <xsl:variable name="distanceProcessGDParamTwo" ><xsl:call-template name="distanceProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                                
                                <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$distanceProcessGDParamOne" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$distanceProcessGDParamOne" /></xsl:variable>
                                final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$distanceProcessGDParamOne" /> = (<xsl:value-of select="$gdObjectFactory" />) <xsl:value-of select="$distanceProcessGDParamOne" />GDGameLayer.gdObject;
                                <xsl:variable name="gdObjectFactoryTwo" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$distanceProcessGDParamTwo" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$distanceProcessGDParamTwo" /></xsl:variable>
                                final <xsl:value-of select="$gdObjectFactoryTwo" /><xsl:text> </xsl:text><xsl:value-of select="$distanceProcessGDParamTwo" /> = (<xsl:value-of select="$gdObjectFactoryTwo" />) <xsl:value-of select="$distanceProcessGDParamTwo" />GDGameLayer.gdObject;
                            </xsl:if>
                            
                            <xsl:if test="contains($hasForEachProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >
<!--                                <xsl:variable name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                                <xsl:variable name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" ><xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                                //linkedObjectsPickObjectsLinkedToProcessGDParamOne=<xsl:value-of select="$linkedObjectsPickObjectsLinkedToProcessGDParamOne" />
                                //linkedObjectsPickObjectsLinkedToProcessGDParamTwo=<xsl:value-of select="$linkedObjectsPickObjectsLinkedToProcessGDParamTwo" />-->
                                
                                <xsl:variable name="parameters" ><xsl:for-each select="parameters" ><xsl:if test="position() != 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            //LinkedObjects::PickObjectsLinkedTo for //BuiltinCommonInstructions::CompareNumbers
                                <xsl:if test="contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >
                                    <xsl:variable name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" ><xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>

                                    <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$linkedObjectsPickObjectsLinkedToProcessGDParamTwo" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$linkedObjectsPickObjectsLinkedToProcessGDParamTwo" /></xsl:variable>
                            final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$linkedObjectsPickObjectsLinkedToProcessGDParamTwo" /> = (<xsl:value-of select="$gdObjectFactory" />) <xsl:value-of select="$linkedObjectsPickObjectsLinkedToProcessGDParamTwo" />GDGameLayer.gdObject;
                                </xsl:if>
                                <xsl:if test="contains($parameters, 'Player')" >
                                    <xsl:variable name="name" >Player</xsl:variable>
                            final GDGameLayer <xsl:value-of select="$name" />GDGameLayer = (GDGameLayer) 
                                <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.get(0);
                            final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /> = 
                                (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" />) <xsl:value-of select="$name" />GDGameLayer.gdObject;
                                </xsl:if>
                                <xsl:if test="contains($parameters, 'PlatformerMap')" >
                                    <xsl:variable name="name" >PlatformerMap</xsl:variable>
                            final GDGameLayer <xsl:value-of select="$name" />GDGameLayer = (GDGameLayer) 
                                <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.get(0);
                            final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /> = 
                                (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" />) <xsl:value-of select="$name" />GDGameLayer.gdObject;
                                </xsl:if>
                            </xsl:if>

                            <xsl:if test="not(contains($hasForEachProcessGD, 'found') or contains($hasCollisionProcessGD, 'found') or contains($hasDistanceProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >
                            <xsl:if test="contains($hasObject2, 'found') or contains($hasObjectGroup2, 'found')" >
                                if(globals.<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayerList.size() == 0) {
                                    return false;
                                }
                                final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer = (GDGameLayer) globals.<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayerList.get(0);
                                final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$firstOrBeforeFourthParam" /><xsl:text> </xsl:text><xsl:value-of select="$firstOrBeforeFourthParam" /> = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$firstOrBeforeFourthParam" />) <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer.gdObject;
                            </xsl:if>
                            </xsl:if>

                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if>(<xsl:for-each select="parameters" ><xsl:if test="position() != 2" ><xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template></xsl:if><xsl:if test="position() = 2" ><xsl:call-template name="replace-escaped-conditionals" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template></xsl:if><xsl:text> </xsl:text></xsl:for-each>)) {
                                //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "<xsl:if test="$inverted = 'true'" >!</xsl:if>(<xsl:for-each select="parameters" ><xsl:if test="position() != 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 2" ><xsl:call-template name="replace-escaped-conditionals" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template></xsl:if><xsl:text> </xsl:text></xsl:for-each>", this, commonStrings.PROCESS);
                                return true;
                            }
                            return false;
                        }                                
                        </xsl:if>

                        <xsl:if test="contains($forExtension, 'found')" >
                        @Override
                        public boolean process(final Object[] objectArray, final int[] intArray, final long[] longArray, final float[] floatArray) {
                            
                            //Map from object array with action params
                            final GDGameLayer gameLayer = (GDGameLayer) objectArray[1];
                            this.process(gameLayer, intArray[3], intArray[5]);

                            return true;
                        }
                        </xsl:if>

                        public void process(final GDGameLayer gameLayer, final int x, final int y) {
                            final GDObject gdObject = gameLayer.gdObject;
                            this.process(gdObject, x, y);
                        }

                        public void process(final GDObject gdObject, final int x, final int y) {
                            throw new RuntimeException();
                        }

                    };

                    <xsl:if test="not(contains($forExtension, 'found'))" >
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;
                    </xsl:if>

    </xsl:template>

</xsl:stylesheet>

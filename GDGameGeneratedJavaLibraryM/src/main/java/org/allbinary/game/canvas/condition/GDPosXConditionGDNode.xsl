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

    <xsl:template name="posXConditionGDNode" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="objectsGroupsAsString" />

        <xsl:variable name="quote" >"</xsl:variable>

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
                    //posXConditionGDNode - //Condition - //PosX - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                        //private final String ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Else: " + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        //private final StringMaker stringBuilder = new StringMaker();

                        <xsl:variable name="objectInForEach" >
                            <xsl:call-template name="objectBuiltinCommonInstructionsForEachToProcessGD" >
                                <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                            </xsl:call-template>
                        </xsl:variable>
                        //ForEach as parent with object=<xsl:value-of select="$objectInForEach" />
                        
                        <xsl:variable name="paramOneNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each><xsl:value-of select="$objectInForEach" ></xsl:value-of></xsl:variable>
                        <xsl:variable name="paramTwoNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                        //paramOneNameObjectsGroups=<xsl:value-of select="$paramOneNameObjectsGroups" />
                        //paramTwoNameObjectsGroups=<xsl:value-of select="$paramTwoNameObjectsGroups" />
                        
                        //PosX - condition
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                        <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        //gdObjectName=<xsl:value-of select="$gdObjectName" />

<!--                        <xsl:variable name="closedValueForGDObject" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '&lt;' or text() = '&lt;='" >.x</xsl:if><xsl:if test="text() = '&gt;' or text() = '&gt;='" >.X2()</xsl:if></xsl:if></xsl:for-each></xsl:variable>-->
                            <xsl:variable name="closedValueForGDObject" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '&lt;' or text() = '&lt;=' or text() = '&gt;' or text() = '&gt;='" >.x</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                            <xsl:if test="$paramOneNameObjectsGroups = '' and $paramTwoNameObjectsGroups = ''" >

                            final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gdObjectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            GDGameLayer <xsl:value-of select="$gdObjectName" />GDGameLayer;
                            GDObject <xsl:value-of select="$gdObjectName" />;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                                <xsl:value-of select="$gdObjectName" />GDGameLayer = (GDGameLayer) 
                                <xsl:text>&#10;</xsl:text>
                                <xsl:call-template name="globals" >
                                    <xsl:with-param name="name" >
                                        <xsl:value-of select="$gdObjectName" />
                                    </xsl:with-param>
                                </xsl:call-template>.
                                <xsl:text>&#10;</xsl:text>
                                <xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index);

                                <xsl:value-of select="$gdObjectName" /><xsl:text> = </xsl:text><xsl:value-of select="$gdObjectName" />GDGameLayer.gdObject;
                                
                                //stringBuilder.delete(0, stringBuilder.length());
                                //logUtil.put(stringBuilder.append("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> ").append(commonLabels.INDEX_LABEL).append(index).append(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" >).append(</xsl:if><xsl:if test="position() != 2" >" <xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" ><xsl:value-of select="$closedValueForGDObject" /></xsl:if><xsl:if test="position() != 2" >").append(</xsl:if><xsl:if test="position() != 2" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" ><xsl:value-of select="$closedValueForGDObject" /></xsl:if></xsl:for-each>).toString(), this, commonStrings.PROCESS);
                                if(<xsl:if test="$inverted = 'true'" >!</xsl:if><xsl:for-each select="parameters" ><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="position() = 1" ><xsl:value-of select="$closedValueForGDObject" /></xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                                    //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                    <xsl:for-each select=".." >
                                        <xsl:call-template name="actionIdsGDObjectPos" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                            <xsl:with-param name="gdObjectName" ><xsl:value-of select="$gdObjectName" /></xsl:with-param>
                                            <xsl:with-param name="gdGameLayer" ><xsl:value-of select="$gdObjectName" />GDGameLayer</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                } //else {
                                    //logUtil.put(ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                //}
                                //logUtil.put(<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index).toString(), this, commonStrings.PROCESS);
                            }

                            </xsl:if>
                            
                            <xsl:if test="$paramOneNameObjectsGroups != '' or $paramTwoNameObjectsGroups != ''" >
                                //Needs Impl
                                if(true) throw new RuntimeException();
                            </xsl:if>
                            
                            super.processStatsE();

                            return true;

                        }

                        <xsl:variable name="param" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 3" >
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
                        //param3=<xsl:value-of select="$param" />
                                                
                        <xsl:variable name="beforeSecondParam" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>
                        //beforeSecondParam=<xsl:value-of select="$beforeSecondParam" />

                        <xsl:variable name="hasObject" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObjectGroup" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup, 'found')" >
                        //beforeSecondParam is object or objectsGroup
                        </xsl:if>

                        <xsl:variable name="firstOrBeforeFourthParam" >
                            <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup, 'found')" >
                                <xsl:value-of select="$beforeSecondParam" />
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
                    
                    /*hasForEachProcessGD=<xsl:value-of select="$hasForEachProcessGD" /> hasCollisionProcessGD=<xsl:value-of select="$hasCollisionProcessGD" /> hasDistanceProcessGD=<xsl:value-of select="$hasDistanceProcessGD" /> hasLinkedObjectsPickObjectsLinkedToProcessGD=<xsl:value-of select="$hasLinkedObjectsPickObjectsLinkedToProcessGD" />*/
                    
                    <xsl:if test="$paramOneNameObjectsGroups != '' or $paramTwoNameObjectsGroups != ''" >
                    <xsl:call-template name="parentSelectionNodeProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="not(contains($hasForEachProcessGD, 'found') or contains($hasCollisionProcessGD, 'found') or contains($hasDistanceProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >
                    //Not from parent collision - //PosX
                    public boolean processGD(final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                    </xsl:if>
                    </xsl:if>

                    <xsl:if test="$paramOneNameObjectsGroups != '' or $paramTwoNameObjectsGroups != ''" >
                            //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, commonStrings.PROCESS);
                            <xsl:text>&#10;</xsl:text>

                                <xsl:variable name="firstParamFound" ><xsl:call-template name="firstParamFound" ><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                                <xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 1" ><xsl:if test="text() != $firstParamFound" >//orignalFirstParam=<xsl:value-of select="text()" /><xsl:text>&#10;</xsl:text></xsl:if></xsl:if>
                                    <xsl:if test="position() = 1" >final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$firstParamFound" /><xsl:text> </xsl:text><xsl:value-of select="$firstParamFound" /> = ((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$firstParamFound" />) <xsl:value-of select="$firstParamFound" />GDGameLayer.gdObject);<xsl:text>&#10;</xsl:text></xsl:if>
                                </xsl:for-each>
                                <xsl:if test="not(contains($beforeSecondParam, $gdObjectName)) and contains($param, '.')" >

                                    <xsl:if test="contains($hasForEachProcessGD, 'found')" >
                                    <xsl:variable name="forEachGDParamTwo" ><xsl:call-template name="forEachGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param><xsl:with-param name="secondGameLayer" ><xsl:value-of select="$firstOrBeforeFourthParam" /></xsl:with-param></xsl:call-template></xsl:variable>
                                    //forEachGDParamTwo=<xsl:value-of select="$forEachGDParamTwo" /><xsl:text>&#10;</xsl:text>
                                    <xsl:if test="string-length($forEachGDParamTwo) = 0" >
                                    final GDGameLayer <xsl:value-of select="$beforeSecondParam" />GDGameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$beforeSecondParam" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$beforeSecondParam" />GDGameLayerList.get(0);
                                    </xsl:if>
                                    </xsl:if>

                                <xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 3" ><xsl:if test="text() != $beforeSecondParam" >//orignalThirdParam=<xsl:value-of select="text()" /><xsl:text>&#10;</xsl:text></xsl:if></xsl:if>
                                    <xsl:if test="position() = 3" >final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$beforeSecondParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeSecondParam" /><xsl:text> </xsl:text><xsl:value-of select="$beforeSecondParam" /> = ((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$beforeSecondParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeSecondParam" />) <xsl:value-of select="$beforeSecondParam" />GDGameLayer.gdObject);<xsl:text>&#10;</xsl:text></xsl:if>
                                </xsl:for-each>
                                </xsl:if>

                                //stringBuilder.delete(0, stringBuilder.length());
                                //logUtil.put(stringBuilder.append("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> ").append(commonLabels.INDEX_LABEL).append(index).append(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" >).append(</xsl:if><xsl:if test="position() != 2" >" <xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" ><xsl:value-of select="$closedValueForGDObject" /></xsl:if><xsl:if test="position() != 2" >").append(</xsl:if><xsl:if test="position() != 2" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" ><xsl:value-of select="$closedValueForGDObject" /></xsl:if></xsl:for-each>).toString(), this, commonStrings.PROCESS);
                                if(<xsl:if test="$inverted = 'true'" >!</xsl:if><xsl:for-each select="parameters" ><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="position() = 1" ><xsl:value-of select="$closedValueForGDObject" /></xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                                    //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                    return true;
                                } //else {
                                    //logUtil.put(ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                //}
                            
                            return false;
                        }    
                    </xsl:if>                                        
                    <xsl:if test="$paramOneNameObjectsGroups = '' and $paramTwoNameObjectsGroups = ''" >
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {

                            super.processGDStats(gameLayer);
                        
                            if(true) throw new RuntimeException();
                        
                            return false;
                        }        
                    </xsl:if>

                    };

    </xsl:template>

</xsl:stylesheet>

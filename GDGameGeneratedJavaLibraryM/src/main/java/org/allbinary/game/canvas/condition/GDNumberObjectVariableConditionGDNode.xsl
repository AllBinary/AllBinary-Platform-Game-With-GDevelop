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

    <xsl:template name="numberObjectVariableConditionGDNode" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
        
        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /></xsl:variable>

        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
        <xsl:variable name="siblingOrParentOrList" ><xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList0" ><xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param><xsl:with-param name="includeList" >found</xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList0" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>final GDGameLayer </xsl:text><xsl:value-of select="$name" /><xsl:text>GDGameLayer = </xsl:text></xsl:with-param><xsl:with-param name="replacementText" >//final GDGameLayer <xsl:value-of select="$name" />GDGameLayer = </xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList3" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList2" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>if(</xsl:text><xsl:value-of select="$name" /><xsl:text>GDGameLayerList</xsl:text></xsl:with-param><xsl:with-param name="replacementText" >//if(<xsl:value-of select="$name" />GDGameLayerList</xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList4" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList3" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>final GD</xsl:text>GlobalsGDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /><xsl:text> = (GDGlobalsGDObjectsFactory.</xsl:text><xsl:value-of select="$name" /><xsl:text></xsl:text>) <xsl:value-of select="$name" /><xsl:text></xsl:text>GDGameLayer.gdObject;</xsl:with-param><xsl:with-param name="replacementText" >//final GDGlobalsGDObjectsFactory.<xsl:value-of select="$name" /> <xsl:value-of select="$name" /> = (GDGlobalsGDObjectsFactory.<xsl:value-of select="$name" />) <xsl:value-of select="$name" />GDGameLayer.gdObject;</xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrListOnlyListForTheMainParamIncludeList" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList4" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>final GD</xsl:text><xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /><xsl:text> = (GD</xsl:text><xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text></xsl:text>) <xsl:value-of select="$name" /><xsl:text></xsl:text>GDGameLayer.gdObject;</xsl:with-param><xsl:with-param name="replacementText" >//final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /> = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" />)<xsl:text> </xsl:text><xsl:value-of select="$name" />GDGameLayer.gdObject;</xsl:with-param></xsl:call-template></xsl:variable>

                    //numberObjectVariableConditionGDNode - //Condition - //NumberObjectVariable - GDNode
                    <xsl:if test="contains($forExtension, 'found')" >public </xsl:if>final GDNode NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                        <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        <xsl:variable name="paramOneNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="paramTwoNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                        //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                        //paramOneNameObjectsGroups=<xsl:value-of select="$paramOneNameObjectsGroups" />
                        //paramTwoNameObjectsGroups=<xsl:value-of select="$paramTwoNameObjectsGroups" />
                        
                                <xsl:variable name="hasCondition" ><xsl:for-each select="conditions" >found</xsl:for-each></xsl:variable>

                                <xsl:variable name="hasSiblingWithDuplicateProcessing" >
                                    <xsl:for-each select=".." >
                                        <xsl:for-each select="whileConditions" >
                                        <!--
                                        <xsl:if test="type/value = 'BuiltinCommonInstructions::And'" >found</xsl:if>
                                        <xsl:if test="type/value = 'BuiltinCommonInstructions::Or'" >found</xsl:if>
                                        -->
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:variable>

                            <xsl:variable name="gameLayerName" ><xsl:value-of select="$name" /></xsl:variable>
                            
                                <xsl:variable name="hasObjectGroup" >
                                    <xsl:for-each select="//objectsGroups" >
                                        <xsl:if test="name = $gameLayerName" >found</xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>
                                                
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
                        <xsl:variable name="hasObjectGroup2" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $beforeFourthParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup2, 'found')" >
                        //beforeFourthParam=<xsl:value-of select="$beforeFourthParam" />
                        </xsl:if>

                        <xsl:variable name="firstOrBeforeFourthParam" >
                            <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup2, 'found')" >
                                <xsl:value-of select="$beforeFourthParam" />
                            </xsl:if>
                            <xsl:if test="not(contains($hasObject, 'found') or contains($hasObjectGroup2, 'found'))" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                        </xsl:variable>
                                                
                        //NumberObjectVariable - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            boolean result = false;

                            try {
                            //logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                      
                            final GDGameLayer[] gameLayerArray = gameGlobals.tempGameLayerArray;      
                            <xsl:value-of select="$siblingOrParentOrListOnlyListForTheMainParamIncludeList" />

                            //logUtil.putF(commonStrings.START, this, "<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GroupInterface)</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>");

                            final int size = <xsl:if test="not(contains($hasObjectGroup, 'found'))" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.</xsl:if><xsl:value-of select="$name" />GDGameLayerList.size();
                            
                            //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + size, this, commonStrings.PROCESS);
                            
                            GDGameLayer <xsl:value-of select="$name" />GDGameLayer;
                            <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$name" />;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {                        
                                <xsl:value-of select="$name" />GDGameLayer = (GDGameLayer) <xsl:value-of select="$name" />GDGameLayerList.get(index);
                                <xsl:value-of select="$name" /> = (<xsl:value-of select="$gdObjectFactory" />) <xsl:value-of select="$name" />GDGameLayer.gdObject;

                                <xsl:call-template name="numberObjectVariableConditionGDObject" >
                                    <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    <xsl:with-param name="param" ><xsl:value-of select="$param" /></xsl:with-param>
                                </xsl:call-template>   
                            }

                            <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param><xsl:with-param name="includeList" >found</xsl:with-param></xsl:call-template>

                            super.processStatsE();
                            
              
                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }

                            return result;

                        }

                        @Override
                        public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                            super.processStats(motionGestureEvent);
                            
                            //logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "motion", this, commonStrings.PROCESS);
                            
                            return this.process();
                        }

                        @Override
                        public boolean processGD(final GDGameLayer[] gameLayerArray) throws Exception {
                            super.processGDStats(gameLayerArray);
                            
                            boolean result = false;

                            try {
                     
                                <xsl:value-of select="$siblingOrParentOrList" />

                                <xsl:call-template name="numberObjectVariableConditionGDObject" >
                                    <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    <xsl:with-param name="param" ><xsl:value-of select="$param" /></xsl:with-param>
                                </xsl:call-template>
                                
                                <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>
              
                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }

                            return result;
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

    <xsl:template name="numberObjectVariableConditionGDObject" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="param" />

        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        
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
                    
                    <xsl:variable name="hasKnownParamsFromParent" ><xsl:if test="contains($hasForEachProcessGD, 'found') or contains($hasCollisionProcessGD, 'found') or contains($hasDistanceProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >found</xsl:if></xsl:variable>
        
                    <xsl:variable name="hasParamMatchWithParentParam" >
                        <xsl:if test="contains($hasForEachProcessGD, 'found')" >
                            <xsl:variable name="forEachGDParamOne" ><xsl:call-template name="forEachGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                            <xsl:if test="$name = $forEachGDParamOne" >found</xsl:if>
                        </xsl:if>
                        <xsl:if test="contains($hasCollisionProcessGD, 'found')" >
                            <xsl:variable name="collisionProcessGDParamOne" ><xsl:call-template name="collisionProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                            <xsl:variable name="collisionProcessGDParamTwo" ><xsl:call-template name="collisionProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                            <xsl:if test="$name = $collisionProcessGDParamOne" >found</xsl:if>
                            <xsl:if test="$name = $collisionProcessGDParamTwo" >found</xsl:if>
                        </xsl:if>
                        <xsl:if test="contains($hasDistanceProcessGD, 'found')" >
                            <xsl:variable name="distanceProcessGDParamOne" ><xsl:call-template name="distanceProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                            <xsl:variable name="distanceProcessGDParamTwo" ><xsl:call-template name="distanceProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                            <xsl:if test="$name = $distanceProcessGDParamOne" >found</xsl:if>
                            <xsl:if test="$name = $distanceProcessGDParamTwo" >found</xsl:if>
                        </xsl:if>
                        <xsl:if test="contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >
                            <xsl:variable name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                            <xsl:variable name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" ><xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                            <xsl:if test="$name = $linkedObjectsPickObjectsLinkedToProcessGDParamOne" >found</xsl:if>
                            <xsl:if test="$name = $linkedObjectsPickObjectsLinkedToProcessGDParamTwo" >found</xsl:if>
                        </xsl:if>
                    </xsl:variable>
                    
                    //hasParamMatchWithParentParam=<xsl:value-of select="$hasParamMatchWithParentParam" />
                    <xsl:if test="not(contains($hasKnownParamsFromParent, 'found') and contains($hasParamMatchWithParentParam, 'found'))" >

                    <xsl:variable name="hasGameLayer2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="contains(text(), '.')" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                    <xsl:variable name="gameLayerName2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="gameLayerName3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:if></xsl:for-each></xsl:variable>
                    //gameLayerName3=<xsl:value-of select="$gameLayerName3" />
                    <xsl:variable name="gameLayerName4" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3 and contains(text(), '-')" ><xsl:value-of select="substring-after($gameLayerName3, '-')" /></xsl:if><xsl:if test="position() = 3 and not(contains($gameLayerName3, '-'))" ><xsl:value-of select="$gameLayerName3" /></xsl:if></xsl:for-each></xsl:variable>
                    //gameLayerName4=<xsl:value-of select="$gameLayerName4" />
                    <xsl:variable name="gameLayerName" ><xsl:call-template name="after-lastIndexOf" ><xsl:with-param name="string" ><xsl:value-of select="$gameLayerName4" /></xsl:with-param><xsl:with-param name="char" select="' '" /></xsl:call-template></xsl:variable>
                    //gameLayerName=<xsl:value-of select="$gameLayerName" />

                    <xsl:if test="contains($hasGameLayer2, 'found')" >
                    <xsl:if test="not($gameLayerName = $gameLayerName2 or substring($gameLayerName, 2, string-length($gameLayerName)) = $gameLayerName2)" >
                    final GDGameLayer <xsl:value-of select="$gameLayerName" />GDGameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(0);
                    //final GDObject <xsl:value-of select="$gameLayerName" /> = <xsl:value-of select="$gameLayerName" />GDGameLayer.gdObject;
                    <xsl:variable name="gdObjectFactory2" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gameLayerName" /></xsl:variable>
                    final <xsl:value-of select="$gdObjectFactory2" /><xsl:text> </xsl:text><xsl:value-of select="$gameLayerName" /> = (<xsl:value-of select="$gdObjectFactory2" />)<xsl:text> </xsl:text><xsl:value-of select="$gameLayerName" />GDGameLayer.gdObject;
                    </xsl:if>
                    </xsl:if>
                                                
                    </xsl:if>

                                //NumberObjectVariable - //Has GameLayer
                                if(<xsl:if test="$inverted = 'true'" >!</xsl:if><xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.</xsl:if>
                                    <xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if>
                                    <xsl:if test="position() = 3" >
                                        <xsl:call-template name="replace-escaped-conditionals" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="position() = 4" >
                                        <xsl:variable name="before" >
                                            <xsl:value-of select="substring-before(text(), '.')" />
                                        </xsl:variable>
                                        <xsl:variable name="hasObject" >
                                            <xsl:for-each select="//objects" >
                                                <xsl:if test="name = $before" >found</xsl:if>
                                            </xsl:for-each>
                                        </xsl:variable>

                                        <xsl:if test="$before != ''" >
                                            //<xsl:value-of select="$before" /> - <xsl:value-of select="$hasObject" />
                                            <xsl:text>&#10;</xsl:text>
                                            <xsl:if test="contains($hasObject, 'found')" >
                                                ((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$before" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$before" />) <xsl:value-of select="$before" />).<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="substring-after(text(), '.')" /></xsl:with-param><xsl:with-param name="find" >VariableChildCount(</xsl:with-param><xsl:with-param name="replacementText" >VariableChildCount(<xsl:value-of select="$before" />.</xsl:with-param></xsl:call-template>
                                            </xsl:if>                                            
                                        </xsl:if>
                                        <xsl:if test="not(contains($hasObject, 'found'))" >
                                            <xsl:if test="contains(text(), 'SceneInstancesCount(')" >
                                                <xsl:value-of select="$param" />
                                            </xsl:if>
                                            <xsl:if test="not(contains(text(), 'SceneInstancesCount('))" >
                                            <xsl:value-of select="text()" />
                                            </xsl:if>
                                        </xsl:if>
 
                                    </xsl:if>
                                </xsl:for-each>) {
                                                                
                                    //logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "NumberObjectVariable processing", this, commonStrings.PROCESS);
                                    return true;
                                }
                                
    </xsl:template>

</xsl:stylesheet>

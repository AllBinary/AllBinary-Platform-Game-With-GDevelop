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
    
    <xsl:template name="animatableCapabilityAnimatableBehaviorElapsedTimeConditionGDNode" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        
        <xsl:variable name="quote" >"</xsl:variable>

                    //animatableCapabilityAnimatableBehaviorHasAnimationEndedConditionGDNode - //Condition - //AnimatableCapability::AnimatableBehavior::ElapsedTime - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

        
        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        <xsl:variable name="hasObjectVariable" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), '.Variable')" >found</xsl:if></xsl:for-each></xsl:variable>
        
        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

        <xsl:variable name="hasObjectGroup2" >
            <xsl:for-each select="/game">
                <xsl:for-each select="layouts" >
                    <xsl:for-each select="objectsGroups" >
                        <xsl:if test="name = $name" >
                            found
                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /></xsl:variable>
        
                    //AnimatableCapability::AnimatableBehavior::ElapsedTime
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                        
                        <xsl:if test="contains($hasObjectGroup2, 'found')" >
    
                        final int size3 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.size();
                        for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; index3++) {
                        
                            //final BasicArrayList gdObjectList2 = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.get(index3));
                            final BasicArrayList <xsl:value-of select="$name" />GDGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(index3));
                            final int size = <xsl:value-of select="$name" />GDGameLayerList.size();
                            GDGameLayer gameLayer;
                            <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$name" />;<xsl:text>&#10;</xsl:text>

                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            //.ObjectName()
                            //fourthParam=<xsl:value-of select="$fourthParam" />
                            
                            <xsl:variable name="fourthParam2" >gameLayer.gdObject.<xsl:value-of select="substring-after($fourthParam, '.')" /></xsl:variable>
                            
                            gameLayer = (GDGameLayer) <xsl:value-of select="$name" />GDGameLayerList.get(index);
                            <xsl:value-of select="$name" /> = (<xsl:value-of select="$gdObjectFactory" />) gameLayer.gdObject;

                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                        //1
                        if(gameLayer.getIndexedAnimationInterface().getFrame() == <xsl:value-of select="$fourthParam" />) {
                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>
                        
                            }
                        }
                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasObjectGroup2, 'found'))" >

                        <xsl:for-each select="parameters" >
                            <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="position() = 1" >final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size()</xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>

                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                                        
                        <xsl:for-each select="parameters" >
                            <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="position() = 1" >final GDGameLayer gameLayer = (((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index)))</xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasObjectVariable, 'found') or contains($hasObjectGroup2, 'found'))" >
                            
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($fourthParam, 'Variable')" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                //1
                                if(gameLayer.getIndexedAnimationInterface().getFrame() == <xsl:value-of select="$fourthParam" />) {
                                    return true;
                                }
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="not(contains($fourthParam, 'Variable'))" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                //2
                                if(gameLayer.getIndexedAnimationInterface().getFrame() == <xsl:value-of select="$fourthParam" />) {
                                    return true;
                                }
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        }
                        </xsl:if>
                        
                        <xsl:if test="contains($hasObjectVariable, 'found')" >

                        //3
                        if(gameLayer.getIndexedAnimationInterface().getFrame() == <xsl:value-of select="$fourthParam" />) {
                            return true;
                        }
                        </xsl:if>

                        return false;
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
                                                
                        <xsl:variable name="beforeSecondParam" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>

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
                        //beforeSecondParam=<xsl:value-of select="$beforeSecondParam" />
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
                        //firstOrBeforeFourthParam=<xsl:value-of select="$firstOrBeforeFourthParam" />
                        //firstParam=<xsl:value-of select="$name" />

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
                    
                    <xsl:call-template name="parentSelectionNodeProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        <xsl:with-param name="secondGameLayer" ><xsl:value-of select="$firstOrBeforeFourthParam" /></xsl:with-param>
                        <xsl:with-param name="secondGameLayer2" ><xsl:value-of select="$name" /></xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="contains($hasCollisionProcessGD, 'found')" >
                        <xsl:variable name="collisionProcessGDParamOne" ><xsl:call-template name="collisionProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="collisionProcessGDParamTwo" ><xsl:call-template name="collisionProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                        super.processGDStats(<xsl:value-of select="$collisionProcessGDParamOne" />GDGameLayer);
                        
                        <xsl:if test="$name != $collisionProcessGDParamOne and $name != $collisionProcessGDParamTwo" >
                        //From objectsGroup to object
                        GDGameLayer <xsl:value-of select="$name" />GDGameLayer = <xsl:value-of select="$collisionProcessGDParamOne" />GDGameLayer;
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >
                        <xsl:variable name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" ><xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                        super.processGDStats(<xsl:value-of select="$linkedObjectsPickObjectsLinkedToProcessGDParamOne" />GDGameLayer);
                        
                        <xsl:if test="$name != $linkedObjectsPickObjectsLinkedToProcessGDParamOne and $name != $linkedObjectsPickObjectsLinkedToProcessGDParamTwo" >
                        //From objectsGroup to object
                        GDGameLayer <xsl:value-of select="$name" />GDGameLayer = <xsl:value-of select="$linkedObjectsPickObjectsLinkedToProcessGDParamOne" />GDGameLayer;
                        </xsl:if>
                        
                    </xsl:if>
                    <xsl:if test="not(contains($hasForEachProcessGD, 'found') or contains($hasCollisionProcessGD, 'found') or contains($hasDistanceProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >

                        <xsl:variable name="hasSiblingActionWithObjectsGroupsOrObject" >
                            <xsl:for-each select=".." >
                                <xsl:for-each select="actions" >
                                    <xsl:if test="type/value = 'Create' and type/value != 'CreateByName'" >found</xsl:if>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:variable>                        

                        <xsl:if test="contains($hasSiblingActionWithObjectsGroupsOrObject, 'found')" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //Sibling - //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //AnimatableCapability::AnimatableBehavior::ElapsedTime - From sibling action
                    public boolean processGD(final GDGameLayer gdGameLayer, final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final Graphics graphics) throws Exception {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasSiblingActionWithObjectsGroupsOrObject, 'found') or contains($hasForEachProcessGD, 'found') or contains($hasCollisionProcessGD, 'found') or contains($hasDistanceProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >
                    //Not from parent collision - //AnimatableCapability::AnimatableBehavior::ElapsedTime
                    public boolean processGD(final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                        
                        <xsl:if test="$name != $firstOrBeforeFourthParam" >
                        //From objectsGroup to object
                        GDGameLayer <xsl:value-of select="$name" />GDGameLayer = <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer;
                        </xsl:if>

                        </xsl:if>
                        
                    </xsl:if>

                        //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, commonStrings.PROCESS);

                        final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$name" /> = ((<xsl:value-of select="$gdObjectFactory" />) <xsl:value-of select="$name" />GDGameLayer.gdObject);<xsl:text>&#10;</xsl:text>
                        <xsl:if test="$name != $firstOrBeforeFourthParam" >
                        <xsl:variable name="gdObjectFactory1" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$firstOrBeforeFourthParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$firstOrBeforeFourthParam" /></xsl:variable>
                        final <xsl:value-of select="$gdObjectFactory1" /><xsl:text> </xsl:text><xsl:value-of select="$firstOrBeforeFourthParam" /> = ((<xsl:value-of select="$gdObjectFactory1" />) <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer.gdObject);<xsl:text>&#10;</xsl:text>
                        </xsl:if>

                        <xsl:if test="contains($hasObjectGroup2, 'found')" >
                            
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            //.ObjectName()
                            //fourthParam=<xsl:value-of select="$fourthParam" />
                            

                            <xsl:variable name="fourthParam2" ><xsl:value-of select="$name" />.<xsl:value-of select="substring-after($fourthParam, '.')" /></xsl:variable>
                            
                            
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                        //1
                        if(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer.getIndexedAnimationInterface().getFrame() == <xsl:value-of select="$fourthParam" />) {
                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>

                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasObjectVariable, 'found') or contains($hasObjectGroup2, 'found'))" >
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($fourthParam, 'Variable')" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                        //2
                        if(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer.getIndexedAnimationInterface().getFrame() == <xsl:value-of select="$fourthParam" />) {
                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="not(contains($fourthParam, 'Variable'))" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                        //3
                        if(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer.getIndexedAnimationInterface().getFrame() == <xsl:value-of select="$fourthParam" />) {
                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>

                        </xsl:if>
                        
                        <xsl:if test="contains($hasObjectVariable, 'found')" >

                        final int offset = (<xsl:value-of select="$name" />.animation_name_array.length * <xsl:value-of select="$name" />.animation_direction_array.length * <xsl:value-of select="$name" />.character);<xsl:text>&#10;</xsl:text>
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        //4
                        if(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer.getIndexedAnimationInterface().getFrame() == <xsl:value-of select="$fourthParam" />) {
                            return true;
                        }
                        </xsl:if>
                        </xsl:for-each>
                        
                        </xsl:if>
                        
                        return false;
                    }

                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS);
                        
                        <xsl:if test="contains($hasObjectGroup2, 'found')" >
                            
                            //final BasicArrayList gdObjectList2 = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.get(index));
                            final BasicArrayList <xsl:value-of select="$name" />GDGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(index));
                            final int size = <xsl:value-of select="$name" />GDGameLayerList.size();
                            GDGameLayer gameLayer;
                            <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$name" />;<xsl:text>&#10;</xsl:text>

                        for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index2++) {
                                                        
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            //.ObjectName()
                            //fourthParam=<xsl:value-of select="$fourthParam" />
                            
                            <xsl:variable name="fourthParam2" >gameLayer.gdObject.<xsl:value-of select="substring-after($fourthParam, '.')" /></xsl:variable>
                            
                            gameLayer = (GDGameLayer) <xsl:value-of select="$name" />GDGameLayerList.get(index2);
                            <xsl:value-of select="$name" /> = (<xsl:value-of select="$gdObjectFactory" />) gameLayer.gdObject;

                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                        //1
                        if(gameLayer.getIndexedAnimationInterface().getFrame() == <xsl:value-of select="$fourthParam" />) {
                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>
                        }
                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasObjectGroup2, 'found'))" >
                            
                        <xsl:for-each select="parameters" >
                            <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="position() = 1" >if(index <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size()) return false;<xsl:text>&#10;</xsl:text></xsl:if>
                        <xsl:if test="position() = 1" >final GDGameLayer gameLayer = (((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index)))</xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        
                        <xsl:text>&#10;</xsl:text>
                            
                        </xsl:if>
                        <xsl:if test="not(contains($hasObjectVariable, 'found') or contains($hasObjectGroup2, 'found'))" >

                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($fourthParam, 'Variable')" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                        //2
                        if(gameLayer.getIndexedAnimationInterface().getFrame() == <xsl:value-of select="$fourthParam" />) {
                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="not(contains($fourthParam, 'Variable'))" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                        //3
                        if(gameLayer.getIndexedAnimationInterface().getFrame() == <xsl:value-of select="$fourthParam" />) {
                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>

                        </xsl:if>
                        
                        <xsl:if test="contains($hasObjectVariable, 'found')" >

                        //4
                        if(gameLayer.getIndexedAnimationInterface().getFrame() == <xsl:value-of select="$fourthParam" />) {
                            return true;
                        }

                        </xsl:if>

                        return false;
                    }
                    
                    };

    </xsl:template>

</xsl:stylesheet>

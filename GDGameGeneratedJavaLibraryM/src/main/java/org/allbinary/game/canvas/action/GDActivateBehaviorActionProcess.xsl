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

    <xsl:template name="activateBehaviorActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        
        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        
                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="param3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:variable name="param" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >
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
                
                    //ActivateBehavior - action
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
<!--                            //final BasicArrayList gdObjectList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.get(index));-->
                            final BasicArrayList gdGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(index));
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup) = 0" >
<!--                            //final BasicArrayList gdObjectList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectList;-->
                            final BasicArrayList gdGameLayerList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList;
                            </xsl:if>

                            final int size2 = gdGameLayerList.size();
<!--                            //if(size2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                            //    result = true;
                            //}-->

                            GDGameLayer gdGameLayer;
                            //GDObject gdObject;
                            for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
<!--                            //if(gdObjectList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {-->
                                gdGameLayer = (GDGameLayer) gdGameLayerList.get(index2);
                                
<!--                        //if(<xsl:if test="$param3 = 'yes'" >!</xsl:if><xsl:for-each select="parameters" ><xsl:if test="position() = 1" >gdGameLayer.gdObject.isBehaviorEnabledArray[</xsl:if><xsl:if test="position() = 2" >gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), ':', '_')" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each>_BEHAVIOR_INDEX])
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));-->
                                
                                <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >gdGameLayer.gdObject.isBehaviorEnabledArray[</xsl:if><xsl:if test="position() = 2" >gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), ':', '_')" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each>_BEHAVIOR_INDEX] = <xsl:if test="$param3 = 'yes'" >true</xsl:if><xsl:if test="$param3 != 'yes'" >false</xsl:if>;
<!--                                //gdObject = (GDObject) gdGameLayer.gdObject;
                                //result = result <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> 
                            //}-->
                            }

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            }
                            </xsl:if>
                        
                        
                        return true;
                    }
                    
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
                    //ActivateBehavior - From sibling action
                    public boolean processGD(final GDGameLayer <xsl:value-of select="$name" />GDGameLayer, final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final Graphics graphics) throws Exception {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasSiblingActionWithObjectsGroupsOrObject, 'found') or contains($hasForEachProcessGD, 'found') or contains($hasCollisionProcessGD, 'found') or contains($hasDistanceProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >
                    //Not from parent collision - //ActivateBehavior
                    public boolean processGD(final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                        
                        <xsl:if test="$name != $firstOrBeforeFourthParam" >
                        //From objectsGroup to object
                        GDGameLayer <xsl:value-of select="$name" />GDGameLayer = <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer;
                        </xsl:if>

                        </xsl:if>
                        
                    </xsl:if>
                        
                        //if(<xsl:if test="$param3 = 'yes'" >!</xsl:if><xsl:for-each select="parameters" ><xsl:if test="position() = 1" >gdGameLayer.gdObject.isBehaviorEnabledArray[</xsl:if><xsl:if test="position() = 2" >gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), ':', '_')" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each>_BEHAVIOR_INDEX])
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                        
                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayer.gdObject.isBehaviorEnabledArray[</xsl:if><xsl:if test="position() = 2" >gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each>_BEHAVIOR_INDEX] = <xsl:if test="$param3 = 'yes'" >true</xsl:if><xsl:if test="$param3 != 'yes'" >false</xsl:if>;
                            
                        return true;

                    }

    </xsl:template>

</xsl:stylesheet>

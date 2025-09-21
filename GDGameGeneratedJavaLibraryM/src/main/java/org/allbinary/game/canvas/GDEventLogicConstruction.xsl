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

    <xsl:import href="./condition/GDCollisionNPConditionGDNode.xsl" />

    <!--
            <xsl:choose>
            <xsl:when test="not(preceding::events/actions[parameters = current()/actions/parameters])">
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    <xsl:text>&#10;</xsl:text>
                    <xsl:if test="type/value = 'ModVarScene'" >
                        // - No Preceding text=<xsl:value-of select="parameters" /><xsl:text>&#10;</xsl:text>
                        <xsl:if test="current()/parameters[2]/text() = '+'" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 2" ><xsl:if test="text() = '+'" >=</xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each></xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    <xsl:text>&#10;</xsl:text>
                    // - Already Preceded text=<xsl:value-of select="current()/parameters" /><xsl:text>&#10;</xsl:text>
                </xsl:for-each>
            </xsl:otherwise>
            </xsl:choose>
    -->

    <xsl:template name="firstParamFound" >
        <xsl:param name="nodeId" />
        
        <xsl:variable name="firstParam" >
            <xsl:for-each select="parameters" >
                <xsl:if test="position() = 1" >
                    <xsl:value-of select="text()" />
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="hasObject1" >
            <xsl:for-each select="//objects" >
                <xsl:if test="name = $firstParam" >found</xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="hasObjectGroup1" >
            <xsl:for-each select="//objectsGroups" >
                <xsl:if test="name = $firstParam" >found</xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="isInObjectGroup" >
            <xsl:for-each select="//objectsGroups/objects" >
                <xsl:if test="name = $firstParam" >found</xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="objectGroup" >
            <xsl:for-each select="//objectsGroups" >
                <xsl:variable name="name" >
                    <xsl:value-of select="name" />
                </xsl:variable>
                <xsl:for-each select="objects" >
                    <xsl:if test="name = $firstParam" >
                        <xsl:value-of select="$name" />
                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="collisionProcessGDParamOne" >
            <xsl:call-template name="collisionProcessGDParamOne" >
                <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
<!--
        <xsl:if test="contains($isInObjectGroup, 'found') and $objectGroup = $collisionProcessGDParamOne" >
            //hasObject1=<xsl:value-of select="$hasObject1" />
            //hasObjectGroup1=<xsl:value-of select="$hasObjectGroup1" />
            //isInObjectGroup=<xsl:value-of select="$isInObjectGroup" />
            //collisionProcessGDParamOne=<xsl:value-of select="$collisionProcessGDParamOne" />
            //isFirstParamInTheObjectGroupOfTheCollidedFirstParam=<xsl:value-of select="$objectGroup" />
        </xsl:if>
-->
        <xsl:if test="contains($isInObjectGroup, 'found') and $objectGroup = $collisionProcessGDParamOne" ><xsl:value-of select="$objectGroup" /></xsl:if><xsl:if test="not(contains($isInObjectGroup, 'found') and $objectGroup = $collisionProcessGDParamOne)" ><xsl:value-of select="$firstParam" /></xsl:if>
    </xsl:template>

    <xsl:template name="parentObjectsGroupsOrObjectOrCreateSibling" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            <xsl:for-each select="conditions" >
<!--                 and type/value != 'GlobalVariableAsBoolean'-->
                <xsl:if test="type/value != 'DepartScene' and type/value != 'KeyPressed' and type/value != 'KeyReleased' and type/value != 'MusicStopped' and type/value != 'BuiltinCommonInstructions::Always'" >
                <xsl:if test="count(parameters) > 0" >
                    <xsl:variable name="hasObjectsGroupsOrObjectInParameters" >
                        <xsl:for-each select="parameters" >
                            <xsl:variable name="text" ><xsl:value-of select="text()" /></xsl:variable>
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $text" >found</xsl:if>
                            </xsl:for-each>
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $text" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:if test="contains($hasObjectsGroupsOrObjectInParameters, 'found')" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    
                    <xsl:if test="$totalRecursions = 0" >
                    //Sibling - //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                    </xsl:if>
                    <xsl:if test="$totalRecursions > 0" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                                
                    <xsl:if test="contains($hasChildNode, 'found')" >                                    
                    //Parent - //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                    </xsl:if>
                </xsl:if>
                
                </xsl:if>
                </xsl:if>
                </xsl:if>
            </xsl:for-each>

            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create' and type/value != 'CreateByName'" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

                <xsl:if test="$totalRecursions = 0" >
                //Sibling - //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                </xsl:if>
                <xsl:if test="$totalRecursions > 0" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                                
                <xsl:if test="contains($hasChildNode, 'found')" >
                //Parent - //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                </xsl:if>
                </xsl:if>
                </xsl:if>
            </xsl:for-each>

            <xsl:for-each select="events" >
                
                <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
                <xsl:if test="$totalRecursions = 0" >
                //Sibling - //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                </xsl:if>
                <xsl:if test="$totalRecursions > 0" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                                
                <xsl:if test="contains($hasChildNode, 'found')" >                
                //Parent - //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                </xsl:if>
                </xsl:if>
                </xsl:if>
            </xsl:for-each>
            
            <xsl:call-template name="parentObjectsGroupsOrObjectOrCreateSibling" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
                
    </xsl:template>

    <xsl:template name="hasChildNode" >
        <xsl:param name="childNodeId" />
        
        <xsl:for-each select="*" >
            <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
           
            <xsl:if test="$childNodeId = $nodeId" >found</xsl:if>

            <xsl:call-template name="hasChildNode" >
                <xsl:with-param name="childNodeId" ><xsl:value-of select="$childNodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="hasChildActionThatSetsSecondParam" >
        <xsl:param name="secondParam" />
        
        <xsl:for-each select="actions" >
            <xsl:if test="type/value = 'Create'" >found</xsl:if>
            <xsl:if test="type/value = 'CreateByName'" >found</xsl:if>
        </xsl:for-each>
        
        <xsl:for-each select="events" >
            <xsl:call-template name="hasChildActionThatSetsSecondParam" ><xsl:with-param name="secondParam" ><xsl:value-of select="$secondParam" /></xsl:with-param></xsl:call-template>
        </xsl:for-each>
        
    </xsl:template>

    <xsl:template name="parentSelectionNodeProcessGD" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        <xsl:param name="secondGameLayer" />
        <xsl:param name="secondGameLayer2" />
        
        <xsl:for-each select=".." >
            <xsl:for-each select="events" >
            <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" >
                <xsl:variable name="secondParam" ><xsl:if test="object != $secondGameLayer" ><xsl:value-of select="$secondGameLayer" /></xsl:if><xsl:if test="object = $secondGameLayer and object != $secondGameLayer2" ><xsl:value-of select="$secondGameLayer2" /></xsl:if></xsl:variable>
                <xsl:variable name="hasChildActionThatSetsSecondParam" ><xsl:call-template name="hasChildActionThatSetsSecondParam" ><xsl:with-param name="secondParam" ><xsl:value-of select="$secondParam" /></xsl:with-param></xsl:call-template></xsl:variable>

                //secondGameLayer=<xsl:value-of select="$secondGameLayer" />, //secondGameLayer2=<xsl:value-of select="$secondGameLayer2" />
                //hasChildActionThatSetsSecondParam=<xsl:value-of select="$hasChildActionThatSetsSecondParam" />
                
                //From parent BuiltinCommonInstructions::ForEach - <xsl:for-each select="text()" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:for-each><xsl:text>&#10;</xsl:text>
                <xsl:if test="contains($hasChildActionThatSetsSecondParam, 'found')" >//Using second param from child action (this should be sibling, but for now it is any child action)</xsl:if>
                //totalRecursions=<xsl:value-of select="$totalRecursions" />                
                @Override
                public boolean processGD(final GDGameLayer <xsl:value-of select="object" />GDGameLayer, final GDGameLayer <xsl:if test="contains($hasChildActionThatSetsSecondParam, 'found') and string-length($secondParam) > 0" ><xsl:value-of select="$secondParam" />GDGameLayer</xsl:if><xsl:if test="not(contains($hasChildActionThatSetsSecondParam, 'found') and string-length($secondParam) > 0)" >gdGameLayer</xsl:if>, final Graphics graphics) throws Exception {

                    super.processGDStats(<xsl:value-of select="object" />GDGameLayer);
                </xsl:if>
            </xsl:if>
            </xsl:for-each>
                        
            <xsl:if test="conditions[type/value = 'CollisionNP']" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                
                <xsl:if test="contains($hasChildNode, 'found')" >
                //From parent CollisionNP - <xsl:for-each select="conditions[type/value = 'CollisionNP']" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:for-each>
                //totalRecursions=<xsl:value-of select="$totalRecursions" />
                @Override
                <xsl:if test="conditions[type/value = 'CollisionNP']/parameters[1] = conditions[type/value = 'CollisionNP']/parameters[2]" >
                public boolean processGD(final GDGameLayer <xsl:value-of select="conditions[type/value = 'CollisionNP']/parameters[1]" />GDGameLayer, final GDGameLayer <xsl:value-of select="conditions[type/value = 'CollisionNP']/parameters[2]" />2GDGameLayer, final Graphics graphics) throws Exception {
                </xsl:if>
                <xsl:if test="conditions[type/value = 'CollisionNP']/parameters[1] != conditions[type/value = 'CollisionNP']/parameters[2]" >
                public boolean processGD(final GDGameLayer <xsl:value-of select="conditions[type/value = 'CollisionNP']/parameters[1]" />GDGameLayer, final GDGameLayer <xsl:value-of select="conditions[type/value = 'CollisionNP']/parameters[2]" />GDGameLayer, final Graphics graphics) throws Exception {
                </xsl:if>
                   super.processGDStats(<xsl:value-of select="conditions[type/value = 'CollisionNP']/parameters[1]" />GDGameLayer);
                </xsl:if>
            </xsl:if>

            <xsl:if test="conditions[type/value = 'Distance']" >
                
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                
                <xsl:if test="contains($hasChildNode, 'found')" >
                //From parent Distance - <xsl:for-each select="conditions[type/value = 'Distance']" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:for-each>
                //totalRecursions=<xsl:value-of select="$totalRecursions" />
                @Override
                public boolean processGD(final GDGameLayer <xsl:value-of select="conditions[type/value = 'Distance']/parameters[1]" />GDGameLayer, final GDGameLayer <xsl:value-of select="conditions[type/value = 'Distance']/parameters[2]" />GDGameLayer, final Graphics graphics) throws Exception {
                
                    super.processGDStats(<xsl:value-of select="conditions[type/value = 'Distance']/parameters[1]" />GDGameLayer);
                </xsl:if>
            </xsl:if>

            <xsl:if test="conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']" >
                
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                
                <xsl:if test="contains($hasChildNode, 'found')" >
                //From parent LinkedObjects::PickObjectsLinkedTo - <xsl:for-each select="conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:for-each>
                //totalRecursions=<xsl:value-of select="$totalRecursions" />
                @Override
                public boolean processGD(final GDGameLayer <xsl:value-of select="conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']/parameters[2]" />GDGameLayer, final GDGameLayer <xsl:value-of select="conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']/parameters[3]" />GDGameLayer, final Graphics graphics) throws Exception {

                    super.processGDStats(<xsl:value-of select="conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']/parameters[2]" />GDGameLayer);
                </xsl:if>
            </xsl:if>

            <xsl:variable name="hasForEachEvent" >
                <xsl:for-each select="events" >
                    <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >            
                        <xsl:variable name="hasChildNode" >
                            <xsl:call-template name="hasChildNode" >
                                <xsl:with-param name="childNodeId" >
                                    <xsl:value-of select="$nodeId" />
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:if test="contains($hasChildNode, 'found')" >found</xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:variable>

            <xsl:variable name="hasCollisionNPCondition" >
            <xsl:if test="conditions[type/value = 'CollisionNP']" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                
                <xsl:if test="contains($hasChildNode, 'found')" >
                    found
                </xsl:if>
            </xsl:if>
            </xsl:variable>

            <xsl:variable name="hasDistanceCondition" >
            <xsl:if test="conditions[type/value = 'Distance']" >
                
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                
                <xsl:if test="contains($hasChildNode, 'found')" >
                    found
                </xsl:if>
            </xsl:if>
            </xsl:variable>

            <xsl:variable name="hasLinkedObjectsPickObjectsLinkedToCondition" >
            <xsl:if test="conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']" >
                
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                
                <xsl:if test="contains($hasChildNode, 'found')" >
                    found
                </xsl:if>
            </xsl:if>
            </xsl:variable>

            <xsl:if test="not(contains($hasForEachEvent, 'found') or contains($hasCollisionNPCondition, 'found') or contains($hasDistanceCondition, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToCondition, 'found'))" >
            <xsl:call-template name="parentSelectionNodeProcessGD" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                <xsl:with-param name="secondGameLayer" ><xsl:value-of select="$secondGameLayer" /></xsl:with-param>
                <xsl:with-param name="secondGameLayer2" ><xsl:value-of select="$secondGameLayer2" /></xsl:with-param>
            </xsl:call-template>
            </xsl:if>
            
        </xsl:for-each>
    </xsl:template>

<!--
    <xsl:template name="linkedObjectsPickObjectsLinkedToProcessGD" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            
            <xsl:if test="conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']" >
                
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                
                <xsl:if test="contains($hasChildNode, 'found')" >
                //From parent LinkedObjects::PickObjectsLinkedTo - <xsl:for-each select="conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:for-each>
                //totalRecursions=<xsl:value-of select="$totalRecursions" />
                @Override
                public boolean processGD(final GDGameLayer <xsl:value-of select="conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']/parameters[2]" />GDGameLayer, final GDGameLayer <xsl:value-of select="conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']/parameters[3]" />GDGameLayer, final Graphics graphics) throws Exception {
                </xsl:if>
            </xsl:if>

            <xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGD" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
                
    </xsl:template>
-->

<!--
    <xsl:template name="distanceProcessGD" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            
            <xsl:if test="conditions[type/value = 'Distance']" >
                
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                
                <xsl:if test="contains($hasChildNode, 'found')" >
                //From parent Distance - <xsl:for-each select="conditions[type/value = 'Distance']" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:for-each>
                //totalRecursions=<xsl:value-of select="$totalRecursions" />
                @Override
                public boolean processGD(final GDGameLayer <xsl:value-of select="conditions[type/value = 'Distance']/parameters[1]" />GDGameLayer, final GDGameLayer <xsl:value-of select="conditions[type/value = 'Distance']/parameters[2]" />GDGameLayer, final Graphics graphics) throws Exception {
                </xsl:if>
            </xsl:if>

            <xsl:if test="not(conditions[type/value = 'Distance'])" >
            <xsl:call-template name="distanceProcessGD" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            </xsl:if>
            
        </xsl:for-each>
                
    </xsl:template>
-->
    
<!--
    <xsl:template name="forEachProcessGD" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            <xsl:for-each select="events" >
            <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" >
                //From parent BuiltinCommonInstructions::ForEach - <xsl:for-each select="text()" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:for-each>
                //totalRecursions=<xsl:value-of select="$totalRecursions" />
                @Override
                public boolean processGD(final GDGameLayer <xsl:value-of select="object" />GDGameLayer, final GDGameLayer unusedGDGameLayer, final Graphics graphics) throws Exception {
                </xsl:if>
            </xsl:if>            
            </xsl:for-each>
                        
            <xsl:call-template name="forEachProcessGD" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
                
    </xsl:template>
-->

<!--
    <xsl:template name="collisionProcessGD" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            <xsl:if test="conditions[type/value = 'CollisionNP']" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                
                <xsl:if test="contains($hasChildNode, 'found')" >
                //From parent CollisionNP - <xsl:for-each select="conditions[type/value = 'CollisionNP']" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:for-each>
                //totalRecursions=<xsl:value-of select="$totalRecursions" />
                @Override
                <xsl:if test="conditions[type/value = 'CollisionNP']/parameters[1] = conditions[type/value = 'CollisionNP']/parameters[2]" >
                public boolean processGD(final GDGameLayer <xsl:value-of select="conditions[type/value = 'CollisionNP']/parameters[1]" />GDGameLayer, final GDGameLayer <xsl:value-of select="conditions[type/value = 'CollisionNP']/parameters[2]" />2GDGameLayer, final Graphics graphics) throws Exception {
                </xsl:if>
                <xsl:if test="conditions[type/value = 'CollisionNP']/parameters[1] != conditions[type/value = 'CollisionNP']/parameters[2]" >
                public boolean processGD(final GDGameLayer <xsl:value-of select="conditions[type/value = 'CollisionNP']/parameters[1]" />GDGameLayer, final GDGameLayer <xsl:value-of select="conditions[type/value = 'CollisionNP']/parameters[2]" />GDGameLayer, final Graphics graphics) throws Exception {
                </xsl:if>
                </xsl:if>
            </xsl:if>
            
            <xsl:call-template name="collisionProcessGD" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
                
    </xsl:template>
-->

<!--
                    <xsl:if test="contains($hasForEachProcessGD, 'found')" >
                        super.processGDStats(<xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayer);
                    </xsl:if>
                    <xsl:if test="contains($hasCollisionProcessGD, 'found')" >
                        super.processGDStats(<xsl:call-template name="collisionProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>GDGameLayer);
                    </xsl:if>
                    <xsl:if test="contains($hasDistanceProcessGD, 'found')" >
                        super.processGDStats(<xsl:call-template name="distanceProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>GDGameLayer);
                    </xsl:if>
                    <xsl:if test="contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >
                        super.processGDStats(<xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>GDGameLayer);
                    </xsl:if>
-->

    <xsl:template name="forEachGDParamOne" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            <xsl:for-each select="events" >
            <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" ><xsl:value-of select="object" /></xsl:if>
            </xsl:if>
            </xsl:for-each>
            
            <xsl:call-template name="forEachGDParamOne" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="forEachGDParamTwo" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        <xsl:param name="secondGameLayer" />
        <xsl:param name="secondGameLayer2" />
        
        <xsl:for-each select=".." >
            <xsl:for-each select="events" >
            <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="secondParam" ><xsl:if test="object != $secondGameLayer" ><xsl:value-of select="$secondGameLayer" /></xsl:if><xsl:if test="object = $secondGameLayer and object != $secondGameLayer2" ><xsl:value-of select="$secondGameLayer2" /></xsl:if></xsl:variable>
            <xsl:variable name="hasChildActionThatSetsSecondParam" ><xsl:call-template name="hasChildActionThatSetsSecondParam" ><xsl:with-param name="secondParam" ><xsl:value-of select="$secondParam" /></xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:if test="contains($hasChildActionThatSetsSecondParam, 'found')" ><xsl:if test="contains($hasChildNode, 'found')" ><xsl:value-of select="$secondParam" /></xsl:if></xsl:if>
            </xsl:if>
            </xsl:for-each>
            
            <xsl:call-template name="forEachGDParamTwo" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                <xsl:with-param name="secondGameLayer" ><xsl:value-of select="$secondGameLayer" /></xsl:with-param>
                <xsl:with-param name="secondGameLayer2" ><xsl:value-of select="$secondGameLayer2" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="distanceProcessGDParamOne" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            <xsl:if test="conditions[type/value = 'Distance']" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" >
                <xsl:value-of select="conditions[type/value = 'Distance']/parameters[1]" />
                </xsl:if>
            </xsl:if>
            
            
            <xsl:if test="not(conditions[type/value = 'Distance'])" >
            <xsl:call-template name="distanceProcessGDParamOne" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            </xsl:if>
            
        </xsl:for-each>
                
    </xsl:template>

    <xsl:template name="distanceProcessGDParamTwo" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            <xsl:if test="conditions[type/value = 'Distance']" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" >
                <xsl:value-of select="conditions[type/value = 'Distance']/parameters[2]" />
                </xsl:if>
            </xsl:if>
            
            <xsl:if test="not(conditions[type/value = 'Distance'])" >
            <xsl:call-template name="distanceProcessGDParamTwo" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            </xsl:if>
            
        </xsl:for-each>
                
    </xsl:template>

    <xsl:template name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            <xsl:if test="conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" >
                <xsl:value-of select="conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']/parameters[2]" />
                </xsl:if>
            </xsl:if>
            
            <xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
                
    </xsl:template>

    <xsl:template name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            <xsl:if test="conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" >
                <xsl:value-of select="conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']/parameters[3]" />
                </xsl:if>
            </xsl:if>
            
            <xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
                
    </xsl:template>

    <xsl:template name="collisionProcessGDParamOne" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            <xsl:if test="conditions[type/value = 'CollisionNP']" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" >
                <xsl:value-of select="conditions[type/value = 'CollisionNP']/parameters[1]" />
                </xsl:if>
            </xsl:if>
            
            <xsl:call-template name="collisionProcessGDParamOne" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
                
    </xsl:template>

    <xsl:template name="collisionProcessGDParamTwo" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            <xsl:if test="conditions[type/value = 'CollisionNP']" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" >
                <xsl:value-of select="conditions[type/value = 'CollisionNP']/parameters[2]" />
                </xsl:if>
            </xsl:if>
            
            <xsl:call-template name="collisionProcessGDParamTwo" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
                
    </xsl:template>

    <xsl:template name="hasBuiltinCommonInstructionsForEachToProcessGD" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            <xsl:for-each select="events" >
            <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" >
                found
                </xsl:if>
            </xsl:if>
            </xsl:for-each>
            
            <xsl:call-template name="hasBuiltinCommonInstructionsForEachToProcessGD" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
                
    </xsl:template>

    <xsl:template name="objectBuiltinCommonInstructionsForEachToProcessGD" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            <xsl:for-each select="events" >
            <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" >
                <xsl:value-of select="object" />
                </xsl:if>
            </xsl:if>
            </xsl:for-each>
            
            <xsl:call-template name="objectBuiltinCommonInstructionsForEachToProcessGD" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
                
    </xsl:template>

    <xsl:template name="hasParentSelectionNodeProcessGD" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            
            <xsl:for-each select="events" >
            <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" >
                found
                </xsl:if>
            </xsl:if>
            </xsl:for-each>
            
            <xsl:if test="conditions[type/value = 'CollisionNP'] or conditions[type/value = 'Distance'] or conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" >
                found
                </xsl:if>
            </xsl:if>
            
            <xsl:call-template name="hasParentSelectionNodeProcessGD" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
                
    </xsl:template>

    <xsl:template name="hasDistanceProcessGD" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            <xsl:if test="conditions[type/value = 'Distance']" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" >
                found
                </xsl:if>
            </xsl:if>
            
            <xsl:call-template name="hasDistanceProcessGD" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
                
    </xsl:template>

    <xsl:template name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            <xsl:if test="conditions[type/value = 'LinkedObjects::PickObjectsLinkedTo']" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" >
                found
                </xsl:if>
            </xsl:if>
            
            <xsl:call-template name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
                
    </xsl:template>

    <xsl:template name="hasCollisionProcessGD" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select=".." >
            <xsl:if test="conditions[type/value = 'CollisionNP']" >
            <xsl:variable name="hasChildNode" >
                <xsl:call-template name="hasChildNode" >
                    <xsl:with-param name="childNodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
                <xsl:if test="contains($hasChildNode, 'found')" >
                found
                </xsl:if>
            </xsl:if>
            
            <xsl:call-template name="hasCollisionProcessGD" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="$totalRecursions + 1" />
                </xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
                
    </xsl:template>

    <xsl:template name="findMousePositionNeeded" >
        <xsl:param name="totalRecursions" />

            <xsl:variable name="foundMousePositionNeeded" >found</xsl:variable>
            <xsl:if test="contains($foundMousePositionNeeded, 'found')" >        
                    //MouseX MouseY
                    globals.eventListenerInterfaceLastPoint = new BaseMotionGestureEventListener() {

                        public void onEvent(final AllBinaryEventObject eventObject)
                        {
                        }

                        public void onMotionGestureEvent(final MotionGestureEvent motionGestureEvent) {

                            try {

                            if(!initialized) {
                                return;
                            }
                        
                            
                            gameGlobalsFactory.point = motionGestureEvent.getCurrentPoint();

                            globals.motionEventListOfList[globals.inUseMotionEventListIndex].add(motionGestureEvent);

                            //globals.lastPointGDNode.process(motionGestureEvent, lastMotionGestureInput);
                
        <xsl:for-each select="events" >

            <xsl:for-each select="conditions" >
                
                <xsl:if test="type/value = 'MouseButtonReleased'" >
                    ////MouseButtonReleased - eventListener
                    //globals.mouseButtonReleasedGDnode_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />.process(motionGestureEvent, lastMotionGestureInput);
                </xsl:if>
                <xsl:if test="type/value = 'MouseButtonPressed'" >
                    ////MouseButtonPressed - eventListener
                    //globals.mouseButtonPressedGDnode_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />.process(motionGestureEvent, lastMotionGestureInput);
                </xsl:if>
                <xsl:if test="type/value = 'SourisBouton'" >
                    ////MouseButton - //SourisBouton - eventListener
                    //globals.mouseButtonGDnode_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />.process(motionGestureEvent, lastMotionGestureInput);
                </xsl:if>
                
            </xsl:for-each>

        </xsl:for-each>

                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e);
                            }
                        }

                    };
                
                globals.lastPointGDNode = new GDNode(-<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                
                    private final TouchMotionGestureFactory touchMotionGestureFactory = TouchMotionGestureFactory.getInstance();

                    public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                
                <xsl:call-template name="actionIdsMovedMotionGestureEvent" >
                    <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                </xsl:call-template>
                
                        return true;
                    }
                };
            </xsl:if>

    </xsl:template>

    <xsl:template name="eventsLogicConstructionMotionGestureEvent" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />

        <xsl:variable name="quote" >"</xsl:variable>
    
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />

            <xsl:call-template name="eventsLogicConstructionMotionGestureEvent" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
            </xsl:call-template>

            <xsl:variable name="hasMouseButtonReleasedCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'MouseButtonReleased'" >found</xsl:if></xsl:for-each></xsl:variable>

            <xsl:if test="contains($hasMouseButtonReleasedCondition, 'found')" >
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> <xsl:if test="repeatExpression" >repeatExpression <xsl:value-of select="repeatExpression" /></xsl:if>
            </xsl:if>

            <xsl:for-each select="conditions" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

                //eventsLogicConstructionMotionGestureEvent - Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                <xsl:if test="type/value = 'MouseButtonReleased' or type/value = 'SourisBouton' or type/value = 'MouseButtonPressed' or type/value = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick::IsPressed'" >
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                                        
                    <!-- //MouseButtonReleased - create Listener -->
                    <!-- //SourisBouton - create Listener -->
<!--                    //<xsl:value-of select="type/value" /> - create Listener-->
                    
<!--
                    globals.eventListenerInterface_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = new BaseMotionGestureEventListener() {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        //private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                        
                        public void onEvent(final AllBinaryEventObject eventObject)
                        {
                        }

                        public void onMotionGestureEvent(final MotionGestureEvent motionGestureEvent) {

                            try {

                            if(!initialized) {
                                return;
                            }
                        
                            //Event for Condition
                            //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                            //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                            <xsl:if test="type/value = 'MouseButtonReleased'" >
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                            </xsl:if>
                            <xsl:if test="type/value = 'SourisBouton'" >
                            //final MotionGestureInput motionGestureInput = motionGestureEvent.getMotionGesture();
                            if (lastMotionGestureInput == touchMotionGestureFactory.PRESSED) {
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            }
                            </xsl:if>

                            <xsl:call-template name="actionIdsMotionGestureEvent" >
                                <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                            </xsl:call-template>

                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e);
                            }
                        }

                    };
-->
                <xsl:if test="type/value = 'MouseButtonReleased'" >
                    //GDNode - //MouseButtonReleased - eventListener
                    globals.mouseButtonReleasedGDnode_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = new GDNode(-<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                </xsl:if>
                <xsl:if test="type/value = 'MouseButtonPressed'" >
                    //GDNode - //MouseButtonPressed - eventListener
                    globals.mouseButtonPressedGDnode_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = new GDNode(-<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                </xsl:if>
                <xsl:if test="type/value = 'SourisBouton'" >
                    //GDNode - //MouseButton - //SourisBouton - eventListener
                    globals.mouseButtonGDnode_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = new GDNode(-<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                </xsl:if>
                <xsl:if test="type/value = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick::IsPressed'" >
                    //SpriteMultitouchJoystick::SpriteMultitouchJoystick::IsPressed - eventListener
                    globals.spriteMultitouchJoystickGDnode_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = new GDNode(-<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                </xsl:if>

                    public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {

                        return gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);

                    }
                };

                </xsl:if>

            </xsl:for-each>

        </xsl:for-each>

    </xsl:template>

    <xsl:template name="eventsLogicConstructionCollisionNP" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="exclusionObjectsAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
    
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />

            <xsl:call-template name="eventsLogicConstructionCollisionNP" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
                <xsl:with-param name="exclusionObjectsAsString" >
                    <xsl:value-of select="$exclusionObjectsAsString" />
                </xsl:with-param>
            </xsl:call-template>

            <xsl:variable name="hasCollisionCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'MouseButtonReleased'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:if test="contains($hasCollisionCondition, 'found')" >
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> <xsl:if test="repeatExpression" >repeatExpression <xsl:value-of select="repeatExpression" /></xsl:if>
            </xsl:if>

            <xsl:for-each select="whileConditions" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //whileConditions - //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                //eventsLogicConstructionCollisionNP - //whileConditions - NOT_IMPLEMENTED
            </xsl:for-each>

            <xsl:for-each select="conditions[type/value = 'CollisionNP']" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //Condition - //CollisionNP
                    //<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                    //<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                    <xsl:variable name="name1" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="name1Comma" ><xsl:value-of select="$name1" />,</xsl:variable>
                    <xsl:variable name="nameComma" ><xsl:value-of select="$name" />,</xsl:variable>

                    <xsl:variable name="nodeList" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                        //Child VarScene conditions with actions
                        final BasicArrayList nodeList<xsl:value-of select="$nodeList" /> = new BasicArrayList();
                        <xsl:for-each select="../events" >
                            <xsl:if test="actions" >
                        //1
                        nodeList<xsl:value-of select="$nodeList" />.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]); 
                            </xsl:if>
                        </xsl:for-each>

                        <xsl:variable name="objectGroupNames" ><xsl:for-each select="/game/layouts/objectsGroups" ><xsl:value-of select="name" />,</xsl:for-each></xsl:variable>

                        <xsl:text>&#10;</xsl:text>

                        <xsl:if test="contains($exclusionObjectsAsString, $nameComma) or contains($exclusionObjectsAsString, $name1Comma)" >
                            //Skipping collision between <xsl:value-of select="$nameComma" /> and <xsl:value-of select="$name1Comma" />
                        </xsl:if>

                        <xsl:if test="not(contains($exclusionObjectsAsString, $nameComma) or contains($exclusionObjectsAsString, $name1Comma))" >

                        <xsl:if test="not(contains($objectGroupNames, $name1Comma))" >
                        //Group name is not a layer so use <xsl:value-of select="$name1" /> from <xsl:value-of select="$objectGroupNames" />

                        <xsl:text>&#10;</xsl:text>
                        
                        //CollisionNP
                        <xsl:call-template name="collisionNPConditionGDNodeUsingAllBinary" >
                            <xsl:with-param name="nodeList" ><xsl:value-of select="$nodeList" /></xsl:with-param>
                        </xsl:call-template>

                        //CollisionNP - add Groups/Teams
                        <xsl:call-template name="addCollisionNP" >
                            <xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param>
                            <xsl:with-param name="name1" ><xsl:value-of select="$name1" /></xsl:with-param>
                            <xsl:with-param name="nodeList" ><xsl:value-of select="$nodeList" /></xsl:with-param>
                        </xsl:call-template>

                        </xsl:if>

                        <xsl:if test="contains($objectGroupNames, $name1Comma)" >
                        //Group object needs inclusion for other names <xsl:value-of select="$name1" /> from <xsl:value-of select="$objectGroupNames" />
                        <xsl:variable name="gameLayersInGroup" ><xsl:for-each select="/game/layouts/objectsGroups" ><xsl:if test="$name1 = name" ><xsl:for-each select="objects" ><xsl:value-of select="name/text()" />,</xsl:for-each></xsl:if></xsl:for-each></xsl:variable>
                        //gameLayersInGroup=<xsl:value-of select="$gameLayersInGroup" />
                        <xsl:text>&#10;</xsl:text>

                        //CollisionNP
                        <xsl:call-template name="collisionNPConditionGDNodeUsingAllBinary" >
                            <xsl:with-param name="nodeList" ><xsl:value-of select="$nodeList" /></xsl:with-param>
                        </xsl:call-template>

                    <xsl:call-template name="splitCollisionNP" >
                        <xsl:with-param name="names" >
                            <xsl:value-of select="$gameLayersInGroup" />
                        </xsl:with-param>
                        <xsl:with-param name="name" >
                            <xsl:value-of select="$name" />
                        </xsl:with-param>
                        <xsl:with-param name="nodeList" >
                            <xsl:value-of select="$nodeList" />
                        </xsl:with-param>
                        <xsl:with-param name="iteration" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                        
                        </xsl:if>
                        
                        </xsl:if>

            <xsl:for-each select="subInstructions" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //subInstructions - //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                //eventsLogicConstructionCollisionNP - //subInstructions - NOT_IMPLEMENTED
            </xsl:for-each>

            </xsl:for-each>

        </xsl:for-each>

    </xsl:template>

    <xsl:template name="addCollisionNP" >
        <xsl:param name="name" />
        <xsl:param name="name1" />
        <xsl:param name="nodeList" />

        //<xsl:variable name="nameGDConditionWithGroupActions" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDConditionWithGroupActions</xsl:variable>
        //<xsl:variable name="nameGDConditionWithGroupActions1" >globals.<xsl:value-of select="$name1" />GDConditionWithGroupActions</xsl:variable>
        
//<xsl:text>                        </xsl:text><xsl:value-of select="$nameGDConditionWithGroupActions"/>.groupWithActionsList.add(globals.<xsl:value-of select="$name1" />GroupInterface);                        
//                        <xsl:value-of select="$nameGDConditionWithGroupActions"/>.actionForGroupsList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="$nodeList" />]);        

//<xsl:text>                        </xsl:text><xsl:value-of select="$nameGDConditionWithGroupActions1"/>.groupWithActionsList.add(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GroupInterface);
//                        <xsl:value-of select="$nameGDConditionWithGroupActions1"/>.actionForGroupsList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="$nodeList" />]);        
    </xsl:template>

    <xsl:template name="splitCollisionNP">
        <xsl:param name="names" select="."/>
        <xsl:param name="name" />
        <xsl:param name="nodeList" />
        <xsl:param name="iteration" />

        <xsl:if test="string-length($names) > 0">
            <xsl:variable name="nextName" select="substring-before(concat($names, ','), ',')" />

                        //CollisionNP - add Groups/Teams - //2
                        <xsl:call-template name="addCollisionNP" >
                            <xsl:with-param name="name" ><xsl:value-of select="$nextName" /></xsl:with-param>
                            <xsl:with-param name="name1" ><xsl:value-of select="$name" /></xsl:with-param>
                            <xsl:with-param name="nodeList" ><xsl:value-of select="$nodeList" /></xsl:with-param>
                        </xsl:call-template>

            <xsl:call-template name="splitCollisionNP">
                <xsl:with-param name="names" select="substring-after($names, ',')"/>
                <xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param>
                <xsl:with-param name="nodeList" ><xsl:value-of select="$nodeList" /></xsl:with-param>
                <xsl:with-param name="iteration" select="number($iteration) + 1" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>

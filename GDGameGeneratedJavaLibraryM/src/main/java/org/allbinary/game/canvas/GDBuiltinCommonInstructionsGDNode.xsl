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

    <xsl:import href="./event/GDBuiltinCommonInstructionsForEachChildVariableEventGDNode.xsl" />
    <xsl:import href="./event/GDBuiltinCommonInstructionsForEachEventGDNode.xsl" />
    <xsl:import href="./event/GDBuiltinCommonInstructionsGroupEventGDNode.xsl" />
    <xsl:import href="./event/GDBuiltinCommonInstructionsHackEventGDNode.xsl" />
    
    <xsl:template name="builtinCommonInstructionsGDNode" >
        <xsl:param name="caller" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="selectedNodeIds" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="layoutName" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="conditionEventPosition" />
         
        <xsl:variable name="quote" >"</xsl:variable>

        <xsl:for-each select="events" >

            <xsl:variable name="eventPosition" select="position()" />
            
            <xsl:variable name="selectedNodeId" select="number(substring(generate-id(), 2) - 65536)" />
            <xsl:variable name="selectedNodeIdWithSep" >,<xsl:value-of select="$selectedNodeId" />,</xsl:variable>
            
            <xsl:if test="contains($selectedNodeIds, $selectedNodeIdWithSep) or $selectedNodeIds = 'All'" >

        //<xsl:value-of select="type" /> - //nodeId=<xsl:value-of select="$selectedNodeId" /> - //BuiltinCommonInstructions - //Event - //repeatExpression=<xsl:value-of select="repeatExpression" />
        public class GD<xsl:value-of select="$selectedNodeId" />GDNode extends GDNode
        {
            public GD<xsl:value-of select="$selectedNodeId" />GDNode() {

                super(<xsl:value-of select="$selectedNodeId" />);

            }

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
            
            <xsl:variable name="thisNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />
            
            <xsl:choose>
            <xsl:when test="type = 'BuiltinCommonInstructions::Comment'" >
            //Do not create GDNode for comment event type
            </xsl:when>
            <xsl:when test="type = 'BuiltinCommonInstructions::Link'" >
            //Do not create GDNode for link - The target GDNode is called instead.
            </xsl:when>
            <xsl:when test="type = 'BuiltinAsync::Async'" >
            //<xsl:value-of select="type" /> NOT_IMPLEMENTED
            </xsl:when>
            <xsl:when test="type = 'BuiltinCommonInstructions::JsCode'" >
                <xsl:call-template name="javascriptCodeEventGDNode" >
                    <xsl:param name="totalRecursions" ><xsl:value-of select="$totalRecursions" /></xsl:param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="type = 'BuiltinCommonInstructions::Else'" >
            //<xsl:value-of select="type" /> NOT_IMPLEMENTED
            throw new RuntimeException();
            </xsl:when>

            <xsl:when test="type = 'BuiltinCommonInstructions::ForEachChildVariable'" >

                <xsl:call-template name="builtinCommonInstructionsForEachChildVariableEventGDNode" >
                    <xsl:with-param name="caller" >
                        <xsl:value-of select="$caller" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutName" >
                        <xsl:value-of select="$layoutName" />
                    </xsl:with-param>
                    <xsl:with-param name="selectedNodeIds" >
                        <xsl:value-of select="$selectedNodeIds" />
                    </xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="$totalRecursions" />
                    </xsl:with-param>
                    <xsl:with-param name="instancesAsString" >
                        <xsl:value-of select="$instancesAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsGroupsAsString" >
                        <xsl:value-of select="$objectsGroupsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="conditionEventPosition" >
                        <xsl:value-of select="$eventPosition" />
                    </xsl:with-param>

                </xsl:call-template>
                
            </xsl:when>
            <xsl:when test="type = 'BuiltinCommonInstructions::ForEach'" >

                <xsl:call-template name="builtinCommonInstructionsForEachEventGDNode" >
                    <xsl:with-param name="caller" >
                        <xsl:value-of select="$caller" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutName" >
                        <xsl:value-of select="$layoutName" />
                    </xsl:with-param>
                    <xsl:with-param name="selectedNodeIds" >
                        <xsl:value-of select="$selectedNodeIds" />
                    </xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="$totalRecursions" />
                    </xsl:with-param>
                    <xsl:with-param name="instancesAsString" >
                        <xsl:value-of select="$instancesAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsGroupsAsString" >
                        <xsl:value-of select="$objectsGroupsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="conditionEventPosition" >
                        <xsl:value-of select="$eventPosition" />
                    </xsl:with-param>

                </xsl:call-template>
                                
            </xsl:when>
            <xsl:when test="type = 'BuiltinCommonInstructions::Group'" >
    
                <xsl:call-template name="builtinCommonInstructionsGroupEventGDNode" >
                    <xsl:with-param name="caller" >
                        <xsl:value-of select="$caller" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutName" >
                        <xsl:value-of select="$layoutName" />
                    </xsl:with-param>
                    <xsl:with-param name="selectedNodeIds" >
                        <xsl:value-of select="$selectedNodeIds" />
                    </xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="$totalRecursions" />
                    </xsl:with-param>
                    <xsl:with-param name="instancesAsString" >
                        <xsl:value-of select="$instancesAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsGroupsAsString" >
                        <xsl:value-of select="$objectsGroupsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="conditionEventPosition" >
                        <xsl:value-of select="$eventPosition" />
                    </xsl:with-param>

                </xsl:call-template>

            </xsl:when>
            <xsl:when test="type = 'BuiltinCommonInstructions::While'" >
    
                <xsl:call-template name="builtinCommonInstructionsHackEventGDNode" >
                    <xsl:with-param name="caller" >
                        <xsl:value-of select="$caller" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutName" >
                        <xsl:value-of select="$layoutName" />
                    </xsl:with-param>
                    <xsl:with-param name="selectedNodeIds" >
                        <xsl:value-of select="$selectedNodeIds" />
                    </xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="$totalRecursions" />
                    </xsl:with-param>
                    <xsl:with-param name="instancesAsString" >
                        <xsl:value-of select="$instancesAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsGroupsAsString" >
                        <xsl:value-of select="$objectsGroupsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="conditionEventPosition" >
                        <xsl:value-of select="$eventPosition" />
                    </xsl:with-param>

                </xsl:call-template>

            </xsl:when>
            <xsl:when test="type = 'BuiltinCommonInstructions::Repeat'" >
    
                <xsl:call-template name="builtinCommonInstructionsHackEventGDNode" >
                    <xsl:with-param name="caller" >
                        <xsl:value-of select="$caller" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutName" >
                        <xsl:value-of select="$layoutName" />
                    </xsl:with-param>
                    <xsl:with-param name="selectedNodeIds" >
                        <xsl:value-of select="$selectedNodeIds" />
                    </xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="$totalRecursions" />
                    </xsl:with-param>
                    <xsl:with-param name="instancesAsString" >
                        <xsl:value-of select="$instancesAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsGroupsAsString" >
                        <xsl:value-of select="$objectsGroupsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="conditionEventPosition" >
                        <xsl:value-of select="$eventPosition" />
                    </xsl:with-param>

                </xsl:call-template>

            </xsl:when>
            <xsl:when test="type = 'BuiltinCommonInstructions::Standard'" >
    
                <xsl:call-template name="builtinCommonInstructionsHackEventGDNode" >
                    <xsl:with-param name="caller" >
                        <xsl:value-of select="$caller" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutName" >
                        <xsl:value-of select="$layoutName" />
                    </xsl:with-param>
                    <xsl:with-param name="selectedNodeIds" >
                        <xsl:value-of select="$selectedNodeIds" />
                    </xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="$totalRecursions" />
                    </xsl:with-param>
                    <xsl:with-param name="instancesAsString" >
                        <xsl:value-of select="$instancesAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsGroupsAsString" >
                        <xsl:value-of select="$objectsGroupsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="conditionEventPosition" >
                        <xsl:value-of select="$eventPosition" />
                    </xsl:with-param>

                </xsl:call-template>

            </xsl:when>
            <xsl:otherwise>
            //<xsl:value-of select="type" /> NOT_IMPLEMENTEDE
            </xsl:otherwise>
            </xsl:choose>

        }
        
        public GD<xsl:value-of select="$selectedNodeId" />GDNode NODE_<xsl:value-of select="$selectedNodeId" /> = new GD<xsl:value-of select="$selectedNodeId" />GDNode();

            </xsl:if>

            <xsl:call-template name="builtinCommonInstructionsGDNode" >
                <xsl:with-param name="caller" >
                    <xsl:value-of select="$caller" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
                <xsl:with-param name="layoutName" >
                    <xsl:value-of select="$layoutName" />
                </xsl:with-param>
                <xsl:with-param name="selectedNodeIds" >
                    <xsl:value-of select="$selectedNodeIds" />
                </xsl:with-param>
                <xsl:with-param name="thisNodeIndex" >
                    <xsl:value-of select="$thisNodeIndex" />
                </xsl:with-param>
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="instancesAsString" >
                    <xsl:value-of select="$instancesAsString" />
                </xsl:with-param>
                <xsl:with-param name="objectsGroupsAsString" >
                    <xsl:value-of select="$objectsGroupsAsString" />
                </xsl:with-param>
                <xsl:with-param name="objectsAsString" >
                    <xsl:value-of select="$objectsAsString" />
                </xsl:with-param>
                <xsl:with-param name="createdObjectsAsString" >
                    <xsl:value-of select="$createdObjectsAsString" />
                </xsl:with-param>
                <xsl:with-param name="conditionEventPosition" >
                    <xsl:value-of select="$eventPosition" />
                </xsl:with-param>

            </xsl:call-template>

        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>

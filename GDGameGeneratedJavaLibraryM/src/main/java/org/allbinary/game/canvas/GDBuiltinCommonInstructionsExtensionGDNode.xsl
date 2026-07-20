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
    
    <xsl:template name="builtinCommonInstructionsExtensionGDNode" >
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

        //nodeId=<xsl:value-of select="$selectedNodeId" /> - //extension - childevents
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

                <xsl:variable name="object" ><xsl:value-of select="object" /></xsl:variable>

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> iterableVariableName=<xsl:value-of select="iterableVariableName" /> valueIteratorVariableName=<xsl:value-of select="valueIteratorVariableName" /> keyIteratorVariableName=<xsl:value-of select="keyIteratorVariableName" />

                private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" /> iterableVariableName=<xsl:value-of select="iterableVariableName" /> valueIteratorVariableName=<xsl:value-of select="valueIteratorVariableName" /> keyIteratorVariableName=<xsl:value-of select="keyIteratorVariableName" />";
                <xsl:text>&#10;</xsl:text>

                <xsl:if test="contains(disabled, 'true')" >
                //Disabled so not call anything.
                /*
                </xsl:if>
                
                //BuiltinCommonInstructions::ForEachChildVariable - event - //extension
                @Override
                public boolean process() throws Exception {
                    super.processStats();

                    //logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                    
                    return true;

                }
                
                <xsl:if test="contains(disabled, 'true')" >
                */
                </xsl:if>
                
            </xsl:when>
            <xsl:when test="type = 'BuiltinCommonInstructions::ForEach'" >

                <xsl:variable name="object" ><xsl:value-of select="object" /></xsl:variable>

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" />

                private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />";
                <xsl:text>&#10;</xsl:text>

                <xsl:variable name="hasObjectGroup" >
                    <xsl:for-each select="//objectsGroups" >
                        <xsl:if test="name = $object" >found</xsl:if>
                    </xsl:for-each>
                </xsl:variable>


                <xsl:if test="contains(disabled, 'true')" >
                //Disabled so not call anything.
                /*
                </xsl:if>
                
                
<!--                <xsl:if test="not(contains(disabled, 'true'))" >-->
                //BuiltinCommonInstructions::ForEach - //extension
                @Override
                public boolean process() throws Exception {
                    super.processStats();

                    //logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                    return true;

                }
<!--                </xsl:if>-->
                
                <xsl:if test="contains(disabled, 'true')" >
                */
                </xsl:if>
                
            </xsl:when>
            <xsl:when test="type = 'BuiltinCommonInstructions::Standard' or 
                          type = 'BuiltinCommonInstructions::While' or 
                          type = 'BuiltinCommonInstructions::Group' or 
                          type = 'BuiltinCommonInstructions::Repeat'" >
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" />

                //<xsl:value-of select="type" /> - //BuiltinCommonInstructions - //Event - //repeatExpression=<xsl:value-of select="repeatExpression" />
                private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />";
                <xsl:text>&#10;</xsl:text>

                <xsl:if test="contains(disabled, 'true')" >
                //Disabled so not call anything.
                /*
                </xsl:if>
                
<!--                <xsl:if test="not(contains(disabled, 'true'))" >-->
                //<xsl:value-of select="type" /> - event
                @Override
                public boolean process() throws Exception {
                    super.processStats();
                    
                    //logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                    return true;

                }                

                @Override
                public boolean process(final int index3) throws Exception {
                    super.processStats();
                    
                    //logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                    return true;

                }                

                @Override
                public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                    super.processStats(motionGestureEvent);

                    //logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "motion", this, commonStrings.PROCESS);

                    return true;                           
                }

                @Override
                public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2) throws Exception {
                    super.processGDStats(gameLayer);

                    //logUtil.putF(EVENT_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                    return true;                
                }

                @Override
                public void processReleased() throws Exception { 
                    super.processReleasedStats();

                    //logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "release, this, globals.PROCESS_RELEASE);

                }

                <xsl:if test="contains(disabled, 'true')" >
                */
                </xsl:if>

            </xsl:when>
            <xsl:otherwise>
            //<xsl:value-of select="type" /> NOT_IMPLEMENTED1
            </xsl:otherwise>
            </xsl:choose>

            <!-- other events - END -->

        }
        
        public GD<xsl:value-of select="$selectedNodeId" />GDNode NODE_<xsl:value-of select="$selectedNodeId" /> = new GD<xsl:value-of select="$selectedNodeId" />GDNode();

            </xsl:if>

            <xsl:call-template name="builtinCommonInstructionsExtensionGDNode" >
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

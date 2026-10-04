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
        open public class GD<xsl:value-of select="$selectedNodeId" />GDNode : GDNode
        {
            public constructor() : super(<xsl:value-of select="$selectedNodeId" />) {

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
            throw RuntimeException()
            </xsl:when>

            <xsl:when test="type = 'BuiltinCommonInstructions::ForEachChildVariable'" >

                <xsl:variable name="object" ><xsl:value-of select="object" /></xsl:variable>

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> iterableVariableName=<xsl:value-of select="iterableVariableName" /> valueIteratorVariableName=<xsl:value-of select="valueIteratorVariableName" /> keyIteratorVariableName=<xsl:value-of select="keyIteratorVariableName" />

                private val EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: String = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" /> iterableVariableName=<xsl:value-of select="iterableVariableName" /> valueIteratorVariableName=<xsl:value-of select="valueIteratorVariableName" /> keyIteratorVariableName=<xsl:value-of select="keyIteratorVariableName" />"
                <xsl:text>&#10;</xsl:text>

                <xsl:if test="contains(disabled, 'true')" >
                //Disabled so not call anything.
                /*
                </xsl:if>

                //BuiltinCommonInstructions::ForEachChildVariable - event - //extension
                override public fun process(): Boolean {
                    super.processStats()

                    //this.logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                    var true: return

                }

                <xsl:if test="contains(disabled, 'true')" >
                */
                </xsl:if>

            </xsl:when>
            <xsl:when test="type = 'BuiltinCommonInstructions::ForEach'" >

                <xsl:variable name="object" ><xsl:value-of select="object" /></xsl:variable>

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" />

                private val EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: String = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />"
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
                override public fun process(): Boolean {
                    super.processStats()

                    //this.logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                    var true: return

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
                private val EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: String = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />"
                <xsl:text>&#10;</xsl:text>

                <xsl:if test="contains(disabled, 'true')" >
                //Disabled so not call anything.
                /*
                </xsl:if>

<!--                <xsl:if test="not(contains(disabled, 'true'))" >-->
                //BuiltinCommonInstructions::ForEachChildVariable - event
                override public fun process(): Boolean {
                    super.processStats()

                    //this.logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                    var true: return

                }

                override public fun process(index3: Int): Boolean {
                    super.processStats()

                    //this.logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                    var true: return

                }

                override public fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): Boolean {
                    super.processStats(motionGestureEvent)

                    //this.logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "motion", this, this.commonStrings.PROCESS)

                    var true: return
                }

                override public fun processGD(gameLayerArray: Array&lt;GDGameLayer&gt;): Boolean {
                    super.processGDStats(gameLayerArray)

                    //this.logUtil.putF(EVENT_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                    var true: return
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

        public var NODE_<xsl:value-of select="$selectedNodeId" />: GD<xsl:value-of select="$selectedNodeId" />GDNode = GD<xsl:value-of select="$selectedNodeId" />GDNode()

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

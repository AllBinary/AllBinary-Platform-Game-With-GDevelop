<?xml version="1.0" encoding="windows-1252"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:import href="./GDHack.xsl" />
    <xsl:import href="./GDEventCreateAssignGDObjectGDNodeCondition.xsl" />
    <xsl:import href="./GDEventCreateAssignGDObjectGDNodeAction.xsl" />
    <xsl:import href="./GDObjectGDNodes.xsl" />
    <xsl:import href="./GDEventCreateAssignGDObjectGDNodeObjectEvent.xsl" />
    <xsl:import href="./GDEventCreateAssignGDObjectGDNodeOtherEvent.xsl" />
    
    <xsl:import href="./event/GDJsCodeEventGDNode.xsl" />
    
    <xsl:template name="externalEventsCreateAssignGDObjectCondition" >
        <xsl:param name="layoutName" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="objectsAsString" />

        //externalEventsCreateAssignGDObjectCondition - START
        <xsl:for-each select="../externalEvents" >
            <xsl:if test="$layoutName = associatedLayout" >
                //externalEventsCreateAssignGDObjectCondition - //eventsCreateAssignGDObjectGDNodeCondition - START
                <xsl:call-template name="eventsCreateAssignGDObjectGDNodesCondition" >
                    <xsl:with-param name="caller" >externalEventsCreateAssignGDObject</xsl:with-param>
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="0" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsGroupsAsString" >
                        <xsl:value-of select="$objectsGroupsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>

                </xsl:call-template>
                //externalEventsCreateAssignGDObjectCondition - //eventsCreateAssignGDObjectGDNodeCondition - END
            </xsl:if>
        </xsl:for-each>
        //externalEventsCreateAssignGDObjectCondition - END

    </xsl:template>

    <xsl:template name="externalEventsCreateAssignGDObjectAction" >
        <xsl:param name="layoutName" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="objectsAsString" />

        //externalEventsCreateAssignGDObjectAction - START
        <xsl:for-each select="../externalEvents" >
            <xsl:if test="$layoutName = associatedLayout" >
                //externalEventsCreateAssignGDObjectAction - //eventsCreateAssignGDObjectGDNodeAction - START
                <xsl:call-template name="eventsCreateAssignGDObjectGDNodesAction" >
                    <xsl:with-param name="caller" >externalEventsCreateAssignGDObject</xsl:with-param>
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="0" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsGroupsAsString" >
                        <xsl:value-of select="$objectsGroupsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>

                </xsl:call-template>
                //externalEventsCreateAssignGDObjectAction - //eventsCreateAssignGDObjectGDNodeAction - END
            </xsl:if>
        </xsl:for-each>
        //externalEventsCreateAssignGDObjectAction - END

    </xsl:template>

    <xsl:template name="externalEventsCreateAssignGDObjectOtherEvent" >
        <xsl:param name="layoutName" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="objectsAsString" />

        //externalEventsCreateAssignGDObjectOtherEvent - START
        <xsl:for-each select="../externalEvents" >
            <xsl:if test="$layoutName = associatedLayout" >
                //externalEventsCreateAssignGDObjectOtherEvent - //eventsCreateAssignGDObjectGDNodeOtherEvent - START
                <xsl:call-template name="eventsCreateAssignGDObjectGDNodesOtherEvent" >
                    <xsl:with-param name="caller" >externalEventsCreateAssignGDObject</xsl:with-param>
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="0" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsGroupsAsString" >
                        <xsl:value-of select="$objectsGroupsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>

                </xsl:call-template>
                //externalEventsCreateAssignGDObjectOtherEvent - //eventsCreateAssignGDObjectGDNodeOtherEvent - END
            </xsl:if>
        </xsl:for-each>
        //externalEventsCreateAssignGDObjectOtherEvent - END

    </xsl:template>

    <xsl:template name="externalEventsCreateAssignGDObjectObjectEvent" >
        <xsl:param name="layoutName" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="objectsAsString" />

        //externalEventsCreateAssignGDObjectObjectEvent - START
        <xsl:for-each select="../externalEvents" >
            <xsl:if test="$layoutName = associatedLayout" >
                //externalEventsCreateAssignGDObjectObjectEvent - //eventsCreateAssignGDObjectGDNodeObjectEvent - START
                <xsl:call-template name="eventsCreateAssignGDObjectGDNodesObjectEvent" >
                    <xsl:with-param name="caller" >externalEventsCreateAssignGDObject</xsl:with-param>
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="0" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>

                </xsl:call-template>
                //externalEventsCreateAssignGDObjectObjectEvent - //eventsCreateAssignGDObjectGDNodeObjectEvent - END
            </xsl:if>
        </xsl:for-each>
        //externalEventsCreateAssignGDObjectObjectEvent - END

    </xsl:template>

</xsl:stylesheet>

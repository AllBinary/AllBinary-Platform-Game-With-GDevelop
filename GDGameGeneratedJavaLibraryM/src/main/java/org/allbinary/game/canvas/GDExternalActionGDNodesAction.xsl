<?xml version="1.0" encoding="windows-1252"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:import href="./GDHack.xsl" />
    <xsl:import href="./GDEventCreateAssignGDObjectGDNodeCondition.xsl" />
    <xsl:import href="./GDActionGDNodeAction.xsl" />
    <xsl:import href="./GDObjectGDNodes.xsl" />
    <xsl:import href="./GDEventCreateAssignGDObjectGDNodeObjectEvent.xsl" />
    <xsl:import href="./GDEventCreateAssignGDObjectGDNodeOtherEvent.xsl" />
    
    <xsl:import href="./event/GDJsCodeEventGDNode.xsl" />
    
    <xsl:template name="externalActionGDNodes" >
        <xsl:param name="layoutName" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="selectedNodeIds" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="objectsAsString" />

        //externalEventsCreateAssignGDObjectAction - START
        <xsl:for-each select="../externalEvents" >
            <xsl:if test="$layoutName = associatedLayout" >
                //externalEventsCreateAssignGDObjectAction - //eventsCreateAssignGDObjectGDNodeAction - START
                <xsl:call-template name="actionGDNodes" >
                    <xsl:with-param name="caller" >externalEventsCreateAssignGDObject</xsl:with-param>
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="0" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="selectedNodeIds" >
                        <xsl:value-of select="$selectedNodeIds" />
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

        <xsl:for-each select="../externalLayouts" >
            <xsl:if test="$layoutName = associatedLayout" >
                //externalLayoutsCreateAssignGDObjectAction - //eventsCreateAssignGDObjectGDNodeAction - START
                <xsl:call-template name="actionGDNodes" >
                    <xsl:with-param name="caller" >externalEventsCreateAssignGDObject</xsl:with-param>
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="0" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="selectedNodeIds" >
                        <xsl:value-of select="$selectedNodeIds" />
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
                //externalLayoutsCreateAssignGDObjectAction - //eventsCreateAssignGDObjectGDNodeAction - END
            </xsl:if>
        </xsl:for-each>
        //externalLayoutsCreateAssignGDObjectAction - END

    </xsl:template>

</xsl:stylesheet>

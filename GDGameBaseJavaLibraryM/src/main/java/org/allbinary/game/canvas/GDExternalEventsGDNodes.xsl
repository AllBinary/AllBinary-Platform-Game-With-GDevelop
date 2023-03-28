<?xml version="1.0" encoding="windows-1252"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:import href="./GDEventCreateAssignGDObjectGDNode.xsl" />

    <xsl:template name="externalEventsCreateAssignGDObject" >
        <xsl:param name="layoutName" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="conditionToProcess" />
        <xsl:param name="actionToProcess" />
        <xsl:param name="otherEventToProcess" />
        <xsl:param name="objectEventToProcess" />
        <xsl:param name="thisNodeIndex" />        

        //externalEventsCreateAssignGDObject - START
        <xsl:for-each select="../externalEvents" >
            <xsl:if test="$layoutName = associatedLayout" >
                //externalEventsCreateAssignGDObject - //eventsCreateAssignGDObject - START
                <xsl:call-template name="eventsCreateAssignGDObjectGDNodes" >
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
                    <xsl:with-param name="conditionToProcess" >
                        <xsl:value-of select="$conditionToProcess" />
                    </xsl:with-param>
                    <xsl:with-param name="actionToProcess" >
                        <xsl:value-of select="$actionToProcess" />
                    </xsl:with-param>
                    <xsl:with-param name="otherEventToProcess" >
                        <xsl:value-of select="$otherEventToProcess" />
                    </xsl:with-param>
                    <xsl:with-param name="objectEventToProcess" >
                        <xsl:value-of select="$objectEventToProcess" />
                    </xsl:with-param>

                </xsl:call-template>
                //externalEventsCreateAssignGDObject - //eventsCreateAssignGDObject - END
            </xsl:if>
        </xsl:for-each>
        //externalEventsCreateAssignGDObject - END

    </xsl:template>

    <xsl:template name="externalEventsCreateAssign" >
        <xsl:param name="layoutName" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="conditionToProcess" />
        <xsl:param name="actionToProcess" />
        <xsl:param name="otherEventToProcess" />
        <xsl:param name="objectEventToProcess" />
        <xsl:param name="thisNodeIndex" />

        //externalEventsCreateAssign - START
        <xsl:for-each select="../externalEvents" >
            <xsl:if test="$layoutName = associatedLayout" >
                //externalEventsCreateAssign - //eventsCreateAssignGDObject - START
                <xsl:call-template name="eventsCreateAssignGDObjectGDNodes" >
                    <xsl:with-param name="caller" >externalEventsCreateAssign</xsl:with-param>
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="0" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="conditionToProcess" >
                        <xsl:value-of select="$conditionToProcess" />
                    </xsl:with-param>
                    <xsl:with-param name="actionToProcess" >
                        <xsl:value-of select="$actionToProcess" />
                    </xsl:with-param>
                    <xsl:with-param name="otherEventToProcess" >
                        <xsl:value-of select="$otherEventToProcess" />
                    </xsl:with-param>
                    <xsl:with-param name="objectEventToProcess" >
                        <xsl:value-of select="$objectEventToProcess" />
                    </xsl:with-param>

                </xsl:call-template>
                //externalEventsCreateAssign - //eventsCreateAssignGDObject - END
            </xsl:if>
        </xsl:for-each>
        //externalEventsCreateAssign - END

    </xsl:template>

</xsl:stylesheet>

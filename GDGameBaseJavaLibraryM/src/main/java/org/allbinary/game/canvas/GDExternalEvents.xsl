<?xml version="1.0" encoding="windows-1252"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    //externalEventsCreateActions - START
    <xsl:template name="externalEventsCreateActions" >
        <xsl:param name="layoutName" />
        <xsl:for-each select="../externalEvents" >
            <xsl:if test="$layoutName = associatedLayout" >
                <xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    //externalEventsCreateActions - END

    //externalEventActionModVarSceneAsString - START
    <xsl:template name="externalEventActionModVarScene" >
        <xsl:param name="layoutName" />
        <xsl:for-each select="../externalEvents" >
            <xsl:if test="$layoutName = associatedLayout" >
                <xsl:call-template name="modVarSceneActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    //externalEventActionModVarSceneAsString - END

    <xsl:template name="externalEventsCreateAssignGDObject" >
        <xsl:param name="layoutName" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="objectsAsString" />

        //externalEventsCreateAssignGDObject - START
        <xsl:for-each select="../externalEvents" >
            <xsl:if test="$layoutName = associatedLayout" >
                <xsl:call-template name="eventsCreateAssignGDObject" >
                    <xsl:with-param name="caller" >externalEventsCreateAssignGDObject</xsl:with-param>
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="0" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>

                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>
        //externalEventsCreateAssignGDObject - END

    </xsl:template>

    <xsl:template name="externalEventsCreateAssign" >
        <xsl:param name="layoutName" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsAsString" />

        //externalEventsCreateAssign - START
        <xsl:for-each select="../externalEvents" >
            <xsl:if test="$layoutName = associatedLayout" >
                <xsl:call-template name="eventsCreateAssignGDObject" >
                    <xsl:with-param name="caller" >externalEventsCreateAssign</xsl:with-param>
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="0" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>

                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>
        //externalEventsCreateAssign - END

    </xsl:template>

    <xsl:template name="externalEventsClassProperty" >
        <xsl:param name="layoutName" />

        //externalEventsClassProperty - START
        <xsl:for-each select="../externalEvents" >
            <xsl:if test="$layoutName = associatedLayout" >
                <xsl:call-template name="externalEventsClassPropertyActions" >
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="0" />
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>
        //externalEventsClassProperty - END

    </xsl:template>

</xsl:stylesheet>

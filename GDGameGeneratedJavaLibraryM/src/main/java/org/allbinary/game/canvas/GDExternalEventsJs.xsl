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

    //externalLayoutsCreateActions - START
    <xsl:template name="externalLayoutsCreateActions" >
        <xsl:param name="layoutName" />
        <xsl:for-each select="../externalLayouts" >
            <xsl:if test="$layoutName = associatedLayout" >
                <xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    //externalLayoutsCreateActions - END

    //externalLayoutActionModVarSceneAsString - START
    <xsl:template name="externalLayoutActionModVarScene" >
        <xsl:param name="layoutName" />
        <xsl:for-each select="../externalLayouts" >
            <xsl:if test="$layoutName = associatedLayout" >
                <xsl:call-template name="modVarSceneActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    //externalLayoutActionModVarSceneAsString - END

    <xsl:template name="externalEventsClassProperty" >
        <xsl:param name="layoutName" />

        //externalEventsClassProperty - START
<!--        
        <xsl:for-each select="../externalEvents" >
            <xsl:if test="$layoutName = associatedLayout" >
                <xsl:call-template name="externalEventsClassPropertyActions" >
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="0" />
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>
-->        
        //externalEventsClassProperty - END

    </xsl:template>

</xsl:stylesheet>

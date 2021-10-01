<?xml version="1.0" encoding="windows-1252"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template name="externalEventsCreateAssign" >
        <xsl:param name="layoutName" />
            
        //externalEventsCreateAssign - START
        <xsl:for-each select="../externalEvents" >
            <xsl:if test="$layoutName = associatedLayout" >
                <xsl:call-template name="eventsCreateAssign" >
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="0" />
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

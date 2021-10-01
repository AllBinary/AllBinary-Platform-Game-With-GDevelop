<?xml version="1.0" encoding="windows-1252"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes"/>

    <xsl:template name="actionIds">
        <xsl:param name="totalRecursions" />
            //Actions totalRecursions=<xsl:value-of select="$totalRecursions" />
        <xsl:for-each select="actions" >
            //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
            <xsl:text>&#10;</xsl:text>
            
            this.actionArrayOfArrays[<xsl:value-of select="number(substring(generate-id(), 3))" />].process();
        </xsl:for-each>
        
        <xsl:for-each select="events" >
            //Events totalRecursions=<xsl:value-of select="$totalRecursions" />
            <xsl:call-template name="actionIds" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>                
            </xsl:call-template>
        </xsl:for-each>
        
    </xsl:template>

    <xsl:template name="actionIdsMotionGestureEvent">
        <xsl:param name="totalRecursions" />
                            //Actions totalRecursions=<xsl:value-of select="$totalRecursions" />
        <xsl:for-each select="actions" >
                            //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                            <xsl:text>&#10;</xsl:text>
                            actionArrayOfArrays[<xsl:value-of select="number(substring(generate-id(), 3))" />].process(motionGestureEvent);
        </xsl:for-each>
        
        <xsl:for-each select="events" >
                            //Events totalRecursions=<xsl:value-of select="$totalRecursions" />
            <xsl:call-template name="actionIdsMotionGestureEvent" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
        
    </xsl:template>
</xsl:stylesheet>

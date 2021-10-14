<?xml version="1.0" encoding="windows-1252"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes"/>

    <xsl:template name="createActions">
        <xsl:param name="totalRecursions" />
        <xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />,</xsl:if></xsl:for-each></xsl:if></xsl:for-each><xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="number($totalRecursions) + 1" /></xsl:with-param></xsl:call-template></xsl:for-each>
    </xsl:template>

    <xsl:template name="modVarSceneActions">
        <xsl:param name="totalRecursions" />
        <xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'ModVarScene'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />,</xsl:if></xsl:for-each></xsl:if></xsl:for-each><xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="number($totalRecursions) + 1" /></xsl:with-param></xsl:call-template></xsl:for-each>
    </xsl:template>

    <xsl:template name="eventIds">
        <xsl:param name="totalRecursions" />
        
        //Event nodeId=<xsl:value-of select="generate-id()" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
        <xsl:text>&#10;</xsl:text>
        this.actionArray[<xsl:value-of select="number(substring(generate-id(), 3))" />].process();

        <xsl:for-each select="events" >
            <xsl:call-template name="eventIds" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>                
            </xsl:call-template>
        </xsl:for-each>
        
    </xsl:template>
            
    <xsl:template name="actionIds">
        <xsl:param name="totalRecursions" />
        //actionIds
            //Actions totalRecursions=<xsl:value-of select="$totalRecursions" />
        <xsl:for-each select="actions" >
            //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
            <xsl:text>&#10;</xsl:text>            
            actionArray[<xsl:value-of select="number(substring(generate-id(), 3))" />].process();
        </xsl:for-each>
        
        <xsl:for-each select="events" >
            <xsl:call-template name="actionIds" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>                
            </xsl:call-template>
        </xsl:for-each>
        
    </xsl:template>

    <xsl:template name="actionIdsGDObject">
        <xsl:param name="totalRecursions" />
        <xsl:param name="gdObjectName" />
        //actionIdsGDObject <xsl:value-of select="$gdObjectName" />
            //Actions totalRecursions=<xsl:value-of select="$totalRecursions" />
        <xsl:for-each select="actions" >
            //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
            <xsl:text>&#10;</xsl:text>
            this.actionArray[<xsl:value-of select="number(substring(generate-id(), 3))" />].process(<xsl:value-of select="$gdObjectName" />);
        </xsl:for-each>
        
        <xsl:for-each select="events" >
            <xsl:call-template name="actionIdsGDObject" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>                
            </xsl:call-template>
        </xsl:for-each>
        
    </xsl:template>

    <xsl:template name="actionIdsMotionGestureEvent">
        <xsl:param name="totalRecursions" />
        //actionIdsMotionGestureEvent
                            //Actions totalRecursions=<xsl:value-of select="$totalRecursions" />
        <xsl:for-each select="actions" >
                            //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                            <xsl:text>&#10;</xsl:text>
                            actionArray[<xsl:value-of select="number(substring(generate-id(), 3))" />].process(motionGestureEvent);
        </xsl:for-each>
        
        <xsl:for-each select="events" >
            <xsl:call-template name="actionIdsMotionGestureEvent" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
        
    </xsl:template>
</xsl:stylesheet>

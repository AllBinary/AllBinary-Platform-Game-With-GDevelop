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
        <xsl:param name="caller" />

        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> caller=<xsl:value-of select="$caller" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
        <xsl:if test="type != 'BuiltinCommonInstructions::Comment'" >
        <xsl:text>&#10;</xsl:text>
        <xsl:if test="$caller = 'externalEventsProcess'" >
        this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(null, null, null, null);
        </xsl:if>
        this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
        </xsl:if>
        <xsl:if test="type = 'BuiltinCommonInstructions::Comment'" >
        //BuiltinCommonInstructions::Comment
        </xsl:if>

        <xsl:for-each select="events" >
            <xsl:call-template name="eventIds" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="caller" >
                    <xsl:value-of select="$caller" />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="conditionIds">
        <xsl:param name="totalRecursions" />
        <xsl:param name="caller" />

        <xsl:for-each select="conditions" >
            <xsl:variable name="typeValue" select="type" />
            //Condition - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
            <xsl:text>&#10;</xsl:text>
            this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
        </xsl:for-each>

        <xsl:for-each select="events" >
            <xsl:call-template name="conditionIds" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="caller" >
                    <xsl:value-of select="$caller" />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="actionIds">
        <xsl:param name="totalRecursions" />
        <xsl:param name="caller" />

        //actionIds
        //Actions - GDNode - totalRecursions=<xsl:value-of select="$totalRecursions" /> caller=<xsl:value-of select="$caller" />
        <xsl:for-each select="actions" >
            //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
            <xsl:text>&#10;</xsl:text>
            nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
        </xsl:for-each>

        <xsl:for-each select="events" >
            <xsl:call-template name="actionIds" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="caller" >
                    <xsl:value-of select="$caller" />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="actionIdsGDObject">
        <xsl:param name="totalRecursions" />
        <xsl:param name="gdObjectName" />
        <xsl:param name="gdGameLayer" />

        //actionIdsGDObject <xsl:value-of select="$gdObjectName" />
            //Actions - GDNode - totalRecursions=<xsl:value-of select="$totalRecursions" />
        <xsl:for-each select="actions" >
            //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
            <xsl:text>&#10;</xsl:text>
            nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$gdObjectName" />);
            ((GDGameLayer) <xsl:value-of select="$gdGameLayer" />).updateGDObject(timeDelta);
        </xsl:for-each>

        <xsl:for-each select="events" >
            <xsl:call-template name="actionIdsGDObject" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="gdObjectName" >
                    <xsl:value-of select="$gdObjectName" />
                </xsl:with-param>
                <xsl:with-param name="gdGameLayer" >
                    <xsl:value-of select="$gdGameLayer" />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="actionIdsMotionGestureEvent">
        <xsl:param name="totalRecursions" />
        //actionIdsMotionGestureEvent
                            //Actions - GDNode - totalRecursions=<xsl:value-of select="$totalRecursions" />
        <xsl:for-each select="actions" >
                            //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                            <xsl:text>&#10;</xsl:text>
                            nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
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

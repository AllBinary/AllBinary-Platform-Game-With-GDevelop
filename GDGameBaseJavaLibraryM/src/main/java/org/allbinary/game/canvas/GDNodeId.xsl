<?xml version="1.0" encoding="windows-1252"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes"/>

    <xsl:template name="createActions">
        <xsl:param name="totalRecursions" />
        <xsl:for-each select="events" ><xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:value-of select="text()" />,</xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
            <xsl:call-template name="createActions" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="modVarSceneActions">
        <xsl:param name="totalRecursions" />
        <xsl:for-each select="events" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'ModVarScene'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            <xsl:value-of select="text()" />,</xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
            <xsl:call-template name="createActions" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
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

    <xsl:template name="actionIdsGDObjectPos">
        <xsl:param name="totalRecursions" />
        <xsl:param name="gdObjectName" />
        <xsl:param name="gdGameLayer" />

        //actionIdsGDObject <xsl:value-of select="$gdObjectName" />
        //Actions - GDNode - totalRecursions=<xsl:value-of select="$totalRecursions" />
        <xsl:for-each select="actions" >
            //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
            <xsl:text>&#10;</xsl:text>
            nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$gdObjectName" />);
            ((GDGameLayer) <xsl:value-of select="$gdGameLayer" />).updatePosition();
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
        <xsl:param name="layoutIndex" />
        <xsl:for-each select="/game">
            <xsl:for-each select="layouts" >
                <xsl:variable name="layoutIndex2" select="position() - 1" />

                <xsl:if test="number($layoutIndex2) = $layoutIndex" >

                    //Actions - GDNode - totalRecursions=<xsl:value-of select="$totalRecursions" />
                    //actionIdsMotionGestureEvent
                    <xsl:call-template name="actionIdsMotionGestureEvent2" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="number($totalRecursions) + 1" />
                        </xsl:with-param>
                    </xsl:call-template>

                    <xsl:variable name="childEventWithUsedEvent" ><xsl:for-each select="events" ><xsl:for-each select="events" ><xsl:call-template name="childEventWithUsedEvent" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:for-each></xsl:for-each></xsl:variable>
                    <xsl:if test="contains($childEventWithUsedEvent, 'found')" >
                    //Events - START
                        <xsl:for-each select="events" >
                    //Found - condition in children - <xsl:value-of select="$childEventWithUsedEvent" />
                    <xsl:variable name="typeValue" select="type/value" />
                    //final String EVENTS_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Events nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>";
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, EVENTS_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    //nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
                        </xsl:for-each>
                    //Events - END
                    </xsl:if>
                    
     
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="actionIdsMotionGestureEvent2">
        <xsl:param name="totalRecursions" />

        <xsl:for-each select="events" >

            <xsl:for-each select="conditions" >
                <xsl:if test="type/value = 'SourisSurObjet'" >
            //SourisSurObjet
            //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
            nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
                </xsl:if>
            </xsl:for-each>

            <xsl:call-template name="actionIdsMotionGestureEvent2" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
            </xsl:call-template>

        </xsl:for-each>

    </xsl:template>

    <!-- Events - <xsl:value-of select="$totalRecursions" /> -->
<!--
        //<xsl:value-of select="$totalRecursions" />:events:<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="type" />

        <xsl:for-each select="conditions" >
            //<xsl:value-of select="$totalRecursions" />:condition:<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="type/value" />
        </xsl:for-each>
        <xsl:for-each select="actions" >
            //<xsl:value-of select="$totalRecursions" />:actions:<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="type/value" />|
        </xsl:for-each>

        <xsl:variable name="hasKeyFromTextPressed" ><xsl:for-each select="conditions" ><xsl:if test = "type/value = 'KeyFromTextPressed'" >found</xsl:if></xsl:for-each></xsl:variable>
            //hasKeyFromTextPressed=<xsl:value-of select="$hasKeyFromTextPressed" />
-->
    <xsl:template name="childEventWithUsedEvent">
        <xsl:param name="totalRecursions" />
    
        <xsl:variable name="hasKeyFromTextPressed" ><xsl:for-each select="conditions" ><xsl:if test = "type/value = 'KeyFromTextPressed'" >found</xsl:if></xsl:for-each></xsl:variable>

        <xsl:variable name="foundConditions" >
            <xsl:for-each select="conditions" >
                <xsl:if test="type/value = 'SourisSurObjet'" >//foundConditions</xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="foundActions" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'AddForceAL'" >//foundActions</xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:if test="contains($foundConditions, 'foundConditions')" >//found</xsl:if>
        <xsl:if test="contains($foundActions, 'foundActions')" >//found</xsl:if>

        <xsl:for-each select="events" >
            <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                
                <xsl:if test="not(conditions) or $hasKeyFromTextPressed = 'found'" >
                    <xsl:call-template name="childEventWithUsedEvent" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="number($totalRecursions) + 1" />
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </xsl:if>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>

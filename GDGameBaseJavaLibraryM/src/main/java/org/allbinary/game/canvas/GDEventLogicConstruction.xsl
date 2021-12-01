<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <!--
            <xsl:choose>
            <xsl:when test="not(preceding::events/actions[parameters = current()/actions/parameters])">
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:if test="$typeValue = 'ModVarScene'" >
                        // - No Preceding text=<xsl:value-of select="parameters" /><xsl:text>&#10;</xsl:text>
                        <xsl:if test="current()/parameters[2]/text() = '+'" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 2" ><xsl:if test="text() = '+'" >=</xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each></xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                    // - Already Preceded text=<xsl:value-of select="current()/parameters" /><xsl:text>&#10;</xsl:text>
                </xsl:for-each>
            </xsl:otherwise>
            </xsl:choose>
    -->

    <xsl:template name="eventsLogicConstruction" >
        <xsl:param name="totalRecursions" />
        
        //eventsLogicConstruction - START
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
            
            <xsl:call-template name="eventsLogicConstruction" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
            </xsl:call-template>

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
            <xsl:if test="repeatExpression" >
                //repeatExpression <xsl:value-of select="repeatExpression" />
            </xsl:if>
    
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'MouseButtonReleased'" >
                    this.eventListenerInterface_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = new BaseMotionGestureEventListener() {

                        //private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=?";
                    
                        public void onEvent(final AllBinaryEventObject eventObject)
                        {
                        }

                        public void onMotionGestureEvent(final MotionGestureEvent motionGestureEvent) {
                    
                            //Event for Condition
                            //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                    <xsl:for-each select=".." >
                            <xsl:call-template name="actionIdsMotionGestureEvent" >
                                <xsl:with-param name="totalRecursions" >0</xsl:with-param>                                
                            </xsl:call-template>
                    </xsl:for-each>                            
                        }
                             
                    };
                </xsl:if>
                
                <xsl:if test="$typeValue = 'CollisionNP'" >

                    //<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                    //<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                    <xsl:variable name="name1" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="name" >this.<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>GDActionsCollidableBehavior</xsl:variable>

                        //Child VarScene conditions with actions
                        <xsl:for-each select="../events" >
                            <xsl:if test="actions" >
                    //1
                    <xsl:value-of select="$name" />.groupCollisionList.add(<xsl:value-of select="$name1" />GroupInterface);
                    <xsl:value-of select="$name" />.actionCollisionList.add(this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
                            </xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="../events/events" >
                            <xsl:if test="actions" >
                    //2
                    <xsl:value-of select="$name" />.groupCollisionList.add(<xsl:value-of select="$name1" />GroupInterface);
                    <xsl:value-of select="$name" />.actionCollisionList.add(this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
                            </xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="../events/events/events" >
                            <xsl:if test="actions" >
                    //3
                    <xsl:value-of select="$name" />.groupCollisionList.add(<xsl:value-of select="$name1" />GroupInterface);
                    <xsl:value-of select="$name" />.actionCollisionList.add(this.actionArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
                            </xsl:if>
                        </xsl:for-each>

                </xsl:if>
                
            </xsl:for-each>

        </xsl:for-each>
        //eventsLogicConstruction - END
        
    </xsl:template>

</xsl:stylesheet>

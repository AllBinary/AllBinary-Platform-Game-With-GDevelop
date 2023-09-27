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

    <xsl:import href="./condition/GDCollisionNPConditionGDNode.xsl" />

    <!--
            <xsl:choose>
            <xsl:when test="not(preceding::events/actions[parameters = current()/actions/parameters])">
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    <xsl:text>&#10;</xsl:text>
                    <xsl:if test="type/value = 'ModVarScene'" >
                        // - No Preceding text=<xsl:value-of select="parameters" /><xsl:text>&#10;</xsl:text>
                        <xsl:if test="current()/parameters[2]/text() = '+'" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 2" ><xsl:if test="text() = '+'" >=</xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each></xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    <xsl:text>&#10;</xsl:text>
                    // - Already Preceded text=<xsl:value-of select="current()/parameters" /><xsl:text>&#10;</xsl:text>
                </xsl:for-each>
            </xsl:otherwise>
            </xsl:choose>
    -->

    <xsl:template name="findMousePositionNeeded" >
        <xsl:param name="totalRecursions" />

            <xsl:variable name="foundMousePositionNeeded" >found</xsl:variable>
            <xsl:if test="contains($foundMousePositionNeeded, 'found')" >        
                    //MouseX MouseY
                    globals.eventListenerInterfaceLastPoint = new BaseMotionGestureEventListener() {

                        public void onEvent(final AllBinaryEventObject eventObject)
                        {
                        }

                        public void onMotionGestureEvent(final MotionGestureEvent motionGestureEvent) {

                            try {

                            if(!initialized) {
                                return;
                            }
                        
                            final GDGlobalsFactory gdGlobalsFactory = GDGlobalsFactory.getInstance();
                            gdGlobalsFactory.point = motionGestureEvent.getCurrentPoint();
                            
                            
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e));
                            }
                        }

                    };
            </xsl:if>

    </xsl:template>

    <xsl:template name="eventsLogicConstructionMotionGestureEvent" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />

        <xsl:variable name="quote" >"</xsl:variable>
    
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />

            <xsl:call-template name="eventsLogicConstructionMotionGestureEvent" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
            </xsl:call-template>

            <xsl:variable name="hasMouseButtonReleasedCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'MouseButtonReleased'" >found</xsl:if></xsl:for-each></xsl:variable>

            <xsl:if test="contains($hasMouseButtonReleasedCondition, 'found')" >
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> <xsl:if test="repeatExpression" >repeatExpression <xsl:value-of select="repeatExpression" /></xsl:if>
            </xsl:if>

            <xsl:for-each select="conditions" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

                //eventsLogicConstructionMotionGestureEvent - Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                <xsl:if test="type/value = 'MouseButtonReleased' or type/value = 'SourisBouton' or type/value = 'MouseButtonPressed'" >
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                                        
                    <!-- //MouseButtonReleased - create Listener -->
                    <!-- //SourisBouton - create Listener -->
                    //<xsl:value-of select="type/value" /> - create Listener
                    globals.eventListenerInterface_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = new BaseMotionGestureEventListener() {

                    private final TouchMotionGestureFactory touchMotionGestureFactory = TouchMotionGestureFactory.getInstance();

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        //private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                        
                        public void onEvent(final AllBinaryEventObject eventObject)
                        {
                        }

                        public void onMotionGestureEvent(final MotionGestureEvent motionGestureEvent) {

                            try {

                            if(!initialized) {
                                return;
                            }
                        
                            final GDGlobalsFactory gdGlobalsFactory = GDGlobalsFactory.getInstance();
                            gdGlobalsFactory.point = motionGestureEvent.getCurrentPoint();
                        
                            //Event for Condition
                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                            <xsl:if test="type/value = 'MouseButtonReleased'" >
                            globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:if>
                            <xsl:if test="type/value = 'SourisBouton'" >
                            final MotionGestureInput motionGestureInput = motionGestureEvent.getMotionGesture();
                            if (motionGestureInput == touchMotionGestureFactory.PRESSED) {
                                globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            }
                            </xsl:if>

                            <xsl:call-template name="actionIdsMotionGestureEvent" >
                                <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                            </xsl:call-template>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e));
                            }
                        }

                    };

                </xsl:if>

            </xsl:for-each>

        </xsl:for-each>

    </xsl:template>

    <xsl:template name="eventsLogicConstructionCollisionNP" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="exclusionObjectsAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
    
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />

            <xsl:call-template name="eventsLogicConstructionCollisionNP" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
                <xsl:with-param name="exclusionObjectsAsString" >
                    <xsl:value-of select="$exclusionObjectsAsString" />
                </xsl:with-param>
            </xsl:call-template>

            <xsl:variable name="hasCollisionCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'MouseButtonReleased'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:if test="contains($hasCollisionCondition, 'found')" >
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> <xsl:if test="repeatExpression" >repeatExpression <xsl:value-of select="repeatExpression" /></xsl:if>
            </xsl:if>

            <xsl:for-each select="whileConditions" >
                //eventsLogicConstructionCollisionNP - //whileConditions - NOT_IMPLEMENTED
            </xsl:for-each>

            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

                <xsl:if test="type/value = 'CollisionNP'" >
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //Condition - //CollisionNP
                    //<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                    //<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                    <xsl:variable name="name1" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="name1Comma" ><xsl:value-of select="$name1" />,</xsl:variable>
                    <xsl:variable name="nameComma" ><xsl:value-of select="$name" />,</xsl:variable>

                    <xsl:variable name="nodeList" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                        //Child VarScene conditions with actions
                        final BasicArrayList nodeList<xsl:value-of select="$nodeList" /> = new BasicArrayList();
                        <xsl:for-each select="../events" >
                            <xsl:if test="actions" >
                        //1
                        nodeList<xsl:value-of select="$nodeList" />.add(globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]); 
                            </xsl:if>
                        </xsl:for-each>

                        <xsl:variable name="objectGroupNames" ><xsl:for-each select="/game/layouts/objectsGroups" ><xsl:value-of select="name" />,</xsl:for-each></xsl:variable>

                        <xsl:text>&#10;</xsl:text>

                        <xsl:if test="contains($exclusionObjectsAsString, $nameComma) or contains($exclusionObjectsAsString, $name1Comma)" >
                            //Skipping collision between <xsl:value-of select="$nameComma" /> and <xsl:value-of select="$name1Comma" />
                        </xsl:if>

                        <xsl:if test="not(contains($exclusionObjectsAsString, $nameComma) or contains($exclusionObjectsAsString, $name1Comma))" >

                        <xsl:if test="not(contains($objectGroupNames, $name1Comma))" >
                        //Group name is not a layer so use <xsl:value-of select="$name1" /> from <xsl:value-of select="$objectGroupNames" />

                        <xsl:text>&#10;</xsl:text>
                        
                        <xsl:call-template name="collisionNPConditionGDNode" >
                            <xsl:with-param name="nodeList" ><xsl:value-of select="$nodeList" /></xsl:with-param>
                        </xsl:call-template>

                        <xsl:call-template name="addCollisionNP" >
                            <xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param>
                            <xsl:with-param name="name1" ><xsl:value-of select="$name1" /></xsl:with-param>
                            <xsl:with-param name="nodeList" ><xsl:value-of select="$nodeList" /></xsl:with-param>
                        </xsl:call-template>

                        </xsl:if>

                        <xsl:if test="contains($objectGroupNames, $name1Comma)" >
                        //Group object needs inclusion for other names <xsl:value-of select="$name1" /> from <xsl:value-of select="$objectGroupNames" />
                        <xsl:variable name="gameLayersInGroup" ><xsl:for-each select="/game/layouts/objectsGroups" ><xsl:if test="$name1 = name" ><xsl:for-each select="objects" ><xsl:value-of select="name/text()" />,</xsl:for-each></xsl:if></xsl:for-each></xsl:variable>
                        //gameLayersInGroup=<xsl:value-of select="$gameLayersInGroup" />
                        <xsl:text>&#10;</xsl:text>

                        <xsl:call-template name="collisionNPConditionGDNode" >
                            <xsl:with-param name="nodeList" ><xsl:value-of select="$nodeList" /></xsl:with-param>
                        </xsl:call-template>

                    <xsl:call-template name="splitCollisionNP" >
                        <xsl:with-param name="names" >
                            <xsl:value-of select="$gameLayersInGroup" />
                        </xsl:with-param>
                        <xsl:with-param name="name" >
                            <xsl:value-of select="$name" />
                        </xsl:with-param>
                        <xsl:with-param name="nodeList" >
                            <xsl:value-of select="$nodeList" />
                        </xsl:with-param>
                        <xsl:with-param name="iteration" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                        
                        </xsl:if>
                        
                        </xsl:if>
                        
                </xsl:if>

            </xsl:for-each>

        </xsl:for-each>

    </xsl:template>

    <xsl:template name="addCollisionNP" >
        <xsl:param name="name" />
        <xsl:param name="name1" />
        <xsl:param name="nodeList" />

        <xsl:variable name="nameGDConditionWithGroupActions" >globals.<xsl:value-of select="$name" />GDConditionWithGroupActions</xsl:variable>
        <xsl:variable name="nameGDConditionWithGroupActions1" >globals.<xsl:value-of select="$name1" />GDConditionWithGroupActions</xsl:variable>
        
<xsl:text>                        </xsl:text><xsl:value-of select="$nameGDConditionWithGroupActions"/>.groupWithActionsList.add(globals.<xsl:value-of select="$name1" />GroupInterface);                        
                        <xsl:value-of select="$nameGDConditionWithGroupActions"/>.actionForGroupsList.add(globals.nodeArray[globals.NODE_<xsl:value-of select="$nodeList" />]);        

<xsl:text>                        </xsl:text><xsl:value-of select="$nameGDConditionWithGroupActions1"/>.groupWithActionsList.add(globals.<xsl:value-of select="$name" />GroupInterface);
                        <xsl:value-of select="$nameGDConditionWithGroupActions1"/>.actionForGroupsList.add(globals.nodeArray[globals.NODE_<xsl:value-of select="$nodeList" />]);        
    </xsl:template>

    <xsl:template name="splitCollisionNP">
        <xsl:param name="names" select="."/>
        <xsl:param name="name" />
        <xsl:param name="nodeList" />
        <xsl:param name="iteration" />

        <xsl:if test="string-length($names) > 0">
            <xsl:variable name="nextName" select="substring-before(concat($names, ','), ',')" />

                        <xsl:call-template name="addCollisionNP" >
                            <xsl:with-param name="name" ><xsl:value-of select="$nextName" /></xsl:with-param>
                            <xsl:with-param name="name1" ><xsl:value-of select="$name" /></xsl:with-param>
                            <xsl:with-param name="nodeList" ><xsl:value-of select="$nodeList" /></xsl:with-param>
                        </xsl:call-template>

            <xsl:call-template name="splitCollisionNP">
                <xsl:with-param name="names" select="substring-after($names, ',')"/>
                <xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param>
                <xsl:with-param name="nodeList" ><xsl:value-of select="$nodeList" /></xsl:with-param>
                <xsl:with-param name="iteration" select="number($iteration) + 1" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>

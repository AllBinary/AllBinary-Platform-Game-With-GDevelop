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

    <xsl:template name="eventsLogicConstructionMouseButtonReleased" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />

        <xsl:variable name="quote" >"</xsl:variable>
    
        //eventsLogicConstruction - <xsl:value-of select="$totalRecursions" /> - START
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />

            <xsl:call-template name="eventsLogicConstructionMouseButtonReleased" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
            </xsl:call-template>

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
            <xsl:if test="repeatExpression" >
                //repeatExpression <xsl:value-of select="repeatExpression" />
            </xsl:if>

            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'MouseButtonReleased'" >
                    //MouseButtonReleased - create Listener
                    globals.eventListenerInterface_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = new BaseMotionGestureEventListener() {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        //private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        public void onEvent(final AllBinaryEventObject eventObject)
                        {
                        }

                        public void onMotionGestureEvent(final MotionGestureEvent motionGestureEvent) {

                            try {

                            if(!initialized) {
                                return;
                            }
                        
                            //Event for Condition
                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            
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
        //eventsLogicConstruction - <xsl:value-of select="$totalRecursions" /> - END

    </xsl:template>

    <xsl:template name="eventsLogicConstructionCollisionNP" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />

        <xsl:variable name="quote" >"</xsl:variable>
    
        //eventsLogicConstruction - <xsl:value-of select="$totalRecursions" /> - START
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />

            <xsl:call-template name="eventsLogicConstructionCollisionNP" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
            </xsl:call-template>

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
            <xsl:if test="repeatExpression" >
                //repeatExpression <xsl:value-of select="repeatExpression" />
            </xsl:if>

            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>

                <xsl:if test="$typeValue = 'CollisionNP'" >
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
                        nodeList<xsl:value-of select="$nodeList" />.add(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]); 
                            </xsl:if>
                        </xsl:for-each>

                        <xsl:variable name="objectGroupNames" ><xsl:for-each select="/game/layouts/objectsGroups" ><xsl:value-of select="name" />,</xsl:for-each></xsl:variable>

                        <xsl:text>&#10;</xsl:text>

                        <xsl:if test="not(contains($objectGroupNames, $name1Comma))" >
                        //Group name is not a layer so use <xsl:value-of select="$name1" /> from <xsl:value-of select="$objectGroupNames" />

                        <xsl:text>&#10;</xsl:text>
                        
                        <xsl:call-template name="collisionNP" >
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

                        <xsl:call-template name="collisionNP" >
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

            </xsl:for-each>

        </xsl:for-each>
        //eventsLogicConstruction - <xsl:value-of select="$totalRecursions" /> - END

    </xsl:template>

    <xsl:template name="addCollisionNP" >
        <xsl:param name="name" />
        <xsl:param name="name1" />
        <xsl:param name="nodeList" />

        <xsl:variable name="nameGDConditionWithGroupActions" >globals.<xsl:value-of select="$name" />GDConditionWithGroupActions</xsl:variable>
        
<xsl:text>                        </xsl:text><xsl:value-of select="$nameGDConditionWithGroupActions"/>.groupWithActionsList.add(globals.<xsl:value-of select="$name1" />GroupInterface);                        
                        <xsl:value-of select="$nameGDConditionWithGroupActions"/>.actionForGroupsList.add(globals.nodeArray[<xsl:value-of select="$nodeList" />]);        
    </xsl:template>

    <xsl:template name="collisionNP" >
        <xsl:param name="nodeList" />

                        globals.nodeArray[<xsl:value-of select="$nodeList" />] = new GDNode(<xsl:value-of select="$nodeList" />) {
                        
                            private final String NODE_AT = "Process GDNode <xsl:value-of select="$nodeList" /> at index: ";

                            //Possibly more than 2 GameLayers.  So not all actions on group list are collisions but some are.
                            @Override
                            public void processM(final CollidableCompositeLayer[] gameLayerArray, final GDNode gdNode, final BasicArrayList gdNodeList) {
                                super.processMStats(gameLayerArray, gdNode, gdNodeList);

                                final int size = nodeList<xsl:value-of select="$nodeList" />.size();
                                GDNode node;
                                final int size2 = gameLayerArray.length;
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    //LogUtil.put(LogFactory.getInstance(NODE_AT + index, this, commonStrings.PROCESS));
                                    node = ((GDNode) nodeList<xsl:value-of select="$nodeList" />.get(index));
                                    //LogUtil.put(LogFactory.getInstance(objectStrings.CALLING_GDNODE + node.getName(), this, commonStrings.PROCESS));
                                    node.clear();
                                    for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                                        node.gameLayerArray[index2] = gameLayerArray[index2];
                                    }
                                    node.processM(node.gameLayerArray, gdNode, gdNodeList);
                                    node.clear2();
                                }
                                
                                super.processMStatsE(gameLayerArray, gdNode, gdNodeList);
                            }
                        };
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

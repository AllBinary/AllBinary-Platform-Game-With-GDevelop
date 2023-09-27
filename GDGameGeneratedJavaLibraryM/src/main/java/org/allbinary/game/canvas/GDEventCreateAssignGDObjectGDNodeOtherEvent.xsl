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
    
    <xsl:template name="eventsCreateAssignGDObjectGDNodesOtherEvent" >
        <xsl:param name="caller" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="conditionEventPosition" />
         
        <xsl:variable name="quote" >"</xsl:variable>
        
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />

            <xsl:variable name="parametersAsString0" ><xsl:for-each select="actions" ><xsl:for-each select="parameters" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="text()" />,</xsl:for-each></xsl:for-each></xsl:variable>
            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

            <xsl:variable name="thisNodeArray" >
                <xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" >globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:if></xsl:for-each>
            </xsl:variable>

            <!-- other events - START -->
            <xsl:if test="type = 'BuiltinCommonInstructions::Comment'" >
            //Do not create GDNode for comment event type
            </xsl:if>
            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
            //Do not create GDNode for link - The target GDNode is called instead.
            </xsl:if>
            <xsl:if test="type = 'BuiltinAsync::Async'" >
            //NOT_IMPLEMENTED
            </xsl:if>
            
            <xsl:if test="type = 'BuiltinCommonInstructions::JsCode'" >
                
                <xsl:call-template name="javascriptCodeEventGDNode" >
                    <xsl:param name="totalRecursions" ><xsl:value-of select="$totalRecursions" /></xsl:param>
                </xsl:call-template>

            </xsl:if>
            <xsl:if test="type = 'BuiltinCommonInstructions::Standard' or 
                          type = 'BuiltinCommonInstructions::ForEachChildVariable' or 
                          type = 'BuiltinCommonInstructions::ForEach' or 
                          type = 'BuiltinCommonInstructions::While' or 
                          type = 'BuiltinCommonInstructions::Group' or 
                          type = 'BuiltinCommonInstructions::Repeat'" >
            //Event - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
            if(globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
            }
            globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                <xsl:variable name="thisNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />
                
                //3
                private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />";
                <xsl:text>&#10;</xsl:text>

                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                //private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                </xsl:for-each>

                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        <xsl:if test="$typeValue != 'PauseTimer' and $typeValue != 'PlaySoundCanal'" >
                //private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "C: <xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        </xsl:if>
                        <xsl:if test="$typeValue != 'ModVarScene' and $typeValue != 'AddForceAL' and $typeValue != 'PlaySoundCanal' and $typeValue != 'StopSoundCanal'" >
                //private final String ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "C: <xsl:value-of select="translate($actionAsString, $quote, ' ')" /> at: ";
                        </xsl:if>
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each>

            <xsl:variable name="foundTimerCondition" >
                <xsl:for-each select="conditions" >
                    <xsl:if test="type/value = 'Timer'" >found</xsl:if>
                </xsl:for-each>
            </xsl:variable>

            <!-- <xsl:if test="type/value != 'Timer' and type/value != 'CollisionNP' and type/value != 'VarObjet' and type/value = 'NbObjet' and type/value = 'DepartScene' and type/value = 'SourisSurObjet' and type/value = 'MouseButtonReleased' and type/value = 'SourisBouton' and type/value = 'MouseButtonPressed'" >found</xsl:if> -->

            <xsl:variable name="foundOtherCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'VarObjet' or type/value = 'NbObjet' or type/value = 'ObjectVariableAsBoolean' or type/value = 'SourisSurObjet'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="foundVarSceneCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'VarScene'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="foundLinkEvent" ><xsl:for-each select="events" ><xsl:if test="type = 'BuiltinCommonInstructions::Link'" >found</xsl:if></xsl:for-each></xsl:variable>
            
            <!-- //foundOtherCondition=<xsl:value-of select="$foundOtherCondition" /> -->

                <xsl:if test="contains($foundTimerCondition, 'found')" >
                //Found used conditions so calling them before actions.
                @Override
                public boolean process() throws Exception {
                    super.processStats();

                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    
                    <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                    <xsl:if test="position() = 1" >
                    //Condition - //<xsl:value-of select="type/value" /> - call - press
                    globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    </xsl:if>
                    </xsl:for-each>
                    
                    return true;
                }

                @Override
                public void processReleased() throws Exception { //Event
                    super.processReleasedStats();
                
                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, globals.PROCESS_RELEASE));

                    <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                    <xsl:if test="position() = 1" >
                    //Condition - call - release
                    globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                    </xsl:if>
                    </xsl:for-each>
                }
                
                </xsl:if>

 //
                <xsl:if test="contains($foundOtherCondition, 'found') and not(contains($foundTimerCondition, 'found')) or (contains($foundVarSceneCondition, 'found') and contains($foundLinkEvent, 'found'))" >
                //Found conditions that need processing.
                @Override
                public boolean process() throws Exception {
                    super.processStats();
                    
                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                    <xsl:for-each select="conditions" >
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                        <xsl:if test="position() = 1" >
                    //eventsCreateAssignGDObjectGDNodes - //Condition - //<xsl:value-of select="type/value" /> - press - call
                    globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                        </xsl:if>
                        <xsl:if test="position() = 2" >
                    //eventsCreateAssignGDObjectGDNodes - //Condition - call - more ifs
                        </xsl:if>
                    </xsl:for-each>
                    
                    return true;
                }

                @Override
                public void processReleased() throws Exception {
                    super.processReleasedStats();
                    
                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, globals.PROCESS_RELEASE));

                    <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                        <xsl:if test="position() = 1" >
                    //eventsCreateAssignGDObjectGDNodes - //Condition - //<xsl:value-of select="type/value" /> - release - call
                    globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                        </xsl:if>
                        <xsl:if test="position() = 2" >
                    //eventsCreateAssignGDObjectGDNodes - //Condition - call - more ifs
                        </xsl:if>
                    </xsl:for-each>
                    
                }
                </xsl:if>

                <xsl:if test="whileConditions" >
                @Override
                public boolean process() throws Exception {
                    super.processStats();
                    
                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    <xsl:for-each select="whileConditions" >
                    //whileConditions - //<xsl:value-of select="type/value" /> - call
                    while(globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                    <xsl:for-each select="../conditions" >
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                    globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    </xsl:for-each>
                    }
                    </xsl:for-each>
                    
                    return true;
                }
                </xsl:if>

                <xsl:if test="not(whileConditions)" >
                <xsl:if test="not(contains($foundOtherCondition, 'found'))" >
                <xsl:if test="not(contains($foundTimerCondition, 'found'))" >

                <xsl:if test="actions" >
                //caller=<xsl:value-of select="$caller" /> //No used conditions so calling actions from event directly.
                <xsl:call-template name="actionsWithIndexesProcess" >
                    <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //eventsCreateAssignXGDObjectGDNodesOtherEvent</xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="parametersAsString" >
                        <xsl:value-of select="$parametersAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>                    
                </xsl:call-template>

                <xsl:call-template name="eventsCreateProcessUsed" >
                    <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //eventsCreateAssignXGDObjectGDNodesOtherEvent</xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="parametersAsString" >
                        <xsl:value-of select="$parametersAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                </xsl:call-template>
                </xsl:if>
                                
                <xsl:if test="not(conditions)" >
                <xsl:if test="not(actions)" >
                //Events only - No actions or conditions
                @Override
                public boolean process() throws Exception {
                    super.processStats();

                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                <xsl:for-each select="events" >
                    <!-- CollisionNP is already handled. -->
                    <xsl:variable name="eventWithBuilderCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'CollisionNP'" >found</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if>
                    <xsl:if test="not(contains($eventWithBuilderCondition, 'found'))" >
                        //Events only - //Event - //<xsl:value-of select="type" /> - call
                        globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    </xsl:if>
                    </xsl:if>
                </xsl:for-each>

                <!--
                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:for-each>

                <xsl:if test="actions" >
                <xsl:for-each select="actions" >
                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, new Exception()));
                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    //globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:for-each>

                <xsl:call-template name="actionIds" >
                    <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    <xsl:with-param name="caller" >eventsCreateAssignGDObject</xsl:with-param>
                </xsl:call-template>

                </xsl:if>
                -->

                    return true;
                }
                
                @Override
                public void process(final MotionGestureEvent motionGestureEvent) throws Exception {
                    super.processStats(motionGestureEvent);

                <xsl:for-each select="events" >
                    <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                        <xsl:variable name="childEventWithUsedEvent" ><xsl:call-template name="childEventWithUsedEvent" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="motionGestureEvent" >true</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="$childEventWithUsedEvent != ''" >//<xsl:value-of select="$childEventWithUsedEvent" /></xsl:if>
                        <xsl:if test="contains($childEventWithUsedEvent, 'found')" >
                    //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if>
                    //Event - //BuiltinCommonInstructions::Standard - call - motionGestureEvent - Used condition in children - 2
                    globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
                        </xsl:if>                  
                    </xsl:if>
                    <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
                    //Event - //BuiltinCommonInstructions::ForEach
                    </xsl:if>
                </xsl:for-each>

                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //Action - //<xsl:value-of select="type/value" /> - call - motionGestureEvent
                    //globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
                </xsl:for-each>

                <xsl:if test="actions" >
                <xsl:for-each select="actions" >
                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, new Exception()));
                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    //Action - //<xsl:value-of select="type/value" /> - call - motionGestureEvent
                    //globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
                </xsl:for-each>

                <xsl:call-template name="actionIds" >
                    <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    <xsl:with-param name="caller" >eventsCreateAssignGDObject</xsl:with-param>
                </xsl:call-template>

                </xsl:if>
                }
                </xsl:if>
                </xsl:if>
                
                </xsl:if>
                </xsl:if>
                </xsl:if>

            };
            </xsl:if>
            <!-- other events - END -->

            <xsl:call-template name="eventsCreateAssignGDObjectGDNodesOtherEvent" >
                <xsl:with-param name="caller" >
                    <xsl:value-of select="$caller" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
                <xsl:with-param name="thisNodeIndex" >
                    <xsl:value-of select="$thisNodeIndex" />
                </xsl:with-param>
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="instancesAsString" >
                    <xsl:value-of select="$instancesAsString" />
                </xsl:with-param>
                <xsl:with-param name="objectsAsString" >
                    <xsl:value-of select="$objectsAsString" />
                </xsl:with-param>
                <xsl:with-param name="createdObjectsAsString" >
                    <xsl:value-of select="$createdObjectsAsString" />
                </xsl:with-param>
                <xsl:with-param name="conditionEventPosition" >
                    <xsl:value-of select="$eventPosition" />
                </xsl:with-param>

            </xsl:call-template>

        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>

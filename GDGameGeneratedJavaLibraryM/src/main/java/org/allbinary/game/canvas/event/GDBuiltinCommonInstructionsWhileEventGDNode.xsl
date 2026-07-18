<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" indent="yes" />
    <xsl:template name="builtinCommonInstructionsWhileEventGDNode" >
        <xsl:param name="caller" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="selectedNodeIds" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="layoutName" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="conditionEventPosition" />

        <xsl:variable name="quote" >"</xsl:variable>
        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>

                    <xsl:variable name="foundSubProcessing" >
                        <xsl:for-each select="conditions" >
                            <xsl:choose>
                                <xsl:when test="type/value = 'BuiltinCommonInstructions::And'" >
                                    found
                                </xsl:when>
                                <xsl:when test="type/value = 'BuiltinCommonInstructions::Or'" >
                                    found
                                </xsl:when>                                
                                <xsl:otherwise></xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:variable name="foundSubProcessingOrInputOrTimer" >
                        <xsl:for-each select="conditions" >
                            <xsl:choose>
                                <xsl:when test="type/value = 'KeyPressed' or type/value = 'KeyReleased' or type/value = 'KeyFromTextPressed' or type/value = 'KeyFromTextReleased' or type/value = 'AnyKeyPressed' or type/value = 'AnyKeyReleased'" >
                                    found
                                </xsl:when>
                                <xsl:when test="type/value = 'MouseButton' or type/value = 'SourisBouton' or type/value = 'MouseButtonReleased' or type/value = 'MouseButtonFromTextPressed'" >
                                    found
                                </xsl:when>
                                <xsl:when test="type/value = 'IsCursorOnObject' or type/value = 'SourisSurObjet'" >
                                    found
                                </xsl:when>
                                <xsl:when test="type/value = 'IsMouseWheelScrollingDown' or type/value = 'IsMouseWheelScrollingUp'" >
                                    found
                                </xsl:when>
                                <xsl:when test="type/value = 'BuiltinCommonInstructions::And'" >
                                    found
                                </xsl:when>
                                <xsl:when test="type/value = 'BuiltinCommonInstructions::Or'" >
                                    found
                                </xsl:when>                                
                                <xsl:otherwise></xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:variable>
                        
                private final GDStrings gdStrings = GDStrings.getInstance();
            
                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
                private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />";
                <xsl:text>&#10;</xsl:text>

                <xsl:if test="contains(disabled, 'true')" >
                //Disabled so not call anything.
                /*
                </xsl:if>
                
                private long iterationTotal;
                
                //<xsl:value-of select="type" /> - //whileConditionsTotal=<xsl:value-of select="count(whileConditions)" /> - event
                @Override
                public boolean process() throws Exception {
                    super.processStats();
                    
                    <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                    //logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="$nodeId" />, this, commonStrings.PROCESS);

                <xsl:if test="whileConditions" >
                    //whileConditions
                    
                    <xsl:for-each select="whileConditions" >
                    //whileConditions - //<xsl:value-of select="type/value" /> - call
                    this.iterationTotal = 0;
                    while(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {

                    this.iterationTotal++;
                    if(iterationTotal % 10000 == 0) {
                        logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="$nodeId" /> + gdStrings.LONG_RUNNING_WHILE_LOOP + this.iterationTotal, this, commonStrings.PROCESS);
                    }

                    <xsl:for-each select=".." >
                    <xsl:for-each select="conditions" >
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                        <xsl:choose>
                            <xsl:when test="type/value = 'KeyPressed' or type/value = 'KeyReleased' or type/value = 'KeyFromTextPressed' or type/value = 'KeyFromTextReleased' or type/value = 'AnyKeyPressed' or type/value = 'AnyKeyReleased'" >
                        //Skip - Key Input condition for process() as it can only be called from GDGameInputProcessor, but probably should not be
                            </xsl:when>
                            <xsl:when test="type/value = 'MouseButton' or type/value = 'SourisBouton' or type/value = 'MouseButtonReleased' or type/value = 'MouseButtonFromTextPressed'" >
                        //Skip - MouseButton/SourisBouton, MouseButtonReleased, MouseButtonFromTextPressed for process() as it can only be called from process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput)
                            </xsl:when>
                            <xsl:when test="type/value = 'IsCursorOnObject' or type/value = 'SourisSurObjet'" >
                        //Skip - IsCursorOnObject/SourisSurObjet for process() as it can only be called from process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput)
                            </xsl:when>
                            <xsl:when test="type/value = 'IsMouseWheelScrollingDown' or type/value = 'IsMouseWheelScrollingUp'" >
                        //Skip - IsMouseWheelScrollingDown for process() as it can only be called from process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput)
                            </xsl:when>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::And'" >
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:when>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::Or'" >
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:when>
                            <xsl:when test="type/value = 'LinkedObjects::PickObjectsLinkedTo'" >
                        //LinkedObjects::PickObjectsLinkedTo does not have process() logic
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:when>
                            <xsl:otherwise>
                        if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>

                    <xsl:if test="not(contains($foundSubProcessingOrInputOrTimer, 'found'))" >
                        
                        <xsl:call-template name="actionsProcessing" >
                            <xsl:with-param name="methodCall" >process()</xsl:with-param>
                        </xsl:call-template>

                    <xsl:for-each select="events" >
                        <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if>
                            //Events only - //Event - //<xsl:value-of select="type" /> - call
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                        </xsl:if>
                        <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> 
                            <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> 
                            <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call
                            <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process();
                        </xsl:if>
                    </xsl:for-each>

                    </xsl:if>

                    <xsl:for-each select="conditions" >
                        <xsl:choose>
                            <xsl:when test="type/value = 'KeyPressed' or type/value = 'KeyReleased' or type/value = 'KeyFromTextPressed' or type/value = 'KeyFromTextReleased' or type/value = 'AnyKeyPressed' or type/value = 'AnyKeyReleased'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'MouseButton' or type/value = 'SourisBouton' or type/value = 'MouseButtonReleased' or type/value = 'MouseButtonFromTextPressed'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'IsCursorOnObject' or type/value = 'SourisSurObjet'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'IsMouseWheelScrollingDown' or type/value = 'IsMouseWheelScrollingUp'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::And'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::Or'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'LinkedObjects::PickObjectsLinkedTo'" >
                            </xsl:when>
                            <xsl:otherwise>
                        }
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    </xsl:for-each>

                    }
                    </xsl:for-each>
                    
                </xsl:if>
                    
                    return true;

                }                

                @Override
                public boolean process(final int index3) throws Exception {
                    super.processStats();
                    
                    //logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);                    

                <xsl:if test="whileConditions" >
                    //whileConditions
                    <xsl:for-each select="whileConditions" >
                    //whileConditions - //<xsl:value-of select="type/value" /> - call
                    this.iterationTotal = 0;
                    while(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index3)) {

                    this.iterationTotal++;
                    if(iterationTotal % 10000 == 0) {
                        logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="$nodeId" /> + gdStrings.LONG_RUNNING_WHILE_LOOP + this.iterationTotal, this, commonStrings.PROCESS);
                    }

                    <xsl:for-each select=".." >
                    <xsl:for-each select="conditions" >
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                        <xsl:choose>
                            <xsl:when test="type/value = 'KeyPressed' or type/value = 'KeyReleased' or type/value = 'KeyFromTextPressed' or type/value = 'KeyFromTextReleased' or type/value = 'AnyKeyPressed' or type/value = 'AnyKeyReleased'" >
                        //Skip - Key Input condition for process() as it can only be called from GDGameInputProcessor, but probably should not be
                            </xsl:when>
                            <xsl:when test="type/value = 'MouseButton' or type/value = 'SourisBouton' or type/value = 'MouseButtonReleased'" >
                        //Skip - MouseButton/SourisBouton, MouseButtonReleased for process() as it can only be called from process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput)
                            </xsl:when>
                            <xsl:when test="type/value = 'IsCursorOnObject' or type/value = 'SourisSurObjet'" >
                        //Skip - IsCursorOnObject/SourisSurObjet for process() as it can only be called from process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput)
                            </xsl:when>
                            <xsl:when test="type/value = 'IsMouseWheelScrollingDown' or type/value = 'IsMouseWheelScrollingUp'" >
                        //Skip - IsMouseWheelScrollingDown for process() as it can only be called from process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput)
                            </xsl:when>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::And'" >
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index3);
                            </xsl:when>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::Or'" >
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index3);
                            </xsl:when>
                            <xsl:when test="type/value = 'LinkedObjects::PickObjectsLinkedTo'" >
                        //LinkedObjects::PickObjectsLinkedTo does not have process(index3) logic
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index3);
                            </xsl:when>
                            <xsl:otherwise>
                        if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index3)) {
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>

                    <xsl:if test="not(contains($foundSubProcessingOrInputOrTimer, 'found'))" >
                        
                        <xsl:call-template name="actionsProcessing" >
                            <xsl:with-param name="methodCall" >process(index3)</xsl:with-param>
                        </xsl:call-template>

                    <xsl:for-each select="events" >
                        <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if>
                            //Events only - //Event - //<xsl:value-of select="type" /> - call
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index3);
                        </xsl:if>
                        <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> 
                            <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> 
                            <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call
                            <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process(index3);
                        </xsl:if>
                    </xsl:for-each>

                    </xsl:if>

                    <xsl:for-each select="conditions" >
                        <xsl:choose>
                            <xsl:when test="type/value = 'KeyPressed' or type/value = 'KeyReleased' or type/value = 'KeyFromTextPressed' or type/value = 'KeyFromTextReleased' or type/value = 'AnyKeyPressed' or type/value = 'AnyKeyReleased'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'MouseButton' or type/value = 'SourisBouton' or type/value = 'MouseButtonReleased'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'IsCursorOnObject' or type/value = 'SourisSurObjet'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'IsMouseWheelScrollingDown' or type/value = 'IsMouseWheelScrollingUp'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::And'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::Or'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'LinkedObjects::PickObjectsLinkedTo'" >
                            </xsl:when>
                            <xsl:otherwise>
                        }
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    </xsl:for-each>

                    }
                    </xsl:for-each>

                </xsl:if>

                    return true;

                }                

                @Override
                public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                    super.processStats(motionGestureEvent);

                    //logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "motion", this, commonStrings.PROCESS);

                <xsl:if test="whileConditions" >
                    //whileConditions
                    
                    <xsl:for-each select="whileConditions" >
                    //whileConditions - //<xsl:value-of select="type/value" /> - call
                    this.iterationTotal = 0;
                    while(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput)) {

                    this.iterationTotal++;
                    if(iterationTotal % 10000 == 0) {
                        logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="$nodeId" /> + gdStrings.LONG_RUNNING_WHILE_LOOP + this.iterationTotal, this, commonStrings.PROCESS);
                    }
                    
                    <xsl:for-each select=".." >
                    <xsl:for-each select="conditions" >
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                        <xsl:choose>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::And'" >
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                            </xsl:when>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::Or'" >
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                            </xsl:when>
                            <xsl:when test="type/value = 'LinkedObjects::PickObjectsLinkedTo'" >
                        //LinkedObjects::PickObjectsLinkedTo does not have process(motionGestureEvent, lastMotionGestureInput) logic
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index3);
                            </xsl:when>
                            <xsl:otherwise>
                        if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput)) {
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>

                    <xsl:if test="not(contains($foundSubProcessing, 'found'))" >
                        
                        <xsl:call-template name="actionsProcessing" >
                            <xsl:with-param name="methodCall" >process(motionGestureEvent, lastMotionGestureInput)</xsl:with-param>
                        </xsl:call-template>

                    <xsl:for-each select="events" >
                        <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if>
                            //Events only - //Event - //<xsl:value-of select="type" /> - call
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                        </xsl:if>
                        <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> 
                            <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> 
                            <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call
                            <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process(motionGestureEvent, lastMotionGestureInput);
                        </xsl:if>
                    </xsl:for-each>

                    </xsl:if>

                    <xsl:for-each select="conditions" >
                        <xsl:choose>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::And'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::Or'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'LinkedObjects::PickObjectsLinkedTo'" >
                            </xsl:when>
                            <xsl:otherwise>
                        }
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    </xsl:for-each>

                    }
                    </xsl:for-each>

                </xsl:if>
                    
                    return true;
                }

                @Override
                public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2) throws Exception {
                    super.processGDStats(gameLayer);

                    //logUtil.putF(EVENT_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                <xsl:if test="whileConditions" >
                    //whileConditions
                    
                    <xsl:for-each select="whileConditions" >
                    //whileConditions - //<xsl:value-of select="type/value" /> - call
                    this.iterationTotal = 0;
                    while(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameLayer2)) {
                    
                    this.iterationTotal++;
                    if(iterationTotal % 10000 == 0) {
                        logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="$nodeId" /> + gdStrings.LONG_RUNNING_WHILE_LOOP + this.iterationTotal, this, commonStrings.PROCESS);
                    }
                    
                    <xsl:for-each select=".." >
                    <xsl:for-each select="conditions" >
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                        <xsl:choose>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::And'" >
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameGlobals.tempGameLayerArray[1]);
                            </xsl:when>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::Or'" >
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameGlobals.tempGameLayerArray[1]);
                            </xsl:when>
                            <xsl:when test="type/value = 'LinkedObjects::PickObjectsLinkedTo'" >
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameGlobals.tempGameLayerArray[1]);
                            </xsl:when>
                            <xsl:otherwise>
                        if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameGlobals.tempGameLayerArray[1])) {
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>

                    <xsl:if test="not(contains($foundSubProcessing, 'found'))" >
                        
                        <xsl:call-template name="actionsProcessing" >
                            <xsl:with-param name="methodCall" >processGD(gameLayer, gameGlobals.tempGameLayerArray[1])</xsl:with-param>
                            <xsl:with-param name="parentParam" >gameLayer</xsl:with-param>
                            <xsl:with-param name="parentParam2" >gameGlobals.tempGameLayerArray[1]</xsl:with-param>
                        </xsl:call-template>

                    <xsl:for-each select="events" >
                        <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if>
                            //Events only - //Event - //<xsl:value-of select="type" /> - call
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameGlobals.tempGameLayerArray[1]);
                        </xsl:if>
                        <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> 
                            <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> 
                            <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call
                            <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.processGD(gameLayer, gameGlobals.tempGameLayerArray[1]);
                        </xsl:if>
                    </xsl:for-each>

                    </xsl:if>

                    <xsl:for-each select="conditions" >
                        <xsl:choose>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::And'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'BuiltinCommonInstructions::Or'" >
                            </xsl:when>
                            <xsl:when test="type/value = 'LinkedObjects::PickObjectsLinkedTo'" >
                            </xsl:when>
                            <xsl:otherwise>
                        }
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    </xsl:for-each>

                    }
                    </xsl:for-each>

                </xsl:if>

                    return true;                
                }

                @Override
                public void processReleased() throws Exception { 
                    super.processReleasedStats();

                    //logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "release, this, globals.PROCESS_RELEASE);
                    //No release for whileConditions?

                }

                <xsl:if test="contains(disabled, 'true')" >
                */
                </xsl:if>

    </xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="windows-1252"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes"/>

    <xsl:template name="generateIndexToNodeIdMapping2" >
        <xsl:param name="totalRecursion" />

            <xsl:variable name="eventIndex" ><xsl:value-of select="position()" /></xsl:variable>
            <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
            <xsl:variable name="externalEventCountBefore" ><xsl:value-of select="count(//externalEvents[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            //Count - //Parent of Event - <xsl:value-of select="$externalEventCountBefore" /> //events - <xsl:value-of select="$eventCountBefore" /> //conditions = <xsl:value-of select="$conditionsCountBefore" /> //actions = <xsl:value-of select="$actionsCountBefore" /> //actionParameters = <xsl:value-of select="$actionParametersCountBefore" />
            final int NODE_<xsl:value-of select="$id" /> = <xsl:value-of select="$externalEventCountBefore + $eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />;

            <xsl:call-template name="generateIndexToNodeIdMapping" >
                <xsl:with-param name="totalRecursion" >
                    <xsl:value-of select="$totalRecursion + 1" />
                </xsl:with-param>
            </xsl:call-template>
                
    </xsl:template>

    <xsl:template name="generateIndexToNodeIdMapping" >
        <xsl:param name="totalRecursion" />
                
        <xsl:for-each select="events" >
        
            <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
            <xsl:variable name="externalEventCountBefore" ><xsl:value-of select="count(//externalEvents[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            //Count - //Event - //Parents of Event - <xsl:value-of select="$externalEventCountBefore" /> //events - <xsl:value-of select="$eventCountBefore" /> //conditions = <xsl:value-of select="$conditionsCountBefore" /> //actions = <xsl:value-of select="$actionsCountBefore" /> //actionParameters = <xsl:value-of select="$actionParametersCountBefore" />
            public final int NODE_<xsl:value-of select="$id" /> = <xsl:value-of select="$externalEventCountBefore + $eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />;

            <xsl:for-each select="whileConditions" >
                <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                <xsl:variable name="externalEventCountBefore" ><xsl:value-of select="count(//externalEvents[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                //Count - //whileConditions - //Condition - //Parents of Event - <xsl:value-of select="$externalEventCountBefore" /> //events = <xsl:value-of select="$eventCountBefore" /> //conditions = <xsl:value-of select="$conditionsCountBefore" /> //actions = <xsl:value-of select="$actionsCountBefore" /> //actionParameters = <xsl:value-of select="$actionParametersCountBefore" />
                final int NODE_<xsl:value-of select="$id" /> = <xsl:value-of select="$externalEventCountBefore + $eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />;
                <xsl:for-each select="subInstructions" >
                    <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                    <xsl:variable name="externalEventCountBefore" ><xsl:value-of select="count(//externalEvents[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    //Count - //subInstructions - //Condition - //Parents of Event - <xsl:value-of select="$externalEventCountBefore" /> //events = <xsl:value-of select="$eventCountBefore" /> //conditions = <xsl:value-of select="$conditionsCountBefore" /> //actions = <xsl:value-of select="$actionsCountBefore" /> //actionParameters = <xsl:value-of select="$actionParametersCountBefore" />
                    final int NODE_<xsl:value-of select="$id" /> = <xsl:value-of select="$externalEventCountBefore + $eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />;
                </xsl:for-each>
            </xsl:for-each>
                        
            <xsl:for-each select="conditions" >
                <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                <xsl:variable name="externalEventCountBefore" ><xsl:value-of select="count(//externalEvents[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                //Count - //Condition - //Parents of Event - <xsl:value-of select="$externalEventCountBefore" /> //events = <xsl:value-of select="$eventCountBefore" /> //conditions = <xsl:value-of select="$conditionsCountBefore" /> //actions = <xsl:value-of select="$actionsCountBefore" /> //actionParameters = <xsl:value-of select="$actionParametersCountBefore" />
                final int NODE_<xsl:value-of select="$id" /> = <xsl:value-of select="$externalEventCountBefore + $eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />;
                <xsl:for-each select="subInstructions" >
                    <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                    <xsl:variable name="externalEventCountBefore" ><xsl:value-of select="count(//externalEvents[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    //Count - //subInstructions - //Condition - //Parents of Event - <xsl:value-of select="$externalEventCountBefore" /> //events = <xsl:value-of select="$eventCountBefore" /> //conditions = <xsl:value-of select="$conditionsCountBefore" /> //actions = <xsl:value-of select="$actionsCountBefore" /> //actionParameters = <xsl:value-of select="$actionParametersCountBefore" />
                    final int NODE_<xsl:value-of select="$id" /> = <xsl:value-of select="$externalEventCountBefore + $eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />;
                </xsl:for-each>
            </xsl:for-each>

            <xsl:for-each select="actions" >
                <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                <xsl:variable name="externalEventCountBefore" ><xsl:value-of select="count(//externalEvents[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                //Count - //Action - //Parents of Event - <xsl:value-of select="$externalEventCountBefore" /> //events = <xsl:value-of select="$eventCountBefore" /> //conditions = <xsl:value-of select="$conditionsCountBefore" /> //actions = <xsl:value-of select="$actionsCountBefore" /> //actionParameters = <xsl:value-of select="$actionParametersCountBefore" />
                public final int NODE_<xsl:value-of select="$id" /> = <xsl:value-of select="$externalEventCountBefore + $eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />;
                <xsl:for-each select="parameters" >
                <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                <xsl:variable name="externalEventCountBefore" ><xsl:value-of select="count(//externalEvents[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                //Count - //Action Parameter - //Parents of Event - <xsl:value-of select="$externalEventCountBefore" /> //events = <xsl:value-of select="$eventCountBefore" /> //conditions = <xsl:value-of select="$conditionsCountBefore" /> //actions = <xsl:value-of select="$actionsCountBefore" /> //actionParameters = <xsl:value-of select="$actionParametersCountBefore" />
                final int PARAM_NODE_<xsl:value-of select="$id" /> = <xsl:value-of select="$externalEventCountBefore + $eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />;
                </xsl:for-each>
            </xsl:for-each>

            <xsl:call-template name="generateIndexToNodeIdMapping" >
                <xsl:with-param name="totalRecursion" >
                    <xsl:value-of select="$totalRecursion + 1" />
                </xsl:with-param>
            </xsl:call-template>

        </xsl:for-each>

    </xsl:template>

    <xsl:template name="generateGDNodeTotal" >

        <xsl:variable name="externalEventCountBefore" ><xsl:value-of select="count(//externalEvents)" /></xsl:variable>
        <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events)" /></xsl:variable>
        <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions)" /></xsl:variable>
        <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions)" /></xsl:variable>
        <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions)" /></xsl:variable>
        <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions)" /></xsl:variable>
        <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters)" /></xsl:variable>
        <xsl:value-of select="$externalEventCountBefore + $eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />

    </xsl:template>

    <xsl:template name="createActions" >
        <xsl:param name="totalRecursions" />
        <xsl:for-each select="events" >
            <xsl:for-each select="actions" >
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

    <xsl:template name="eventIds" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="caller" />

        //caller=<xsl:value-of select="$caller" /> - //eventIds
        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
        <xsl:if test="type = 'BuiltinCommonInstructions::Comment'" >
            //BuiltinCommonInstructions::Comment
        </xsl:if>
        <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
            <xsl:text>&#10;</xsl:text>
            //caller=<xsl:value-of select="$caller" /> - //eventIds
            <xsl:if test="$caller = 'externalEventsProcess'" >
                //Apparently the process below already calls this.
                //tempGameLayerUtil.clear();
                //eventIds not no longer called //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processM(tempGameLayerUtil.gameLayerArray);
                //tempGameLayerUtil.clear2();
            </xsl:if>
            //eventIds - //Events - //<xsl:value-of select="type" /> - //<xsl:value-of select="name" /> - call
            //eventIds not no longer called //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
        </xsl:if>
        <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
            //Event - //BuiltinCommonInstructions::Link - call
            //eventIds not no longer called //globals.<xsl:value-of select="target" />GDNode.process();
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

    <xsl:template name="eventIdsLessRecursion" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="caller" />

        //caller=<xsl:value-of select="$caller" /> - //eventIdsDoNotCallRecursions
        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
        <xsl:if test="type = 'BuiltinCommonInstructions::Comment'" >
            //BuiltinCommonInstructions::Comment
        </xsl:if>
        <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
            <xsl:text>&#10;</xsl:text>
            //caller=<xsl:value-of select="$caller" /> - //eventIdsDoNotCallRecursions
            <xsl:if test="$caller = 'externalEventsProcess'" >
                //Apparently the process below already calls this.
                <xsl:if test="$totalRecursions > 0" >//TWB not called anymore <xsl:value-of select="$caller" />//</xsl:if>tempGameLayerUtil.clear();
                <xsl:if test="$totalRecursions > 0" >//TWB not called anymore <xsl:value-of select="$caller" />//</xsl:if>gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processM(gameGlobals.nodeArray[tempGameLayerUtil.gameLayerArray);
                <xsl:if test="$totalRecursions > 0" >//TWB not called anymore <xsl:value-of select="$caller" />//</xsl:if>tempGameLayerUtil.clear2();
            </xsl:if>
            //eventIdsDoNotCallRecursions - //Events - //<xsl:value-of select="type" /> - //<xsl:value-of select="name" /> - call
            <xsl:if test="$totalRecursions > 0" >//TWB not called anymore <xsl:value-of select="$caller" />//</xsl:if>gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
        </xsl:if>
        <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
            //Event - //BuiltinCommonInstructions::Link - call
            <xsl:if test="$totalRecursions > 0" >//TWB not called anymore <xsl:value-of select="$caller" />//</xsl:if>globals.<xsl:value-of select="target" />GDNode.process();
        </xsl:if>

        <xsl:if test="$caller = 'onceCondition - //BuiltinCommonInstructions::Once'" >
        <xsl:for-each select="events" >
            <xsl:call-template name="eventIdsLessRecursion" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="caller" >
                    <xsl:value-of select="$caller" />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
        </xsl:if>

     <xsl:if test="$caller = 'externalEventsProcess'" >
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
     </xsl:if>

    </xsl:template>

    <xsl:template name="actionIds">        
        <xsl:param name="totalRecursions" />
        <xsl:param name="caller" />

        //caller=<xsl:value-of select="$caller" /> - //actionIds
        //Actions - GDNode - totalRecursions=<xsl:value-of select="$totalRecursions" />
        <xsl:for-each select="actions" >
            //caller=<xsl:value-of select="$caller" /> - //actionIds - //Action - //<xsl:value-of select="type/value" /> - call
            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
            //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
            <xsl:text>&#10;</xsl:text>
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="actionIdsGDObject" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="gdObjectName" />
        <xsl:param name="gdGameLayer" />

        //actionIdsGDObject <xsl:value-of select="$gdGameLayer" />
        //Actions - GDNode - totalRecursions=<xsl:value-of select="$totalRecursions" />
        <xsl:variable name="hasCreate" >
        <xsl:for-each select="actions" >
            <xsl:if test="type/value = 'Create'" >found</xsl:if>
        </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="parametersHasGDObjectName" >
        <xsl:for-each select="actions" >
            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
            <xsl:if test="type/value != 'Delete'" >
                <xsl:if test="contains($parametersAsString0, $gdObjectName)" >found</xsl:if>
            </xsl:if>
        </xsl:for-each>
        </xsl:variable>

        <xsl:for-each select="actions" >

            <xsl:variable name="hasCreateOrCreateByName" ><xsl:for-each select=".." ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create' and type/value != 'CreateByName'" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>

            <xsl:variable name="text" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="id" ><xsl:for-each select="//objectsGroups" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="//objects" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>

            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
            //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
            <xsl:text>&#10;</xsl:text>
            //actionIdsGDObject - //<xsl:value-of select="type/value" />
            <xsl:if test="type/value = 'Delete'" >
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].addForDelete(<xsl:value-of select="$gdGameLayer" />);
            </xsl:if>
            <xsl:if test="type/value != 'Delete'" >
                <xsl:if test="(contains($parametersHasGDObjectName, 'found') and contains($hasCreate, 'found')) or contains($parametersAsString0, $gdObjectName)" >
                <xsl:if test="not(contains($parametersAsString0, $gdObjectName))" >
                //process without params was called before.
                </xsl:if>

                <xsl:if test="string-length($hasCreateOrCreateByName) > 0 and $hasCreateOrCreateByName &lt; number(substring(generate-id(), 2) - 65536)" >
                    <xsl:if test="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id]) != 0" >
            //Using specific param2 - <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
                    </xsl:if>
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$gdGameLayer" />, gameGlobals.tempGameLayerArray[<xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />], globals.graphics);
                </xsl:if>
                <xsl:if test="not(string-length($hasCreateOrCreateByName) > 0 and $hasCreateOrCreateByName &lt; number(substring(generate-id(), 2) - 65536))" >
            //Using null param
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$gdGameLayer" />, null, globals.graphics);
                </xsl:if>
            <!-- 
            if(globals.<xsl:value-of select="$gdGameLayer" />.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) { 
            -->

            //updateGDObject - 8
            <xsl:value-of select="$gdGameLayer" />.updateGDObject(globals.timeDelta);
                </xsl:if>

                <xsl:if test="not((contains($parametersHasGDObjectName, 'found') and contains($hasCreate, 'found')) or contains($parametersAsString0, $gdObjectName))" >
            //Not processing the on the same GDGameLayer2
            //Action - //<xsl:value-of select="type/value" /> - call
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>

            </xsl:if>
            <!-- 
            } else {
                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$gdGameLayer" /> was smaller than <xsl:value-of select="$gdGameLayer" /> at index: " + index, this, commonStrings.PROCESS));
            }
            -->
            
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="delete">
        <xsl:param name="totalRecursions" />
        <xsl:param name="gdGameLayer" />

        //actionIdsGDObject <xsl:value-of select="$gdGameLayer" />
        //Actions - GDNode - totalRecursions=<xsl:value-of select="$totalRecursions" />
        <xsl:for-each select="actions" >
            <xsl:text>&#10;</xsl:text>
            <xsl:if test="type/value = 'Delete'" >
            //Action - //RemoveList - //<xsl:value-of select="type/value" /> - call
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
            </xsl:if>

        </xsl:for-each>

        <xsl:for-each select="events" >
            <xsl:call-template name="actionIdsGDObject" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
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

        //actionIdsGDObject <xsl:value-of select="$gdGameLayer" />
        //Actions - GDNode - totalRecursions=<xsl:value-of select="$totalRecursions" />
        <xsl:for-each select="actions" >
            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
            //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
            <xsl:text>&#10;</xsl:text>
            
            <xsl:if test="contains($parametersAsString0, $gdObjectName)" >
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$gdGameLayer" />, null, globals.graphics);
            
            //if(globals.<xsl:value-of select="$gdGameLayer" />.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                <xsl:value-of select="$gdGameLayer" />.updatePosition();
            //} else {
                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$gdGameLayer" /> was smaller than <xsl:value-of select="$gdGameLayer" /> at index: " + index, this, commonStrings.PROCESS));
            //}
            </xsl:if>
            <xsl:if test="not(contains($parametersAsString0, $gdObjectName))" >
            //Not processing the on the same GDGameLayer
            //Action - //<xsl:value-of select="type/value" /> - call
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
            </xsl:if>
            
        </xsl:for-each>

        <xsl:for-each select="events" >
            <xsl:call-template name="actionIdsGDObjectPos" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="gdGameLayer" >
                    <xsl:value-of select="$gdGameLayer" />
                </xsl:with-param>
                <xsl:with-param name="gdObjectName" >
                    <xsl:value-of select="$gdObjectName" />
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

                    //actionIdsMotionGestureEvent - //Actions - GDNode - totalRecursions=<xsl:value-of select="$totalRecursions" />
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
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //final String EVENTS_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Events nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> parameters=<xsl:value-of select="$parametersAsString" />";
                    //LogUtil.put(LogFactory.getInstance(EVENTS_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    //actionIdsMotionGestureEvent - //Event - //<xsl:value-of select="type" /> - call
                    //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
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
                    
                <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
                <xsl:variable name="conditions" ><xsl:for-each select="../../conditions" >found</xsl:for-each></xsl:variable>
                <xsl:variable name="release" ><xsl:for-each select="../../conditions" ><xsl:if test="type/value = 'MouseButtonReleased'" >found</xsl:if></xsl:for-each></xsl:variable>
                <xsl:variable name="press" ><xsl:for-each select="../../conditions" ><xsl:if test="type/value = 'SourisBouton' or type/value = 'MouseButtonPressed'" >found</xsl:if></xsl:for-each></xsl:variable>
                    
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                
                <xsl:if test="contains($press, 'found') or contains($release, 'found')" >
            //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
            //Condition - //SourisSurObjet - call - //release=<xsl:value-of select="$release" /> - //press=<xsl:value-of select="$press" /> //inverted=<xsl:value-of select="$inverted" /> - GDNode
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                </xsl:if>

                </xsl:if>
            </xsl:for-each>

            <xsl:call-template name="actionIdsMotionGestureEvent2" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
            </xsl:call-template>

        </xsl:for-each>

    </xsl:template>

    <xsl:template name="actionIdsMovedMotionGestureEvent">
        <xsl:param name="totalRecursions" />

        <xsl:for-each select="events" >

            <xsl:for-each select="conditions" >

                <xsl:if test="type/value = 'GlobalVariableAsBoolean'" >
                    <xsl:variable name="hasFocus" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" /></xsl:for-each></xsl:variable>
                    <xsl:if test="$hasFocus = 'hasFocus'" >
            //This is a special case to start audio on HTML builds
                <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
                <xsl:variable name="conditions" ><xsl:for-each select="../conditions" >found</xsl:for-each></xsl:variable>
                <xsl:variable name="release" ><xsl:for-each select="../conditions" ><xsl:if test="type/value = 'MouseButtonReleased'" >found</xsl:if></xsl:for-each></xsl:variable>
                <xsl:variable name="press" ><xsl:for-each select="../conditions" ><xsl:if test="type/value = 'SourisBouton' or type/value = 'MouseButtonPressed'" >found</xsl:if></xsl:for-each></xsl:variable>
                    
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        <xsl:if test="not(contains($press, 'found') or contains($release, 'found'))" >
            //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
            //Condition - //GlobalVariableAsBoolean - call - //release=<xsl:value-of select="$release" /> - //press=<xsl:value-of select="$press" /> //inverted=<xsl:value-of select="$inverted" /> - GDNode
                            //final MotionGestureInput motionGestureInput = motionGestureEvent.getMotionGesture();
                            if (lastMotionGestureInput == touchMotionGestureFactory.PRESSED) {
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            }
                        </xsl:if>
                    </xsl:if>
                </xsl:if>
                
                <xsl:if test="type/value = 'SourisSurObjet'" >

                <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
                <xsl:variable name="conditions" ><xsl:for-each select="../../conditions" >found</xsl:for-each></xsl:variable>
                <xsl:variable name="release" ><xsl:for-each select="../../conditions" ><xsl:if test="type/value = 'MouseButtonReleased'" >found</xsl:if></xsl:for-each></xsl:variable>
                <xsl:variable name="press" ><xsl:for-each select="../../conditions" ><xsl:if test="type/value = 'SourisBouton' or type/value = 'MouseButtonPressed'" >found</xsl:if></xsl:for-each></xsl:variable>
                    
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        <xsl:if test="not(contains($press, 'found') or contains($release, 'found'))" >
            //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
            //Condition - //SourisSurObjet - call - //release=<xsl:value-of select="$release" /> - //press=<xsl:value-of select="$press" /> //inverted=<xsl:value-of select="$inverted" /> - GDNode
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                        </xsl:if>
                </xsl:if>
            </xsl:for-each>

            <xsl:call-template name="actionIdsMovedMotionGestureEvent" >
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
        <xsl:param name="motionGestureEvent" />
    
        <xsl:variable name="hasKeyFromTextPressed" ><xsl:for-each select="conditions" ><xsl:if test = "type/value = 'KeyFromTextPressed' or type/value = 'KeyPressed'" >found</xsl:if></xsl:for-each></xsl:variable>

        <xsl:for-each select="conditions" >
            <xsl:if test="$motionGestureEvent != 'true'" ><xsl:if test="type/value = 'NbObjet'" >//foundCondition:<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:</xsl:if></xsl:if>
            <xsl:if test="type/value = 'SourisSurObjet'" >//foundCondition:<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:</xsl:if>
        </xsl:for-each>
        <xsl:for-each select="actions" >
            <xsl:if test="type/value = 'AddForceAL'" >//foundAction:<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:</xsl:if>
            <xsl:if test="type/value = 'Create'" >//foundCreateAction:<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:</xsl:if>
        </xsl:for-each>

        <xsl:for-each select="events" >
            <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                
                <xsl:if test="not(conditions) or $hasKeyFromTextPressed = 'found'" >
                    <xsl:call-template name="childEventWithUsedEvent" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="number($totalRecursions) + 1" />
                        </xsl:with-param>
                        <xsl:with-param name="motionGestureEvent" >
                            <xsl:value-of select="$motionGestureEvent" />
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </xsl:if>
        </xsl:for-each>

    </xsl:template>

<!--
                        //childEventWithUsedEvent2 - START
                        //childEventWithUsedEvent2 - END
//Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
//Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
-->
    <xsl:template name="childEventWithUsedEvent2">
        <xsl:param name="totalRecursions" />

        <xsl:variable name="foundCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" >found</xsl:if></xsl:for-each></xsl:variable>

        <xsl:for-each select="conditions" >
        </xsl:for-each>

        <xsl:if test="$foundCondition = 'found'" >
        
        <xsl:for-each select="actions" >
            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
            //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
            <xsl:if test="type/value = 'AddForceAL'" >
                //childEventWithUsedEvent2 - //Action - //AddForceAL - call - Used action in children - 4
                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
            </xsl:if>
        </xsl:for-each>
        
        </xsl:if>
    
        <xsl:for-each select="events" >
            <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                    <xsl:call-template name="childEventWithUsedEvent2" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="number($totalRecursions) + 1" />
                        </xsl:with-param>
                    </xsl:call-template>
            </xsl:if>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>

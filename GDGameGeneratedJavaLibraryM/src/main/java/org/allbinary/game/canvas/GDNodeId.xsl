<?xml version="1.0" encoding="windows-1252"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes"/>

    <xsl:template name="generateIndexToNodeIdMapping" >
        <xsl:param name="totalRecursion" />
        
        <xsl:for-each select="events" >
        
            <xsl:variable name="eventIndex" ><xsl:value-of select="position()" /></xsl:variable>
            <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
            <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            //Count - //Event - //events - <xsl:value-of select="$eventCountBefore" /> //conditions = <xsl:value-of select="$conditionsCountBefore" /> //actions = <xsl:value-of select="$actionsCountBefore" /> //actionParameters = <xsl:value-of select="$actionParametersCountBefore" />
            final int NODE_<xsl:value-of select="$id" /> = <xsl:value-of select="$eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />;

            <xsl:for-each select="whileConditions" >
                <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                //Count - //whileConditions - //Condition - //events = <xsl:value-of select="$eventCountBefore" /> //conditions = <xsl:value-of select="$conditionsCountBefore" /> //actions = <xsl:value-of select="$actionsCountBefore" /> //actionParameters = <xsl:value-of select="$actionParametersCountBefore" />
                final int NODE_<xsl:value-of select="$id" /> = <xsl:value-of select="$eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />;
                <xsl:for-each select="subInstructions" >
                    <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                    <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    //Count - //subInstructions - //Condition - //events = <xsl:value-of select="$eventCountBefore" /> //conditions = <xsl:value-of select="$conditionsCountBefore" /> //actions = <xsl:value-of select="$actionsCountBefore" /> //actionParameters = <xsl:value-of select="$actionParametersCountBefore" />
                    final int NODE_<xsl:value-of select="$id" /> = <xsl:value-of select="$eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />;
                </xsl:for-each>
            </xsl:for-each>
                        
            <xsl:for-each select="conditions" >
                <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                //Count - //Condition - //events = <xsl:value-of select="$eventCountBefore" /> //conditions = <xsl:value-of select="$conditionsCountBefore" /> //actions = <xsl:value-of select="$actionsCountBefore" /> //actionParameters = <xsl:value-of select="$actionParametersCountBefore" />
                final int NODE_<xsl:value-of select="$id" /> = <xsl:value-of select="$eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />;
                <xsl:for-each select="subInstructions" >
                    <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                    <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                    //Count - //subInstructions - //Condition - //events = <xsl:value-of select="$eventCountBefore" /> //conditions = <xsl:value-of select="$conditionsCountBefore" /> //actions = <xsl:value-of select="$actionsCountBefore" /> //actionParameters = <xsl:value-of select="$actionParametersCountBefore" />
                    final int NODE_<xsl:value-of select="$id" /> = <xsl:value-of select="$eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />;
                </xsl:for-each>
            </xsl:for-each>

            <xsl:for-each select="actions" >
                <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                //Count - //Action - //events = <xsl:value-of select="$eventCountBefore" /> //conditions = <xsl:value-of select="$conditionsCountBefore" /> //actions = <xsl:value-of select="$actionsCountBefore" /> //actionParameters = <xsl:value-of select="$actionParametersCountBefore" />
                public final int NODE_<xsl:value-of select="$id" /> = <xsl:value-of select="$eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />;
                <xsl:for-each select="parameters" >
                <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters[number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
                //Count - //Action Parameter - //events = <xsl:value-of select="$eventCountBefore" /> //conditions = <xsl:value-of select="$conditionsCountBefore" /> //actions = <xsl:value-of select="$actionsCountBefore" /> //actionParameters = <xsl:value-of select="$actionParametersCountBefore" />
                final int PARAM_NODE_<xsl:value-of select="$id" /> = <xsl:value-of select="$eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />;
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

        <xsl:variable name="eventCountBefore" ><xsl:value-of select="count(//events)" /></xsl:variable>
        <xsl:variable name="conditionsCountBefore" ><xsl:value-of select="count(//conditions)" /></xsl:variable>
        <xsl:variable name="subInstructionsCountBefore" ><xsl:value-of select="count(//subInstructions)" /></xsl:variable>
        <xsl:variable name="whileConditionsCountBefore" ><xsl:value-of select="count(//whileConditions)" /></xsl:variable>
        <xsl:variable name="actionsCountBefore" ><xsl:value-of select="count(//actions)" /></xsl:variable>
        <xsl:variable name="actionParametersCountBefore" ><xsl:value-of select="count(//actions/parameters)" /></xsl:variable>
        <xsl:value-of select="$eventCountBefore + $conditionsCountBefore + $subInstructionsCountBefore + $whileConditionsCountBefore + $actionsCountBefore + $actionParametersCountBefore" />

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
                globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].clear();
                //globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processM(globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].gameLayerArray, null, null);
                globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processM(globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].gameLayerArray);
                globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].clear2();
            </xsl:if>
            //eventIds - //Events - //<xsl:value-of select="type" /> - call
            globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
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
            globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="actionIdsGDObject" >
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
            //actionIdsGDObject - //<xsl:value-of select="type/value" />
            <xsl:if test="type/value = 'Delete'" >
            globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].addForDelete(<xsl:value-of select="$gdGameLayer" />);
            </xsl:if>
            <xsl:if test="type/value != 'Delete'" >
                <xsl:if test="contains($parametersAsString0, $gdObjectName)" >
            globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$gdGameLayer" />, globals.graphics);
            <!-- 
            if(globals.<xsl:value-of select="$gdGameLayer" />.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) { 
            -->
            //updateGDObject - 8
            <xsl:value-of select="$gdGameLayer" />.updateGDObject(globals.timeDelta);
                </xsl:if>
                <xsl:if test="not(contains($parametersAsString0, $gdObjectName))" >
            //Not processing the on the same GDGameLayer
            //Action - //<xsl:value-of select="type/value" /> - call
            globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
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
            globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
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
            globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$gdGameLayer" />, globals.graphics);
            
            //if(globals.<xsl:value-of select="$gdGameLayer" />.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                <xsl:value-of select="$gdGameLayer" />.updatePosition();
            //} else {
                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$gdGameLayer" /> was smaller than <xsl:value-of select="$gdGameLayer" /> at index: " + index, this, commonStrings.PROCESS));
            //}
            </xsl:if>
            <xsl:if test="not(contains($parametersAsString0, $gdObjectName))" >
            //Not processing the on the same GDGameLayer
            //Action - //<xsl:value-of select="type/value" /> - call
            globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
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
                    //globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
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
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
            //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
            //Condition - //SourisSurObjet - call
            globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
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
                globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
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

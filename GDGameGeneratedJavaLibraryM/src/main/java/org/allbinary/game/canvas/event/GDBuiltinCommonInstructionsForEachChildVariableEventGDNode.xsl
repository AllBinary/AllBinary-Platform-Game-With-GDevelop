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
    <xsl:template name="builtinCommonInstructionsForEachChildVariableEventGDNode" >
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
        
        //BuiltinCommonInstructions::ForEachChildVariable
        
                <xsl:variable name="object" ><xsl:value-of select="object" /></xsl:variable>

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> iterableVariableName=<xsl:value-of select="iterableVariableName" /> valueIteratorVariableName=<xsl:value-of select="valueIteratorVariableName" /> keyIteratorVariableName=<xsl:value-of select="keyIteratorVariableName" />

                private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" /> iterableVariableName=<xsl:value-of select="iterableVariableName" /> valueIteratorVariableName=<xsl:value-of select="valueIteratorVariableName" /> keyIteratorVariableName=<xsl:value-of select="keyIteratorVariableName" />";
                <xsl:text>&#10;</xsl:text>

                <xsl:if test="contains(disabled, 'true')" >
                //Disabled so not call anything.
                /*
                </xsl:if>
                
<!--                <xsl:if test="not(contains(disabled, 'true'))" >-->
                //BuiltinCommonInstructions::ForEachChildVariable - event
                @Override
                public boolean process() throws Exception {
                    super.processStats();

                    //logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                    
                    <xsl:variable name="hasJsonObjects" >
                    <xsl:call-template name="hasJsonObjects">
                        <xsl:with-param name="param" ><xsl:value-of select="iterableVariableName/text()" /></xsl:with-param>
                        <xsl:with-param name="iteration" >0</xsl:with-param>
                    </xsl:call-template>
                    </xsl:variable>
                    
                    //hasJsonObjects=<xsl:value-of select="$hasJsonObjects" />
                    <xsl:if test="contains($hasJsonObjects, 'found')" >
                    //JSON
                    <xsl:variable name="valueIteratorVariableName" select="valueIteratorVariableName/text()" />
                    //JSONArray
                    if(<xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="iterableVariableName/text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>JSONArray != nullUtil.NULL_OBJECT) {
                    final JSONArray jsonArray = (JSONArray) <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="iterableVariableName/text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>JSONArray;
                    final int size = jsonArray.length();
                    
                    logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + size, this, commonStrings.PROCESS);
                    
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                        <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="keyIteratorVariableName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template> = VariableString(index);
                        
                        <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="$valueIteratorVariableName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>JSONObject = jsonArray.optJSONObjectAsObject(index);
                        <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="$valueIteratorVariableName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>JSONArray = jsonArray.optJSONArrayAsObject(index);
                        
                        <xsl:for-each select="//variables" >
                            <xsl:if test="name = $valueIteratorVariableName" >
                                <xsl:for-each select="children" >
                                    <xsl:choose>
                                        <xsl:when test="type = 'string'" >
                        final JSONObject jsonObject2 = ((JSONObject) <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="$valueIteratorVariableName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>JSONObject);
                        <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="$valueIteratorVariableName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" /> = jsonObject2.getString(globals.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>);
                                        </xsl:when>
                                        <xsl:otherwise>
                                            //Otherwise - <xsl:value-of select="type" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </xsl:if>
                        </xsl:for-each>

                    <xsl:for-each select="conditions" >
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                        if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                    </xsl:for-each>
                    
                        <xsl:call-template name="actionsProcessing" >
                            <xsl:with-param name="methodCall" >process()</xsl:with-param>
                        </xsl:call-template>                                        
                        
                        <xsl:for-each select="events" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> 
                                <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                        //Event - //BuiltinCommonInstructions::Link - call - //eventsProcess
                        <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process();
                            </xsl:if>
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:if>
                        </xsl:for-each>
                    
                    <xsl:for-each select="conditions" >
                        }
                    </xsl:for-each>
                    }
                    } else
                    //JSONObject
                    if(<xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="iterableVariableName/text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>JSONObject != nullUtil.NULL_OBJECT) {
                    final JSONObject jsonObject = (JSONObject) <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="iterableVariableName/text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>JSONObject;
                    final JSONArray array = jsonObject.names();
                    final int size = jsonObject.length();

                    logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + size, this, commonStrings.PROCESS);
                    
                    String name;
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                        name = (String) array.get(index);
                        <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="keyIteratorVariableName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template> = name;
                        
                        <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="$valueIteratorVariableName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>JSONObject = jsonObject.optJSONObjectAsObject(name);
                        <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="$valueIteratorVariableName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>JSONArray = jsonObject.optJSONArrayAsObject(name);
                        
                        <xsl:for-each select="//variables" >
                            <xsl:if test="name = $valueIteratorVariableName" >
                                <xsl:for-each select="children" >
                                    <xsl:choose>
                                        <xsl:when test="type = 'string'" >
                        //if(<xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="$valueIteratorVariableName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>JSONObject != nullUtil.NULL_OBJECT) {
                            final JSONObject jsonObject2 = ((JSONObject) <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="$valueIteratorVariableName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>JSONObject);
                            <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="$valueIteratorVariableName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" /> = jsonObject2.getString(globals.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>);
                        //}
                                        </xsl:when>
                                        <xsl:otherwise>
                                            //Otherwise - <xsl:value-of select="type" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </xsl:if>
                        </xsl:for-each>

                    <xsl:for-each select="conditions" >
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                        if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                    </xsl:for-each>
                    
                        <xsl:call-template name="actionsProcessing" >
                            <xsl:with-param name="methodCall" >process()</xsl:with-param>
                        </xsl:call-template>
                        <xsl:for-each select="events" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> 
                                <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                        //Event - //BuiltinCommonInstructions::Link - call - //eventsProcess
                        <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process();
                            </xsl:if>
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:if>
                        </xsl:for-each>
                    
                    <xsl:for-each select="conditions" >
                        }
                    </xsl:for-each>
                    }
                    } else {
                        logUtil.put(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, new Exception());
                    }

                    </xsl:if>
                    <xsl:if test="not(contains($hasJsonObjects, 'found'))" >
                    //Array
                    final int size = <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="iterableVariableName/text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>.length;
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    
                        <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="valueIteratorVariableName/text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template> = <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="iterableVariableName/text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>[index];

                    <xsl:for-each select="conditions" >
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                        if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                    </xsl:for-each>
                    
                        <xsl:call-template name="actionsProcessing" >
                            <xsl:with-param name="methodCall" >process()</xsl:with-param>
                        </xsl:call-template>
                        <xsl:for-each select="events" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> 
                                <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                        //Event - //BuiltinCommonInstructions::Link - call - //eventsProcess
                        <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process();
                            </xsl:if>
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:if>
                        </xsl:for-each>
                    
                    <xsl:for-each select="conditions" >
                        }
                    </xsl:for-each>
                    }
                    </xsl:if>

                    return true;

                }
<!--                </xsl:if>-->
                
                <xsl:if test="contains(disabled, 'true')" >
                */
                </xsl:if>
        

    </xsl:template>

</xsl:stylesheet>

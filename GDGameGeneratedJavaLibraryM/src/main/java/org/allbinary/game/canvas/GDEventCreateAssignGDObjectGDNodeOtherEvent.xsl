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
        <xsl:param name="objectsGroupsAsString" />
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
                <xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" >gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:if></xsl:for-each>
            </xsl:variable>

            <!-- other events - START -->
            <xsl:if test="type = 'BuiltinCommonInstructions::Comment'" >
            //Do not create GDNode for comment event type
            </xsl:if>
            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
            //Do not create GDNode for link - The target GDNode is called instead.
            </xsl:if>
            <xsl:if test="type = 'BuiltinAsync::Async'" >
            //<xsl:value-of select="type" /> NOT_IMPLEMENTED
            </xsl:if>
            
            <xsl:if test="type = 'BuiltinCommonInstructions::JsCode'" >
                
                <xsl:call-template name="javascriptCodeEventGDNode" >
                    <xsl:param name="totalRecursions" ><xsl:value-of select="$totalRecursions" /></xsl:param>
                </xsl:call-template>

            </xsl:if>
            
            <xsl:variable name="thisNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />

            <xsl:variable name="foundOtherCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'BuiltinCommonInstructions::Always' or type/value = 'DepartScene' or type/value = 'ObjectVariableChildCount' or type/value = 'VarObjet' or type/value = 'VarScene' or type/value = 'NbObjet' or type/value = 'ObjectVariableAsBoolean' or type/value = 'SourisSurObjet'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="foundVarSceneCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'VarScene'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="foundLinkEvent" ><xsl:for-each select="events" ><xsl:if test="type = 'BuiltinCommonInstructions::Link'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="foundTimerCondition" >
                <xsl:for-each select="conditions" >
                    <xsl:if test="type/value = 'Timer'" >found</xsl:if>
                </xsl:for-each>
            </xsl:variable>

            //foundOtherCondition=<xsl:value-of select="$foundOtherCondition" />
            //foundVarSceneCondition=<xsl:value-of select="$foundVarSceneCondition" />
            //foundTimerCondition=<xsl:value-of select="$foundTimerCondition" />
            //foundLinkEvent=<xsl:value-of select="$foundLinkEvent" />

            <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >

                <xsl:variable name="object" ><xsl:value-of select="object" /></xsl:variable>

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
            if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
            }
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />";
                <xsl:text>&#10;</xsl:text>

                <xsl:variable name="hasObjectGroup" >
                    <xsl:for-each select="//objectsGroups" >
                        <xsl:if test="name = $object" >found</xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                //BuiltinCommonInstructions::ForEach - condition
                @Override
                public boolean process() throws Exception {
                    super.processStats();

                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                    final int size3 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$object" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$object" />GDGameLayerListOfList.size();
                    for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; index3++) {
                    final BasicArrayList gdGameLayerList = (BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$object" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$object" />GDGameLayerListOfList.get(index3);
                    </xsl:if>
                    <xsl:if test="not(contains($hasObjectGroup, 'found'))" >
                    final BasicArrayList gdGameLayerList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="object" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$object" />GDGameLayerList;
                    </xsl:if>
                    
                    //final int size = gdGameLayerList.size();
                            
                    GDGameLayer gameLayer2;
                    //for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> gdGameLayerList.size(); index++) {

                        gameLayer2 = (GDGameLayer) gdGameLayerList.get(index);
                    <xsl:for-each select="conditions" >
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                        if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer2, null, null)) {
                    </xsl:for-each>
                    <xsl:if test="count(conditions) = 0" >
                        <xsl:for-each select="actions" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="actions" ><xsl:for-each select="parameters" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="text()" />,</xsl:for-each></xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer2, null, null);
                        </xsl:for-each>
                        <xsl:for-each select="events" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="actions" ><xsl:for-each select="parameters" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="text()" />,</xsl:for-each></xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer2, null, null);
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="count(conditions[type/value = 'VarObjet' or type/value = 'ObjectVariableAsBoolean']) > 0" >
                        <xsl:for-each select="events" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="actions" ><xsl:for-each select="parameters" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="text()" />,</xsl:for-each></xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer2, null, null);
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    
                    <xsl:for-each select="conditions" >
                        }
                    </xsl:for-each>
                    }

                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                    }
                    </xsl:if>
                    return true;

                }                
            };

            </xsl:if>
            <xsl:if test="type = 'BuiltinCommonInstructions::Standard' or 
                          type = 'BuiltinCommonInstructions::ForEachChildVariable' or 
                          type = 'BuiltinCommonInstructions::While' or 
                          type = 'BuiltinCommonInstructions::Group' or 
                          type = 'BuiltinCommonInstructions::Repeat'" >
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
            if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
            }
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                //<xsl:value-of select="type" /> - //BuiltinCommonInstructions - //Event
                private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />";
                <xsl:text>&#10;</xsl:text>

                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                //private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                </xsl:for-each>

                <xsl:if test="not(whileConditions)" >
                <xsl:if test="not(contains($foundOtherCondition, 'found'))" >
                <xsl:if test="not(contains($foundTimerCondition, 'found'))" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        <xsl:if test="$typeValue != 'PauseTimer' and $typeValue != 'PlaySoundCanal'" >
                private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "C: <xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        </xsl:if>
                        <xsl:if test="$typeValue != 'ModVarScene' and $typeValue != 'AddForceAL' and $typeValue != 'PlayMusicCanal' and $typeValue != 'StopMusicCanal' and $typeValue != 'StopSoundCanal'" >
                //private final String ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "C: <xsl:value-of select="translate($actionAsString, $quote, ' ')" /> at: ";
                        </xsl:if>
                //private final String ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "G: " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;
                //private final String ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "processGD - " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each>
                </xsl:if>
                </xsl:if>
                </xsl:if>

            <!-- <xsl:if test="type/value != 'Timer' and type/value != '(Used when using the AllBinary Collision Processing) CollisionNP' and type/value != 'VarObjet' and type/value = 'NbObjet' and type/value = 'DepartScene' and type/value = 'SourisSurObjet' and type/value = 'MouseButtonReleased' and type/value = 'SourisBouton' and type/value = 'MouseButtonPressed'" >found</xsl:if> -->
            
            <!-- //foundOtherCondition=<xsl:value-of select="$foundOtherCondition" /> -->
                
                //<xsl:value-of select="type" /> - event
                @Override
                public boolean process() throws Exception {
                    super.processStats();
                    
                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
   
                <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                <xsl:if test="$caller = 'externalEventsCreateAssignGDObject'" >
                <xsl:if test="not(whileConditions)" >
                <xsl:if test="not(contains($foundOtherCondition, 'found'))" >
                <xsl:if test="not(contains($foundTimerCondition, 'found'))" >
                    <xsl:variable name="hasParentConditionVarGlobal" >
                        <xsl:for-each select="conditions" >
                            <xsl:if test="type/value = 'VarGlobal'" >found</xsl:if>
                        </xsl:for-each>
                    </xsl:variable>
                
                <xsl:if test="not(contains($hasParentConditionVarGlobal, 'found'))" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

                    <xsl:variable name="hasCreateOrCreateByName" ><xsl:for-each select=".." ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create' and type/value != 'CreateByName'" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>

                    //hasCreateOrCreateByName=<xsl:value-of select="$hasCreateOrCreateByName" />
                    <xsl:variable name="text" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="id" ><xsl:for-each select="//objectsGroups" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="//objects" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>

                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //Action - //<xsl:value-of select="type/value" /> - call
                    <xsl:if test="string-length($hasCreateOrCreateByName) > 0 and $hasCreateOrCreateByName &lt; number(substring(generate-id(), 2) - 65536)" >
                    <xsl:if test="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id]) != 0" >
                    //Using specific param - <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
                    </xsl:if>
                    //TWB - Action was not called before
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    </xsl:if>
                    <xsl:if test="not(string-length($hasCreateOrCreateByName) > 0 and $hasCreateOrCreateByName &lt; number(substring(generate-id(), 2) - 65536))" >
                    //TWB - Action was not called before
                    //Using unknown param
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    </xsl:if>
                </xsl:for-each>
                </xsl:if>
                </xsl:if>
                </xsl:if>
                </xsl:if>
                </xsl:if>
                </xsl:if>
                    
                <xsl:if test="contains($foundOtherCondition, 'found') or contains($foundTimerCondition, 'found') or contains($foundVarSceneCondition, 'found')" >
                    //Has one of the special conditions.
                    <xsl:if test="contains($foundOtherCondition, 'found') or contains($foundTimerCondition, 'found') or (contains($foundVarSceneCondition, 'found') and contains($foundLinkEvent, 'found'))" >
                    <xsl:if test="not(whileConditions)" >
                    //Found conditions that need processing.

                    <xsl:for-each select="conditions" >
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                        <xsl:if test="position() = 1" >
                    //eventsCreateAssignGDObjectGDNodes - //Condition - //<xsl:value-of select="type/value" /> - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                        </xsl:if>
                        <xsl:if test="position() = 2" >
                    //eventsCreateAssignGDObjectGDNodes - //Condition - call - more ifs
                        </xsl:if>
                    </xsl:for-each>
                    
                    </xsl:if>
                    </xsl:if>
                    
                </xsl:if>

                <xsl:if test="whileConditions" >
                //whileConditions
                    
                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    <xsl:for-each select="whileConditions" >
                    //whileConditions - //<xsl:value-of select="type/value" /> - call
                    while(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                    <xsl:for-each select="../conditions" >
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    </xsl:for-each>
                    }
                    </xsl:for-each>
                    
                </xsl:if>

                <xsl:if test="not(conditions)" >
                <xsl:if test="not(actions)" >
                //Events only - No actions or conditions

                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                <xsl:for-each select="events" >
                    <!-- CollisionNP is already handled. -->
                    <xsl:variable name="eventWithBuilderCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = '(Used when using the AllBinary Collision Processing) CollisionNP'" >found</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if>
                    <xsl:if test="not(contains($eventWithBuilderCondition, 'found'))" >
                        //Events only - //Event - //<xsl:value-of select="type" /> - call
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    </xsl:if>
                    </xsl:if>
                </xsl:for-each>

                <!--
                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:for-each>

                <xsl:if test="actions" >
                <xsl:for-each select="actions" >
                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, new Exception()));
                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:for-each>

                <xsl:call-template name="actionIds" >
                    <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    <xsl:with-param name="caller" >eventsCreateAssignGDObject</xsl:with-param>
                </xsl:call-template>

                </xsl:if>
                -->

                </xsl:if>
                </xsl:if>

                <xsl:if test="not(whileConditions)" >
                <xsl:if test="not(contains($foundOtherCondition, 'found'))" >
                <xsl:if test="not(contains($foundTimerCondition, 'found'))" >

                <xsl:if test="actions" >
                //Was not being called before - START
                </xsl:if>

                //caller=<xsl:value-of select="$caller" /> - //No used conditions so calling actions from event directly.
                <xsl:call-template name="hackProcessing" >
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

                <xsl:if test="actions" >
                //Was not being called before - END
                </xsl:if>
                                
                </xsl:if>
                </xsl:if>
                </xsl:if>

                    return true;

                }                

                @Override
                public boolean process(final int index3) throws Exception {
                    super.processStats();
                    
                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
   
                <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                <xsl:if test="$caller = 'externalEventsCreateAssignGDObject'" >
                <xsl:if test="not(whileConditions)" >
                <xsl:if test="not(contains($foundOtherCondition, 'found'))" >
                <xsl:if test="not(contains($foundTimerCondition, 'found'))" >
                    <xsl:variable name="hasParentConditionVarGlobal" >
                        <xsl:for-each select="conditions" >
                            <xsl:if test="type/value = 'VarGlobal'" >found</xsl:if>
                        </xsl:for-each>
                    </xsl:variable>
                
                <xsl:if test="not(contains($hasParentConditionVarGlobal, 'found'))" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

                    <xsl:variable name="hasCreateOrCreateByName" ><xsl:for-each select=".." ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create' and type/value != 'CreateByName'" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>

                    //hasCreateOrCreateByName=<xsl:value-of select="$hasCreateOrCreateByName" />
                    <xsl:variable name="text" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="id" ><xsl:for-each select="//objectsGroups" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="//objects" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>

                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //Action - //<xsl:value-of select="type/value" /> - call
                    <xsl:if test="string-length($hasCreateOrCreateByName) > 0 and $hasCreateOrCreateByName &lt; number(substring(generate-id(), 2) - 65536)" >
                    <xsl:if test="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id]) != 0" >
                    //Using specific param - <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
                    </xsl:if>
                    //TWB - Action was not called before
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index3);
                    </xsl:if>
                    <xsl:if test="not(string-length($hasCreateOrCreateByName) > 0 and $hasCreateOrCreateByName &lt; number(substring(generate-id(), 2) - 65536))" >
                    //TWB - Action was not called before
                    //Using unknown param
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index3);
                    </xsl:if>
                </xsl:for-each>
                </xsl:if>
                </xsl:if>
                </xsl:if>
                </xsl:if>
                </xsl:if>
                </xsl:if>
                    
                <xsl:if test="contains($foundOtherCondition, 'found') or contains($foundTimerCondition, 'found') or contains($foundVarSceneCondition, 'found')" >
                    //Has one of the special conditions.
                    <xsl:if test="contains($foundOtherCondition, 'found') or contains($foundTimerCondition, 'found') or (contains($foundVarSceneCondition, 'found') and contains($foundLinkEvent, 'found'))" >
                    <xsl:if test="not(whileConditions)" >
                    //Found conditions that need processing.

                    <xsl:for-each select="conditions" >
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                        <xsl:if test="position() = 1" >
                    //eventsCreateAssignGDObjectGDNodes - //Condition - //<xsl:value-of select="type/value" /> - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index3);
                        </xsl:if>
                        <xsl:if test="position() = 2" >
                    //eventsCreateAssignGDObjectGDNodes - //Condition - call - more ifs
                        </xsl:if>
                    </xsl:for-each>
                    
                    </xsl:if>
                    </xsl:if>
                    
                </xsl:if>

                <xsl:if test="whileConditions" >
                //whileConditions
                    
                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    <xsl:for-each select="whileConditions" >
                    //whileConditions - //<xsl:value-of select="type/value" /> - call
                    while(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index3)) {
                    <xsl:for-each select="../conditions" >
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index3);
                    </xsl:for-each>
                    }
                    </xsl:for-each>
                    
                </xsl:if>

                <xsl:if test="not(conditions)" >
                <xsl:if test="not(actions)" >
                //Events only - No actions or conditions

                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                <xsl:for-each select="events" >
                    <!-- CollisionNP is already handled. -->
                    <xsl:variable name="eventWithBuilderCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = '(Used when using the AllBinary Collision Processing) CollisionNP'" >found</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if>
                    <xsl:if test="not(contains($eventWithBuilderCondition, 'found'))" >
                        //Events only - //Event - //<xsl:value-of select="type" /> - call
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index3);
                    </xsl:if>
                    </xsl:if>
                </xsl:for-each>

                <!--
                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:for-each>

                <xsl:if test="actions" >
                <xsl:for-each select="actions" >
                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, new Exception()));
                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:for-each>

                <xsl:call-template name="actionIds" >
                    <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    <xsl:with-param name="caller" >eventsCreateAssignGDObject</xsl:with-param>
                </xsl:call-template>

                </xsl:if>
                -->

                </xsl:if>
                </xsl:if>

                <xsl:if test="not(whileConditions)" >
                <xsl:if test="not(contains($foundOtherCondition, 'found'))" >
                <xsl:if test="not(contains($foundTimerCondition, 'found'))" >

                <xsl:if test="actions" >
                //Was not being called before - START
                </xsl:if>

                //caller=<xsl:value-of select="$caller" /> - //No used conditions so calling actions from event directly.
                <xsl:call-template name="hackProcessing" >
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
                    <xsl:with-param name="index" >index3</xsl:with-param>
                </xsl:call-template>

                <xsl:if test="actions" >
                //Was not being called before - END
                </xsl:if>
                                
                </xsl:if>
                </xsl:if>
                </xsl:if>

                    return true;

                }                

                @Override
                public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                    super.processStats(motionGestureEvent);

                <xsl:if test="contains($foundOtherCondition, 'found') or contains($foundTimerCondition, 'found') or (contains($foundVarSceneCondition, 'found') and contains($foundLinkEvent, 'found'))" >
                    <xsl:if test="not(whileConditions)" >
                //Found conditions that need processing.
                    
                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                    <xsl:for-each select="conditions" >
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                        <xsl:if test="position() = 1" >
                    //eventsCreateAssignGDObjectGDNodes - //Condition - //<xsl:value-of select="type/value" /> - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                        </xsl:if>
                        <xsl:if test="position() = 2" >
                    //eventsCreateAssignGDObjectGDNodes - //Condition - call - more ifs
                        </xsl:if>
                    </xsl:for-each>
                    
                    </xsl:if>
                </xsl:if>

                <xsl:if test="whileConditions" >
                //whileConditions
                    
                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    <xsl:for-each select="whileConditions" >
                    //whileConditions - //<xsl:value-of select="type/value" /> - call
                    while(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput)) {
                    <xsl:for-each select="../conditions" >
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                    </xsl:for-each>
                    }
                    </xsl:for-each>
                    
                </xsl:if>

                <xsl:if test="not(conditions)" >
                <xsl:if test="not(actions)" >
                //Events only - No actions or conditions

                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                <xsl:for-each select="events" >
                    <!-- CollisionNP is already handled. -->
                    <xsl:variable name="eventWithBuilderCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = '(Used when using the AllBinary Collision Processing) CollisionNP'" >found</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if>
                    <xsl:if test="not(contains($eventWithBuilderCondition, 'found'))" >
                        //Events only - //Event - //<xsl:value-of select="type" /> - call
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                    </xsl:if>
                    </xsl:if>
                </xsl:for-each>

                <!--
                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                </xsl:for-each>

                <xsl:if test="actions" >
                <xsl:for-each select="actions" >
                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, new Exception()));
                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                </xsl:for-each>

                <xsl:call-template name="actionIds" >
                    <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    <xsl:with-param name="caller" >eventsCreateAssignGDObject</xsl:with-param>
                </xsl:call-template>

                </xsl:if>
                -->

                </xsl:if>
                </xsl:if>

                <xsl:if test="not(whileConditions)" >
                <xsl:if test="not(contains($foundOtherCondition, 'found'))" >
                <xsl:if test="not(contains($foundTimerCondition, 'found'))" >

                <xsl:if test="actions" >
                //caller=<xsl:value-of select="$caller" /> //No used conditions so calling actions from event directly.

                </xsl:if>
                
                </xsl:if>
                </xsl:if>
                </xsl:if>

                <xsl:if test="not(conditions)" >
                <xsl:if test="not(actions)" >
                //Events only - No actions or conditions                

                <xsl:for-each select="events" >
                    <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                        <xsl:variable name="childEventWithUsedEvent" ><xsl:call-template name="childEventWithUsedEvent" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="motionGestureEvent" >true</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="$childEventWithUsedEvent != ''" >//<xsl:value-of select="$childEventWithUsedEvent" /></xsl:if>
                        <xsl:if test="contains($childEventWithUsedEvent, 'found')" >
                    //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if>
                    //Event - //BuiltinCommonInstructions::Standard - call - motionGestureEvent - Used condition in children - 2
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                        </xsl:if>                  
                    </xsl:if>
                    <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
                    //Event - //BuiltinCommonInstructions::ForEach
                    </xsl:if>
                </xsl:for-each>

                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //Condition - //<xsl:value-of select="type/value" /> - call - motionGestureEvent
                    //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                </xsl:for-each>

                <xsl:if test="actions" >
                <xsl:for-each select="actions" >
                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, new Exception()));
                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    //Action - //<xsl:value-of select="type/value" /> - call - motionGestureEvent
                    //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                </xsl:for-each>

                <xsl:call-template name="actionIds" >
                    <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    <xsl:with-param name="caller" >eventsCreateAssignGDObject</xsl:with-param>
                </xsl:call-template>

                </xsl:if>

                </xsl:if>
                </xsl:if>
                    return true;                           
                }

                @Override
                public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                    super.processGDStats(gameLayer);

                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //Condition - //<xsl:value-of select="type/value" /> - call

                    //List Siblings and Parents - START
                    <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                    <xsl:call-template name="parentObjectsGroupsOrObjectOrCreateSibling" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>
                    //List Siblings and Parents - END
                    
                    <xsl:variable name="text" ><xsl:value-of select="unknown" /></xsl:variable>
                    <xsl:variable name="id" ><xsl:for-each select="//objectsGroups" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="//objects" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>
                    //Condition - //<xsl:value-of select="type/value" /> - <xsl:value-of select="$text" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
                    gameGlobals.tempGameLayerArray[0] = gameLayer2;
                    //if(gameGlobals.tempGameLayerArray[0] != null) LogUtil.put(LogFactory.getInstance(gameGlobals.tempGameLayerArray[0].toString(), this, commonStrings.PROCESS));
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameGlobals.tempGameLayerArray[0], graphics)) {
                </xsl:for-each>

                <xsl:for-each select="actions" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

                    <xsl:variable name="hasCreateOrCreateByName" ><xsl:for-each select=".." ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create' and type/value != 'CreateByName'" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>

                    //hasCreateOrCreateByName=<xsl:value-of select="$hasCreateOrCreateByName" />
                    <xsl:variable name="text" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="id" ><xsl:for-each select="//objectsGroups" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="//objects" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>

                    //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //Action - //<xsl:value-of select="type/value" /> - call
                    <xsl:if test="string-length($hasCreateOrCreateByName) > 0 and $hasCreateOrCreateByName &lt; number(substring(generate-id(), 2) - 65536)" >
                    <xsl:if test="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id]) != 0" >
                    //Using specific param - <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
                    </xsl:if>
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameGlobals.tempGameLayerArray[<xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />], graphics);
                    </xsl:if>
                    <xsl:if test="not(string-length($hasCreateOrCreateByName) > 0 and $hasCreateOrCreateByName &lt; number(substring(generate-id(), 2) - 65536))" >
                    //Using unknown param
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameGlobals.tempGameLayerArray[0], graphics);
                    </xsl:if>
                </xsl:for-each>

                <xsl:for-each select="events" >
                    <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                    //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if>
                    //Event - //BuiltinCommonInstructions::Standard - call - Used condition in children - 2
                    <xsl:variable name="childEventWithUsedEvent" ><xsl:call-template name="childEventWithUsedEvent" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="motionGestureEvent" >true</xsl:with-param></xsl:call-template></xsl:variable>
                    <xsl:if test="$childEventWithUsedEvent != ''" >//<xsl:value-of select="$childEventWithUsedEvent" /></xsl:if>
                        <xsl:if test="not(contains($childEventWithUsedEvent, 'found'))" >
                    //Was not called before
                        </xsl:if>
                    //Using unknown param2
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameGlobals.tempGameLayerArray[0], graphics);
                    </xsl:if>
                    <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
                    //Event - //BuiltinCommonInstructions::ForEach
                    </xsl:if>
                </xsl:for-each>

                <xsl:for-each select="conditions" >
                    }
                </xsl:for-each>

                    return true;                
                }

                <xsl:if test="not(whileConditions)" >
                <xsl:if test="not(contains($foundOtherCondition, 'found'))" >
                <xsl:if test="not(contains($foundTimerCondition, 'found'))" >

                <xsl:if test="actions" >
                //caller=<xsl:value-of select="$caller" /> - //processGD - //No used conditions so calling actions from event directly.
                <xsl:call-template name="eventsCreateProcessUsed" >
                    <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //eventsCreateAssignXGDObjectGDNodesOtherEvent</xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsGroupsAsString" >
                        <xsl:value-of select="$objectsGroupsAsString" />
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

                <xsl:if test="contains($foundTimerCondition, 'found')" >
                //Found used conditions so calling them before actions.
                @Override
                public void processReleased() throws Exception { //Event
                    super.processReleasedStats();
                
                    //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, globals.PROCESS_RELEASE));

                    <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                    <xsl:if test="position() = 1" >
                    //Condition - call - release
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                    </xsl:if>
                    </xsl:for-each>
                }
                
                </xsl:if>
                 
                <xsl:if test="contains($foundOtherCondition, 'found') and not(contains($foundTimerCondition, 'found')) or (contains($foundVarSceneCondition, 'found') and contains($foundLinkEvent, 'found'))" >
                    <xsl:if test="not(whileConditions)" >
                //Found conditions that need processing.
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
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                        </xsl:if>
                        <xsl:if test="position() = 2" >
                    //eventsCreateAssignGDObjectGDNodes - //Condition - call - more ifs
                        </xsl:if>
                    </xsl:for-each>
                    
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
                <xsl:with-param name="objectsGroupsAsString" >
                    <xsl:value-of select="$objectsGroupsAsString" />
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

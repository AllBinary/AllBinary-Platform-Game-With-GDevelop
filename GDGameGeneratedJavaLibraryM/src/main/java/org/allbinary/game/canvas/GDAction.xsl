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

    <!-- TWB - Hack - Replace the templates in this file with correct logic -->
    <xsl:template name="actionsWithIndexesProcess" >
        <xsl:param name="caller" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="thisNodeIndex" />
                    
        <!--
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                final GDGameLayerFactory <xsl:value-of select="text()" />GDGameLayerFactory = resources.<xsl:value-of select="text()" />GDGameLayerFactory;
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        -->

            <xsl:variable name="logString" >EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexesProcess
                        //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'VarObjet'" >
                        //VarObjet - some are processed from eventsProcess
                        //RemovedNow2
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                </xsl:if>
            </xsl:for-each>
                        
            <xsl:if test="actions" >
                
                <xsl:variable name="thisNodeArray" >this</xsl:variable>

                //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexesProcess - actionsWithIndexes - START
                <xsl:call-template name="actionsWithIndexes" >
                    <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //actionsWithIndexesProcess</xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="thisNodeArray" >
                        <xsl:value-of select="$thisNodeArray" />
                    </xsl:with-param>                    
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="parametersAsString" >
                        <xsl:value-of select="$parametersAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="logString" >
                        <xsl:value-of select="$logString" />
                    </xsl:with-param>
                </xsl:call-template>
                //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexesProcess - actionsWithIndexes - END

            </xsl:if>
            
    </xsl:template>

    <xsl:template name="actionsWithIndexes" >
        <xsl:param name="indexInUse" />
        <xsl:param name="caller" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="thisNodeArray" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="conditionPosition" />
        <xsl:param name="logString" />
        
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //objectGDObjectAtIndex2 - START
                    <xsl:call-template name="objectGDObjectAtIndex2" >
                        <xsl:with-param name="caller" >
                            <xsl:value-of select="$caller" />
                        </xsl:with-param>
                        <xsl:with-param name="thisNodeArray" >
                            <xsl:value-of select="$thisNodeArray" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="parametersAsString" >
                            <xsl:value-of select="$parametersAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="logString" >
                            <xsl:value-of select="$logString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    <!--
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="not(preceding-sibling::actions[type/value/text() = 'Create'])">
                    </xsl:if>
                </xsl:for-each>
                    -->
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //objectGDObjectAtIndex2 - END
                    
                    try {

            <xsl:variable name="alreadyUsedParentCondition" ><xsl:for-each select="../conditions" ><xsl:if test="type/value = 'SourisSurObjet'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasCondition" ><xsl:for-each select="conditions" >found</xsl:for-each></xsl:variable>
            <xsl:variable name="hadConditionOtherThanThis" ><xsl:for-each select="conditions" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >found</xsl:if></xsl:for-each></xsl:variable>
            <!-- position() = 1 and -->
            <xsl:variable name="alreadyUsedCondition" ><xsl:for-each select="conditions" ><xsl:if test="(type/value = 'SourisSurObjet' or type/value = '(Used when using the AllBinary Collision Processing) CollisionNP' or type/value = 'MouseButtonReleased' or type/value = 'SourisBouton' or type/value = 'MouseButtonPressed' or type/value = 'KeyPressed' or type/value = 'KeyReleased' or type/value = 'KeyFromTextPressed' or type/value = 'KeyFromTextReleased')" >found</xsl:if></xsl:for-each></xsl:variable>

            <xsl:variable name="hasOnceCondition" ><xsl:for-each select="conditions" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasUsedOnceCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >found</xsl:if></xsl:if></xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasUsedSoundPlayingCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'SoundPlaying'" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >found</xsl:if></xsl:if></xsl:if></xsl:for-each></xsl:variable>

            <xsl:variable name="hasNoConditionsButDoesHaveUsedAction" ><xsl:if test="not(contains($hasCondition, 'found'))" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'SetAngle' or type/value = 'ChangePlan' or type/value = 'AddForceAL' or type/value = 'ChangeAnimation' or type/value = 'ModVarObjet'" >found</xsl:if></xsl:for-each></xsl:if></xsl:variable>
            <xsl:variable name="hasCreate" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasCollisionCondition" ><xsl:for-each select="../conditions" ><xsl:if test="type/value = '(Used when using the AllBinary Collision Processing) CollisionNP'" >found</xsl:if></xsl:for-each></xsl:variable>

<!--
//alreadyUsedParentCondition=<xsl:value-of select="$alreadyUsedParentCondition" />
//hasCondition=<xsl:value-of select="$hasCondition" />
//hadConditionOtherThanThis=<xsl:value-of select="$hadConditionOtherThanThis" />
//alreadyUsedCondition=<xsl:value-of select="$alreadyUsedCondition" />
//hasOnceCondition=<xsl:value-of select="$hasOnceCondition" />
//hasUsedOnceCondition= <xsl:value-of select="$hasUsedOnceCondition" />
//hasNoConditionsButDoesHaveUsedAction=<xsl:value-of select="$hasNoConditionsButDoesHaveUsedAction" />
//hasCreate=<xsl:value-of select="$hasCreate" />
//hasCollisionCondition=<xsl:value-of select="$hasCollisionCondition" />
-->

            <xsl:if test="$caller = 'conditionLayout - //eventsCreateAssignGDObject'" >
            //conditionLayout - //eventsCreateAssignGDObject - START
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Scene'" >
                    <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //param1=<xsl:value-of select="$param" />
                    //Action - //Scene - call - START
                    //TWBTWB
                    //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    //Action - //Scene - call - END
                </xsl:if>
                <xsl:if test="type/value = 'ChangeScale'" >
                    <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //param1=<xsl:value-of select="$param" />
                    //Action - //ChangeScale - call - START
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    //Action - //ChangeScale - call - END
                </xsl:if>
            </xsl:for-each>
            //conditionLayout - //eventsCreateAssignGDObject - END
            </xsl:if>

            <xsl:if test="not(contains($alreadyUsedCondition, 'found'))" >
            //alreadyUsedCondition - not - //1 - START
            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
            //hasOnceCondition - not - //Conditions - START
            <xsl:for-each select="conditions" >
                <xsl:if test="type/value = 'DepartScene'" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Condition - //DepartScene - call - <xsl:value-of select="$thisNodeIndex" />
                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="type/value = 'SoundPlaying'" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Condition - //SoundPlaying - call - <xsl:value-of select="$thisNodeIndex" />
                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
            </xsl:for-each>
            //hasOnceCondition - not - //1 - END
            </xsl:if>

            <xsl:if test="not(contains($alreadyUsedParentCondition, 'found'))" >
            //alreadyUsedParentCondition - not - START
            <xsl:for-each select="conditions" >
                <!-- A sibling of BuiltinCommonInstructions::Once may not call it -->
                <xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Condition - //BuiltinCommonInstructions::Once - call - <xsl:value-of select="$thisNodeIndex" />
                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                </xsl:if>
                </xsl:if>
            </xsl:for-each>

            <xsl:if test="contains($hasOnceCondition, 'found')" >
            //hasOnceCondition - START
            <xsl:for-each select="conditions" >
                <!-- A sibling of BuiltinCommonInstructions::Once may not call it -->
                <xsl:if test="type/value != 'BuiltinCommonInstructions::Once' and type/value != 'SoundPlaying'" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Condition - //otherthan(BuiltinCommonInstructions::Once) - //<xsl:value-of select="type/value" /> - call - <xsl:value-of select="$thisNodeIndex" />
                //TWBTWB - process the other conditions
                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                </xsl:if>
            </xsl:for-each>
            //hasOnceCondition - END
            </xsl:if>

            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
            //alreadyUsedCondition - not - //2 - START
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <!--
                <xsl:if test="number($thisNodeIndex) = number(substring(generate-id(), 2) - 65536)" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                //Condition - call - actionsWithIndexes - this
                </xsl:if>
                -->
                <xsl:if test="($conditionPosition = '' and position() = 1) or position() = $conditionPosition + 1" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:if test="type/value != 'DepartScene' and type/value != 'SoundPlaying' and (not(contains($caller, 'eventsCreateAssignGDObject') and type/value = 'NbObjet'))" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Condition - //not(BuiltinCommonInstructions::Once) - //<xsl:value-of select="type/value" /> - call - <xsl:value-of select="$thisNodeIndex" />
                if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                </xsl:if>
                </xsl:if>
                </xsl:if>
                <xsl:if test="($conditionPosition = '' and position() = 2) or position() = $conditionPosition + 2" >
                //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Condition - call - more ifs
                </xsl:if>
            </xsl:for-each>
            //alreadyUsedCondition - not - //2 - END
            </xsl:if>

            //alreadyUsedParentCondition - not - START
            </xsl:if>
            //alreadyUsedCondition - not - END
            </xsl:if>

            <xsl:if test="contains($hasOnceCondition, 'found')" >
            <xsl:if test="not(contains($hasUsedOnceCondition, 'found'))" >
            //hasUsedOnceCondition and not hasUsedOnceCondition
            <xsl:for-each select="actions" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
            <xsl:text>&#10;</xsl:text>
            //Action - //<xsl:value-of select="type/value" /> - call
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
            </xsl:for-each>
            </xsl:if>
            </xsl:if>

            <xsl:if test="contains($hasCondition, 'found') and not(contains($hadConditionOtherThanThis, 'found'))" >
                //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //hadConditionOtherThanThis <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />= <xsl:value-of select="$thisNodeIndex" />
            </xsl:if>

            //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //hadConditionOtherThanThis=<xsl:value-of select="$hadConditionOtherThanThis" />
            <xsl:if test="not(contains($hadConditionOtherThanThis, 'found')) or ($caller = 'conditionLayout - //eventsCreateAssignGDObject' and contains($hasCreate, 'found'))" >
            <xsl:if test="actions" >
                        
                <xsl:if test="contains($hadConditionOtherThanThis, 'found') and ($caller = 'conditionLayout - //eventsCreateAssignGDObject' and contains($hasCreate, 'found'))" >
                //Hackish - //<xsl:value-of select="$thisNodeArray" />
                </xsl:if>

                        <!--
                        //hasCreate=<xsl:value-of select="$hasCreate" /> //hasCollisionCondition=<xsl:value-of select="$hasCollisionCondition" />
                        <xsl:for-each select="conditions" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                        </xsl:for-each>
                        <xsl:for-each select="actions" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                        </xsl:for-each>
                        -->
                        
                        <xsl:if test="contains($hasCreate, 'found')" >
                            <xsl:if test="contains($hasCollisionCondition, 'found') and $caller != 'conditionLayout - //VarScene'" >
                            //Skipping actions with create since they are associated with a CollisionNP condition - <xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each>
                            </xsl:if>
                        </xsl:if>

                        //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //repeatExpression <xsl:value-of select="repeatExpression" /> //<xsl:value-of select="../../events/type" />
                        <xsl:if test="not(contains($hasCreate, 'found')) or not(contains($hasCollisionCondition, 'found')) or $caller = 'conditionLayout - //VarScene'" >

                        <xsl:variable name="listSize" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'MettreY' or type/value = 'MettreXY' or type/value = 'MettreAutourPos'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size()</xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:variable>

                        //GDAction
                        final int size = <xsl:if test="string-length($listSize) = 0 and not(repeatExpression or ../../events/type = 'BuiltinCommonInstructions::ForEach')" >1;</xsl:if>
                        <xsl:if test="string-length($listSize) > 0 and not(repeatExpression or ../../events/type = 'BuiltinCommonInstructions::ForEach')" ><xsl:value-of select="$listSize" />; //MettreY //MettreXY</xsl:if>
                        <xsl:if test="../../events/type = 'BuiltinCommonInstructions::ForEach'" >globals.<xsl:value-of select="substring-before(substring-after($parametersAsString, ':'), ',')" />GDGameLayerList.size();</xsl:if>
                        <xsl:if test="repeatExpression" ><xsl:value-of select="repeatExpression" />;</xsl:if>
            
            <xsl:if test="contains($hadConditionOtherThanThis, 'found') and ($caller = 'conditionLayout - //eventsCreateAssignGDObject' and contains($hasCreate, 'found'))" >
            //Skip size limit logic
            </xsl:if>
            <xsl:if test="not(contains($hadConditionOtherThanThis, 'found'))" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            //LogUtil.put(LogFactory.getInstance("<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() " + <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() +  " size " + size, this, commonStrings.PROCESS));
                            if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> size) {
                                //LogUtil.put(LogFactory.getInstance("A: Keep from creating again before last time: <xsl:value-of select="text()" />", this, commonStrings.PROCESS));
                                //caller=<xsl:value-of select="$caller" />
                                return <xsl:if test="contains($caller, 'actionsWithIndexesProcess') or $caller = 'conditionLayout - //VarScene'" > true</xsl:if>;
                            }
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
            </xsl:if>
            
            <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
            <xsl:if test="not(contains($hasCreate, 'found'))" >
                        final BasicArrayList gameLayerList = new BasicArrayList();
            </xsl:if>
            </xsl:if>
                        //final StringMaker stringBuilder = new StringMaker();

                       <xsl:variable name="actionWithTextObjectString" >
                           <xsl:for-each select="actions" >
                               <xsl:variable name="typeValue" select="type/value" />
                               <xsl:if test="$typeValue = 'TextObject::String'" >found:<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:if>
                           </xsl:for-each>
                        </xsl:variable>

                        <xsl:variable name="nodeId" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" ><xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:for-each select="actions" >
                            <xsl:if test="type/value = 'Create'" >
                                <xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 2" >

                        if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.objectArray == arrayUtil.ZERO_OBJECT_ARRAY) {
                            LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$nodeId" /><xsl:value-of select="text()" />GDGameLayerList = new BasicArrayList(size);", this, commonStrings.PROCESS));
                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.ensureCapacity(size);
                        }

                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:if>
                            
                        <xsl:if test="type/value = 'Create'" >
                        <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        //param1=<xsl:value-of select="$param" />
                        <xsl:if test="contains($actionWithTextObjectString, $param)" >
                        //Action - //TextObject::String - call - START
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                        //Action - //TextObject::String - call - END
                        </xsl:if>
                        </xsl:if>

                        <xsl:if test="type/value = 'RotateTowardPosition'" >
                        <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        //param1=<xsl:value-of select="$param" />
                        //Action - //RotateTowardPosition - call - START
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                        //Action - //RotateTowardPosition - call - END
                        </xsl:if>

                        </xsl:for-each>

                        <xsl:variable name="createParamsAsString" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />,</xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="timerActions" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" ><xsl:value-of select="type/value" />,</xsl:if></xsl:for-each></xsl:variable>
                        
                        <xsl:if test="string-length($createParamsAsString) > 0" >
                            <xsl:variable name="text" select="substring-before($createParamsAsString, ',')" />
                        //caller=<xsl:value-of select="$caller" /><xsl:if test="contains($caller, 'eventsCreateAssignGDObject')" > - add one</xsl:if> - //Create Loop
                        final int startIndex = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$text" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$text" />GDGameLayerList.size();
                        final int endIndex = startIndex + size;
                        
                        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />").append(" Timer - size <xsl:value-of select="$text" />List startIndex: ").append(startIndex).append(" endIndex: ").append(endIndex).toString(), this, commonStrings.PROCESS, new Exception()));
                        <xsl:if test="contains($timerActions, 'Timer,')" >
                        </xsl:if>
                        for(int index = startIndex; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> endIndex; index++) {
                        </xsl:if>

                        <xsl:if test="string-length($createParamsAsString) = 0" >
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                        </xsl:if>
            
            <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
            <xsl:if test="not(contains($hasCreate, 'found'))" >
            gameLayerList.clear();
            </xsl:if>
            //updateGDObject - -1
            boolean actionWithUpdate = false;
            </xsl:if>

            <xsl:if test="not(contains($hasCondition, 'found'))" >
            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found'))" >
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                <xsl:if test="position() = 1" >
                //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Condition - call
                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="position() = 2" >
                //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Condition - call - more ifs
                </xsl:if>
            </xsl:for-each>
            </xsl:if>
            </xsl:if>

            <xsl:if test="contains($hasCreate, 'found')" >
            <xsl:variable name="gameObjectNames" >
                <xsl:for-each select="actions" >                                
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() > 2" >
                            <xsl:if test="contains(text(), '.')" >
                                <xsl:variable name="objectNameWithSeps" >:<xsl:value-of select="substring-before(text(), '.')" />,</xsl:variable>
                                <xsl:if test="contains($objectsAsString, $objectNameWithSeps)" >
                                    <xsl:value-of select="substring-before(text(), '.')" />,
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>                    
                </xsl:if>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:if test="$gameObjectNames != ''" >
                <xsl:variable name="gameObjectName" ><xsl:value-of select="substring-before($gameObjectNames, ',')" /></xsl:variable>
                //This may need to loop through more than 1 game object found: <xsl:value-of select="$gameObjectName" /> 
                //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Create - //<xsl:value-of select="$gameObjectName" />
                if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameObjectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameObjectName" />GDGameLayerList.size() == 0) {
                    //caller=<xsl:value-of select="$caller" />
                    return <xsl:if test="contains($caller, 'actionsWithIndexesProcess') or $caller = 'conditionLayout - //VarScene'" > false</xsl:if>;
                }

                GDObject <xsl:value-of select="$gameObjectName" /> = null;                
                if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameObjectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameObjectName" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                    <xsl:value-of select="$gameObjectName" /> = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameObjectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameObjectName" />GDGameLayerList.get(0)).gdObject;
                }
            </xsl:if>
            </xsl:if>

            <!-- //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Actions - 1 -->
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:text>&#10;</xsl:text>
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                
                <xsl:if test="$typeValue = 'ResetTimer'" >                    
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //ResetTimer - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'PauseTimer'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //PauseTimer - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'UnPauseTimer'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //UnPauseTimer - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'Opacity'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //Opacity - call
            <xsl:if test="not(contains($hasNoConditionsButDoesHaveUsedAction, 'found'))" >
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processU(index);
            </xsl:if>
            <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
            </xsl:if>

                </xsl:if>

                <xsl:if test="$caller = 'externalEventsCreateAssignGDObject - //eventsCreateAssignXGDObjectGDNodesOtherEvent - //actionsWithIndexesProcess'" >
                <xsl:if test="$typeValue = 'ModVarScene'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //ModVarScene - call - 1
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                </xsl:if>

                <xsl:if test="$typeValue = 'Create'" >

                    //actionsWithIndexes - //createGDObject - START
                    <xsl:call-template name="createGDObject" >
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="nodeAsString" >
                            <xsl:value-of select="$nodeId" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //actionsWithIndexes - //createGDObject - END
                    
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //Create - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processCreate(<xsl:value-of select="$name" />GDobject2);
                    <xsl:if test="$caller = 'externalEventsCreateAssignGDObject - //eventsCreateAssignXGDObjectGDNodesOtherEvent - //actionsWithIndexesProcess'" >
                    final int size2 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />OnceGDNodeList.size();
                    for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                        ((GDNode) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />OnceGDNodeList.get(index2)).firstTime = true;
                    }
                    </xsl:if>
                </xsl:if>

                <xsl:if test="$typeValue = 'MettreX'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //MettreX - call
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                    final int <xsl:value-of select="text()" />Size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size();
                        </xsl:if>
                    </xsl:for-each>

                    for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />Size</xsl:if></xsl:for-each>; index2++) {
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        final GDGameLayer gameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index2);
                        </xsl:if>
                    </xsl:for-each>
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(gameLayer.gdObject, 
                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList</xsl:if></xsl:for-each>,
                        index2,
                        globals.graphics);
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        gameLayer.updatePosition();
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'MettreY'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //MettreY - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(((GDGameLayer) globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />List.get(index))</xsl:if></xsl:for-each>, null, globals.graphics);
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            gameLayer.updatePosition();
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <xsl:if test="$typeValue = 'MettreXY'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //MettreXY - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(((GDGameLayer) globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayerList.get(index))</xsl:if></xsl:for-each>, null, globals.graphics);
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            gameLayer.updatePosition();
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="$typeValue = 'MettreAutourPos'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //MettreXY - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(((GDGameLayer) globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayerList.get(index))</xsl:if></xsl:for-each>, null, globals.graphics);
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            gameLayer.updatePosition();
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <xsl:if test="$typeValue = 'SetAngle'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //SetAngle - call
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index)) {
                        <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                        <xsl:if test="not(contains($hasCreate, 'found'))" >
                        <xsl:call-template name="addGameLayerToList" />
                        </xsl:if>
                        </xsl:if>
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangePlan'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //ChangePlan - call
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index)) {
                        <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                        <xsl:if test="not(contains($hasCreate, 'found'))" >
                        <xsl:call-template name="addGameLayerToList" />
                        </xsl:if>
                        </xsl:if>
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeColor'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //ChangeColor - call
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index)) {
                        <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                        <xsl:if test="not(contains($hasCreate, 'found'))" >
                        <xsl:call-template name="addGameLayerToList" />
                        </xsl:if>
                        </xsl:if>
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'AddForceAL'" >
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //AddForceAL - call
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index)) {
                        <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                        <xsl:if test="not(contains($hasCreate, 'found'))" >
                        <xsl:call-template name="addGameLayerToList" />
                        </xsl:if>
                        </xsl:if>
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeAnimation'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //ChangeAnimation - call
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index)) {
                        <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                        <xsl:if test="not(contains($hasCreate, 'found'))" >
                        <xsl:call-template name="addGameLayerToList" />
                        </xsl:if>
                        </xsl:if>
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarObjet'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //ModVarObjet - call
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index)) {
                        <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                        <xsl:if test="not(contains($hasCreate, 'found'))" >
                        <xsl:call-template name="addGameLayerToList" />
                        </xsl:if>
                        </xsl:if>
                    }
                </xsl:if>

            </xsl:for-each>

            <xsl:for-each select="actions" >
                <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'Create'" >
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //Create - call - end
                    //<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />GDGameLayerList</xsl:if></xsl:for-each>, 
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processEnd(index);
                </xsl:if>
            </xsl:for-each>

            <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
            <xsl:if test="not(contains($hasCreate, 'found'))" >
                                if(actionWithUpdate) {

                                    final int size2 = gameLayerList.size();
                                    if(size2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                        for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                                            //updateGDObject - 0
                                            ((GDGameLayer) gameLayerList.get(index2)).updateGDObject(globals.timeDelta);
                                        }
                                    } else {
                                        LogUtil.put(LogFactory.getInstance("updateGDObject failed: <xsl:for-each select="actions" ><xsl:if test="type/value = 'MettreX' or type/value = 'MettreY' or type/value = 'MettreXY' or type/value = 'SetAngle' or type/value = 'ChangePlan' or type/value = 'ChangeAnimation' or type/value = 'ModVarObjet'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayer </xsl:if></xsl:for-each></xsl:if></xsl:for-each>was null", this, commonStrings.PROCESS, new Exception()));
                                    }

                                }
            </xsl:if>
            </xsl:if>

                        }

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                
                <xsl:if test="type/value = 'Delete'" >
                    <xsl:if test="not(contains($caller, 'external'))" >
                    <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //Delete - call
                    if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerList.size() != 0) {

                    final GDGameLayer <xsl:value-of select="$gameLayerName" />GDGameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(0);
                    if(<xsl:value-of select="$gameLayerName" />GDGameLayer != null) {
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$gameLayerName" />GDGameLayer, null, globals.graphics);
                    } else {
                        LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "<xsl:value-of select="$gameLayerName" />GDGameLayer was null", this, commonStrings.PROCESS));
                    }

                    }
                        </xsl:if>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarGlobalTxt'" >                    
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //ModVarGlobalTxt - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'ModVarGlobal'" >                    
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //ModVarGlobal - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="type/value = 'ModVarScene'" >
                    <xsl:if test="not(contains($caller, 'external'))" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //ModVarScene - call - 2
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>

            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'TextObject::String'" >
                    //Action - //TextObject::String - call - START
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    //Action - //TextObject::String - call - END
                </xsl:if>
            </xsl:for-each>

                        </xsl:if>

            </xsl:if>
                        
            </xsl:if>
            
<!--
            <xsl:if test="not(contains($alreadyUsedParentCondition, 'found')) and contains($hasCondition, 'found') and contains($hadConditionOtherThanThis, 'found')" >
            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($hasOnceCondition, 'found')) and not(contains($hasUsedOnceCondition, 'found'))" >
            <xsl:if test="not(contains($hasNoConditionsButDoesHaveUsedAction, 'found')) and not(contains($hasCreate, 'found')) and not(contains($hasCollisionCondition, 'found'))" >
            </xsl:if>
            </xsl:if>
            </xsl:if>
-->

            <xsl:variable name="hasPauseTimer" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'PauseTimer'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasResetTimer" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'ResetTimer'" >found</xsl:if></xsl:for-each></xsl:variable>

            <xsl:variable name="lastCondition" ><xsl:for-each select="conditions" ><xsl:if test="position() = last()" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >found</xsl:if></xsl:if></xsl:if></xsl:for-each></xsl:variable>

            <xsl:if test="contains($lastCondition, 'found') and contains($caller, 'conditionLayout')" >
            //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Actions - //lastCondition2
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
            //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //lastCondition2 - //Action - //<xsl:value-of select="$typeValue" /> - call
            <xsl:if test="type/value = 'Scene'" >
            //TWBTWB
            </xsl:if>
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
            </xsl:for-each>
            </xsl:if>

            <xsl:if test="contains($hasCondition, 'found') and contains($hadConditionOtherThanThis, 'found') and not(contains($hasUsedSoundPlayingCondition, 'found'))" >

            //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Actions - 2 - START
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                <xsl:if test="contains($hasPauseTimer, 'found') or contains($hasResetTimer, 'found') or (contains($caller, 'eventsCreateAssignGDObject') and $typeValue = 'ModVarScene')" >
                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //<xsl:value-of select="type/value" />
                <xsl:if test="contains($caller, 'conditionLayout') or contains($caller, 'otherEventLayout')" >
                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="not(contains($caller, 'conditionLayout') or contains($caller, 'otherEventLayout'))" >
                //TWBTWB
                //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                </xsl:if>
            </xsl:for-each>
            //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Actions - 2 - END
            
            </xsl:if>

            <xsl:if test="not(contains($hasCondition, 'found'))" >
            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene'" >
                //not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene' - START
                        <xsl:for-each select="events" >
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Event - //<xsl:value-of select="type" /> - call
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:if>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call
                            globals.<xsl:value-of select="target" />GDNode.process();
                            </xsl:if>
                        </xsl:for-each>
                //not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene' - END
            </xsl:if>
                
            <xsl:if test="contains($caller, 'eventsCreateAssignGDObject')" >
                //contains($caller, 'eventsCreateAssignGDObject') - START
                        <xsl:for-each select="events" >
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Event - //<xsl:value-of select="type" /> - call
                            //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:if>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call
                            //globals.<xsl:value-of select="target" />GDNode.process();
                            </xsl:if>
                        </xsl:for-each>
                //contains($caller, 'eventsCreateAssignGDObject') - END
            </xsl:if>
            </xsl:if>

            <xsl:if test="contains($hasCondition, 'found')" >
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="($conditionPosition = '' and position() = 1) or position() = $conditionPosition + 1" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:if test="type/value != 'DepartScene' and type/value != 'SoundPlaying' and (not(contains($caller, 'eventsCreateAssignGDObject') and type/value = 'NbObjet'))" >

            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene'" >
                //maybe - not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene' - START
                        <xsl:for-each select="../events" >
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Event - //<xsl:value-of select="type" /> - call
                            // maybe we should not call this here.1
                            //TWB not called anymore <xsl:value-of select="$caller" /> - //actionsWithIndexes //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:if>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call
                            globals.<xsl:value-of select="target" />GDNode.process();
                            </xsl:if>
                        </xsl:for-each>
                //maybe - not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene' - END
            </xsl:if>
                
            <xsl:if test="contains($caller, 'eventsCreateAssignGDObject')" >
                //maybe - contains($caller, 'eventsCreateAssignGDObject') - START
                        <xsl:for-each select="../events" >
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Event - //<xsl:value-of select="type" /> - call
                            // maybe we should not call this here.2
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:if>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call
                            globals.<xsl:value-of select="target" />GDNode.process();
                            </xsl:if>
                        </xsl:for-each>
                //maybe - contains($caller, 'eventsCreateAssignGDObject') - END
            </xsl:if>

                </xsl:if>
                </xsl:if>
                </xsl:if>
            </xsl:for-each>

            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene'" >
                //maybe - not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene' - START
                        <xsl:for-each select="events" >
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Event - //<xsl:value-of select="type" /> - call
                            //Was calling these, but maybe should not have been
                            //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:if>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call
                            //globals.<xsl:value-of select="target" />GDNode.process();
                            </xsl:if>
                        </xsl:for-each>
                //maybe - not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene' - END
            </xsl:if>
                
            <xsl:if test="contains($caller, 'eventsCreateAssignGDObject')" >
                //maybe - contains($caller, 'eventsCreateAssignGDObject') - START
                        <xsl:for-each select="events" >
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Event - //<xsl:value-of select="type" /> - call
                            //Was calling these, but maybe should not have been
                            //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:if>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call
                            //globals.<xsl:value-of select="target" />GDNode.process();
                            </xsl:if>
                        </xsl:for-each>
                //maybe - contains($caller, 'eventsCreateAssignGDObject') - END
            </xsl:if>
            </xsl:if>

            <xsl:if test="not(contains($alreadyUsedCondition, 'found'))" >
            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
            <xsl:if test="not(contains($alreadyUsedParentCondition, 'found'))" >

            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
                
            <xsl:variable name="hasActions" ><xsl:for-each select="actions" >found</xsl:for-each></xsl:variable>

            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="($conditionPosition = '' and position() = 1) or position() = $conditionPosition + 1" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:if test="type/value != 'DepartScene' and type/value != 'SoundPlaying' and (not(contains($caller, 'eventsCreateAssignGDObject') and type/value = 'NbObjet'))" >
                    
                <xsl:if test="contains($hasActions, 'found')" >
                //Condition - END
                </xsl:if>   
                }
                </xsl:if>
                </xsl:if>
                </xsl:if>
            </xsl:for-each>
            </xsl:if>
            
            </xsl:if>
            </xsl:if>
            </xsl:if>

                    } catch(Exception e) {
                    //1
                        LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />", this, commonStrings.PROCESS, e));
                    }

    </xsl:template>

    <xsl:template name="actionsWithUndefinedVariables" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="variables" />
        
        <xsl:for-each select="events" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'ModVarScene'" >
                    <xsl:variable name="parametersOne" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />,</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="not(contains($variables, $parametersOne))" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

                    <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                    <xsl:variable name="hasPriorUndefinedVariable" ><xsl:if test="//actions[type/value/text() = 'ModVarScene' and number(substring(generate-id(), 2) - 65536) &lt; $id]/parameters[1]/text() = parameters[1]/text()">found</xsl:if></xsl:variable>
<!--                    //hasPriorUndefinedVariable=<xsl:value-of select="$hasPriorUndefinedVariable" />-->
                    <xsl:if test="not(contains($hasPriorUndefinedVariable, 'found'))" >
                    //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
                    <xsl:if test="contains(parameters[3]/text(), '.') and number(parameters[3]/text())" >
                    public double <xsl:value-of select="parameters[1]/text()" /> = 0;    
                    </xsl:if>
                    <xsl:if test="not(contains(parameters[3]/text(), '.') and number(parameters[3]/text()))" >
                    public int <xsl:value-of select="parameters[1]/text()" /> = 0;    
                    </xsl:if>                    
                    <xsl:text>&#10;</xsl:text>
                    </xsl:if>

                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
            
            <xsl:call-template name="actionsWithUndefinedVariables" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="variables" >
                    <xsl:value-of select="$variables" />
                </xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="actionsWithUndefinedGlobalVariables" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="variables" />
        
        <xsl:for-each select="events" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'ModVarGlobal'" >
                    <xsl:variable name="parametersOne" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />,</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="not(contains($variables, $parametersOne))" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

                    <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                    <xsl:variable name="hasPriorUndefinedVariable" ><xsl:if test="//actions[type/value/text() = 'ModVarGlobal' and number(substring(generate-id(), 2) - 65536) &lt; $id]/parameters[1]/text() = parameters[1]/text()">found</xsl:if></xsl:variable>
<!--                    //hasPriorUndefinedVariable=<xsl:value-of select="$hasPriorUndefinedVariable" />-->
                    <xsl:if test="not(contains($hasPriorUndefinedVariable, 'found'))" >
                    //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
                    <xsl:if test="contains(parameters[3]/text(), '.') and number(parameters[3]/text())" >
                    public double <xsl:value-of select="parameters[1]/text()" /> = 0;    
                    </xsl:if>
                    <xsl:if test="not(contains(parameters[3]/text(), '.') and number(parameters[3]/text()))" >
                    public int <xsl:value-of select="parameters[1]/text()" /> = 0;    
                    </xsl:if>                    
                    <xsl:text>&#10;</xsl:text>
                    </xsl:if>

                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
            
            <xsl:call-template name="actionsWithUndefinedGlobalVariables" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="variables" >
                    <xsl:value-of select="$variables" />
                </xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="addGameLayerToList" >

                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        actionWithUpdate = true;

                        if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        </xsl:if>
                    </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>

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
    <xsl:template name="hackProcessing2" >
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

                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing2
                        //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'NumberObjectVariable'" >
                        //NumberObjectVariable - some are processed from eventsProcess
                        //RemovedNow2
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                </xsl:if>
            </xsl:for-each>
                        
            <xsl:if test="actions" >
                
                <xsl:variable name="thisNodeArray" >this</xsl:variable>

                //caller=<xsl:value-of select="$caller" /> - //hackProcessing2 - hackProcessing - START
                <xsl:call-template name="hackProcessing" >
                    <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //hackProcessing2</xsl:with-param>
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
                //caller=<xsl:value-of select="$caller" /> - //hackProcessing2 - hackProcessing - END

            </xsl:if>
            
    </xsl:template>

    <xsl:template name="hackProcessing" >
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
        <xsl:param name="index" />
        <xsl:param name="repeat" />
                    
                    try {

            <xsl:variable name="alreadyUsedParentCondition" ><xsl:for-each select="../conditions" ><xsl:if test="type/value = 'SourisSurObjet'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasCondition" ><xsl:for-each select="conditions" >found</xsl:for-each></xsl:variable>
            <xsl:variable name="hadConditionOtherThanThis" ><xsl:for-each select="conditions" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >found</xsl:if></xsl:for-each></xsl:variable>
            <!-- position() = 1 and -->
            <xsl:variable name="alreadyUsedCondition" ><xsl:call-template name="alreadyUsedCondition" ></xsl:call-template></xsl:variable>

            <xsl:variable name="hasOnceCondition" ><xsl:for-each select="conditions" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasUsedOnceCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >found</xsl:if></xsl:if></xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasUsedSoundPlayingCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'SoundPlaying'" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >found</xsl:if></xsl:if></xsl:if></xsl:for-each></xsl:variable>

            <xsl:variable name="hasNoConditionsButDoesHaveUsedAction" ><xsl:if test="not(contains($hasCondition, 'found'))" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'SetAngle' or type/value = 'ChangePlan' or type/value = 'AddForceAL' or type/value = 'ChangeAnimation' or type/value = 'SetNumberObjectVariable'" >found</xsl:if></xsl:for-each></xsl:if></xsl:variable>
            <xsl:variable name="hasCreate" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasCollisionCondition" ><xsl:for-each select="../conditions" ><xsl:if test="type/value = '(Used when using the AllBinary Collision Processing) CollisionNP'" >found</xsl:if></xsl:for-each></xsl:variable>

//hackProcessing - START
//alreadyUsedParentCondition=<xsl:value-of select="$alreadyUsedParentCondition" />
//hasCondition=<xsl:value-of select="$hasCondition" />
//hadConditionOtherThanThis=<xsl:value-of select="$hadConditionOtherThanThis" />
//alreadyUsedCondition=<xsl:value-of select="$alreadyUsedCondition" />
//hasOnceCondition=<xsl:value-of select="$hasOnceCondition" />
//hasUsedOnceCondition= <xsl:value-of select="$hasUsedOnceCondition" />
//hasNoConditionsButDoesHaveUsedAction=<xsl:value-of select="$hasNoConditionsButDoesHaveUsedAction" />
//hasCreate=<xsl:value-of select="$hasCreate" />
//hasCollisionCondition=<xsl:value-of select="$hasCollisionCondition" />

<!--
-->

            <xsl:if test="$caller = 'conditionLayout - //eventsCreateAssignGDObject'" >
            //conditionLayout - //eventsCreateAssignGDObject - START
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Scene'" >
                    <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //param1=<xsl:value-of select="$param" />
                    //Action - //Scene - call
                    //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                </xsl:if>
                <xsl:if test="type/value = 'ChangeScale'" >
                    <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //param1=<xsl:value-of select="$param" />
                    //Action - //ChangeScale - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
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
                //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Condition - //DepartScene - call - <xsl:value-of select="$thisNodeIndex" />
                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                </xsl:if>
                <xsl:if test="type/value = 'SoundPlaying'" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Condition - //SoundPlaying - call - <xsl:value-of select="$thisNodeIndex" />
                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
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
                //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Condition - //BuiltinCommonInstructions::Once - call - <xsl:value-of select="$thisNodeIndex" />
                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
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
                //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Condition - //otherthan(BuiltinCommonInstructions::Once) - //<xsl:value-of select="type/value" /> - call - <xsl:value-of select="$thisNodeIndex" />
                //TWBTWB - process the other conditions
                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                </xsl:if>
                </xsl:if>
            </xsl:for-each>
            //hasOnceCondition - END
            </xsl:if>

            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
            //alreadyUsedCondition - not - //2 - START
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="($conditionPosition = '' and position() = 1) or position() = $conditionPosition + 1" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:if test="type/value != 'DepartScene' and type/value != 'SoundPlaying' and (not(contains($caller, 'eventsCreateAssignGDObject') and type/value = 'NbObjet'))" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Condition - //not(BuiltinCommonInstructions::Once) - //<xsl:value-of select="type/value" /> - call - <xsl:value-of select="$thisNodeIndex" />
                if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />)) {
                </xsl:if>
                </xsl:if>
                </xsl:if>
                <xsl:if test="($conditionPosition = '' and position() = 2) or position() = $conditionPosition + 2" >
                //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Condition - call - more ifs
                </xsl:if>
            </xsl:for-each>
            //alreadyUsedCondition - not - //2 - END
            </xsl:if>

            //alreadyUsedParentCondition - not - START
            </xsl:if>
                        
            <xsl:if test="contains($alreadyUsedParentCondition, 'found')" >
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Condition - //not(BuiltinCommonInstructions::Once) - //<xsl:value-of select="type/value" /> - call - <xsl:value-of select="$thisNodeIndex" />
                //other - //Condition - //<xsl:value-of select="type/value" /> - call
                if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />)) {
                </xsl:if>
            </xsl:for-each>
            </xsl:if>
            
            //alreadyUsedCondition - not - END
            </xsl:if>

            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Actions - //hasUsedOnceCondition and not hasUsedOnceCondition
            
            <xsl:variable name="hasSubCondition" >
            <xsl:for-each select="conditions" >
                <xsl:if test="type/value = 'BuiltinCommonInstructions::Or' or type/value = 'BuiltinCommonInstructions::And'" >found</xsl:if>
            </xsl:for-each>
            </xsl:variable>
            <!-- This variable is the same as in part of the actions below -->
            <xsl:variable name="notAlreadyUsedConditionButWithSpecificAction" >
                <xsl:if test="not(contains($hasSubCondition, 'found'))" >
            <xsl:for-each select="actions" >
            <xsl:if test="not(type/value = 'Cache' or type/value = 'SetGlobalVariableAsBoolean' or type/value = 'SetBooleanVariable' or type/value = 'PlaySoundCanal' or type/value = 'TextContainerCapability::TextContainerBehavior::SetValue'or type/value = 'SetNumberVariable')" >                
            <xsl:if test="not(contains($alreadyUsedCondition, 'found'))" >
                <xsl:if test="type/value = 'ModVarScene' or type/value = 'PlaySound'" >found</xsl:if>
            </xsl:if>
            </xsl:if>
            </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            
            <xsl:for-each select="actions" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
            <xsl:text>&#10;</xsl:text>
            //Action - //<xsl:value-of select="type/value" /> - call h1

            <xsl:if test="type/value = 'Cache' or type/value = 'SetGlobalVariableAsBoolean' or type/value = 'SetBooleanVariable' or type/value = 'PlaySoundCanal' or type/value = 'TextContainerCapability::TextContainerBehavior::SetValue' or type/value = 'SetNumberVariable'" >
            <xsl:if test="contains($alreadyUsedCondition, 'found')" >
            //Skipping Action since a alreadyUsedCondition is used
            </xsl:if>
            <xsl:if test="not(contains($alreadyUsedCondition, 'found'))" >
<!--                <xsl:if test="type/value = 'SetNumberVariable'" >
                    //TWB - was not called beforeXYZ
                </xsl:if>-->
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
            </xsl:if>
            </xsl:if>
                        
            <xsl:if test="not(type/value = 'Cache' or type/value = 'SetGlobalVariableAsBoolean' or type/value = 'SetBooleanVariable' or type/value = 'PlaySoundCanal' or type/value = 'TextContainerCapability::TextContainerBehavior::SetValue'or type/value = 'SetNumberVariable')" >                
            <xsl:if test="not(contains($alreadyUsedCondition, 'found'))" >
                <xsl:if test="not(type/value = 'ModVarScene' or type/value = 'PlaySound')" >
            //Could I call this - //<xsl:value-of select="type/value" />
                </xsl:if>
                <xsl:if test="type/value = 'ModVarScene' or type/value = 'PlaySound'" >
            //I am now calling this - //<xsl:value-of select="type/value" />
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                </xsl:if>
            </xsl:if>
            </xsl:if>
            
            <xsl:if test="contains($hasOnceCondition, 'found')" >
            <xsl:if test="not(contains($hasUsedOnceCondition, 'found'))" >
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
            </xsl:if>
            </xsl:if>
            
            </xsl:for-each>

            <xsl:if test="contains($hasCondition, 'found') and not(contains($hadConditionOtherThanThis, 'found'))" >
                //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //hadConditionOtherThanThis <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />= <xsl:value-of select="$thisNodeIndex" />
            </xsl:if>

            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //hadConditionOtherThanThis=<xsl:value-of select="$hadConditionOtherThanThis" />
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

                        //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //repeatExpression <xsl:value-of select="repeatExpression" /> //<xsl:value-of select="../../events/type" />
                        <xsl:if test="not(contains($hasCreate, 'found')) or not(contains($hasCollisionCondition, 'found')) or $caller = 'conditionLayout - //VarScene'" >

                        <xsl:variable name="listSize" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'MettreY' or type/value = 'MettreXY' or type/value = 'MettreAutourPos'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size()</xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:variable>

                        //GDAction
                        final int size = <xsl:if test="string-length($listSize) = 0 and not(repeatExpression or ../../events/type = 'BuiltinCommonInstructions::ForEach')" >1;</xsl:if>
                        <xsl:if test="string-length($listSize) > 0 and not(repeatExpression or ../../events/type = 'BuiltinCommonInstructions::ForEach')" ><xsl:value-of select="$listSize" />; //MettreY //MettreXY</xsl:if>
                        <xsl:if test="../../events/type = 'BuiltinCommonInstructions::ForEach'" >globals.<xsl:value-of select="substring-before(substring-after($parametersAsString, ':'), ',')" />GDGameLayerList.size();</xsl:if>
                        <xsl:if test="repeatExpression" >eSize;</xsl:if>
            
            <xsl:if test="contains($hadConditionOtherThanThis, 'found') and ($caller = 'conditionLayout - //eventsCreateAssignGDObject' and contains($hasCreate, 'found'))" >
            //Skip size limit logic
            </xsl:if>
            <xsl:if test="not(contains($hadConditionOtherThanThis, 'found'))" >
            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Actions - //hadConditionOtherThanThis
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            //LogUtil.put(LogFactory.getInstance("<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() " + <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() +  " size " + size, this, commonStrings.PROCESS));
                            if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> size) {
                                //LogUtil.put(LogFactory.getInstance("A: Keep from creating again before last time: <xsl:value-of select="text()" />", this, commonStrings.PROCESS));
                                //caller=<xsl:value-of select="$caller" />
                                return <xsl:if test="contains($caller, 'hackProcessing2') or $caller = 'conditionLayout - //VarScene' or $caller = 'otherEventLayout - //eventsCreateAssignXGDObjectGDNodesOtherEvent' or $caller = 'externalEventsCreateAssignGDObject - //eventsCreateAssignXGDObjectGDNodesOtherEvent'" > true</xsl:if>;
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

                        <xsl:variable name="nodeIdAsString" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" ><xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>

                        //caller=<xsl:value-of select="$caller" /> - //hackProcessing
                        <xsl:for-each select="actions" >
                            <xsl:if test="type/value = 'Create'" >
                                <xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 2" >

                        if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.objectArray == arrayUtil.ZERO_OBJECT_ARRAY) {
                            LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$nodeIdAsString" /><xsl:value-of select="text()" />GDGameLayerList = new BasicArrayList(size);", this, commonStrings.PROCESS));
                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.ensureCapacity(size);
                        }

                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:if>
                            
                        <xsl:if test="type/value = 'Create'" >
                        <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        //param1=<xsl:value-of select="$param" />
                        <xsl:if test="contains($actionWithTextObjectString, $param)" >
                        //Action - //TextObject::String - call
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                        </xsl:if>
                        </xsl:if>

                        <xsl:if test="type/value = 'RotateTowardPosition'" >
                        <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        //param1=<xsl:value-of select="$param" />
                        //Action - //RotateTowardPosition - call
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
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
                        //TWB - loop hack - 1 index=<xsl:value-of select="$index" /> repeat=<xsl:value-of select="$repeat" />
                        <xsl:if test="contains($repeat, 'found')" >
                        for(int index2 = startIndex; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> endIndex; index2++) {
                        </xsl:if>
                        <xsl:if test="not(contains($repeat, 'found'))" >
                        for(int index = startIndex; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> endIndex; index++) {
                        </xsl:if>

                        </xsl:if>

                        <xsl:if test="string-length($createParamsAsString) = 0" >
                        //TWB - loop hack - 2
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
                //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Condition - call
                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                </xsl:if>
                <xsl:if test="position() = 2" >
                //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Condition - call - more ifs
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
                <xsl:if test="not(contains($hasCreate, 'found'))" >
                <xsl:variable name="gameObjectName" ><xsl:value-of select="substring-before($gameObjectNames, ',')" /></xsl:variable>
                //This may need to loop through more than 1 game object found: <xsl:value-of select="$gameObjectName" /> 
                //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Create - //<xsl:value-of select="$gameObjectName" />
                if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameObjectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameObjectName" />GDGameLayerList.size() == 0) {
                    //caller=<xsl:value-of select="$caller" />
                    return <xsl:if test="contains($caller, 'hackProcessing2') or $caller = 'conditionLayout - //VarScene' or $caller = 'otherEventLayout - //eventsCreateAssignXGDObjectGDNodesOtherEvent' or $caller = 'externalEventsCreateAssignGDObject - //eventsCreateAssignXGDObjectGDNodesOtherEvent'" > true</xsl:if>;
                }

                //GDObject <xsl:value-of select="$gameObjectName" /> = null;
                //if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameObjectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameObjectName" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                    //<xsl:value-of select="$gameObjectName" /> = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameObjectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameObjectName" />GDGameLayerList.get(0)).gdObject;
                //}
                final GDObject <xsl:value-of select="$gameObjectName" /> = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameObjectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameObjectName" />GDGameLayerList.get(0)).gdObject;
                </xsl:if>
            </xsl:if>

            </xsl:if>

            <!--  -->
            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Actions - 1
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:text>&#10;</xsl:text>
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                
                <xsl:if test="$typeValue = 'ResetTimer'" >                    
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //ResetTimer - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                </xsl:if>
                <xsl:if test="$typeValue = 'PauseTimer'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //PauseTimer - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                </xsl:if>
                <xsl:if test="$typeValue = 'UnPauseTimer'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //UnPauseTimer - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                </xsl:if>
                <xsl:if test="$typeValue = 'Opacity'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //Opacity - call
            <xsl:if test="not(contains($hasNoConditionsButDoesHaveUsedAction, 'found'))" >
                    //index=<xsl:value-of select="$index" />
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processU(index);
            </xsl:if>
            <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                    //index=<xsl:value-of select="$index" />
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
            </xsl:if>

                </xsl:if>

                <xsl:if test="$caller = 'externalEventsCreateAssignGDObject - //eventsCreateAssignXGDObjectGDNodesOtherEvent - //hackProcessing2'" >
                <xsl:if test="$typeValue = 'ModVarScene'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //ModVarScene - call - 1
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                </xsl:if>
                </xsl:if>

                <xsl:if test="$typeValue = 'Create'" >

                    //hackProcessing - //createGDObject - START
                    <xsl:call-template name="createGDObject" >
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="nodeAsString" >
                            <xsl:value-of select="$nodeIdAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //hackProcessing2</xsl:with-param>
                    </xsl:call-template>
                    //hackProcessing - //createGDObject - END
                    
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //Create - call
                    //TWB is this still needed3
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processCreate(<xsl:value-of select="$name" />GDobject2);
                    <xsl:if test="$caller = 'externalEventsCreateAssignGDObject - //eventsCreateAssignXGDObjectGDNodesOtherEvent - //hackProcessing2'" >
                    final int size2 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />OnceGDNodeList.size();
                    for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                        ((GDNode) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />OnceGDNodeList.get(index2)).firstTime = true;
                    }
                    </xsl:if>
                </xsl:if>

                <xsl:if test="$typeValue = 'MettreX'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //MettreX - call
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
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //MettreY - call
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
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //MettreXY - call
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
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //MettreXY - call
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
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //SetAngle - call
                    //index=<xsl:value-of select="$index" />
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
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //ChangePlan - call
                    //index=<xsl:value-of select="$index" />
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
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //ChangeColor - call
                    //index=<xsl:value-of select="$index" />
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index)) {
                        <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                        <xsl:if test="not(contains($hasCreate, 'found'))" >
                        <xsl:call-template name="addGameLayerToList" />
                        </xsl:if>
                        </xsl:if>
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'AddForceAL'" >
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //AddForceAL - call
                    //index=<xsl:value-of select="$index" />
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
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //ChangeAnimation - call
                    //index=<xsl:value-of select="$index" />
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index)) {
                        <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                        <xsl:if test="not(contains($hasCreate, 'found'))" >
                        <xsl:call-template name="addGameLayerToList" />
                        </xsl:if>
                        </xsl:if>
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'SetNumberObjectVariable'" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //SetNumberObjectVariable - call
                    //index=<xsl:value-of select="$index" />
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index)) {
                        <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                        <xsl:if test="not(contains($hasCreate, 'found'))" >
                        <xsl:call-template name="addGameLayerToList" />
                        </xsl:if>
                        </xsl:if>
                    }
                </xsl:if>

            </xsl:for-each>
            
            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - 2
            <xsl:for-each select="actions" >
<!--                <xsl:variable name="nodeIdAsString" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>-->
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'Create'" >
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //Create - call - end
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
                                            ((GDGameLayer) gameLayerList.get(index2)).updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta);
                                        }
                                    } else {
                                        LogUtil.put(LogFactory.getInstance("updateGDObject failed: <xsl:for-each select="actions" ><xsl:if test="type/value = 'MettreX' or type/value = 'MettreY' or type/value = 'MettreXY' or type/value = 'SetAngle' or type/value = 'ChangePlan' or type/value = 'ChangeAnimation' or type/value = 'SetNumberObjectVariable'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayer </xsl:if></xsl:for-each></xsl:if></xsl:for-each>was null", this, commonStrings.PROCESS, new Exception()));
                                    }

                                }
            </xsl:if>
            </xsl:if>

                        }

            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - 3
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                
                <xsl:if test="type/value = 'Delete'" >
                    <xsl:if test="not(contains($caller, 'external'))" >
                    <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //Delete - call
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
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //ModVarGlobalTxt - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                </xsl:if>
                <xsl:if test="$typeValue = 'SetNumberVariable'" >                    
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //SetNumberVariable - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                </xsl:if>
                <xsl:if test="type/value = 'ModVarScene'" >
                    <xsl:if test="not(contains($caller, 'external'))" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //ModVarScene - call - 2
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>

            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - 3
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'TextObject::String'" >
                    //Action - //TextObject::String - call
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                </xsl:if>
            </xsl:for-each>

                        </xsl:if>

            </xsl:if>
                        
            </xsl:if>
            
            <xsl:variable name="alreadyUsedParentConditionAndHasConditions" >
            <xsl:if test="not(contains($hadConditionOtherThanThis, 'found')) or ($caller = 'conditionLayout - //eventsCreateAssignGDObject' and contains($hasCreate, 'found'))" >
            <xsl:if test="actions" >
            <xsl:if test="not(contains($alreadyUsedCondition, 'found'))" >
            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
            <xsl:if test="not(contains($alreadyUsedParentCondition, 'found'))" >
            <xsl:if test="conditions" >found</xsl:if>
            </xsl:if>
            </xsl:if>
            </xsl:if>
            </xsl:if>
            </xsl:if>
            </xsl:variable>
            
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
            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Actions - //lastCondition2
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //<xsl:value-of select="$typeValue" /> - //lastCondition2 - call
            <xsl:if test="type/value = 'Scene'" >
            //TWBTWB - hack
            </xsl:if>
            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
            </xsl:for-each>
            </xsl:if>

            <xsl:if test="contains($hasCondition, 'found') and contains($hadConditionOtherThanThis, 'found') and not(contains($hasUsedSoundPlayingCondition, 'found'))" >

            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Actions - 2 - START
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                <xsl:if test="contains($hasPauseTimer, 'found') or contains($hasResetTimer, 'found') or (contains($caller, 'eventsCreateAssignGDObject') and $typeValue = 'ModVarScene')" >
                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Actions - //<xsl:value-of select="type/value" />
                <xsl:if test="contains($caller, 'conditionLayout') or contains($caller, 'otherEventLayout')" >
                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                </xsl:if>
                <xsl:if test="not(contains($caller, 'conditionLayout') or contains($caller, 'otherEventLayout'))" >
                //TWBTWB - hack - remarked
                //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                </xsl:if>
                </xsl:if>

            </xsl:for-each>
            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Actions - 2 - END
            
            </xsl:if>

            <xsl:variable name="hasExcludedEventBefore" >
                <xsl:if test="not(contains($hasCondition, 'found'))" >
                    <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene'" >
                        <xsl:for-each select="events" ></xsl:for-each>
                    </xsl:if>
                    <xsl:if test="contains($caller, 'eventsCreateAssignGDObject')" >
                        <xsl:for-each select="events" >found</xsl:for-each>
                    </xsl:if>
                </xsl:if>

                <xsl:if test="contains($hasCondition, 'found')" >
                    <xsl:for-each select="conditions" >
                        <xsl:variable name="typeValue" select="type/value" />
                        <xsl:if test="($conditionPosition = '' and position() = 1) or position() = $conditionPosition + 1" >
                            <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                                <xsl:if test="type/value != 'DepartScene' and type/value != 'SoundPlaying' and (not(contains($caller, 'eventsCreateAssignGDObject') and type/value = 'NbObjet'))" >

                                    <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene'" >
                                        <xsl:for-each select="../events" >found</xsl:for-each>
                                    </xsl:if>

                                    <xsl:if test="contains($caller, 'eventsCreateAssignGDObject')" >
                                        <xsl:for-each select="../events" >found</xsl:for-each>
                                    </xsl:if>
            
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                
                <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene'" >
                    <xsl:if test="contains($caller, 'eventsCreateAssignGDObject')" >
                        <xsl:for-each select="events" >found</xsl:for-each>
                    </xsl:if>
            
                    <xsl:if test="contains($caller, 'eventsCreateAssignGDObject')" >
                        <xsl:for-each select="events" >found</xsl:for-each>
                    </xsl:if>

                </xsl:if>
            </xsl:variable>

            <xsl:variable name="isInsideCondiion" >
                <xsl:if test="not(contains($alreadyUsedCondition, 'found'))" >
                    <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
                        <xsl:for-each select="conditions" >
                            <xsl:variable name="typeValue" select="type/value" />
                            <xsl:if test="($conditionPosition = '' and position() = 1) or position() = $conditionPosition + 1" >
                                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                                    <xsl:if test="type/value != 'DepartScene' and type/value != 'SoundPlaying' and (not(contains($caller, 'eventsCreateAssignGDObject') and type/value = 'NbObjet'))" >
                                        <xsl:if test="type/value = 'VariableAsBoolean'" >found</xsl:if>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:if>
            </xsl:variable>
                        
            <xsl:variable name="noConditionWithAlreadyUsedConditionAndNotAlreadyUsedParentConditionWithoutCaller" >
            <xsl:if test="not(contains($hasCondition, 'found'))" >
            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene'" >found</xsl:if>
            </xsl:if>
            </xsl:variable>

            <xsl:variable name="conditionConditionWithCreate" >
            <xsl:if test="not(contains($hasCondition, 'found'))" >
            <xsl:if test="contains($caller, 'eventsCreateAssignGDObject')" >found</xsl:if>
            </xsl:if>
            </xsl:variable>

            <xsl:variable name="hasSpecificCondition" >
            <xsl:if test="contains($hasCondition, 'found')" >
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="($conditionPosition = '' and position() = 1) or position() = $conditionPosition + 1" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:if test="type/value != 'DepartScene' and type/value != 'SoundPlaying' and (not(contains($caller, 'eventsCreateAssignGDObject') and type/value = 'NbObjet'))" >
                <xsl:if test="contains($caller, 'eventsCreateAssignGDObject')" >found</xsl:if>
                </xsl:if>
                </xsl:if>
                </xsl:if>
            </xsl:for-each>
            </xsl:if>
            </xsl:variable>
 
            
            <xsl:variable name="hasConditionWithoutAlreadyUsedConditionAndOnceCondition" >
            <xsl:if test="contains($hasCondition, 'found')" >
            <xsl:if test="not(contains($alreadyUsedCondition, 'found'))" >
            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
            <xsl:if test="contains($alreadyUsedParentCondition, 'found')" >
            <xsl:if test="conditions" >found</xsl:if>
            </xsl:if>
            </xsl:if>

            </xsl:if>
            </xsl:if>
            </xsl:variable>

            <xsl:variable name="hasConditionWithoutAlreadyUsedConditionAndWithoutUsedParentConditionAndNotCaller" >
            <xsl:if test="contains($hasCondition, 'found')" >
            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene'" >found</xsl:if>
            </xsl:if>
            </xsl:variable>

            <xsl:for-each select="events" >

                <xsl:variable name="foundTotal" ><xsl:value-of select="$alreadyUsedParentConditionAndHasConditions" /><xsl:value-of select="$noConditionWithAlreadyUsedConditionAndNotAlreadyUsedParentConditionWithoutCaller" /><xsl:value-of select="$conditionConditionWithCreate" /><xsl:value-of select="$hasSpecificCondition" /><xsl:value-of select="$hasConditionWithoutAlreadyUsedConditionAndOnceCondition" /><xsl:value-of select="$hasConditionWithoutAlreadyUsedConditionAndWithoutUsedParentConditionAndNotCaller" /></xsl:variable>
                <xsl:if test="contains($foundTotal, 'foundfound')" >
                    //foundMoreThanOneTime=<xsl:value-of select="$alreadyUsedParentConditionAndHasConditions" />/<xsl:value-of select="$noConditionWithAlreadyUsedConditionAndNotAlreadyUsedParentConditionWithoutCaller" />/<xsl:value-of select="$conditionConditionWithCreate" />/<xsl:value-of select="$hasSpecificCondition" />/<xsl:value-of select="$hasConditionWithoutAlreadyUsedConditionAndOnceCondition" />/<xsl:value-of select="$hasConditionWithoutAlreadyUsedConditionAndWithoutUsedParentConditionAndNotCaller" />
                </xsl:if>
                
                            <xsl:if test="contains($alreadyUsedParentConditionAndHasConditions, 'found')" >
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link' and not(contains($caller, 'conditionLayout - //eventsCreateAssignGDObject'))" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Event - //<xsl:value-of select="type" /> - call
                            //Was not called before 2a
                            //index=<xsl:value-of select="$index" />
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                            </xsl:if>
                            </xsl:if>

                <xsl:if test="contains($noConditionWithAlreadyUsedConditionAndNotAlreadyUsedParentConditionWithoutCaller, 'found')" >
                //not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene' - START
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Event - //<xsl:value-of select="type" /> - call
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                            </xsl:if>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call - //hack
                            <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process(<xsl:value-of select="$index" />);
                            </xsl:if>
                //not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene' - END
                </xsl:if>

                <xsl:if test="contains($conditionConditionWithCreate, 'found')" >

<!--                //contains($caller, 'eventsCreateAssignGDObject') - START
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Event - //<xsl:value-of select="type" /> - call
                            //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                            </xsl:if>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call - //hack
                            <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>//globals.<xsl:value-of select="target" />GDNode.process(<xsl:value-of select="$index" />);
                            </xsl:if>
                //contains($caller, 'eventsCreateAssignGDObject') - END-->

                <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene'" >
                //maybe - not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene' - START
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Event - //<xsl:value-of select="type" /> - call
                            // maybe we should not call this here.1
                            //TWB not called anymore <xsl:value-of select="$caller" /> - //hackProcessing //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                            </xsl:if>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call - //hack
                            <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process(<xsl:value-of select="$index" />);
                            </xsl:if>
                //maybe - not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene' - END
                </xsl:if>

                </xsl:if>

                <xsl:if test="contains($hasSpecificCondition, 'found')" >
                //maybe - contains($caller, 'eventsCreateAssignGDObject') - START
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Event - //<xsl:value-of select="type" /> - call
                            // maybe we should not call this here.2
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                            </xsl:if>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call - //hack
                            <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process(<xsl:value-of select="$index" />);
                            </xsl:if>
                //maybe - contains($caller, 'eventsCreateAssignGDObject') - END
                </xsl:if>
                
                <xsl:if test="contains($hasConditionWithoutAlreadyUsedConditionAndOnceCondition, 'found')" >
                
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Event - //<xsl:value-of select="type" /> - call
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                            </xsl:if>

                </xsl:if>

                <xsl:if test="contains($hasConditionWithoutAlreadyUsedConditionAndWithoutUsedParentConditionAndNotCaller, 'found')" >
                //maybe - not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene' - START2
                            <xsl:variable name="foundLinkExternalEvent" ><xsl:for-each select="../../../externalEvents" >found</xsl:for-each></xsl:variable>
                            <xsl:variable name="allowedCondition" ><xsl:for-each select="../conditions" ><xsl:variable name="typeValue" select="type/value" /><xsl:if test="$typeValue = 'NumberVariable'" >found</xsl:if></xsl:for-each></xsl:variable>
                    
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Event - //<xsl:value-of select="type" /> - call
                            
                <xsl:if test="contains($hasExcludedEventBefore, 'found')" >
                    //has excluded event before
                    <xsl:if test="contains($isInsideCondiion, 'found')" >
                        //is inside condition
                        <xsl:if test="contains($hasCondition, 'found')" >
                            <xsl:if test="contains($hadConditionOtherThanThis, 'found')" >
                            //Was not called before 2b
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                            </xsl:if>
                        </xsl:if>
                    </xsl:if>
                </xsl:if>

                            <xsl:if test="contains($foundLinkExternalEvent, 'found') and contains($allowedCondition, 'found')" >
                            //External events call process() and not processGD
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                            </xsl:if>
                            <xsl:if test="not(contains($foundLinkExternalEvent, 'found') and contains($allowedCondition, 'found'))" >
                                <xsl:if test="not(contains($notAlreadyUsedConditionButWithSpecificAction, 'found') and type = 'BuiltinCommonInstructions::Standard') and contains($caller, 'conditionLayout - //eventsCreateAssignGDObject')" >
                            //Should we call these - //caller=<xsl:value-of select="$caller" /> - //hackProcessing2
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                                </xsl:if>
                                <xsl:if test="contains($notAlreadyUsedConditionButWithSpecificAction, 'found') and type = 'BuiltinCommonInstructions::Standard'" >
                            //I am now calling this2 - //<xsl:value-of select="type" />
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:value-of select="$index" />);
                                </xsl:if>
                            </xsl:if>
                            
                            </xsl:if>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call - //hack2
                            <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process(<xsl:value-of select="$index" />);
                            </xsl:if>
                //maybe - not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene' - END2                
                </xsl:if>
                
            </xsl:for-each>

            <xsl:if test="not(contains($alreadyUsedCondition, 'found'))" >
            //condition ending - //alreadyUsedCondition - not - //1 - START

            <xsl:if test="not(contains($alreadyUsedParentCondition, 'found'))" >
            //condition ending - //alreadyUsedParentCondition - not - START

            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
            //condition ending - //alreadyUsedCondition - not - //2 - START
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="($conditionPosition = '' and position() = 1) or position() = $conditionPosition + 1" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:if test="type/value != 'DepartScene' and type/value != 'SoundPlaying' and (not(contains($caller, 'eventsCreateAssignGDObject') and type/value = 'NbObjet'))" >
                //Condition - END
                }
                </xsl:if>
                </xsl:if>
                </xsl:if>
            </xsl:for-each>
            //condition ending - //alreadyUsedCondition - not - //2 - END
            </xsl:if>

            //condition ending - //alreadyUsedParentCondition - not - START
            </xsl:if>
                        
            <xsl:if test="contains($alreadyUsedParentCondition, 'found')" >
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                //Condition - END
                }
                </xsl:if>
            </xsl:for-each>
            </xsl:if>
            
            //condition ending - //alreadyUsedCondition - not - END
            </xsl:if>


                    } catch(Exception e) {
                    //1
                        LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />", this, commonStrings.PROCESS, e));
                    }

//hackProcessing - END
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

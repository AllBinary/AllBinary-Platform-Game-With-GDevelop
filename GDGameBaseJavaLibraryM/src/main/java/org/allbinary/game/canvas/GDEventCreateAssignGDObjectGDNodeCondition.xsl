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

    <xsl:import href="./GDObjectGDNodes.xsl" />
    
    <xsl:import href="./condition/GDOnceConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSoundPlayingConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSourisBoutonConditionGDNode.xsl" />
    <xsl:import href="./condition/GDLayerVisibleConditionGDNode.xsl" />
    <xsl:import href="./condition/GDKeyFromTextPressedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSystemInfoIsMobileConditionGDNode.xsl" />
    <xsl:import href="./condition/GDTimerConditionGDNode.xsl" />
    <xsl:import href="./condition/GDPosXConditionGDNode.xsl" />
    <xsl:import href="./condition/GDPosYConditionGDNode.xsl" />
    <xsl:import href="./condition/GDNbObjetConditionGDNode.xsl" />
    <xsl:import href="./condition/GDOpacityConditionGDNode.xsl" />
    <xsl:import href="./condition/GDVarObjetConditionGDNode.xsl" />
    <xsl:import href="./condition/GDVarSceneConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSourisSurObjetConditionGDNode.xsl" />

    <xsl:template name="eventsCreateAssignGDObjectGDNodesCondition" >
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

            <xsl:variable name="eventAsString" >
            private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />";
            <xsl:text>&#10;</xsl:text>
            </xsl:variable>

            <xsl:variable name="logString" >EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                        
            <!-- //Hackish - actionWithTextObjectString is probably bad idea -->
            <xsl:variable name="actionWithTextObjectString" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="$typeValue = 'TextObject::String'" >found:<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:if>
                </xsl:for-each>
            </xsl:variable>

            <xsl:variable name="hasAssociatedSiblingCondition" select="conditions/type/value = 'MouseButtonReleased' or conditions/type/value = 'SourisBouton' or conditions/type/value = 'VarScene' or conditions/type/value = 'Timer'" />
            <xsl:variable name="parentEventType" ><xsl:for-each select="../../events" ><xsl:value-of select="type" /></xsl:for-each></xsl:variable>
            <xsl:variable name="actionTypesAsString" ><xsl:for-each select="actions" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="type/value" />,</xsl:for-each></xsl:variable>
            <xsl:variable name="parametersAsString" ><xsl:for-each select="actions" ><xsl:for-each select="parameters" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="text()" />,</xsl:for-each></xsl:for-each></xsl:variable>

            <xsl:variable name="actionAsStringsStrings" >
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:if test="$typeValue != 'PauseTimer' and $typeValue != 'PlaySoundCanal'" >
                private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        </xsl:if>
                        <xsl:if test="$typeValue != 'ModVarScene' and $typeValue != 'AddForceAL' and $typeValue != 'PlaySoundCanal' and $typeValue != 'StopSoundCanal'" >
                private final String ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" /> at: ";
                        </xsl:if>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
            </xsl:variable>

            <xsl:variable name="thisNodeArray" >
                <xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" >globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:if></xsl:for-each>
            </xsl:variable>

            <xsl:variable name="eventsCreateProcessUsed" >
                <xsl:call-template name="eventsCreateProcessUsed" >
                    <xsl:with-param name="caller" >
                        <xsl:value-of select="$caller" />
                    </xsl:with-param>
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
            </xsl:variable>

            <!-- conditions - START -->
            <xsl:variable name="alreadyUsedCondition" ><xsl:for-each select="conditions" ><xsl:if test="(type/value = 'SourisSurObjet' or type/value = 'CollisionNP' or type/value = 'MouseButtonReleased' or type/value = 'SourisBouton' or type/value = 'KeyFromTextPressed' or type/value = 'KeyFromTextReleased')" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="conditionNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'CollisionNP'" >
                    //CollisionNP - condition is processed by the AllBinary collision processor
                </xsl:if>                
                <xsl:if test="$typeValue = 'VarObjet'" >
                    //VarObjet - condition is processed from eventsProcess
                </xsl:if>                
                <xsl:if test="$typeValue = 'NbObjet'" >
                    //NbObjet - some conditions are processed from eventsProcess?
                </xsl:if>
                <xsl:if test="$typeValue = 'DepartScene'" >
                    ////DepartScene - condition - eventsOnceConditionProcessActions
                </xsl:if>                
                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                    //SourisSurObjet - Handled by AllBinary Event Listeners
                </xsl:if>                
                <xsl:if test="$typeValue = 'MouseButtonReleased'" >
                    //MouseButtonReleased - Handled by AllBinary Event Listeners
                </xsl:if>
                <xsl:if test="$typeValue = 'SourisBouton'" >
                    //SourisBouton/MouseButtonPressed - Handled by AllBinary Event Listeners
                </xsl:if>
                <xsl:if test="$typeValue = 'BuiltinCommonInstructions::Once' and not(contains($alreadyUsedCondition, 'found'))" >
                    
                    <xsl:call-template name="onceConditionGDNode" />

                    <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                    <xsl:for-each select=".." >
                    <xsl:call-template name="addGDNodeToOnceList" >
                        <xsl:with-param name="iteration" >0</xsl:with-param>
                        <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                    </xsl:call-template>
                    </xsl:for-each>

                </xsl:if>
                <xsl:if test="$typeValue = 'SoundPlaying'" >
                    
                    <xsl:call-template name="soundPlayingConditionGDNode" />

                </xsl:if>
                <xsl:if test="$typeValue = 'SourisBouton'" >
                    
                    <xsl:call-template name="sourisBoutonConditionGDNode" />
                    
                </xsl:if>
                <xsl:if test="$typeValue = 'LayerVisible'" >
                    
                    <xsl:call-template name="layerVisibleConditionGDNode" />
                    
                </xsl:if>
                <xsl:if test="$typeValue = 'KeyFromTextPressed'" >
                    
                    <xsl:call-template name="keyFromTextPressedConditionGDNode" />

                </xsl:if>
                <xsl:if test="$typeValue = 'SystemInfo::IsMobile'" >
                    
                    <xsl:call-template name="systemInfoIsMobileConditionGDNode" />

                </xsl:if>
                
                <xsl:if test="$typeValue = 'Timer'" >
                    
                    <xsl:call-template name="timerConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                        <xsl:with-param name="thisNodeIndex" ><xsl:value-of select="$thisNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="thisNodeArray" ><xsl:value-of select="$thisNodeArray" /></xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="eventAsString" ><xsl:value-of select="$eventAsString" /></xsl:with-param>
                        <xsl:with-param name="actionAsStringsStrings" ><xsl:value-of select="$actionAsStringsStrings" /></xsl:with-param>
                        <xsl:with-param name="logString" ><xsl:value-of select="$logString" /></xsl:with-param>
                        <xsl:with-param name="eventsCreateProcessUsed" ><xsl:value-of select="$eventsCreateProcessUsed" /></xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:if>
                <xsl:if test="$typeValue = 'PosX'" >

                    <xsl:call-template name="posXConditionGDNode" />

                </xsl:if>
                <xsl:if test="$typeValue = 'PosY'" >
                    
                    <xsl:call-template name="posYConditionGDNode" />

                </xsl:if>
                <xsl:if test="$typeValue = 'NbObjet'" >
                    
                    <xsl:call-template name="nbObjetConditionGDNode" >
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:if>
                <xsl:if test="$typeValue = 'Opacity'" >
                    
                    <xsl:call-template name="opacityConditionGDNode" />

                </xsl:if>
                <xsl:if test="$typeValue = 'VarObjet'" >
                    
                    <xsl:call-template name="varObjetConditionGDNode" />

                </xsl:if>
                <xsl:if test="$typeValue = 'VarScene'" >
                    
                    <xsl:call-template name="varSceneCnditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="actionAsStringsStrings" ><xsl:value-of select="$actionAsStringsStrings" /></xsl:with-param>
                    </xsl:call-template>

                </xsl:if>                
                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                    
                    <xsl:call-template name="sourisSurObjetConditionGDNode" >
                    </xsl:call-template>
                    
                </xsl:if>
                
            </xsl:for-each>
            <!-- conditions - END -->

            <xsl:call-template name="eventsCreateAssignGDObjectGDNodesCondition" >
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

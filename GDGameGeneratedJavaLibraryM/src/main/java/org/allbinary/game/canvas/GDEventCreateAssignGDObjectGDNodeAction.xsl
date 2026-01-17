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

    <xsl:import href="./action/GDTextContainerCapabilityTextContainerBehaviorSetValueActionProcess.xsl" />
    <xsl:import href="./action/GDTextObjectStringActionProcess.xsl" />
    <xsl:import href="./action/GDTextObjectChangeColorActionProcess.xsl" />

    <xsl:import href="./action/GDTextEntryObjectActionProcess.xsl" />

    <xsl:import href="./action/GDChangeAnimationActionProcess.xsl" />
    <xsl:import href="./action/GDAnimationSetIndexActionProcess.xsl" />
    <xsl:import href="./action/GDAnimationSetNameActionProcess.xsl" />
    <xsl:import href="./action/GDAnimationSetSpeedScaleActionProcess.xsl" />
    <xsl:import href="./action/GDAnimationSetFrameActionProcess.xsl" />
    <xsl:import href="./action/GDSetNumberObjectVariableActionProcess.xsl" />
    <xsl:import href="./action/GDModVarObjetTxtActionProcess.xsl" />
    <xsl:import href="./action/GDModVarSceneTxtActionProcess.xsl" />
    
    <xsl:import href="./action/GDLinkedObjectsLinkObjectsActionProcess.xsl" />
    
    <xsl:import href="./action/GDObjectVariablePushNumberActionProcess.xsl" />

    <xsl:import href="./action/GDHideLayerActionProcess.xsl" />
    <xsl:import href="./action/GDMontreToShowActionProcess.xsl" />
    <xsl:import href="./action/GDCacheToHideActionProcess.xsl" />
    
    <xsl:import href="./action/GDPlayMusicActionProcess.xsl" />
    <xsl:import href="./action/GDPlayMusicCanalActionProcess.xsl" />
    <xsl:import href="./action/GDStopMusicCanalActionProcess.xsl" />

    <xsl:import href="./action/GDPlaySoundActionProcess.xsl" />
    <xsl:import href="./action/GDPlaySoundCanalActionProcess.xsl" />
    <xsl:import href="./action/GDStopSoundCanalActionProcess.xsl" />
    
    <xsl:import href="./action/GDResetTimerActionProcess.xsl" />

    <xsl:import href="./action/GDPauseTimerActionProcess.xsl" />
    <xsl:import href="./action/GDUnPauseTimerActionProcess.xsl" />
    
    <xsl:import href="./action/GDResetObjectTimerActionProcess.xsl" />

    <xsl:import href="./action/GDOpacityActionProcess.xsl" />
    <xsl:import href="./action/GDCreateActionProcess.xsl" />
    <xsl:import href="./action/GDCreateByNameActionProcess.xsl" />
    <xsl:import href="./action/GDSetAngleActionProcess.xsl" />
    <xsl:import href="./action/GDChangePlanActionProcess.xsl" />
    <xsl:import href="./action/GDChangeColorActionProcess.xsl" />
    <xsl:import href="./action/GDLeaderboardsSavePlayerScoreActionProcess.xsl" />
    <xsl:import href="./action/GDSceneActionProcess.xsl" />
    <xsl:import href="./action/GDMettreXActionProcess.xsl" />
    <xsl:import href="./action/GDMettreYActionProcess.xsl" />
    <xsl:import href="./action/GDMettreXYActionProcess.xsl" />
    <xsl:import href="./action/GDMettreAutourPosActionProcess.xsl" />
    <xsl:import href="./action/GDModVarGlobalActionProcess.xsl" />
    <xsl:import href="./action/GDModVarSceneActionProcess.xsl" />
    <xsl:import href="./action/GDDeleteActionProcess.xsl" />
    <xsl:import href="./action/GDAddForceALActionProcess.xsl" />
    <xsl:import href="./action/GDAddForceXYActionProcess.xsl" />
    <xsl:import href="./action/GDQuitActionProcess.xsl" />
    <xsl:import href="./action/GDSetGlobalVariableAsBooleanActionProcess.xsl" />
    <xsl:import href="./action/SetFullScreenActionProcess.xsl" />
    <xsl:import href="./action/GDSetObjectVariableAsBooleanActionProcess.xsl" />
    <xsl:import href="./action/GDSetSceneVariableAsBooleanActionProcess.xsl" />
    <xsl:import href="./action/GDJSONToVariableStructureActionProcess.xsl" />
    <xsl:import href="./action/GDRotateActionProcess.xsl" />
    <xsl:import href="./action/GDRotateTowardPositionActionProcess.xsl" />
    <xsl:import href="./action/GDChangeScaleActionProcess.xsl" />
    <xsl:import href="./action/GDScalableBehaviorSetValueActionProcess.xsl" />
    <xsl:import href="./action/GDScalableBehaviorSetXActionProcess.xsl" />
    <xsl:import href="./action/GDScalableBehaviorSetYActionProcess.xsl" />
    <xsl:import href="./action/GDActivateBehaviorActionProcess.xsl" />
    <xsl:import href="./action/GDPathfindingBehaviorSetDestinationActionProcess.xsl" />
    <xsl:import href="./action/GDSceneBackgroundActionProcess.xsl" />
    <xsl:import href="./action/GDPrimitiveDrawingFillColorActionProcess.xsl" />
    <xsl:import href="./action/GDPrimitiveDrawingRectangleActionProcess.xsl" />
    <xsl:import href="./action/GDEcrireFichierTxtSaveJSONActionProcess.xsl" />
    <xsl:import href="./action/GDLireFichierTxtLoadJSONActionProcess.xsl" />
    <xsl:import href="./action/GDJSONToGlobalVariableStructureActionProcess.xsl" />
    <xsl:import href="./action/GDPanelSpriteSliderPanelSpriteSliderSetValueActionProcess.xsl" />
    <xsl:import href="./action/GDTextInputVirtualKeyboardTextInputVirtualKeyboardOpenKeyboardActionProcess.xsl" />
    <xsl:import href="./action/GDTextInputVirtualKeyboardTextInputVirtualKeyboardCloseKeyboardActionProcess.xsl" />
    
    <xsl:template name="eventsCreateAssignGDObjectGDNodesAction" >
        <xsl:param name="caller" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="conditionEventPosition" />
         
        <xsl:variable name="quote" >"</xsl:variable>
        
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />

            <xsl:variable name="eventAsString" >
            //1
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

            <xsl:variable name="hasAssociatedSiblingCondition" select="conditions/type/value = 'MouseButtonReleased' or conditions/type/value = 'MouseButtonFromTextReleased' or conditions/type/value = 'SourisBouton' or conditions/type/value = 'MouseButtonPressed' or conditions/type/value = 'MouseButtonFromTextPressed' or conditions/type/value = 'VarScene' or conditions/type/value = 'Timer'" />
            <xsl:variable name="actionTypesAsString" ><xsl:for-each select="actions" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="type/value" />,</xsl:for-each></xsl:variable>

            <xsl:variable name="actionAsStringsStrings" >
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        <xsl:if test="not($typeValue = 'PauseTimer' or $typeValue = 'PlaySoundCanal' or $typeValue = 'PlaySoundOnChannel')" >
                //GDNode - Strings 3
                private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                //private final String ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" /> at: ";
                //private final String ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "processGD - " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;
                        </xsl:if>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
            </xsl:variable>

            <xsl:variable name="thisNodeArray" >
                <xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" >gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:if></xsl:for-each>
            </xsl:variable>

            <!-- actions - START -->
            <xsl:for-each select="actions" >
                <xsl:variable name="nodeIdAsString" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                <xsl:variable name="thisNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />
                <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                <xsl:text>&#10;</xsl:text>

                    //Action - GDNode - for Condition totalRecursions=<xsl:value-of select="$totalRecursions" /> eventPosition=<xsl:value-of select="$eventPosition" /> conditionEventPosition=<xsl:value-of select="$conditionEventPosition" /> hasAssociatedSiblingCondition=<xsl:value-of select="$hasAssociatedSiblingCondition" />
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }

                    <xsl:variable name="selectedNodeId" select="number(substring(generate-id(), 2) - 65536)" />
                    <xsl:variable name="lastDigit" ><xsl:value-of select="substring($selectedNodeId, string-length($selectedNodeId))" /></xsl:variable>
                    <xsl:variable name="lastDigit2" ><xsl:if test="4 >= $lastDigit" >0</xsl:if><xsl:if test="$lastDigit > 4" >1</xsl:if></xsl:variable>
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = org.allbinary.game.canvas.node.action.GD<xsl:value-of select="$layoutIndex" /><xsl:if test="$caller = 'externalEventsCreateAssignGDObject'" >External</xsl:if>Action<xsl:value-of select="$lastDigit2" />GDNodes.getInstance().NODE_<xsl:value-of select="$selectedNodeId" />;

            </xsl:for-each>
            <!-- actions - END -->

            <xsl:call-template name="eventsCreateAssignGDObjectGDNodesAction" >
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
                <xsl:with-param name="objectsGroupsAsString" >
                    <xsl:value-of select="$objectsGroupsAsString" />
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

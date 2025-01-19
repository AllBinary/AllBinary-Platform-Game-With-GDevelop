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
    
    <xsl:template name="actionGDNodeIdList" >
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

            <xsl:for-each select="actions" >
<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /><xsl:text> </xsl:text>
            </xsl:for-each>

            <xsl:call-template name="actionGDNodeIdList" >
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

            </xsl:call-template>

        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>

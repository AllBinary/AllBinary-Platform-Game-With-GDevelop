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

    <xsl:import href="./condition/GDLeaderboardsIsLeaderboardViewLoadedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDTextContainerCapabilityTextContainerBehaviorValueConditionGDNode.xsl" />
    <xsl:import href="./condition/GDOnceConditionGDNode.xsl" />
    <xsl:import href="./condition/GDAlwaysConditionGDNode.xsl" />
    <xsl:import href="./condition/GDLinkedObjectsPickObjectsLinkedToConditionGDNode.xsl" />
    <xsl:import href="./condition/GDOrConditionGDNode.xsl" />
    <xsl:import href="./condition/GDAndConditionGDNode.xsl" />
    <xsl:import href="./condition/GDMusicPlayingConditionGDNode.xsl" />
    <xsl:import href="./condition/GDMusicStoppedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSoundPlayingConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSoundStoppedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSoundPausedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDLayerVisibleConditionGDNode.xsl" />
    <xsl:import href="./condition/GDBehaviorActivatedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDKeyFromTextPressedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDKeyFromTextReleasedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDAnyKeyReleasedConditionGDNodeConditionGDNode.xsl" />
    <xsl:import href="./condition/GDKeyPressedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDKeyReleasedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSystemInfoIsMobileConditionGDNode.xsl" />
    <xsl:import href="./condition/GDTimerConditionGDNode.xsl" />
    <xsl:import href="./condition/GDObjectTimerConditionGDNode.xsl" />
    <xsl:import href="./condition/GDPosXConditionGDNode.xsl" />
    <xsl:import href="./condition/GDPosYConditionGDNode.xsl" />
    <xsl:import href="./condition/GDNbObjetConditionGDNode.xsl" />
    <xsl:import href="./condition/GDOpacityConditionGDNode.xsl" />
    <xsl:import href="./condition/GDObjectVariableChildCountConditionGDNode.xsl" />
    <xsl:import href="./condition/GDVarGlobalConditionGDNode.xsl" />
    <xsl:import href="./condition/GDNumberObjectVariableConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSceneInstancesCountConditionGDNode.xsl" />
    <xsl:import href="./condition/GDGlobalVariableAsBooleanConditionGDNode.xsl" />
    <xsl:import href="./condition/GDVarSceneConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSourisSurObjetConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSourisBoutonConditionGDNode.xsl" />
    <xsl:import href="./condition/GDMouseButtonPressedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDMouseButtonReleasedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDDepartSceneConditionGDNode.xsl" />
    <xsl:import href="./condition/GDNumberVariableConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSceneVariableAsBooleanConditionGDNode.xsl" />
    <xsl:import href="./condition/GDPopStartedTouchConditionGDNode.xsl" />
    <xsl:import href="./condition/GDPopEndedTouchConditionGDNode.xsl" />
    <xsl:import href="./condition/GDVelocityConditionGDNode.xsl" />
    <xsl:import href="./condition/GDObjectVariableAsBooleanConditionGDNode.xsl" />
    <xsl:import href="./condition/GDDistanceConditionGDNode.xsl" />
    <xsl:import href="./condition/GDCompareNumbersConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSpriteMultitouchJoystickIsPressedConditionProcess.xsl" />
    <xsl:import href="./condition/GDPanelSpriteSliderPanelSpriteSliderValueConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSystemInfoIsNativeDesktopAppConditionGDNode.xsl" />

    <xsl:import href="./condition/GDAnimationHasAnimationEndedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDAnimationElapsedTimeConditionGDNode.xsl" />
    
    <xsl:template name="eventsCreateAssignGDObjectGDNodesCondition2" >
        <xsl:param name="caller" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="conditionEventPosition" />
        <xsl:param name="hasParentOnceCondition" />
        <xsl:param name="alreadyUsedCondition" />
        <xsl:param name="thisNodeArray" />
        <xsl:param name="eventAsString" />
        <xsl:param name="actionAsStringsStrings" />
        <xsl:param name="logString" />
        <xsl:param name="eventsCreateProcessUsed" />
        <xsl:param name="parentEventType" />

                <xsl:variable name="nodeList" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                <xsl:variable name="conditionNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />

                <xsl:if test="$typeValue = 'Leaderboards::IsLeaderboardViewLoaded'" >
                    
                    <xsl:call-template name="leaderboardsIsLeaderboardViewLoadedConditionGDNode" />
                    
                </xsl:if>
                
                <xsl:if test="$typeValue = 'TextContainerCapability::TextContainerBehavior::Value'" >

                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
<!--                    <xsl:call-template name="textContainerCapabilityTextContainerBehaviorValueConditionGDNode" />-->

                </xsl:if>
                <xsl:if test="$typeValue = 'Inventory::Count'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Inventory::Has'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Inventory::IsFull'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Inventory::IsEquipped'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'SystemInfo::IsMobile'" >
                    
                    <xsl:call-template name="systemInfoIsMobileConditionGDNode" />

                </xsl:if>
                <xsl:if test="$typeValue = 'SystemInfo::IsNativeMobileApp'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'SystemInfo::IsNativeDesktopApp'" >
                    
                    <xsl:call-template name="systemInfoIsNativeDesktopAppConditionGDNode" />
                    
                </xsl:if>
                <xsl:if test="$typeValue = 'SystemInfo::IsWebGLSupported'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'SystemInfo::IsPreview'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'SystemInfo::HasTouchScreen'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'GetArgumentAsBoolean'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'CompareArgumentAsNumber'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'CompareArgumentAsString'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'MusicPlaying'" >

                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    <xsl:call-template name="musicPlayingConditionGDNode" />

                </xsl:if>
                <xsl:if test="$typeValue = 'MusicPaused'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'MusicStopped'" >
                    
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    <xsl:call-template name="soundStoppedConditionGDNode" />
                    
                </xsl:if>
                <xsl:if test="$typeValue = 'SoundPlaying'" >
                    
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    <xsl:call-template name="soundPlayingConditionGDNode" />

                </xsl:if>
                <xsl:if test="$typeValue = 'SoundPaused'" >
                    
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    <xsl:call-template name="soundPausedConditionGDNode" />
                    
                </xsl:if>
                <xsl:if test="$typeValue = 'SoundStopped'" >
                    
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    <xsl:call-template name="soundStoppedConditionGDNode" />
                    
                </xsl:if>                        
                <xsl:if test="$typeValue = 'GlobalVolume'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'SoundCanalVolume'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'MusicCanalVolume'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'SoundChannelPlayingOffset'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'MusicChannelPlayingOffset'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'SoundChannelPitch'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'MusicChannelPitch'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Width'" >                    
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Height'" >                    
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'AnimationName'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Sprite'" >    
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'AnimStopped'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'AnimationEnded'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'AnimationEnded2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ScaleWidth'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ScaleHeight'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Opacity'" >
                    
                    <xsl:call-template name="opacityConditionGDNode" />

                </xsl:if>

                <xsl:if test="$typeValue = 'LinkedObjects::PickObjectsLinkedTo'" >

                    <xsl:call-template name="linkedObjectsPickObjectsLinkedToConditionGDNode" >
                        <xsl:with-param name="parametersAsString" >
                            <xsl:value-of select="$parametersAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:if>        

                <xsl:if test="$typeValue = 'FlippedX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'FlippedY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'PrimitiveDrawing::ClearBetweenFrames'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'PrimitiveDrawing::OutlineSize'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                
                <xsl:if test="$typeValue = 'PrimitiveDrawing::FillOpacity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'PrimitiveDrawing::OutlineOpacity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'PrimitiveDrawing::AreCoordinatesRelative'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                        
                <xsl:if test="$typeValue = 'PrimitiveDrawing::ScaleX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
        
                <xsl:if test="$typeValue = 'PrimitiveDrawing::ScaleY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                
                <xsl:if test="$typeValue = 'PrimitiveDrawing::FlippedX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                    
                <xsl:if test="$typeValue = 'PrimitiveDrawing::FlippedY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'PrimitiveDrawing::CheckAntialiasing'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'PosX'" >

                    <xsl:call-template name="posXConditionGDNode" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:if>
                <xsl:if test="$typeValue = 'PosY'" >
                    
                    <xsl:call-template name="posYConditionGDNode" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:if>

                <xsl:if test="$typeValue = 'ObjectVariableChildExists'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Angle'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Plan'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Layer'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Visible'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Invisible'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Arret'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'Vitesse'" >
                    <xsl:call-template name="velocityConditionGDNode" />
                </xsl:if>

                <xsl:if test="$typeValue = 'AngleOfDisplacement'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                    
                    <xsl:if test="$typeValue = 'NbObjet'" >
                        //NbObjet - some are processed from eventsProcess
                        <xsl:call-template name="nbObjetConditionGDNode" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="caller" >
                                <xsl:value-of select="$caller" />
                            </xsl:with-param>
                            <xsl:with-param name="conditionNodeIndex" >
                                <xsl:value-of select="$conditionNodeIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="thisNodeIndex" >
                                <xsl:value-of select="$thisNodeIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="objectsAsString" >
                                <xsl:value-of select="$objectsAsString" />
                            </xsl:with-param>
                            <xsl:with-param name="createdObjectsAsString" >
                                <xsl:value-of select="$createdObjectsAsString" />
                            </xsl:with-param>
                            <xsl:with-param name="parametersAsString" >
                                <xsl:value-of select="$parametersAsString" />
                            </xsl:with-param>
                        
                        </xsl:call-template>

                    </xsl:if>

                    <xsl:if test="$typeValue = 'SceneInstancesCount'" >
                        
                        <xsl:call-template name="sceneInstancesCountConditionGDNode" />

                    </xsl:if>
                    <xsl:if test="$typeValue = 'PickedInstancesCount'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = '(Used when using the AllBinary Collision Processing) CollisionNP'" >
                        //CollisionNP - condition is processed by the AllBinary collision processor
                    </xsl:if>                
                    <xsl:if test="$typeValue = 'CollisionNP'" >
                        //CollisionNP - ?
                        <xsl:call-template name="collisionNPConditionGDNode" >
                            <xsl:with-param name="nodeList" ><xsl:value-of select="$nodeList" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>                
                    <xsl:if test="$typeValue = 'Raycast'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'RaycastToPosition'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'Distance'" >
                        
                        <xsl:call-template name="distanceConditionGDNode" >
                            <xsl:with-param name="parametersAsString" >
                                <xsl:value-of select="$parametersAsString" />
                            </xsl:with-param>
                        </xsl:call-template>
                        
                    </xsl:if>
                    <xsl:if test="$typeValue = 'SeDirige'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'EstTourne'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                        
                <xsl:if test="$typeValue = 'VarObjetTxt'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'BooleanObjectVariable'" >
                        <xsl:call-template name="objectVariableAsBooleanConditionGDNode" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                        </xsl:call-template>
                </xsl:if>

                <xsl:if test="$typeValue = 'VarObjetDef'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'BehaviorActivated'" >
                        <xsl:call-template name="behaviorActivatedConditionGDNode" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                        </xsl:call-template>
                </xsl:if>
                <xsl:if test="$typeValue = 'CollisionPoint'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                        
                    <xsl:if test="$typeValue = 'SourisSurObjet'" >
                        //SourisSurObjet - Some are Handled by AllBinary Event Listeners?
                        <xsl:call-template name="sourisSurObjetConditionGDNode" >
                        </xsl:call-template>
                    
                    </xsl:if>
                
                    <xsl:if test="$typeValue = 'AjoutObjConcern'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'AjoutHasard'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                            </xsl:if>
                    <xsl:if test="$typeValue = 'PickNearest'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>

                    <xsl:if test="$typeValue = 'CameraX'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'CameraY'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'CameraCenterX'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'CameraCenterY'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'CameraWidth'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'CameraHeight'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'CameraBorderLeft'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'CameraBorderRight'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'CameraBorderTop'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'CameraBorderBottom'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>                        
                <xsl:if test="$typeValue = 'LayerVisible'" >
                    
                    <xsl:call-template name="layerVisibleConditionGDNode" />
                    
                </xsl:if>                
                    <xsl:if test="$typeValue = 'CameraAngle'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'LayerEffectEnabled'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'LayerTimeScale'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'LayerDefaultZOrder'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>

                    <xsl:if test="$typeValue = 'Toujours'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>

                    <xsl:if test="$typeValue = 'BuiltinCommonInstructions::Always'" >
                        <xsl:call-template name="alwaysConditionGDNode" >
                            <xsl:with-param name="parametersAsString" >
                                <xsl:value-of select="$parametersAsString" />
                            </xsl:with-param>
                            <xsl:with-param name="parentEventType" >
                                <xsl:value-of select="$parentEventType" />
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>

                    //xsl:if test="$typeValue = 'Egal'"
                    //xsl:if test="$typeValue = 'StrEqual'" 
                    
                    <xsl:if test="$typeValue = 'BuiltinCommonInstructions::CompareNumbers'" >

                        <xsl:call-template name="compareNumbersConditionGDNode" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="parametersAsString" >
                                <xsl:value-of select="$parametersAsString" />
                            </xsl:with-param>
                            <xsl:with-param name="objectsGroupsAsString" >
                                <xsl:value-of select="$objectsGroupsAsString" />
                            </xsl:with-param>
                            <xsl:with-param name="createdObjectsAsString" >
                                <xsl:value-of select="$createdObjectsAsString" />
                            </xsl:with-param>
                        </xsl:call-template>

                    </xsl:if>
  
                    <xsl:if test="$typeValue = 'BuiltinCommonInstructions::CompareStrings'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
      
                    <xsl:if test="$typeValue = 'BuiltinCommonInstructions::Or'" >
                        <xsl:call-template name="orConditionGDNode" />
                    </xsl:if>
                    <xsl:if test="$typeValue = 'BuiltinCommonInstructions::And'" >
                        <xsl:call-template name="andConditionGDNode" />
                    </xsl:if>
                    <xsl:if test="$typeValue = 'BuiltinCommonInstructions::Not'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'BuiltinCommonInstructions::Once' and not(contains($alreadyUsedCondition, 'found'))" >
                    
                        <xsl:call-template name="onceConditionGDNode" />

                        <xsl:variable name="nodeId" >
                            <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />
                        </xsl:variable>
                        <xsl:for-each select=".." >
                            <xsl:call-template name="addGDNodeToOnceList" >
                                <xsl:with-param name="iteration" >0</xsl:with-param>
                                <xsl:with-param name="nodeId" >
                                    <xsl:value-of select="$nodeId" />
                                </xsl:with-param>
                                <xsl:with-param name="objectsAsString" >
                                    <xsl:value-of select="$objectsAsString" />
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>

                    </xsl:if>

                <xsl:if test="$typeValue = 'GroupExists'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'KeyPressed'" >
                    
                    <xsl:call-template name="keyPressedConditionGDNode" />

                </xsl:if>
                <xsl:if test="$typeValue = 'KeyReleased'" >
                    
                    <xsl:call-template name="keyFromTextReleasedConditionGDNode" />

                </xsl:if>
                <xsl:if test="$typeValue = 'KeyFromTextPressed'" >
                    
                    <xsl:call-template name="keyFromTextPressedConditionGDNode" />

                </xsl:if>
                <xsl:if test="$typeValue = 'KeyFromTextReleased'" >
                    
                    <xsl:call-template name="keyFromTextReleasedConditionGDNode" />

                </xsl:if>
                    <xsl:if test="$typeValue = 'AnyKeyPressed'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'AnyKeyReleased'" >

                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
<!--                        <xsl:call-template name="anyKeyReleasedConditionGDNode" />-->

                    </xsl:if>

                    <xsl:if test="$typeValue = 'CursorX'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'CursorY'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'MouseOnlyOnlyCursorX'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'MouseOnlyCursorY'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'MouseX'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'MouseY'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    
                    <xsl:if test="$typeValue = 'IsMouseInsideCanvas'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'SourisX'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>
                    <xsl:if test="$typeValue = 'SourisY'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:if>

                    <xsl:if test="$typeValue = 'MouseButtonPressed'" >
                        //MouseButtonPressed - Some Handled by AllBinary Event Listeners? should have as a sub condition //SourisSurObjet
                        <xsl:call-template name="mouseButtonPressedConditionGDNode" >
                            <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodesCondition</xsl:with-param>
                            <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                            <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>

                    <xsl:if test="$typeValue = 'SourisBouton'" >
                        //MouseButton - //SourisBouton - Some Handled by AllBinary Event Listeners? This is currently for single button press without continued processing until release
                        <xsl:call-template name="sourisBoutonConditionGDNode" >
                            <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodesCondition</xsl:with-param>
                            <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                            <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        </xsl:call-template>
                    
                    </xsl:if>
                
                    <xsl:if test="$typeValue = 'MouseButtonReleased'" >
                        //MouseButtonReleased - Some Handled by AllBinary Event Listeners?
                        <xsl:call-template name="mouseButtonReleasedConditionGDNode" />
                    
                    </xsl:if>
                
                <xsl:if test="$typeValue = 'MouseButtonFromTextPressed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'MouseButtonFromTextReleased'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsMouseWheelScrollingUp'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsMouseWheelScrollingDown'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>                
                <xsl:if test="$typeValue = 'PopStartedTouch'" >
                    
                    <xsl:call-template name="popStartedTouchConditionGDNode" >
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodesCondition</xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                    </xsl:call-template>

                </xsl:if>

                <xsl:if test="$typeValue = 'PopEndedTouch'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'TouchX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'TouchY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'HasAnyTouchStarted'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'HasAnyTouchOrMouseStarted'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'HasTouchEnded'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Dragged'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Dropped'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'PickObjectsLinkedTo'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'EmitterAngle'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'EmitterAngleA'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'EmitterAngleB'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ConeSprayAngle'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ZoneRadius'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ParticleGravityAngle'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ParticleGravityLength'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'ParticleRed1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ParticleRed2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ParticleBlue1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ParticleBlue2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ParticleGreen1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ParticleGreen2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ParticleSize1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ParticleSize2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ParticleAlpha1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ParticleAlpha2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'NoMoreParticles'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'RendererParam1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'RendererParam2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Tank'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Flow'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Texture'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
  
                <xsl:if test="$typeValue = 'PathFound'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'DestinationReached'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'CellWidth'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'CellHeight'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'AngleOffset'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ExtraBorder'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'DiagonalsAllowed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ObjectRotated'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Cost'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsImpassable'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'IsDynamic'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsFixedRotation'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsBullet'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'LinearVelocity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'AngularVelocity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'LinearDamping'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'CollisionWith'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'AngularDamping'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
    
                <xsl:if test="$typeValue = 'IsMoving'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsOnFloor'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsOnLadder'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsJumping'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsGrabbingPlatform'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Gravity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'MaxFallingSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'LadderClimbingSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'JumpSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'CanJump'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'CanGrabPlatforms'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'CurrentFallSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'CurrentJumpSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsObjectOnGivenFloor'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'OutlineSize'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'FillOpacity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'OutlineOpacity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'CheckAntialiasing'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'DepartScene'" >
                    
                    <xsl:if test="$hasParentOnceCondition = 'true'" >
                    //DepartScene - condition - eventsOnceConditionProcessActions    
                    </xsl:if>
                    <xsl:if test="$hasParentOnceCondition != 'true'" >
                        <xsl:call-template name="departSceneConditionGDNode" />
                    </xsl:if>

                </xsl:if>                

                <xsl:if test="$typeValue = 'SceneJustResumed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'HasGameJustResumed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'DoesSceneExist'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'Collision'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'Timer'" >
                    
                    <xsl:call-template name="timerConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
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
                <xsl:if test="$typeValue = 'ObjectTimer'" >
                    
                    //Depricated
                    <xsl:call-template name="objectTimerConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
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
                
                <xsl:if test="$typeValue = 'CompareTimer'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'TimerPaused'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'TimeScale'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'VarScene'" >

                    <xsl:call-template name="varSceneCnditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="actionAsStringsStrings" ><xsl:value-of select="$actionAsStringsStrings" /></xsl:with-param>
                    </xsl:call-template>

                </xsl:if>                

                <xsl:if test="$typeValue = 'VarSceneTxt'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'BooleanVariable'" >
                    
                    <xsl:call-template name="sceneVariableAsBooleanConditionGDNode" >
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>

                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="thisNodeIndex" ><xsl:value-of select="$thisNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                                                
                        <xsl:with-param name="thisNodeArray" >this</xsl:with-param>                    
                        <xsl:with-param name="conditionPosition" ><xsl:value-of select="position()" /></xsl:with-param>
                        <xsl:with-param name="logString" >CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:with-param>

                    </xsl:call-template>
                    
                </xsl:if>
                
                <xsl:if test="$typeValue = 'NumberVariable'" >
                    <xsl:call-template name="numberVariableConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="actionAsStringsStrings" ><xsl:value-of select="$actionAsStringsStrings" /></xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
                
                <xsl:if test="$typeValue = 'VarGlobal'" >
                    <xsl:call-template name="varGlobalConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="actionAsStringsStrings" ><xsl:value-of select="$actionAsStringsStrings" /></xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
                
                <xsl:if test="$typeValue = 'VarGlobalTxt'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'GlobalVariableAsBoolean'" >
                    <xsl:call-template name="globalVariableAsBooleanConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="actionAsStringsStrings" ><xsl:value-of select="$actionAsStringsStrings" /></xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
                <xsl:if test="$typeValue = 'VarSceneDef'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'VarGlobalDef'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ObjectVariableChildCount'" >
                    <xsl:call-template name="objectVariableChildCountConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="actionAsStringsStrings" ><xsl:value-of select="$actionAsStringsStrings" /></xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
                <xsl:if test="$typeValue = 'SceneVariableChildCount'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'GlobalVariableChildCount'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'VariableChildExists'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'GlobalVariableChildExists'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'IsFullScreen'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'IsNativeMobileApp'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsNativeDesktopApp'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsWebGLSupported'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'FileExists'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>                                                                                             

                //Was VarObjet
                <xsl:if test="$typeValue = 'NumberObjectVariable' or $typeValue = 'VarObjet'" >

                    //NumberObjectVariable - some are processed from eventsProcess
                    <xsl:call-template name="numberObjectVariableConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:if>

                <xsl:if test="$typeValue = 'ObjectTimerPaused'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsEffectEnabled'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'Activated'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <xsl:if test="$typeValue = 'String'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ScaleX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'ScaleY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Smoothed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsBold'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsItalic'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsUnderlined'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Padding'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'TextAlignment'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'IsWrapping'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'WrappingWidth'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Acceleration'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Deceleration'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'MaxSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'Speed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'AngularMaxSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'XVelocity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>
                <xsl:if test="$typeValue = 'YVelocity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:if>

                <!-- Extension Actions below here -->
                <xsl:if test="$typeValue = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick::IsPressed'" >
                    
                    <xsl:call-template name="spriteMultitouchJoystickIsPressedActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:if>

                <xsl:if test="$typeValue = 'PanelSpriteSlider::PanelSpriteSlider::Value'" >

                    <xsl:call-template name="panelSpriteSliderPanelSpriteSliderValueConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="thisNodeIndex" ><xsl:value-of select="$thisNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:if>

                <xsl:if test="$typeValue = 'AnimatableCapability::AnimatableBehavior::HasAnimationEnded'" >
                    <xsl:call-template name="animatableCapabilityAnimatableBehaviorHasAnimationEndedConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
                <xsl:if test="$typeValue = 'AnimatableCapability::AnimatableBehavior::ElapsedTime'" >
                    <xsl:call-template name="animatableCapabilityAnimatableBehaviorElapsedTimeConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                    </xsl:call-template>
                </xsl:if>

    </xsl:template>

    <xsl:template name="eventsCreateAssignGDObjectGDNodesCondition" >
        <xsl:param name="caller" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="conditionEventPosition" />
        <xsl:param name="hasParentOnceCondition" />
                 
        <xsl:variable name="quote" >"</xsl:variable>
        
        <xsl:for-each select="events" >
            <xsl:variable name="type" select="type" />
            <xsl:variable name="eventPosition" select="position()" />
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />

            <xsl:variable name="eventAsString" >
            //2
            private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />";
            <xsl:text>&#10;</xsl:text>
            </xsl:variable>

            <xsl:variable name="logString" >EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

            <xsl:variable name="hasAssociatedSiblingCondition" select="conditions/type/value = 'MouseButtonReleased' or conditions/type/value = 'SourisBouton' or conditions/type/value = 'MouseButtonPressed' or conditions/type/value = 'VarScene' or conditions/type/value = 'Timer'" />
            <xsl:variable name="actionTypesAsString" ><xsl:for-each select="actions" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="type/value" />,</xsl:for-each></xsl:variable>
            <xsl:variable name="parametersAsString0" ><xsl:for-each select="actions" ><xsl:for-each select="parameters" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="text()" />,</xsl:for-each></xsl:for-each></xsl:variable>
            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

            <xsl:variable name="actionAsStringsStrings" >
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        <xsl:if test="$typeValue != 'PauseTimer' and $typeValue != 'PlaySoundCanal'" >
                //GDNode - Strings
                private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                //private final String ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" /> at: ";
                //private final String ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "processGD - " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;-->
                        </xsl:if>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
            </xsl:variable>

            <xsl:variable name="thisNodeArray" >
                <xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" >gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:if></xsl:for-each>
            </xsl:variable>

            <xsl:variable name="eventsCreateProcessUsed" >
                <xsl:call-template name="eventsCreateProcessUsed" >
                    <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodesCondition</xsl:with-param>
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
            </xsl:variable>

            <!-- conditions - START -->
            <xsl:variable name="alreadyUsedCondition" ><xsl:call-template name="alreadyUsedCondition" ></xsl:call-template></xsl:variable>
            
            <!-- whileConditions - conditions - START -->
            <xsl:for-each select="whileConditions" >
                
            <xsl:call-template name="eventsCreateAssignGDObjectGDNodesCondition2" >
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
                <xsl:with-param name="hasParentOnceCondition" >
                    <xsl:value-of select="$hasParentOnceCondition" />
                </xsl:with-param>
                <xsl:with-param name="alreadyUsedCondition" >
                    <xsl:value-of select="$alreadyUsedCondition" />
                </xsl:with-param>
                <xsl:with-param name="thisNodeArray" >
                    <xsl:value-of select="$thisNodeArray" />
                </xsl:with-param>
                <xsl:with-param name="eventAsString" >
                    <xsl:value-of select="$eventAsString" />
                </xsl:with-param>
                <xsl:with-param name="actionAsStringsStrings" >
                    <xsl:value-of select="$actionAsStringsStrings" />
                </xsl:with-param>
                <xsl:with-param name="logString" >
                    <xsl:value-of select="$logString" />
                </xsl:with-param>
                <xsl:with-param name="eventsCreateProcessUsed" >
                    <xsl:value-of select="$eventsCreateProcessUsed" />
                </xsl:with-param>
                <xsl:with-param name="parentEventType" >
                    <xsl:value-of select="$type" />
                </xsl:with-param>

            </xsl:call-template>
                
                <xsl:if test="type/value = 'PopEndedTouch'" >
                    
                    <xsl:call-template name="popEndedTouchConditionGDNode" >
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodesCondition</xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                    </xsl:call-template>

                </xsl:if>
                
                <!-- whileConditions - subInstructions - conditions - START -->
                <xsl:for-each select="subInstructions" >
                    //whileConditions - //subInstructions - START

                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //whileConditions - //subInstructions - //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                    
            <xsl:call-template name="eventsCreateAssignGDObjectGDNodesCondition2" >
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
                <xsl:with-param name="hasParentOnceCondition" >
                    <xsl:value-of select="$hasParentOnceCondition" />
                </xsl:with-param>
                <xsl:with-param name="alreadyUsedCondition" >
                    <xsl:value-of select="$alreadyUsedCondition" />
                </xsl:with-param>
                <xsl:with-param name="thisNodeArray" >
                    <xsl:value-of select="$thisNodeArray" />
                </xsl:with-param>
                <xsl:with-param name="eventAsString" >
                    <xsl:value-of select="$eventAsString" />
                </xsl:with-param>
                <xsl:with-param name="actionAsStringsStrings" >
                    <xsl:value-of select="$actionAsStringsStrings" />
                </xsl:with-param>
                <xsl:with-param name="logString" >
                    <xsl:value-of select="$logString" />
                </xsl:with-param>
                <xsl:with-param name="eventsCreateProcessUsed" >
                    <xsl:value-of select="$eventsCreateProcessUsed" />
                </xsl:with-param>
                <xsl:with-param name="parentEventType" >
                    <xsl:value-of select="$type" />
                </xsl:with-param>

            </xsl:call-template>

                //whileConditions - //subInstructions - END
                </xsl:for-each>
                <!-- whileConditions - subInstructions - conditions - END -->
                
            </xsl:for-each>
            <!-- whileConditions - conditions - END -->

            <xsl:for-each select="conditions" >

            <xsl:call-template name="eventsCreateAssignGDObjectGDNodesCondition2" >
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
                <xsl:with-param name="hasParentOnceCondition" >
                    <xsl:value-of select="$hasParentOnceCondition" />
                </xsl:with-param>
                <xsl:with-param name="alreadyUsedCondition" >
                    <xsl:value-of select="$alreadyUsedCondition" />
                </xsl:with-param>
                <xsl:with-param name="thisNodeArray" >
                    <xsl:value-of select="$thisNodeArray" />
                </xsl:with-param>
                <xsl:with-param name="eventAsString" >
                    <xsl:value-of select="$eventAsString" />
                </xsl:with-param>
                <xsl:with-param name="actionAsStringsStrings" >
                    <xsl:value-of select="$actionAsStringsStrings" />
                </xsl:with-param>
                <xsl:with-param name="logString" >
                    <xsl:value-of select="$logString" />
                </xsl:with-param>
                <xsl:with-param name="eventsCreateProcessUsed" >
                    <xsl:value-of select="$eventsCreateProcessUsed" />
                </xsl:with-param>
                <xsl:with-param name="parentEventType" >
                    <xsl:value-of select="$type" />
                </xsl:with-param>

            </xsl:call-template>

                <!-- subInstructions - conditions - START -->
                <xsl:for-each select="subInstructions" >
                    //subInstructions - START

                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //subInstructions - //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                    
            <xsl:call-template name="eventsCreateAssignGDObjectGDNodesCondition2" >
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
                <xsl:with-param name="hasParentOnceCondition" >
                    <xsl:value-of select="$hasParentOnceCondition" />
                </xsl:with-param>
                <xsl:with-param name="alreadyUsedCondition" >
                    <xsl:value-of select="$alreadyUsedCondition" />
                </xsl:with-param>
                <xsl:with-param name="thisNodeArray" >
                    <xsl:value-of select="$thisNodeArray" />
                </xsl:with-param>
                <xsl:with-param name="eventAsString" >
                    <xsl:value-of select="$eventAsString" />
                </xsl:with-param>
                <xsl:with-param name="actionAsStringsStrings" >
                    <xsl:value-of select="$actionAsStringsStrings" />
                </xsl:with-param>
                <xsl:with-param name="logString" >
                    <xsl:value-of select="$logString" />
                </xsl:with-param>
                <xsl:with-param name="eventsCreateProcessUsed" >
                    <xsl:value-of select="$eventsCreateProcessUsed" />
                </xsl:with-param>
                <xsl:with-param name="parentEventType" >
                    <xsl:value-of select="$type" />
                </xsl:with-param>

            </xsl:call-template>

                //subInstructions - END
                </xsl:for-each>
                <!-- subInstructions - conditions - END -->
            </xsl:for-each>
            <!-- conditions - END -->

            <xsl:variable name="hasParentOnceCondition1" >
                <xsl:for-each select="conditions" >
                    <xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" >found</xsl:if>
                </xsl:for-each>
                <xsl:if test="$hasParentOnceCondition = 'true'" >found</xsl:if>
            </xsl:variable>
            <xsl:variable name="hasParentOnceCondition0" ><xsl:if test="contains($hasParentOnceCondition1, 'found')" >true</xsl:if></xsl:variable>

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
                <xsl:with-param name="objectsGroupsAsString" >
                    <xsl:value-of select="$objectsGroupsAsString" />
                </xsl:with-param>
                <xsl:with-param name="createdObjectsAsString" >
                    <xsl:value-of select="$createdObjectsAsString" />
                </xsl:with-param>
                <xsl:with-param name="conditionEventPosition" >
                    <xsl:value-of select="$eventPosition" />
                </xsl:with-param>
                <xsl:with-param name="hasParentOnceCondition" >
                    <xsl:value-of select="$hasParentOnceCondition0" />
                </xsl:with-param>

            </xsl:call-template>

        </xsl:for-each>

    </xsl:template>

    <xsl:template name="addGDNodeToOnceList" >
        <xsl:param name="iteration" />
        <xsl:param name="nodeId" />
        <xsl:param name="objectsAsString" />
        
        <xsl:for-each select="events" >
            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                //TWBRemove - events that were not handled before
                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
            </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="actions" >
            <xsl:for-each select="parameters" >
                <xsl:if test="position() = 1 and text() != '' and not(contains(text(), $objectsAsString))" >
                    //TWBRemove - had once for
                    //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />OnceGDNodeList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="$nodeId" />]);
                </xsl:if>
                <xsl:if test="position() = 1 and text() != '' and contains(text(), $objectsAsString)" >
        <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />OnceGDNodeList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="$nodeId" />]);
                </xsl:if>
            </xsl:for-each>
            
            <!--
            <xsl:call-template name="addGDNodeToOnceList" >
                <xsl:with-param name="iteration" ><xsl:value-of select="$iteration" /></xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
            </xsl:call-template>
            -->
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

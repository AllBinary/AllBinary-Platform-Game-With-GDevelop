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
    <xsl:import href="./condition/GDAnyKeyPressedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDKeyFromTextPressedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDKeyFromTextReleasedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDAnyKeyReleasedConditionGDNodeConditionGDNode.xsl" />
    <xsl:import href="./condition/GDKeyPressedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDKeyReleasedConditionGDNode.xsl" />
    <xsl:import href="./condition/GDIsTouchConditionGDNode.xsl" />
    <xsl:import href="./condition/GDIsMultitouchConditionGDNode.xsl" />
    <xsl:import href="./condition/GDCanAutoHideConditionGDNode.xsl" />
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
    <xsl:import href="./condition/GDSceneVariableAsTextConditionGDNode.xsl" />
    <xsl:import href="./condition/GDPopStartedTouchConditionGDNode.xsl" />
    <xsl:import href="./condition/GDPopEndedTouchConditionGDNode.xsl" />
    <xsl:import href="./condition/GDVelocityConditionGDNode.xsl" />
    <xsl:import href="./condition/GDObjectVariableAsBooleanConditionGDNode.xsl" />
    <xsl:import href="./condition/GDDistanceConditionGDNode.xsl" />
    <xsl:import href="./condition/GDCompareNumbersConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSpriteMultitouchJoystickIsPressedConditionProcess.xsl" />
    <xsl:import href="./condition/GDPanelSpriteSliderPanelSpriteSliderValueConditionGDNode.xsl" />
    <xsl:import href="./condition/GDSystemInfoIsNativeDesktopAppConditionGDNode.xsl" />
    <xsl:import href="./condition/GDStringVariableConditionGDNode.xsl" />
    <xsl:import href="./condition/GDCompareStringsConditionGDNode.xsl" />
    <xsl:import href="./condition/GDIsStoppedVelocityConditionGDNode.xsl" />

    <xsl:import href="./condition/GDDraggableBehaviorDraggedConditionGDNode.xsl" />

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

                <xsl:choose>
                <xsl:when test="$typeValue = 'Leaderboards::IsLeaderboardViewLoaded'" >
                    
                    <xsl:call-template name="leaderboardsIsLeaderboardViewLoadedConditionGDNode" />
                    
                </xsl:when>
                
                <xsl:when test="$typeValue = 'TextContainerCapability::TextContainerBehavior::Value'" >

                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
<!--                    <xsl:call-template name="textContainerCapabilityTextContainerBehaviorValueConditionGDNode" />-->

                </xsl:when>
                <xsl:when test="$typeValue = 'Inventory::Count'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Inventory::Has'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Inventory::IsFull'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Inventory::IsEquipped'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'TouchScreen::isAutoHide'" >
                    
                    <xsl:call-template name="canAutoHideConditionGDNode" />

                </xsl:when>
                <xsl:when test="$typeValue = 'TouchScreen::isMultitouchSupported'" >
                    
                    <xsl:call-template name="multitouchConditionGDNode" />

                </xsl:when>
                <xsl:when test="$typeValue = 'TouchScreen::isTouchSupported'" >
                    
                    <xsl:call-template name="touchConditionGDNode" />

                </xsl:when>

                <xsl:when test="$typeValue = 'SystemInfo::IsMobile'" >
                    
                    <xsl:call-template name="systemInfoIsMobileConditionGDNode" />

                </xsl:when>
                <xsl:when test="$typeValue = 'SystemInfo::IsNativeMobileApp'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'SystemInfo::IsNativeDesktopApp'" >
                    
                    <xsl:call-template name="systemInfoIsNativeDesktopAppConditionGDNode" />
                    
                </xsl:when>
                <xsl:when test="$typeValue = 'SystemInfo::IsWebGLSupported'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'SystemInfo::IsPreview'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'SystemInfo::HasTouchScreen'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'GetArgumentAsBoolean'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'CompareArgumentAsNumber'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'CompareArgumentAsString'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'MusicPlaying'" >

                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    <xsl:call-template name="musicPlayingConditionGDNode" />

                </xsl:when>
                <xsl:when test="$typeValue = 'MusicPaused'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'MusicStopped'" >
                    
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    <xsl:call-template name="soundStoppedConditionGDNode" />
                    
                </xsl:when>
                <xsl:when test="$typeValue = 'SoundPlaying'" >
                    
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    <xsl:call-template name="soundPlayingConditionGDNode" />

                </xsl:when>
                <xsl:when test="$typeValue = 'SoundPaused'" >
                    
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    <xsl:call-template name="soundPausedConditionGDNode" />
                    
                </xsl:when>
                <xsl:when test="$typeValue = 'SoundStopped'" >
                    
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    <xsl:call-template name="soundStoppedConditionGDNode" />
                    
                </xsl:when>                        
                <xsl:when test="$typeValue = 'GlobalVolume'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'SoundCanalVolume'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'MusicCanalVolume'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'SoundChannelPlayingOffset'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'MusicChannelPlayingOffset'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'SoundChannelPitch'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'MusicChannelPitch'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Width'" >                    
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Height'" >                    
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'AnimationName'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Sprite'" >    
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'AnimStopped'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'AnimationEnded'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'AnimationEnded2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ScaleWidth'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ScaleHeight'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Opacity'" >
                    
                    <xsl:call-template name="opacityConditionGDNode" />

                </xsl:when>

                <xsl:when test="$typeValue = 'LinkedObjects::PickObjectsLinkedTo'" >

                    <xsl:call-template name="linkedObjectsPickObjectsLinkedToConditionGDNode" >
                        <xsl:with-param name="parametersAsString" >
                            <xsl:value-of select="$parametersAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:when>        

                <xsl:when test="$typeValue = 'FlippedX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'FlippedY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'PrimitiveDrawing::ClearBetweenFrames'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'PrimitiveDrawing::OutlineSize'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'PrimitiveDrawing::FillOpacity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'PrimitiveDrawing::OutlineOpacity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'PrimitiveDrawing::AreCoordinatesRelative'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::ScaleX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::ScaleY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'PrimitiveDrawing::FlippedX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                    
                <xsl:when test="$typeValue = 'PrimitiveDrawing::FlippedY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'PrimitiveDrawing::CheckAntialiasing'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'PosX'" >

                    <xsl:call-template name="posXConditionGDNode" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'PosY'" >
                    
                    <xsl:call-template name="posYConditionGDNode" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'ObjectVariableChildExists'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Angle'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Plan'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Layer'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Visible'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Invisible'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'Arret'" >
                    <xsl:call-template name="isStoppedVelocityConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                    </xsl:call-template>
                </xsl:when>

                <xsl:when test="$typeValue = 'Vitesse'" >
                    <xsl:call-template name="velocityConditionGDNode" />
                </xsl:when>

                <xsl:when test="$typeValue = 'AngleOfDisplacement'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                    
                    <xsl:when test="$typeValue = 'NbObjet'" >
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

                    </xsl:when>

                    <xsl:when test="$typeValue = 'SceneInstancesCount'" >
                        
                        <xsl:call-template name="sceneInstancesCountConditionGDNode" />

                    </xsl:when>
                    <xsl:when test="$typeValue = 'PickedInstancesCount'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = '(Used when using the AllBinary Collision Processing) CollisionNP'" >
                        //CollisionNP - condition is processed by the AllBinary collision processor
                    </xsl:when>                
                    <xsl:when test="$typeValue = 'CollisionNP'" >
                        //CollisionNP - Not Pixel Perfect
                        <xsl:call-template name="collisionNPConditionGDNode" >
                            <xsl:with-param name="nodeList" ><xsl:value-of select="$nodeList" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>                
                    <xsl:when test="$typeValue = 'Collision'" >
                        //Collision - Pixel Perfect
                        <xsl:call-template name="collisionNPConditionGDNode" >
                            <xsl:with-param name="nodeList" ><xsl:value-of select="$nodeList" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>                
                    <xsl:when test="$typeValue = 'Raycast'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'RaycastToPosition'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'Distance'" >
                        
                        <xsl:call-template name="distanceConditionGDNode" >
                            <xsl:with-param name="parametersAsString" >
                                <xsl:value-of select="$parametersAsString" />
                            </xsl:with-param>
                        </xsl:call-template>
                        
                    </xsl:when>
                    <xsl:when test="$typeValue = 'SeDirige'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'EstTourne'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                        
                <xsl:when test="$typeValue = 'VarObjetTxt'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'BooleanObjectVariable'" >
                        <xsl:call-template name="objectVariableAsBooleanConditionGDNode" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                        </xsl:call-template>
                </xsl:when>

                <xsl:when test="$typeValue = 'VarObjetDef'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'BehaviorActivated'" >
                        <xsl:call-template name="behaviorActivatedConditionGDNode" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                        </xsl:call-template>
                </xsl:when>
                <xsl:when test="$typeValue = 'CollisionPoint'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                        
                    <xsl:when test="$typeValue = 'SourisSurObjet'" >
                        //SourisSurObjet - Some are Handled by AllBinary Event Listeners?
                        <xsl:call-template name="sourisSurObjetConditionGDNode" >
                        </xsl:call-template>
                    
                    </xsl:when>
                
                    <xsl:when test="$typeValue = 'AjoutObjConcern'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'AjoutHasard'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                            </xsl:when>
                    <xsl:when test="$typeValue = 'PickNearest'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>

                    <xsl:when test="$typeValue = 'CameraX'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'CameraY'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'CameraCenterX'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'CameraCenterY'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'CameraWidth'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'CameraHeight'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'CameraBorderLeft'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'CameraBorderRight'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'CameraBorderTop'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'CameraBorderBottom'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>                        
                <xsl:when test="$typeValue = 'LayerVisible'" >
                    
                    <xsl:call-template name="layerVisibleConditionGDNode" />
                    
                </xsl:when>                
                    <xsl:when test="$typeValue = 'CameraAngle'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'LayerEffectEnabled'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'LayerTimeScale'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'LayerDefaultZOrder'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>

                    <xsl:when test="$typeValue = 'Toujours'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>

                    <xsl:when test="$typeValue = 'BuiltinCommonInstructions::Always'" >
                        <xsl:call-template name="alwaysConditionGDNode" >
                            <xsl:with-param name="parametersAsString" >
                                <xsl:value-of select="$parametersAsString" />
                            </xsl:with-param>
                            <xsl:with-param name="parentEventType" >
                                <xsl:value-of select="$parentEventType" />
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>

                    //xsl:when test="$typeValue = 'Egal'"
                    //xsl:when test="$typeValue = 'StrEqual'" 
                    
                    <xsl:when test="$typeValue = 'BuiltinCommonInstructions::CompareNumbers'" >

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

                    </xsl:when>
  
                    <xsl:when test="$typeValue = 'BuiltinCommonInstructions::CompareStrings'" >
                        <xsl:call-template name="compareStringsConditionGDNode" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="parametersAsString" >
                                <xsl:value-of select="$parametersAsString" />
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>

                    <xsl:when test="$typeValue = 'StringVariable'" >
                        <xsl:call-template name="stringVariableConditionGDNode" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="parametersAsString" >
                                <xsl:value-of select="$parametersAsString" />
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>
      
                    <xsl:when test="$typeValue = 'BuiltinCommonInstructions::Or'" >
                        <xsl:call-template name="orConditionGDNode" />
                    </xsl:when>
                    <xsl:when test="$typeValue = 'BuiltinCommonInstructions::And'" >
                        <xsl:call-template name="andConditionGDNode" />
                    </xsl:when>
                    <xsl:when test="$typeValue = 'BuiltinCommonInstructions::Not'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'BuiltinCommonInstructions::Once'" >
                    
                        <xsl:if test="not(contains($alreadyUsedCondition, 'found'))" >

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

                    </xsl:when>

                <xsl:when test="$typeValue = 'GroupExists'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'KeyPressed'" >
                    
                    <xsl:call-template name="keyPressedConditionGDNode" >                            
                        <xsl:with-param name="parametersAsString" >
                            <xsl:value-of select="$parametersAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'KeyReleased'" >
                    
                    <xsl:call-template name="keyFromTextReleasedConditionGDNode" >
                        <xsl:with-param name="parametersAsString" >
                            <xsl:value-of select="$parametersAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'KeyFromTextPressed'" >
                    
                    <xsl:call-template name="keyFromTextPressedConditionGDNode" >
                        <xsl:with-param name="parametersAsString" >
                            <xsl:value-of select="$parametersAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'KeyFromTextReleased'" >
                    
                    <xsl:call-template name="keyFromTextReleasedConditionGDNode" >
                        <xsl:with-param name="parametersAsString" >
                            <xsl:value-of select="$parametersAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                    <xsl:when test="$typeValue = 'AnyKeyPressed'" >
                        
                    <xsl:call-template name="anykeyPressedConditionGDNode" >
                        <xsl:with-param name="parametersAsString" >
                            <xsl:value-of select="$parametersAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                    </xsl:when>
                    <xsl:when test="$typeValue = 'AnyKeyReleased'" >

                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
<!--                        <xsl:call-template name="anyKeyReleasedConditionGDNode" />-->

                    </xsl:when>

                    <xsl:when test="$typeValue = 'CursorX'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'CursorY'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'MouseOnlyOnlyCursorX'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'MouseOnlyCursorY'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'MouseX'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'MouseY'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    
                    <xsl:when test="$typeValue = 'IsMouseInsideCanvas'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'SourisX'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>
                    <xsl:when test="$typeValue = 'SourisY'" >
                        //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                    </xsl:when>

                    <xsl:when test="$typeValue = 'MouseButtonPressed' or $typeValue = 'MouseButtonFromTextPressed'" >
                        //<xsl:value-of select="$typeValue" /> - //MouseButtonPressed - Some Handled by AllBinary Event Listeners? should have as a sub condition //SourisSurObjet
                        <xsl:call-template name="mouseButtonPressedConditionGDNode" >
                            <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodesCondition</xsl:with-param>
                            <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                            <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>

                    <xsl:when test="$typeValue = 'SourisBouton'" >
                        //MouseButton - //SourisBouton - Some Handled by AllBinary Event Listeners? This is currently for single button press without continued processing until release
                        <xsl:call-template name="sourisBoutonConditionGDNode" >
                            <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodesCondition</xsl:with-param>
                            <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                            <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        </xsl:call-template>
                    
                    </xsl:when>
                
                    <xsl:when test="$typeValue = 'MouseButtonReleased' or $typeValue = 'MouseButtonFromTextReleased'" >
                        //<xsl:value-of select="$typeValue" /> - //MouseButtonReleased - Some Handled by AllBinary Event Listeners?
                        <xsl:call-template name="mouseButtonReleasedConditionGDNode" />
                    
                    </xsl:when>
                
                <xsl:when test="$typeValue = 'IsMouseWheelScrollingUp'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsMouseWheelScrollingDown'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>                
                <xsl:when test="$typeValue = 'PopStartedTouch'" >
                    
                    <xsl:call-template name="popStartedTouchConditionGDNode" >
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodesCondition</xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'PopEndedTouch'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TouchX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TouchY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'HasAnyTouchStarted'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'HasAnyTouchOrMouseStarted'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'HasTouchEnded'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Dragged'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Dropped'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'PickObjectsLinkedTo'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'EmitterAngle'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'EmitterAngleA'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'EmitterAngleB'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ConeSprayAngle'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ZoneRadius'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleGravityAngle'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleGravityLength'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'ParticleRed1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleRed2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleBlue1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleBlue2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleGreen1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleGreen2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSize1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSize2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleAlpha1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleAlpha2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'NoMoreParticles'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'RendererParam1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'RendererParam2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Tank'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Flow'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Texture'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
  
                <xsl:when test="$typeValue = 'PathFound'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'DestinationReached'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'CellWidth'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'CellHeight'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'AngleOffset'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ExtraBorder'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'DiagonalsAllowed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ObjectRotated'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Cost'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsImpassable'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'IsDynamic'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsFixedRotation'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsBullet'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'LinearVelocity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'AngularVelocity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'LinearDamping'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'CollisionWith'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'AngularDamping'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
    
                <xsl:when test="$typeValue = 'IsMoving'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsOnFloor'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsOnLadder'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsJumping'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsGrabbingPlatform'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Gravity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'MaxFallingSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'LadderClimbingSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'JumpSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'CanJump'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'CanGrabPlatforms'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'CurrentFallSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'CurrentJumpSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsObjectOnGivenFloor'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'OutlineSize'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'FillOpacity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'OutlineOpacity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'CheckAntialiasing'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'DepartScene'" >
                    
                    <xsl:if test="$hasParentOnceCondition = 'true'" >
                    //DepartScene - condition - eventsOnceConditionProcessActions    
                    </xsl:if>
                    <xsl:if test="$hasParentOnceCondition != 'true'" >
                        <xsl:call-template name="departSceneConditionGDNode" />
                    </xsl:if>

                </xsl:when>                

                <xsl:when test="$typeValue = 'SceneJustResumed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'HasGameJustResumed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'DoesSceneExist'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'Timer'" >
                    
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
                    
                </xsl:when>
                <xsl:when test="$typeValue = 'ObjectTimer'" >
                    
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
                    
                </xsl:when>
                
                <xsl:when test="$typeValue = 'CompareTimer'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TimerPaused'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TimeScale'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'VarScene'" >

                    <xsl:call-template name="varSceneCnditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="actionAsStringsStrings" ><xsl:value-of select="$actionAsStringsStrings" /></xsl:with-param>
                    </xsl:call-template>

                </xsl:when>                

                <xsl:when test="$typeValue = 'VarSceneTxt'" >
                    
                    <xsl:call-template name="sceneVariableAsTextConditionGDNode" >
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

                </xsl:when>

                <xsl:when test="$typeValue = 'BooleanVariable'" >
                    
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
                    
                </xsl:when>
                
                <xsl:when test="$typeValue = 'NumberVariable'" >
                    <xsl:call-template name="numberVariableConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="actionAsStringsStrings" ><xsl:value-of select="$actionAsStringsStrings" /></xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                
                <xsl:when test="$typeValue = 'VarGlobal'" >
                    <xsl:call-template name="varGlobalConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="actionAsStringsStrings" ><xsl:value-of select="$actionAsStringsStrings" /></xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                
                <xsl:when test="$typeValue = 'VarGlobalTxt'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'GlobalVariableAsBoolean'" >
                    <xsl:call-template name="globalVariableAsBooleanConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="actionAsStringsStrings" ><xsl:value-of select="$actionAsStringsStrings" /></xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$typeValue = 'VarSceneDef'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'VarGlobalDef'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ObjectVariableChildCount'" >
                    <xsl:call-template name="objectVariableChildCountConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                        <xsl:with-param name="actionAsStringsStrings" ><xsl:value-of select="$actionAsStringsStrings" /></xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$typeValue = 'SceneVariableChildCount'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'GlobalVariableChildCount'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'VariableChildExists'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'GlobalVariableChildExists'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'IsFullScreen'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'IsNativeMobileApp'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsNativeDesktopApp'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsWebGLSupported'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'FileExists'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>                                                                                             

                //Was VarObjet
                <xsl:when test="$typeValue = 'NumberObjectVariable' or $typeValue = 'VarObjet'" >

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

                </xsl:when>

                <xsl:when test="$typeValue = 'ObjectTimerPaused'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsEffectEnabled'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'Activated'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'String'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ScaleX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ScaleY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Smoothed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsBold'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsItalic'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsUnderlined'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Padding'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TextAlignment'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'IsWrapping'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'WrappingWidth'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Acceleration'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Deceleration'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'MaxSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Speed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'AngularMaxSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'XVelocity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'YVelocity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <!-- Extension Actions below here -->
                <xsl:when test="$typeValue = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick::IsPressed'" >
                    
                    <xsl:call-template name="spriteMultitouchJoystickIsPressedActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:when>

                <xsl:when test="$typeValue = 'PanelSpriteSlider::PanelSpriteSlider::Value'" >

                    <xsl:call-template name="panelSpriteSliderPanelSpriteSliderValueConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                        <xsl:with-param name="conditionNodeIndex" ><xsl:value-of select="$conditionNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="thisNodeIndex" ><xsl:value-of select="$thisNodeIndex" /></xsl:with-param>
                        <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:when>

                <xsl:when test="$typeValue = 'AnimatableCapability::AnimatableBehavior::HasAnimationEnded'" >
                    <xsl:call-template name="animatableCapabilityAnimatableBehaviorHasAnimationEndedConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$typeValue = 'AnimatableCapability::AnimatableBehavior::ElapsedTime'" >
                    <xsl:call-template name="animatableCapabilityAnimatableBehaviorElapsedTimeConditionGDNode" >
                        <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                        <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                
                <xsl:when test="$typeValue = 'DraggableBehavior::Dragged'" >
                    
                    <xsl:call-template name="draggableBehaviorDraggedConditionGDNode" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:otherwise>
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTEDC
                </xsl:otherwise>
                </xsl:choose>

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

            <xsl:variable name="hasAssociatedSiblingCondition" select="conditions/type/value = 'MouseButtonReleased' or conditions/type/value = 'MouseButtonFromTextReleased' or conditions/type/value = 'SourisBouton' or conditions/type/value = 'MouseButtonPressed' or conditions/type/value = 'MouseButtonFromTextPressed' or conditions/type/value = 'VarScene' or conditions/type/value = 'Timer'" />
            <xsl:variable name="actionTypesAsString" ><xsl:for-each select="actions" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="type/value" />,</xsl:for-each></xsl:variable>
            <xsl:variable name="parametersAsString0" ><xsl:for-each select="actions" ><xsl:for-each select="parameters" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="text()" />,</xsl:for-each></xsl:for-each></xsl:variable>
            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

            <xsl:variable name="actionAsStringsStrings" >
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        <xsl:if test="not($typeValue = 'PauseTimer' or $typeValue = 'PlaySoundCanal' or $typeValue = 'PlaySoundOnChannel')" >
<!--
                //GDNode - Strings 4
                private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                //private final String ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" /> at: ";
                //private final String ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "processGD - " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;
-->
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

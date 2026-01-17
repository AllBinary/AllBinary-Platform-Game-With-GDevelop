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
    <xsl:import href="./action/GDStopForceActionProcess.xsl" />
    <xsl:import href="./action/GDQuitActionProcess.xsl" />
    <xsl:import href="./action/GDSetGlobalVariableAsBooleanActionProcess.xsl" />
    <xsl:import href="./action/SetFullScreenActionProcess.xsl" />
    <xsl:import href="./action/GDSetObjectVariableAsBooleanActionProcess.xsl" />
    <xsl:import href="./action/GDSetSceneVariableAsBooleanActionProcess.xsl" />
    <xsl:import href="./action/GDSetStringVariableActionProcess.xsl" />
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
    
    <xsl:template name="actionGDNodes" >
        <xsl:param name="caller" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="selectedNodeIds" />
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
                //GDNode - Strings 0
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

            <xsl:variable name="selectedNodeId" select="number(substring(generate-id(), 2) - 65536)" />
            <xsl:variable name="selectedNodeIdWithSep" >,<xsl:value-of select="$selectedNodeId" />,</xsl:variable>
            
            <xsl:if test="contains($selectedNodeIds, ',8715,') or contains($selectedNodeId, '8715')" >
            //selectedNodeIds=<xsl:value-of select="$selectedNodeIds" />
            //selectedNodeIdWithSep=<xsl:value-of select="$selectedNodeIdWithSep" />
            </xsl:if>
            
            <xsl:if test="contains($selectedNodeIds, $selectedNodeIdWithSep)" >

                //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                <xsl:text>&#10;</xsl:text>

                    //Action - GDNode - for Condition totalRecursions=<xsl:value-of select="$totalRecursions" /> eventPosition=<xsl:value-of select="$eventPosition" /> conditionEventPosition=<xsl:value-of select="$conditionEventPosition" /> hasAssociatedSiblingCondition=<xsl:value-of select="$hasAssociatedSiblingCondition" />
                    public class GD<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />GDNode extends GDNode {
                    
                    public GD<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />GDNode() {
                        super(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />);
                    }
                    
                    <xsl:variable name="nodeAsString" ><xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                    <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        //GDNode - Strings 1
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "B: <xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        //private final String ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "B: <xsl:value-of select="translate($actionAsString, $quote, ' ')" /> at: ";
                        //private final String ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "processGD - " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;
                        <xsl:text>&#10;</xsl:text>

                    <xsl:choose>
                    <xsl:when test="$typeValue = 'TextObject::String'" >

                        <xsl:if test="contains($actionWithTextObjectString, 'found')" >
                        <xsl:call-template name="textObjectStringActionProcess" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="objectsGroupsAsString" >
                                <xsl:value-of select="$objectsGroupsAsString" />
                            </xsl:with-param>
                            <xsl:with-param name="createdObjectsAsString" >
                                <xsl:value-of select="$createdObjectsAsString" />
                            </xsl:with-param>
                        </xsl:call-template>
                        </xsl:if>

                    </xsl:when>

                    <xsl:when test="$typeValue = 'TextContainerCapability::TextContainerBehavior::SetValue'" >
                        
                        <xsl:call-template name="textContainerCapabilityTextContainerBehaviorSetValueActionProcess" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="objectsGroupsAsString" >
                                <xsl:value-of select="$objectsGroupsAsString" />
                            </xsl:with-param>
                            <xsl:with-param name="createdObjectsAsString" >
                                <xsl:value-of select="$createdObjectsAsString" />
                            </xsl:with-param>
                        </xsl:call-template>

                    </xsl:when>                    

                <xsl:when test="$typeValue = 'TextObject::ChangeColor'" >

                    <xsl:call-template name="textObjectChangeColorActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>                        
                    
                </xsl:when>
                
                <xsl:when test="$typeValue = 'SceneBackground'" >

                    <xsl:call-template name="sceneBackgroundActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'ChangeAnimation'" >
                    
                    <xsl:call-template name="changeAnimationActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                
                <xsl:when test="$typeValue = 'SetNumberObjectVariable' or $typeValue = 'ModVarObjet'" >
                    
                    <xsl:call-template name="setNumberObjectVariableActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'ModVarSceneTxt'" >

                    <xsl:call-template name="modVarSceneTxtActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'ModVarObjetTxt'" >

                    <xsl:call-template name="modVarObjetTxtActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'SetNumberObjectVariableTxt'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'LinkedObjects::LinkObjects'" >
                    
                    <xsl:call-template name="linkedObjectsLinkObjectsActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>                        
                    
                </xsl:when>

                <xsl:when test="$typeValue = 'BuiltinExternalLayouts::CreateObjectsFromExternalLayout'" >
                //BuiltinExternalLayouts::CreateObjectsFromExternalLayout
                @Override
                public boolean process() throws Exception {
                    super.processStats();

                    final org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalLayoutGDNodes gdLayoutGDNodes = org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalLayoutGDNodes.getInstance();
                    final String LAYOUT = <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>;
                    final int size = gdLayoutGDNodes.layoutNameList.size();
                    String key;
                    int index = 0;
                    while(index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size) {
                        key = (String) gdLayoutGDNodes.layoutNameList.get(index);
                        //stringMaker.append(key);
                        if(key.compareTo(LAYOUT) == 0) {
                            break;
                        }
                        index++;
                    }
                    //+ stringMaker.toString()
                    //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + LAYOUT, this, commonStrings.PROCESS);
                    final GDNode layoutGDNode = (GDNode) gdLayoutGDNodes.layoutGDNodeList.get(index);
                    //externalLinkLayoutGDNode - process
                    layoutGDNode.process();
                    
                    return true;
                }

                @Override
                public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                    super.processGDStats(gameLayer);

                    //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                    this.process();
                    
                    return true;
                }

                </xsl:when>

                <xsl:when test="$typeValue = 'LinkedObjects::RemoveLinkBetween'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'LinkedObjects::RemoveAllLinksOf'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::Circle'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::Line'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::LineV2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'PrimitiveDrawing::Ellipse'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::RoundedRectangle'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::ChamferRectangle'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'PrimitiveDrawing::RegularPolygon'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::Torus'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::Star'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::Arc'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
            
                <xsl:when test="$typeValue = 'PrimitiveDrawing::BezierCurve'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::QuadraticCurve'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::BeginFillPath'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'PrimitiveDrawing::EndFillPath'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'PrimitiveDrawing::PathMoveTo'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'PrimitiveDrawing::PathLineTo'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'PrimitiveDrawing::PathBezierCurveTo'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::PathArc'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::PathQuadraticCurveTo'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::ClosePath'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::Arc'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::ArcTo'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'PrimitiveDrawing::Drawer::ClearShapes'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::ClearBetweenFrames'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::FillColor'" >
                    
                    <xsl:call-template name="primitiveDrawingFillColorActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::OutlineColor'" >
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
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::UseRelativeCoordinates'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
            
                <xsl:when test="$typeValue = 'PrimitiveDrawing::Scale'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::Drawer::SetScaleX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::Drawer::SetScaleX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::FlipX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'PrimitiveDrawing::FlipY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::Width'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'PrimitiveDrawing::Height'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'PrimitiveDrawing::SetRotationCenter'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
        
                <xsl:when test="$typeValue = 'PrimitiveDrawing::Drawer'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'PrimitiveDrawing::SetAntialiasing'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'PrimitiveDrawing::Rectangle'" >
                    
                    <xsl:call-template name="primitiveDrawingRectangleActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:when>

                <xsl:when test="$typeValue = 'AjoutObjConcern'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'AjoutHasard'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'SetBooleanObjectVariable'" >
                    
                    <xsl:call-template name="setObjectVariableAsBooleanActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'ToggleObjectVariableAsBoolean'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
  
                <xsl:when test="$typeValue = 'ObjectVariablePush'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
  
                <xsl:when test="$typeValue = 'ObjectVariablePushString'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
  
                <xsl:when test="$typeValue = 'ObjectVariablePushNumber'" >

                    <xsl:call-template name="objectVariablePushNumberActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                                        
                </xsl:when>
  
                <xsl:when test="$typeValue = 'ObjectVariablePushBool'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
  
                <xsl:when test="$typeValue = 'ObjectVariableRemoveAt'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'HideLayer'" >

                    <xsl:call-template name="hideLayerActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'Cache'" >

                    <xsl:call-template name="cacheAsHideActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'TextEntryObject::String'" >

                    <xsl:call-template name="textEntryObjectAsStringActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'PlaySound'" >
                    
                    <xsl:call-template name="playSoundActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'PlayMusic'" >
                    
                    <xsl:call-template name="playMusicActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'PlayMusicCanal'" >
                    
                    <xsl:call-template name="playMusicCanalActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'StopMusicCanal'" >
                    
                    <xsl:call-template name="stopMusicCanalActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:when>
                <xsl:when test="$typeValue = 'PlaySoundCanal' or $typeValue = 'PlaySoundOnChannel'" >
                    
                    <xsl:call-template name="playSoundCanalActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:when>
                <xsl:when test="$typeValue = 'StopSoundCanal'" >
                    
                    <xsl:call-template name="stopSoundCanalActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:when>
                
                <xsl:when test="$typeValue = 'ResetTimer'" >
                    
                    <xsl:call-template name="resetTimerActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'PauseTimer'" >
                    
                    <xsl:call-template name="pauseTimerActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>                        

                </xsl:when>
                <xsl:when test="$typeValue = 'UnPauseTimer'" >

                    <xsl:call-template name="unPauseTimerActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>                        

                </xsl:when>

                <xsl:when test="$typeValue = 'ChangeScale'" >
                    
                    <xsl:call-template name="changeScaleActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'ResetObjectTimer'" >
                    
                    <xsl:call-template name="resetObjectTimerActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>                        

                </xsl:when>

                <xsl:when test="$typeValue = 'Opacity'" >
                    
                    <xsl:call-template name="opacityActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:when>
                <xsl:when test="$typeValue = 'Create'" >

                    <xsl:call-template name="createActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="param" >
                            <xsl:value-of select="$param" />
                        </xsl:with-param>
                        <xsl:with-param name="nodeAsString" >
                            <xsl:value-of select="$nodeAsString" />
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
                    </xsl:call-template>
                    
                </xsl:when>

                <xsl:when test="$typeValue = 'CreateByName'" >

                    <xsl:call-template name="createByNameActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="param" >
                            <xsl:value-of select="$param" />
                        </xsl:with-param>
                        <xsl:with-param name="nodeAsString" >
                            <xsl:value-of select="$nodeAsString" />
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
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'SetAngle'" >
                    
                    <xsl:call-template name="setAngleActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'ChangePlan'" >
                    
                    <xsl:call-template name="changePlanActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'ChangeColor'" >
                    
                    <xsl:call-template name="changeColorActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'Scene'" >

                    <xsl:call-template name="sceneActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'SetFullScreen'" >

                    <xsl:call-template name="setFullScreenActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'LaunchFile'" >

                    <xsl:call-template name="launchFileActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'MettreX'" >

                    <xsl:call-template name="mettreXActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'MettreY'" >

                    <xsl:call-template name="mettreYActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'MettreXY'" >

                    <xsl:call-template name="mettreXYActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                                
                <xsl:when test="$typeValue = 'MettreAutourPos'" >

                    <xsl:call-template name="mettreAutourPosActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'ModVarScene'" >

                    <xsl:call-template name="modVarSceneActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                
                <xsl:when test="$typeValue = 'SetNumberVariable' or $typeValue = 'ModVarGlobal'" >

                    <xsl:call-template name="modVarGlobalActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'ModVarGlobalTxt'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'Delete'" >
                    
                    <xsl:call-template name="deleteActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'Quit'" >

                    <xsl:call-template name="quitActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'SetGlobalVariableAsBoolean'" >

                    <xsl:call-template name="setGlobalVariableAsBooleanActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'SetBooleanVariable'" >

                    <xsl:call-template name="setSceneVariableAsBooleanActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'SetStringVariable'" >

                    <xsl:call-template name="setStringVariableActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'JSONToVariableStructure'" >

                    <xsl:call-template name="jsonToVariableStructureActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'JSONToGlobalVariableStructure'" >
                    //JSON to global variable from scene variable - JSONPersistance
                    <xsl:call-template name="jsonToGlobalVariableStructureActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>

                <xsl:when test="$typeValue = 'RotateTowardPosition'" >

                    <xsl:call-template name="rotateTowardPositionActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'Rotate'" >

                    <xsl:call-template name="rotateActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>              

                <xsl:when test="$typeValue = 'SetCenterX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'SetCenterY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'RotateTowardAngle'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'RotateTowardPosition'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ChangeLayer'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Montre'" >

                    <xsl:call-template name="montreAsShowActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'MettreAutour'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'AddForceAL'" >

                    <xsl:call-template name="addForceALActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'AddForceXY'" >
                    
                    <xsl:call-template name="addForceXYActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                
                <xsl:when test="$typeValue = 'AddForceVersPos'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'AddForceVers'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Arreter'" >

                    <xsl:call-template name="stopForceActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'SeparateFromObjects'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Ecarter'" >
                    //Deprecated
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'Rebondir'" >
                    //Deprecated
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ActivateBehavior'" >
                    
                    <xsl:call-template name="activateBehaviorActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'ObjectVariableRemoveChild'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>  
                <xsl:when test="$typeValue = 'ObjectVariableClearChildren'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                                
                <xsl:when test="$typeValue = 'PauseObjectTimer'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'UnPauseObjectTimer'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'RemoveObjectTimer'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'EnableEffect'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'SetEffectDoubleParameter'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'SetEffectStringParameter'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                              
                <xsl:when test="$typeValue = 'SetEffectBooleanParameter'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'SetIncludedInParentCollisionMask'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'AnimatableCapability::AnimatableBehavior::SetIndex'" >
                    <xsl:call-template name="animatableCapabilityAnimatableBehaviorSetIndexActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
  
                <xsl:when test="$typeValue = 'AnimatableCapability::AnimatableBehavior::SetName'" >
                    <xsl:call-template name="animatableCapabilityAnimatableBehaviorSetNameActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
  
                <xsl:when test="$typeValue = 'AnimatableCapability::AnimatableBehavior::SetSpeedScale'" >
                    <xsl:call-template name="animatableCapabilityAnimatableBehaviorSetSpeedScaleActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$typeValue = 'AnimatableCapability::AnimatableBehavior::PauseAnimation'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'AnimatableCapability::AnimatableBehavior::PlayAnimation'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'ParticleSystem::EmitterForceMin'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::EmitterForceMax'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::EmitterAngle'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::EmitterAngleA'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::EmitterAngleB'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ConeSprayAngle'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ZoneRadius'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleLifeTimeMin'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleLifeTimeMax'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleGravityX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleGravityY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleGravityAngle'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleGravityLength'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleColor1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleColor2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleRed1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleRed2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleBlue1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleBlue2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleGreen1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleGreen2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleSize1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleSize2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleAlpha1'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::ParticleAlpha2'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::RecreateParticleSystem'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::SetTank'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::Tank'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::StartEmission'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::StopEmission'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::SetFlow'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::Flow'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::SetTextureFromResource'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::Texture'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ParticleSystem::JumpEmitterForwardInTime'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'EffectCapability::EffectBehavior::SetEffectDoubleParameter'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>                       
                <xsl:when test="$typeValue = 'EffectCapability::EffectBehavior::SetEffectStringParameter'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'EffectCapability::EffectBehavior::SetEffectBooleanParameter'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'EffectCapability::EffectBehavior::EnableEffect'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'OpacityCapability::OpacityBehavior::SetValue'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'ScalableCapability::ScalableBehavior::SetValue'" >
                    //TWB - does this work?
                    <xsl:call-template name="scalableBehaviorSetValueActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$typeValue = 'ScalableCapability::ScalableBehavior::SetX'" >
                    //TWB - does this work?
                    <xsl:call-template name="scalableBehaviorSetXActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$typeValue = 'ScalableCapability::ScalableBehavior::SetY'" >
                    //TWB - does this work?
                    <xsl:call-template name="scalableBehaviorSetYActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                
                <xsl:when test="$typeValue = 'ResizableCapability::ResizableBehavior::SetWidth'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ResizableCapability::ResizableBehavior::SetHeight'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ResizableCapability::ResizableBehavior::SetSize'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED - Started work on but disabled - getSetSizeForObject
                </xsl:when>
                
                <xsl:when test="$typeValue = 'FlippableCapability::FlippableBehavior::FlipX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'FlippableCapability::FlippableBehavior::FlipY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'ChangeBlendMode'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'SetAnimationName'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ChangeDirection'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ChangeSprite'" >
                    
                    <xsl:call-template name="changeSpriteActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'PauseAnimation'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlayAnimation'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ChangeAnimationSpeedScale'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ChangeScaleWidth'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ChangeScaleHeight'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ChangeScale'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ChangeWidth'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ChangeHeight'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'SetSize'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TourneVersPos'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TourneVers'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'ChangeColor'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'FlipX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'FlipY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'PhysicsBehavior::SetStatic'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::SetDynamic'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::SetFixedRotation'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::SetFreeRotation'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::AddRevoluteJoint'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::AddRevoluteJointBetweenObjects'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::ActAddGearJointBetweenObjects'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::SetAsBullet'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::DontSetAsBullet'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::ApplyImpulse'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::ApplyImpulseUsingPolarCoordinates'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::ApplyImpulseTowardPosition'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::ApplyForce'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::ApplyForceUsingPolarCoordinates'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::ApplyForceTowardPosition'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::ApplyTorque'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::SetLinearVelocity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::SetAngularVelocity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::SetLinearDamping'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PhysicsBehavior::SetAngularDamping'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                
                <xsl:when test="$typeValue = 'PlatformBehavior::Gravity'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>                  
                <xsl:when test="$typeValue = 'PlatformBehavior::MaxFallingSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::LadderClimbingSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::Acceleration'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::Deceleration'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::MaxSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::JumpSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::JumpSustainTime'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::PlatformerObjectBehavior::SetCurrentFallSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::PlatformerObjectBehavior::SetCurrentSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::CanGrabPlatforms'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::SetCanJump'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::PlatformerObjectBehavior::SetCanNotAirJump'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::PlatformerObjectBehavior::AbortJump'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::SimulateLeftKey'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::SimulateRightKey'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::SimulateUpKey'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::SimulateDownKey'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::SimulateLadderKey'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::SimulateReleaseLadderKey'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PlatformBehavior::SimulateReleasePlatformKey'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'PathfindingBehavior::SetDestination'" >

                    <xsl:call-template name="pathfindingBehaviorSetDestinationActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'PathfindingBehavior::CellWidth'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PathfindingBehavior::CellHeight'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PathfindingBehavior::PathfindingBehavior::SetGridOffsetX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PathfindingBehavior::PathfindingBehavior::SetGridOffsetY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PathfindingBehavior::Acceleration'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PathfindingBehavior::MaxSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PathfindingBehavior::Speed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PathfindingBehavior::AngularMaxSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PathfindingBehavior::AngleOffset'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PathfindingBehavior::ExtraBorder'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PathfindingBehavior::AllowDiagonals'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PathfindingBehavior::RotateObject'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PathfindingBehavior::Cost'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'PathfindingBehavior::SetImpassable'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'TopDownMovementBehavior::Acceleration'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TopDownMovementBehavior::Deceleration'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TopDownMovementBehavior::MaxSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TopDownMovementBehavior::AngularMaxSpeed'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TopDownMovementBehavior::AngleOffset'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TopDownMovementBehavior::AllowDiagonals'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TopDownMovementBehavior::RotateObject'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TopDownMovementBehavior::SimulateLeftKey'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TopDownMovementBehavior::SimulateRightKey'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TopDownMovementBehavior::SimulateUpKey'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TopDownMovementBehavior::SimulateDownKey'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TopDownMovementBehavior::SimulateControl'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TopDownMovementBehavior::IgnoreDefaultControls'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TopDownMovementBehavior::SimulateStick'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TopDownMovementBehavior::TopDownMovementBehavior::SetVelocityX'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>
                <xsl:when test="$typeValue = 'TopDownMovementBehavior::TopDownMovementBehavior::SetVelocityY'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <xsl:when test="$typeValue = 'EcrireFichierTxt'" >
                    //Save JSON - JSONPersistance
                    <xsl:call-template name="ecrireFichierTxtSaveJSONActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$typeValue = 'LireFichierTxt'" >
                    //Load JSON - JSONPersistance
                    <xsl:call-template name="lireFichierTxtLoadJSONActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>

                <xsl:when test="$typeValue = 'Leaderboards::SavePlayerScore'" >

                    <xsl:call-template name="leaderboardsSavePlayerScoreActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'Leaderboards::DisplayLeaderboard'" >
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTED
                </xsl:when>

                <!-- Extension Actions below here -->
                <xsl:when test="$typeValue = 'PanelSpriteSlider::PanelSpriteSlider::SetValue'" >
                    
                    <xsl:call-template name="panelSpriteSliderPanelSpriteSliderSetValueActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>

                <xsl:when test="$typeValue = 'TextInputVirtualKeyboard::TextInputVirtualKeyboard::closeKeyboard'" >
                    
                    <xsl:call-template name="textInputVirtualKeyboardTextInputVirtualKeyboardCloseKeyboardActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:when test="$typeValue = 'TextInputVirtualKeyboard::TextInputVirtualKeyboard::openKeyboard'" >
                    
                    <xsl:call-template name="textInputVirtualKeyboardTextInputVirtualKeyboardOpenKeyboardActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:when>
                <xsl:otherwise>
                    //<xsl:value-of select="$typeValue" /> NOT_IMPLEMENTEDA
                </xsl:otherwise>
                </xsl:choose>

                <xsl:if test="$typeValue = 'Create'" >
                        
                        <xsl:call-template name="createEndActionProcess" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="objectsGroupsAsString" >
                                <xsl:value-of select="$objectsGroupsAsString" />
                            </xsl:with-param>
                            <xsl:with-param name="createdObjectsAsString" >
                                <xsl:value-of select="$createdObjectsAsString" />
                            </xsl:with-param>
                            <xsl:with-param name="nodeIdAsString" >
                                <xsl:value-of select="$nodeIdAsString" />
                            </xsl:with-param>
                        </xsl:call-template>

                </xsl:if>

                <xsl:if test="$typeValue = 'CreateByName'" >

                        <xsl:call-template name="createByNameEndActionProcess" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="objectsGroupsAsString" >
                                <xsl:value-of select="$objectsGroupsAsString" />
                            </xsl:with-param>
                            <xsl:with-param name="createdObjectsAsString" >
                                <xsl:value-of select="$createdObjectsAsString" />
                            </xsl:with-param>
                            <xsl:with-param name="nodeIdAsString" >
                                <xsl:value-of select="$nodeIdAsString" />
                            </xsl:with-param>
                        </xsl:call-template>

                </xsl:if>

                            <xsl:for-each select="../conditions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" /> ";
                                </xsl:if>
                            </xsl:for-each>

<!--                            <xsl:for-each select="../events" >
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //private final String EVENTS_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Events nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> parameters=<xsl:value-of select="$parametersAsString" />";
                            </xsl:for-each>
-->

                        <!--
                        ../events
                        -->
                        <xsl:variable name="childEventWithUsedEvent" ><xsl:for-each select="../events" ><xsl:call-template name="childEventWithUsedEvent" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="motionGestureEvent" >true</xsl:with-param></xsl:call-template></xsl:for-each></xsl:variable>
                        <xsl:variable name="hasSourisSurObjetCondition" ><xsl:for-each select="../conditions" ><xsl:variable name="typeValue" select="type/value" /><xsl:if test="$typeValue = 'SourisSurObjet'" >found</xsl:if></xsl:for-each></xsl:variable>
                        
                        <xsl:if test="contains($childEventWithUsedEvent, 'found') and contains($hasSourisSurObjetCondition, 'found')" >
                        //SourisSurObjet - motionGestureEvent
                        @Override
                        public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                            super.processStats(motionGestureEvent);
                            
                            //Conditions - START
                            <xsl:for-each select="../conditions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                            //Condition - //SourisSurObjet - call - motionGestureEvent
                            //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                                </xsl:if>
                            </xsl:for-each>
                            //Conditions - END
                        
                            return true;
                        }
                        </xsl:if>

                    };
                    
                    public final GD<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />GDNode NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = new GD<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />GDNode();
                    
            </xsl:if>
            
            </xsl:for-each>
            <!-- actions - END -->

            <xsl:call-template name="actionGDNodes" >
                <xsl:with-param name="caller" >
                    <xsl:value-of select="$caller" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
                <xsl:with-param name="selectedNodeIds" >
                    <xsl:value-of select="$selectedNodeIds" />
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

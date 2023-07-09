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

    <xsl:import href="./action/GDTextObjectStringActionProcess.xsl" />
    <xsl:import href="./action/GDTextObjectChangeColorActionProcess.xsl" />

    <xsl:import href="./action/GDChangeAnimationActionProcess.xsl" />
    <xsl:import href="./action/GDModVarObjetActionProcess.xsl" />
    
    <xsl:import href="./action/GDPlaySoundActionProcess.xsl" />
    <xsl:import href="./action/GDPlaySoundCanalActionProcess.xsl" />
    <xsl:import href="./action/GDStopSoundCanalActionProcess.xsl" />
    
    <xsl:import href="./action/GDResetTimerActionProcess.xsl" />

    <xsl:import href="./action/GDPauseTimerActionProcess.xsl" />
    <xsl:import href="./action/GDUnPauseTimerActionProcess.xsl" />
    
    <xsl:import href="./action/GDResetObjectTimerActionProcess.xsl" />

    <xsl:import href="./action/GDOpacityActionProcess.xsl" />
    <xsl:import href="./action/GDCreateActionProcess.xsl" />
    <xsl:import href="./action/GDSetAngleActionProcess.xsl" />
    <xsl:import href="./action/GDChangePlanActionProcess.xsl" />
    <xsl:import href="./action/GDChangeColorActionProcess.xsl" />
    <xsl:import href="./action/GDSceneActionProcess.xsl" />
    <xsl:import href="./action/GDMettreXActionProcess.xsl" />
    <xsl:import href="./action/GDMettreYActionProcess.xsl" />
    <xsl:import href="./action/GDMettreXYActionProcess.xsl" />
    <xsl:import href="./action/GDMettreAutourPosActionProcess.xsl" />
    <xsl:import href="./action/GDModVarSceneActionProcess.xsl" />
    <xsl:import href="./action/GDDeleteActionProcess.xsl" />
    <xsl:import href="./action/GDAddForceALActionProcess.xsl" />
    <xsl:import href="./action/GDQuitActionProcess.xsl" />
    <xsl:import href="./action/GDSetSceneVariableAsBooleanActionProcess.xsl" />
    <xsl:import href="./action/GDJSONToVariableStructureActionProcess.xsl" />
    <xsl:import href="./action/GDRotateActionProcess.xsl" />
    <xsl:import href="./action/GDRotateTowardPositionActionProcess.xsl" />
    <xsl:import href="./action/GDChangeScaleActionProcess.xsl" />
    <xsl:import href="./action/GDSceneBackgroundActionProcess.xsl" />
    
    <xsl:template name="eventsCreateAssignGDObjectGDNodesAction" >
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

            <xsl:variable name="hasAssociatedSiblingCondition" select="conditions/type/value = 'MouseButtonReleased' or conditions/type/value = 'SourisBouton' or conditions/type/value = 'VarScene' or conditions/type/value = 'Timer'" />
            <xsl:variable name="parentEventType" ><xsl:for-each select="../../events" ><xsl:value-of select="type" /></xsl:for-each></xsl:variable>
            <xsl:variable name="actionTypesAsString" ><xsl:for-each select="actions" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="type/value" />,</xsl:for-each></xsl:variable>

            <xsl:variable name="actionAsStringsStrings" >
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
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

            <!-- actions - START -->
            <xsl:for-each select="actions" >
                <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                <xsl:variable name="thisNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />
                <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                <xsl:text>&#10;</xsl:text>

                    //Action - GDNode - for Condition totalRecursions=<xsl:value-of select="$totalRecursions" /> eventPosition=<xsl:value-of select="$eventPosition" /> conditionEventPosition=<xsl:value-of select="$conditionEventPosition" /> hasAssociatedSiblingCondition=<xsl:value-of select="$hasAssociatedSiblingCondition" />
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="nodeAsString" ><xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                    <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "B: <xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        <xsl:if test="$typeValue != 'ModVarScene' and $typeValue != 'AddForceAL' and $typeValue != 'PlaySoundCanal' and $typeValue != 'StopSoundCanal'" >
                        private final String ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "B: <xsl:value-of select="translate($actionAsString, $quote, ' ')" /> at: ";
                        </xsl:if>
                        <xsl:if test="$typeValue = 'ModVarObjet' or $typeValue = 'Opacity'" >
                        //private final String ACTION_AS_STRING_IS_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "B: <xsl:value-of select="translate($actionAsString, $quote, ' ')" /> is: ";
                        </xsl:if>
                        <xsl:text>&#10;</xsl:text>

                <xsl:if test="contains($actionWithTextObjectString, 'found')" >
                    <xsl:if test="$typeValue = 'TextObject::String'" >
                        
                        <xsl:call-template name="textObjectStringActionProcess" />

                    </xsl:if>                    
                </xsl:if>
                <xsl:if test="$typeValue = 'TextObject::ChangeColor'" >

                    <xsl:call-template name="textObjectChangeColorActionProcess" />
                    
                </xsl:if>
                
                <xsl:if test="$typeValue = 'SceneBackground'" >

                    <xsl:call-template name="sceneBackgroundActionProcess" />

                </xsl:if>
                <xsl:if test="$typeValue = 'ChangeAnimation'" >
                    
                    <xsl:call-template name="changeAnimationActionProcess" />

                </xsl:if>
                <xsl:if test="$typeValue = 'ModVarObjet'" >
                    
                    <xsl:call-template name="modVarObjetActionProcess" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:if>                
                <xsl:if test="$typeValue = 'HideLayer'" >
                    //HideLayer - action
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        LogUtil.put(LogFactory.getInstance(commonStrings.NOT_IMPLEMENTED, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                        
                        return true;
                    }
                </xsl:if>
                
                <xsl:if test="$typeValue = 'PlaySound'" >
                    
                    <xsl:call-template name="playSoundActionProcess" />

                </xsl:if>
                <xsl:if test="$typeValue = 'PlaySoundCanal'" >
                    
                    <xsl:call-template name="playSoundCanalActionProcess" />
                    
                </xsl:if>
                <xsl:if test="$typeValue = 'StopSoundCanal'" >
                    
                    <xsl:call-template name="stopSoundCanalActionProcess" />
                    
                </xsl:if>
                
                <xsl:if test="$typeValue = 'ResetTimer'" >
                    
                    <xsl:call-template name="resetTimerActionProcess" />

                </xsl:if>
                <xsl:if test="$typeValue = 'PauseTimer'" >
                    
                    <xsl:call-template name="pauseTimerActionProcess" />

                </xsl:if>
                <xsl:if test="$typeValue = 'UnPauseTimer'" >

                    <xsl:call-template name="unPauseTimerActionProcess" />

                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeScale'" >
                    
                    <xsl:call-template name="changeScaleActionProcess" />

                </xsl:if>

                <xsl:if test="$typeValue = 'ResetObjectTimer'" >
                    
                    <xsl:call-template name="resetObjectTimerActionProcess" />

                </xsl:if>

                <xsl:if test="$typeValue = 'Opacity'" >
                    
                    <xsl:call-template name="opacityActionProcess" >
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:if>                
                <xsl:if test="$typeValue = 'Create'" >

                    <xsl:call-template name="createActionProcess" >
                        <xsl:with-param name="param" >
                            <xsl:value-of select="$param" />
                        </xsl:with-param>
                        <xsl:with-param name="actionWithTextObjectString" >
                            <xsl:value-of select="$actionWithTextObjectString" />
                        </xsl:with-param>
                        <xsl:with-param name="nodeAsString" >
                            <xsl:value-of select="$nodeAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                </xsl:if>

                <xsl:if test="$typeValue = 'SetAngle'" >
                    
                    <xsl:call-template name="setAngleActionProcess" >
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:if>

                <xsl:if test="$typeValue = 'ChangePlan'" >
                    
                    <xsl:call-template name="changePlanActionProcess" />

                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeColor'" >
                    
                    <xsl:call-template name="changeColorActionProcess" />

                </xsl:if>

                <xsl:if test="$typeValue = 'Create'" >
                    <xsl:if test="not(contains($actionWithTextObjectString, $param))" >
                        
                        <xsl:call-template name="createEndActionProcess" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="nodeId" >
                                <xsl:value-of select="$nodeId" />
                            </xsl:with-param>
                        </xsl:call-template>

                    </xsl:if>
                </xsl:if>

                <xsl:if test="$typeValue = 'Scene'" >

                    <xsl:call-template name="sceneActionProcess" />

                </xsl:if>

                <xsl:if test="$typeValue = 'LaunchFile'" >

                    <xsl:call-template name="launchFileActionProcess" />

                </xsl:if>

                <xsl:if test="$typeValue != 'Scene' and $typeValue != 'MettreX' and $typeValue != 'MettreY' and $typeValue != 'SceneBackground' and $typeValue != 'Rotate'" >

                </xsl:if>

                <xsl:if test="$typeValue = 'MettreX'" >

                    <xsl:call-template name="mettreXActionProcess" >
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:if>
                <xsl:if test="$typeValue = 'MettreY'" >

                    <xsl:call-template name="mettreYActionProcess" >
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:if>
                <xsl:if test="$typeValue = 'MettreXY'" >

                    <xsl:call-template name="mettreXYActionProcess" >
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:if>
                <xsl:if test="$typeValue = 'MettreAutourPos'" >

                    <xsl:call-template name="mettreAutourPosActionProcess" >
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:if>
                <xsl:if test="$typeValue = 'ModVarScene'" >

                    <xsl:call-template name="modVarSceneActionProcess" >
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                </xsl:if>

                <xsl:if test="$typeValue = 'Delete'" >
                    
                    <xsl:call-template name="deleteActionProcess" />

                </xsl:if>

                <xsl:if test="$typeValue = 'AddForceAL'" >

                    <xsl:call-template name="addForceALActionProcess" />

                </xsl:if>

                <xsl:if test="$typeValue = 'Quit'" >

                    <xsl:call-template name="quitActionProcess" />

                </xsl:if>

                <xsl:if test="$typeValue = 'SetSceneVariableAsBoolean'" >

                    <xsl:call-template name="setSceneVariableAsBooleanActionProcess" />

                </xsl:if>

                <xsl:if test="$typeValue = 'JSONToVariableStructure'" >

                    <xsl:call-template name="jsonToVariableStructureActionProcess" />

                </xsl:if>

                <xsl:if test="$typeValue = 'RotateTowardPosition'" >

                    <xsl:call-template name="rotateTowardPositionActionProcess" />

                </xsl:if>

                <xsl:if test="$typeValue = 'Rotate'" >

                    <xsl:call-template name="rotateActionProcess" />

                </xsl:if>

                            <xsl:for-each select="../conditions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                                </xsl:if>
                            </xsl:for-each>

                            <xsl:for-each select="../events" >
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //private final String EVENTS_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Events nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> parameters=<xsl:value-of select="$parametersAsString" />";
                            </xsl:for-each>

                        <!--
                        ../events
                        -->
                        <xsl:variable name="childEventWithUsedEvent" ><xsl:for-each select="../events" ><xsl:call-template name="childEventWithUsedEvent" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="motionGestureEvent" >true</xsl:with-param></xsl:call-template></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($childEventWithUsedEvent, 'found')" >
                        //SourisSurObjet - motionGestureEvent
                        @Override
                        public void process(final MotionGestureEvent motionGestureEvent) throws Exception {
                            super.processStats(motionGestureEvent);
                            
                            //Conditions - START
                            <xsl:for-each select="../conditions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                            //Condition - //SourisSurObjet - call - motionGestureEvent
                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
                                </xsl:if>
                            </xsl:for-each>
                            //Conditions - END
                        
                        }
                        </xsl:if>

                    };
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

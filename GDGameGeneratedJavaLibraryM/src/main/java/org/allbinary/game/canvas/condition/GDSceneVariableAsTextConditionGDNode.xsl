<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" indent="yes" />

    <xsl:template name="sceneVariableAsTextConditionGDNode" >
        <xsl:param name="conditionNodeIndex" />
        <xsl:param name="forExtension" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="caller" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="thisNodeArray" />
        <xsl:param name="conditionPosition" />
        <xsl:param name="logString" />
                
        <xsl:variable name="quote" >"</xsl:variable>
        
        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
                    //sceneVariableAsBooleanConditionGDNode - //Condition - //VarSceneTxt - GDNode
                    <xsl:if test="contains($forExtension, 'found')" >public </xsl:if>final GDNode NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                    
                        //VarSceneTxt - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            //final StringMaker stringBuilder = new StringMaker();
                            //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '!='" >!</xsl:if></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" /></xsl:if><xsl:if test="position() != last()" ></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '=' or text() = '!='" >.equals(</xsl:if><xsl:if test="text() = 'startsWith'" >.startsWith(</xsl:if><xsl:if test="text() = 'endsWith'" >.endsWith(</xsl:if><xsl:if test="text() = 'contains'" >.indexOf(</xsl:if></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 2" >)<xsl:if test="text() = 'contains'" > <xsl:text disable-output-escaping="yes" > &gt;</xsl:text>= 0</xsl:if></xsl:if></xsl:for-each>) {

                            <xsl:for-each select=".." >

                                <xsl:variable name="createNodeId" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="hasCreate" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" >found</xsl:if></xsl:for-each></xsl:variable>
                                //hasCreate=<xsl:value-of select="$hasCreate" />

                                <xsl:for-each select="actions" >
                                    
                                    <xsl:if test="type/value = 'Create'" >
                                        
                                        <xsl:variable name="nodeIdAsString" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                    //VarSceneTxt - //createGDObject - START
                    <xsl:call-template name="createGDObject" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="nodeAsString" >
                            <xsl:value-of select="$nodeIdAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //sceneVariableAsBooleanConditionGDNode</xsl:with-param>
                    </xsl:call-template>
                    //VarSceneTxt - //createGDObject - END

                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="typs/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //caller=<xsl:value-of select="$caller" /> - //VarSceneTxt - //hackProcessing - //Action - //Create - call
                                //TWB is this still needed
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processCreate(<xsl:value-of select="$name" />);
                                final int index = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.size() - 1;
                                    </xsl:if>
                                    
                                    <xsl:if test="not(type/value = 'Create' or type/value = 'SetBooleanVariable')" >
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                                        <xsl:if test="type/value != 'Delete'" >
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:if test="contains($hasCreate, 'found')" ><xsl:if test="$createNodeId &lt; number(substring(generate-id(), 2) - 65536)" >index</xsl:if></xsl:if>);
                                        </xsl:if>
                                        <xsl:if test="type/value = 'Delete'" >
                                        //Delete2
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].delete();
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:for-each>

                                <xsl:for-each select="actions" >
                                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                    <xsl:if test="type/value = 'Create'" >
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processEnd(index);
                                    </xsl:if>
                                    <xsl:if test="type/value = 'SetBooleanVariable'" >
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:if test="contains($hasCreate, 'found')" >index</xsl:if>);
                                    </xsl:if>
                                </xsl:for-each>
                                        
                        <xsl:for-each select="events" >
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:if>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call - //VarSceneTxt
                            <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process();
                            </xsl:if>
                        </xsl:for-each>

                        </xsl:for-each>
                                return true;
                            } else {
                                //logUtil.put(commonStrings.START, this, "Else: <xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GroupInterface)</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>");
                            }
                            
                            super.processStatsE();
                            
                            return false;
                        }
 
                        @Override
                        public boolean process(final int index3) throws Exception {
                            super.processStats();
                            
                            return this.process();
                        }
                        
                        @Override
                        public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                            super.processStats(motionGestureEvent);
                            
                            final MotionGestureInput motionGestureInput = motionGestureEvent.getMotionGesture();
                            if (motionGestureInput == touchMotionGestureFactory.PRESSED || motionGestureInput == touchMotionGestureFactory.RELEASED) {
                                return this.process();
                            }
                            return false;

                        }
 
                        @Override
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                            super.processGDStats(gameLayer);
                            
                            //return this.process();
                            
                            //final StringMaker stringBuilder = new StringMaker();
                            //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, commonStrings.PROCESS);

                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '!='" >!</xsl:if></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" /></xsl:if><xsl:if test="position() != last()" ></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '=' or text() = '!='" >.equals(</xsl:if><xsl:if test="text() = 'startsWith'" >.startsWith(</xsl:if><xsl:if test="text() = 'endsWith'" >.endsWith(</xsl:if><xsl:if test="text() = 'contains'" >.indexOf(</xsl:if></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 2" >)<xsl:if test="text() = 'contains'" > <xsl:text disable-output-escaping="yes" > &gt;</xsl:text>= 0</xsl:if></xsl:if></xsl:for-each>) {
                                return true;
                            } else {
                                //logUtil.put(commonStrings.START, this, "Else: <xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GroupInterface)</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>");
                            }

                            return false;
                        } 
                        </xsl:if>

                        <xsl:if test="contains($forExtension, 'found')" >
                        @Override
                        public boolean process(final Object[] objectArray, final int[] intArray, final long[] longArray, final float[] floatArray) {
                            
                            //Map from object array with action params
                            final GDGameLayer gameLayer = (GDGameLayer) objectArray[1];
                            this.process(gameLayer, intArray[3], intArray[5]);

                            return true;
                        }
                        </xsl:if>

                        public void process(final GDGameLayer gameLayer, final int x, final int y) {
                            final GDObject gdObject = gameLayer.gdObject;
                            this.process(gdObject, x, y);
                        }

                        public void process(final GDObject gdObject, final int x, final int y) {
                            throw new RuntimeException();
                        }

                    };

                    <xsl:if test="not(contains($forExtension, 'found'))" >
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;
                    </xsl:if>

    </xsl:template>

</xsl:stylesheet>

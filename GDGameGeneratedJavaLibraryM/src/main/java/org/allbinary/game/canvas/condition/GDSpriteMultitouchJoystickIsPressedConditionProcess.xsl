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

    <xsl:template name="spriteMultitouchJoystickIsPressedActionProcess" >
        <xsl:param name="caller" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="forExtension" />
        <xsl:param name="parametersAsString" />
        <xsl:variable name="quote" >"</xsl:variable>
                //spriteMultitouchJoystickIsPressedActionProcess - //Condition - //SpriteMultitouchJoystick::SpriteMultitouchJoystick - GDNode
                if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                    throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                }
                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                    //spriteMultitouchJoystickIsPressedActionProcess - action
                    //SpriteMultitouchJoystick::SpriteMultitouchJoystick - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();
                        
                            //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                            <xsl:for-each select=".." >
                            <xsl:for-each select="events" >
                                <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                                //caller=<xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodes - //Event - //BuiltinCommonInstructions::Standard - call
                                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                </xsl:if>
                                <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                //Event - //BuiltinCommonInstructions::Link - call - //SpriteMultitouchJoystick::SpriteMultitouchJoystick
                                <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process();
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:for-each>
                            
                            <xsl:call-template name="actionsProcess" >
                                <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                                <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                                <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                            </xsl:call-template>
                        
                        return true;
                    }

                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats();
                        
                            //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                            <xsl:for-each select=".." >
                            <xsl:for-each select="events" >
                                <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                                //caller=<xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodes - //Event - //BuiltinCommonInstructions::Standard - call
                                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
                                </xsl:if>
                                <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                //Event - //BuiltinCommonInstructions::Link - call - //SpriteMultitouchJoystick::SpriteMultitouchJoystick
                                <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process(index);
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:for-each>
                            
                            <xsl:call-template name="actionsProcess" >
                                <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                                <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                                <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                            </xsl:call-template>
                        
                        return true;
                    }

                    public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                        super.processStats(motionGestureEvent);
                        
                            //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "motion", this, commonStrings.PROCESS);
                            
                            <xsl:for-each select=".." >
                            <xsl:for-each select="events" >
                                <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                                //caller=<xsl:value-of select="$caller" /> - //eventsCreateAssignGDObjectGDNodes - //Event - //BuiltinCommonInstructions::Standard - call
                                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent, lastMotionGestureInput);
                                </xsl:if>
                                <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                //Event - //BuiltinCommonInstructions::Link - call - //MouseButtonPressed
                                <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process(motionGestureEvent, lastMotionGestureInput);
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:for-each>
                            
                            <xsl:call-template name="actionsProcess" >
                                <xsl:with-param name="caller" ><xsl:value-of select="$caller" /></xsl:with-param>
                                <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                                <xsl:with-param name="parametersAsString" ><xsl:value-of select="$parametersAsString" /></xsl:with-param>
                            </xsl:call-template>

                        return true;
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
    </xsl:template>

</xsl:stylesheet>

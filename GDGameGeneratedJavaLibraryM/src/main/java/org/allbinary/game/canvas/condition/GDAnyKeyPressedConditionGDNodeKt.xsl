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

    <xsl:import href="./GDConditionUtils.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template name="anykeyPressedConditionGDNode" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />


        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

        <xsl:variable name="quote" >"</xsl:variable>

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                    //anykeyPressedConditionGDNode - //Condition - //AnyKeyPressed - GDNode
                    <xsl:if test="contains($forExtension, 'found')" >public </xsl:if>val NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = object : GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private val CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: String = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />"

                        //AnyKeyPressed - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Throws(Exception::class)
                        override fun process(): Boolean {
                            super.processStats()
                            this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                            //<xsl:value-of select="parameters[2]" />
                            globals.anyKeyProcessorArray[0] = object : GDRGameInputProcessor() {

                                @Throws(Exception::class)
                                override fun process(allbinaryLayerManager: AllBinaryLayerManager, keyAsInteger: Integer)
                                {
                                    this.releasedGameInputProcessor.process(allbinaryLayerManager, keyAsInteger)

                            <xsl:for-each select="../events" >
                                <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                                    //../Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" />
                                    //Event - //BuiltinCommonInstructions::Standard - call
                                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()
                                </xsl:if>
                                <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
                                    //Event - //BuiltinCommonInstructions::ForEach
                                </xsl:if>
                                <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                                    //../Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                    //Event - //BuiltinCommonInstructions::Link - call
                                    <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process()
                                </xsl:if>
                            </xsl:for-each>

                            <xsl:for-each select="conditions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                    //var nodeId: Condition = <xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" >
                                    <xsl:value-of select="text()" />,</xsl:for-each>
                                    //Condition - //<xsl:value-of select="type/value" /> - call
                                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()
                            </xsl:for-each>

                            <xsl:for-each select=".." >
                                <xsl:call-template name="actionsProcessing" >
                                    <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    <xsl:with-param name="methodCall" >process()</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>

                                }

                                @Throws(Exception::class)
                                override fun processReleased(allbinaryLayerManager: AllBinaryLayerManager, keyAsInteger: Integer)
                                {

                            <xsl:for-each select="../events" >
                                <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                                    //...Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" />
                                    //Event - //BuiltinCommonInstructions::Standard - call
                                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased()
                                </xsl:if>
                                <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
                                    //Event - //BuiltinCommonInstructions::ForEach
                                </xsl:if>
                                <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                                    //../Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                    //Event - //BuiltinCommonInstructions::Link - call - //AnyKeyPressed
                                    <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.processReleased()
                                </xsl:if>
                            </xsl:for-each>

                            <xsl:for-each select="conditions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                    //var nodeId: Condition = <xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" >
                                    <xsl:value-of select="text()" />,</xsl:for-each>
                                    //Condition - //<xsl:value-of select="type/value" /> - call
                                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased()
                                    //TWB - I don't think conditions occur here remove after more testing
                                    throw RuntmeException()
                            </xsl:for-each>

                            <xsl:for-each select=".." >
                                <xsl:call-template name="actionsProcessing" >
                                    <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                    <xsl:with-param name="methodCall" >processReleased()</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>

                                    this.releasedGameInputProcessor.processReleased(allbinaryLayerManager, keyAsInteger)

                                }

                            }

                            //Make sure we only call this 1 time
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />)
                            return true
                        }

                        @Throws(Exception::class)
                        override fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): Boolean {
                            super.processStats(motionGestureEvent)

                            //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "motion", this, this.commonStrings.PROCESS)

                            return this.process()
                        }

                        @Throws(Exception::class)
                        override fun processGD(gameLayerArray: Array&lt;GDGameLayer&gt;): Boolean {
                            super.processGDStats(gameLayerArray)

                            try {
                                //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, this.commonStrings.PROCESS)

                                return this.process()
                            } catch(e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                            }
                            return true
                        }

                        </xsl:if>

                        <xsl:if test="contains($forExtension, 'found')" >
                        override fun process(objectArray: Array&lt;Object&gt;, intArray: IntArray, longArray: LongArray, floatArray: FloatArray): Boolean {

                            //Map from object array with action params
                            val gameLayer: GDGameLayer = objectArray[1] as GDGameLayer
                            this.process(gameLayer, intArray[3], intArray[5])

                            return true
                        }
                        </xsl:if>

                        fun process(gameLayer: GDGameLayer, x: Int, y: Int) {
                            val gdObject: GDObject = gameLayer.gdObject
                            this.process(gdObject, x, y)
                        }

                        fun process(gdObject: GDObject, x: Int, y: Int) {
                            throw RuntimeException()
                        }

                    }

                    <xsl:if test="not(contains($forExtension, 'found'))" >
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />")
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />
                    </xsl:if>

    </xsl:template>

</xsl:stylesheet>

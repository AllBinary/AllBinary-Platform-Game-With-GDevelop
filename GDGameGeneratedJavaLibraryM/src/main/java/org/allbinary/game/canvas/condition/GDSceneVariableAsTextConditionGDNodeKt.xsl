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

        <xsl:param name="caller" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="logString" />

        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

        <xsl:variable name="quote" >"</xsl:variable>

        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                    //sceneVariableAsBooleanConditionGDNode - //Condition - //VarSceneTxt - GDNode
                    <xsl:if test="contains($forExtension, 'found')" >public </xsl:if>val NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = object : GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private val CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: String = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />"

                        //VarSceneTxt - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Throws(Exception::class)
                        override fun process(): Boolean {
                            super.processStats()

                            //val stringBuilder: StringMaker = StringMaker()
                            //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '!='" >!</xsl:if></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" /></xsl:if><xsl:if test="position() != last()" ></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '=' or text() = '!='" >.equals(</xsl:if><xsl:if test="text() = 'startsWith'" >.startsWith(</xsl:if><xsl:if test="text() = 'endsWith'" >.endsWith(</xsl:if><xsl:if test="text() = 'contains'" >.indexOf(</xsl:if></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 2" >)<xsl:if test="text() = 'contains'" > <xsl:text disable-output-escaping="yes" > &gt;</xsl:text>= 0</xsl:if></xsl:if></xsl:for-each>) {

                                return true
                            } else {
                                //this.logUtil.putF(this.commonStrings.START, this, "Else: <xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GroupInterface)</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>")
                            }

                            super.processStatsE()

                            return false
                        }

                        @Throws(Exception::class)
                        override fun process(index3: Int): Boolean {
                            super.processStats()

                            return this.process()
                        }

                        @Throws(Exception::class)
                        override fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): Boolean {
                            super.processStats(motionGestureEvent)

                            val motionGestureInput: MotionGestureInput = motionGestureEvent.getMotionGesture()
                            if (motionGestureInput == touchMotionGestureFactory.PRESSED || motionGestureInput == touchMotionGestureFactory.RELEASED) {
                                return this.process()
                            }
                            return false

                        }

                    @Throws(Exception::class)
                    override fun processGD(gameLayerArray: Array&lt;GDGameLayer&gt;): Boolean {
                        super.processGDStats(gameLayerArray)
                        try {

                            //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, this.commonStrings.PROCESS)

                        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
                        <xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '!='" >!</xsl:if></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" /></xsl:if><xsl:if test="position() != last()" ></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:if test="text() = '=' or text() = '!='" >.equals(</xsl:if><xsl:if test="text() = 'startsWith'" >.startsWith(</xsl:if><xsl:if test="text() = 'endsWith'" >.endsWith(</xsl:if><xsl:if test="text() = 'contains'" >.indexOf(</xsl:if></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 2" >)<xsl:if test="text() = 'contains'" > <xsl:text disable-output-escaping="yes" > &gt;</xsl:text>= 0</xsl:if></xsl:if></xsl:for-each>) {
                                return true
                            } else {
                                //this.logUtil.putF(this.commonStrings.START, this, "Else: <xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GroupInterface)</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>")
                            }

                        <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                        } catch(e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                        }

                        return false
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

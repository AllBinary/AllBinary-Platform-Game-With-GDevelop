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

    <xsl:template name="timerConditionGDNode" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="caller" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="objectsAsString" />

        <xsl:param name="eventAsString" />
        <xsl:param name="actionAsStringsStrings" />
        <xsl:param name="logString" />

        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

        <xsl:variable name="quote" >"</xsl:variable>

        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                    //timerConditionGDNode - //Condition - //Timer - GDNode
                    <xsl:if test="contains($forExtension, 'found')" >public </xsl:if>val NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = object : GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                    <xsl:value-of select="$eventAsString" disable-output-escaping="yes" />

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private val CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: String = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />"

                        //A:
                        <xsl:value-of select="$actionAsStringsStrings" disable-output-escaping="yes" />

                <xsl:for-each select="../../events" >

                <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                        val <xsl:value-of select="text()" />GDGameLayerFactory: GDGameLayerFactory = resources.<xsl:value-of select="text()" />GDGameLayerFactory
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                </xsl:for-each>

                </xsl:for-each>

                        //Timer - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Throws(Exception::class)
                        override fun process(): Boolean {
                            super.processStats()

                            globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.delay = (1000 * <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>) as Int
                            //this.logUtil.put(StringMaker().append(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.getElapsed(globals.globalsGameTickTimeDelayHelper.lastStartTime)).append('/').append(globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.delay).toString(), this, this.commonStrings.PROCESS)
                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if>globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.isTime(gameTickTimeDelayHelper.startTime)) {
                                //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)
                                return true
                            } else {
                                return false
                            }
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

                    //gdNodes.runnableList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />])
    </xsl:template>

</xsl:stylesheet>

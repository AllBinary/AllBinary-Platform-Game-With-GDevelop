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

    <xsl:template name="numberVariableConditionGDNode" >
        <xsl:param name="conditionNodeIndex" />
        <xsl:param name="forExtension" />

        <xsl:param name="caller" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

        <xsl:variable name="quote" >"</xsl:variable>

        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                    //numberVariableConditionGDNode - //Condition - //NumberVariable - GDNode
                    <xsl:if test="contains($forExtension, 'found')" >public </xsl:if>val NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = object : GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private val CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: String = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />"

                        //NumberVariable - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Throws(Exception::class)
                        override fun process(): Boolean {
                            super.processStats()

                            var result: Boolean = false

                            //val stringBuilder: StringMaker = StringMaker()
                            //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:call-template name="addGlobalsForVariables" ><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:variable name="objectInParam0" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>
                        <xsl:variable name="objectInParam" ><xsl:if test="not(contains($objectInParam0, '(globals') or contains($objectInParam0, '(gameGlobals'))" ><xsl:value-of select="$objectInParam0" /></xsl:if></xsl:variable>
                        <xsl:variable name="name" ><xsl:value-of select="$objectInParam" /></xsl:variable>

                        <xsl:variable name="hasObjectGroup" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $name" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:variable name="hasObject" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $name" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:if test="$name != 'gameTickTimeDelayHelper'" >

                        <xsl:if test="contains($hasObjectGroup, 'found')" >
                            //This code should probably never be used - it is here to compile with at least some possible logic 2
                            val gdGameLayerList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(0) as BasicArrayList

                            if(gdGameLayerList.size() == 0) {
                                return false
                            }
                            val <xsl:value-of select="$name" />GDGameLayer: GDGameLayer = gdGameLayerList.get(0) as GDGameLayer
                        </xsl:if>

                        <xsl:if test="contains($hasObjectGroup, 'found') or contains($hasObject, 'found')" >
                        <xsl:if test="not(contains($hasObjectGroup, 'found'))" >
                            if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.size() == 0) {
                                return false
                            }
                            val <xsl:value-of select="$name" />GDGameLayer: GDGameLayer = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.get(0) as GDGameLayer
                        </xsl:if>

                            <xsl:text>&#10;</xsl:text>
                            val <xsl:value-of select="$name" />: GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$objectInParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> = </xsl:text>
                                <xsl:value-of select="$name" />GDGameLayer.gdObject as GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$objectInParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" />
                            <xsl:text>&#10;</xsl:text>
                        </xsl:if>

                        </xsl:if>

                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:value-of select="text() " disable-output-escaping="yes" /></xsl:for-each>) {

                                //stringBuilder.delete(0, stringBuilder.length())
                                //this.logUtil.put(stringBuilder.append(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).toString(), this, this.commonStrings.PROCESS)

                                result = true
                            } else {
                                //this.logUtil.putF(this.commonStrings.START, this, "Else: <xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GroupInterface)</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>")
                            }

                            super.processStatsE()

                            return result
                        }

                    @Throws(Exception::class)
                    override fun process(index: Int): Boolean {
                        super.processStats(index)

                        ////this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "index", this, this.commonStrings.PROCESS)

                        return this.process()
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

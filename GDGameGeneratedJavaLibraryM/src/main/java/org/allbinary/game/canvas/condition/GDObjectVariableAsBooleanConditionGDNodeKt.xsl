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

    <xsl:template name="objectVariableAsBooleanConditionGDNode" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />


        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

        <xsl:variable name="quote" >"</xsl:variable>

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>

                    //objectVariableAsBooleanConditionGDNode - //Condition - //BooleanObjectVariable was //ObjectVariableAsBoolean - GDNode
                    <xsl:if test="contains($forExtension, 'found')" >public </xsl:if>val NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = object : GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private val CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: String = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />"
                        //private val ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: String = "Else: " + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />

                        //private val stringBuilder: StringMaker = StringMaker()

                        //BooleanObjectVariable - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Throws(Exception::class)
                        override fun process(): Boolean {
                            super.processStats()

                            var result: Boolean = true
                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:variable name="hasObject" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $name" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObjectGroup" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $name" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                        val size3: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.size()
                        for(index3 in 0 until <xsl:text disable-output-escaping="yes" ></xsl:text>size3) {
                        val <xsl:value-of select="$name" />GDGameLayerList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(index3) as BasicArrayList
                    </xsl:if>
                    <xsl:if test="not(contains($hasObjectGroup, 'found'))" >
                        val <xsl:value-of select="$name" />GDGameLayerList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList
                    </xsl:if>

                            val size: Int = <xsl:value-of select="$name" />GDGameLayerList.size()
                            lateinit var <xsl:value-of select="$name" />GDGameLayer: GDGameLayer
                            lateinit var <xsl:value-of select="$name" />: GDObject
                            for(index in 0 until <xsl:text disable-output-escaping="yes" ></xsl:text>size) {

                                <xsl:value-of select="$name" />GDGameLayer = <xsl:value-of select="$name" />GDGameLayerList.get(index) as GDGameLayer
                                <xsl:value-of select="$name" /><xsl:text> = </xsl:text><xsl:value-of select="$name" />GDGameLayer.gdObject

                                //stringBuilder.delete(0, stringBuilder.length())
                                //this.logUtil.put(stringBuilder.append("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> ").append(commonLabels.INDEX_LABEL).appendint(index).append(<xsl:for-each select="parameters" ><xsl:value-of select="text()" /></xsl:for-each>).toString(), this, this.commonStrings.PROCESS)
                                if(<xsl:if test="$inverted = 'true'" >!</xsl:if><xsl:for-each select="parameters" ><xsl:if test="position() = 3 and (string-length(text()) = 0 or text() = 'False')" >!</xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 1" >(<xsl:value-of select="text()" /> as GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 2" >).<xsl:value-of select="text()" /></xsl:if></xsl:for-each>) {
                                    //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                                } else {
                                    //this.logUtil.put(ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)
                                    result = false
                                }
                                //this.logUtil.put(<xsl:value-of select="$name" />GDGameLayerList.get(index).toString(), this, this.commonStrings.PROCESS)
                            }

                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                        }
                    </xsl:if>

                            super.processStatsE()

                            return result
                        }

                        @Throws(Exception::class)
                        override fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): Boolean {
                            super.processStats(motionGestureEvent)

                            //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                            return this.process()
                        }

                    @Throws(Exception::class)
                    override fun processGD(gameLayerArray: Array&lt;GDGameLayer&gt;): Boolean {
                        try {

                            //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, this.commonStrings.PROCESS)

                            <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
                            <xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                                //stringBuilder.delete(0, stringBuilder.length())
                                //this.logUtil.put(stringBuilder.append("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> ").appendint(index).appendint(index).append(<xsl:for-each select="parameters" ><xsl:value-of select="text()" /></xsl:for-each>).toString(), this, this.commonStrings.PROCESS)
                                if(<xsl:if test="$inverted = 'true'" >!</xsl:if><xsl:for-each select="parameters" ><xsl:if test="position() = 3 and (string-length(text()) = 0 or text() = 'False')" >!</xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 1" >(<xsl:value-of select="text()" /> as GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 2" >).<xsl:value-of select="text()" /></xsl:if></xsl:for-each>) {
                                    //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                                    return true
                                } //else {
                                    //this.logUtil.put(ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)
                                //}

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

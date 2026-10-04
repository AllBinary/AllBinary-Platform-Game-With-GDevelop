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

    <xsl:template name="opacityConditionGDNode" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />


        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

        <xsl:variable name="quote" >"</xsl:variable>
        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                    //opacityConditionGDNode - //Condition - //Opacity - GDNode
                    <xsl:if test="contains($forExtension, 'found')" >public </xsl:if>val NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = object : GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private val CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: String = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />"

                        //Opacity - <xsl:value-of select="$param" /> condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Throws(Exception::class)
                        override fun process(): Boolean {

                            //val stringBuilder: StringMaker = StringMaker()
                            //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            val size: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gdObjectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gdObjectName" />GDGameLayerList.size()
                            for(index in 0 until <xsl:text disable-output-escaping="yes" ></xsl:text>size) {

                                //stringBuilder.delete(0, stringBuilder.length())
                                //this.logUtil.put(stringBuilder.append(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(commonSeps.SPACE).append(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" >(globals.<xsl:value-of select="text()" disable-output-escaping="yes" />GDGameLayerList.get(index) as GDGameLayer).gdObject.opacity</xsl:if><xsl:if test="position() != 1" ><xsl:text> </xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if></xsl:for-each>).toString(), this, this.commonStrings.PROCESS)
                                <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >val gdGameLayer: GDGameLayer = (globals.<xsl:value-of select="text()" disable-output-escaping="yes" />GDGameLayerList.get(index) as GDGameLayer)</xsl:if></xsl:for-each>
                                if(<xsl:if test="$inverted = 'true'" >!</xsl:if><xsl:for-each select="parameters" ><xsl:if test="position() = 1" >gdGameLayer.gdObject.opacity</xsl:if><xsl:if test="position() != 1" ><xsl:text> </xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if></xsl:for-each>) {
                                    return true
                                }
                            }

                            return false
                        }

                        @Throws(Exception::class)
                        override fun process(index: Int): Boolean {
                            super.processStats(index)

                            //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)
                            <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >val gdGameLayer: GDGameLayer = (globals.<xsl:value-of select="text()" disable-output-escaping="yes" />GDGameLayerList.get(index) as GDGameLayer)</xsl:if></xsl:for-each>
                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if><xsl:for-each select="parameters" ><xsl:if test="position() = 1" >gdGameLayer.gdObject.opacity</xsl:if><xsl:if test="position() != 1" ><xsl:text> </xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if></xsl:for-each>) {
                                return true
                            }

                            return false
                        }

                        @Throws(Exception::class)
                        override fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): Boolean {
                            super.processStats(motionGestureEvent)

                            //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "motion", this, this.commonStrings.PROCESS)

                            return this.process()
                        }

                    @Throws(Exception::class)
                    override fun processGD(gameLayerArray: Array&lt;GDGameLayer&gt;): Boolean {
                        try {

                        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
                        <xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                                //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, this.commonStrings.PROCESS)

                                if(<xsl:if test="$inverted = 'true'" >!</xsl:if><xsl:value-of select="$param" />GDGameLayer.gdObject.opacity<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:text> </xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if></xsl:for-each>) {
                                   return true
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

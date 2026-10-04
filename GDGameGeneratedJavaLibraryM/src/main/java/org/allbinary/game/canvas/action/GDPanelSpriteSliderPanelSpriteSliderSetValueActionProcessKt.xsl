<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="panelSpriteSliderPanelSpriteSliderSetValueActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                        //PanelSpriteSlider::PanelSpriteSlider::SetValue - action - START - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                        override fun process(): Boolean {
                            super.processStats()

                            //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)
                            //Parameters - 2
                            <xsl:variable name="thirdParam0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                            <xsl:variable name="thirdParam1" >
                            <xsl:call-template name="string-replace-all" >
                                <xsl:with-param name="text" >
                                    <xsl:value-of select="$thirdParam0" />
                                </xsl:with-param>
                                <xsl:with-param name="find" >VariableString(</xsl:with-param>
                                <xsl:with-param name="replacementText" >VariableString(globals.</xsl:with-param>
                            </xsl:call-template>
                            </xsl:variable>

                            <xsl:variable name="thirdParam3" >
                            <xsl:call-template name="string-replace-all" >
                                <xsl:with-param name="text" >
                                    <xsl:value-of select="$thirdParam1" />
                                </xsl:with-param>
                                <xsl:with-param name="find" >TimerElapsedTime("</xsl:with-param>
                                <xsl:with-param name="replacementText" >TimerElapsedTime(globals.</xsl:with-param>
                            </xsl:call-template>
                            </xsl:variable>

                            <xsl:variable name="thirdParam4" >
                                <xsl:if test="contains($thirdParam3, 'TimerElapsedTime(globals.')" >
                            <xsl:call-template name="string-replace-all" >
                                <xsl:with-param name="text" >
                                    <xsl:value-of select="$thirdParam3" />
                                </xsl:with-param>
                                <xsl:with-param name="find" >")</xsl:with-param>
                                <xsl:with-param name="replacementText" >TimeDelayHelper)</xsl:with-param>
                            </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="not(contains($thirdParam3, 'TimerElapsedTime(globals.'))" ><xsl:value-of select="$thirdParam3" /></xsl:if>
                            </xsl:variable>

                            <xsl:variable name="thirdParam" >
                            <xsl:call-template name="string-replace-all" >
                                <xsl:with-param name="text" >
                                    <xsl:value-of select="$thirdParam4" />
                                </xsl:with-param>
                                <xsl:with-param name="find" >]</xsl:with-param>
                                <xsl:with-param name="replacementText" >)</xsl:with-param>
                            </xsl:call-template>
                            </xsl:variable>

                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >
                            val size: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size()
                            lateinit var gameLayer: GDGameLayer
                            for(index in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size) {
                                gameLayer = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index) as GDGameLayer
                                </xsl:if>
                                <xsl:if test="position() = 2" ><xsl:if test="text() = '='" >gameLayer.setValue(</xsl:if></xsl:if>
                                <xsl:if test="position() = 3" ><xsl:value-of select="$thirdParam" /></xsl:if>
                                <xsl:if test="position() = last()" >)
                            }</xsl:if>
                            </xsl:for-each>

                            return true
                        }


                    override fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): Boolean {
                        super.processStats(motionGestureEvent)

                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        return this.process()
                    }


                    override fun processGD(gameLayerArray: Array&lt;GDGameLayer&gt;): Boolean {
                        super.processGDStats(gameLayerArray)

                        try {
                            //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
                        <xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayer</xsl:if>
                                <xsl:if test="position() = 2" >.setValue(</xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="$thirdParam" /></xsl:if><xsl:if test="position() = last()" >)</xsl:if>
                            </xsl:for-each>

                        <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                        } catch(e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                        }
                        return true
                    }

                        //PanelSpriteSlider::PanelSpriteSlider::SetValue - action - END
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
    </xsl:template>

</xsl:stylesheet>

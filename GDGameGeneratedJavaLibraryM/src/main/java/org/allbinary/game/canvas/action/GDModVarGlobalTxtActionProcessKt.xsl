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

    <xsl:template name="modVarGlobalTxtActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                        <xsl:variable name="firstOrBeforeFourthParam" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        //firstOrBeforeFourthParam=<xsl:value-of select="$firstOrBeforeFourthParam" />

                    <xsl:variable name="secondParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:variable name="param3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:call-template name="addGlobalsForVariables" ><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="param3WithoutQuotes" ><xsl:value-of select="translate($param3, $quote, '')" /></xsl:variable>
                        <xsl:variable name="param3Updated" ><xsl:value-of select="translate(translate(translate(translate(translate($param3WithoutQuotes, '=', 'equal'), '+', 'plus'), '-', 'minus'), '*', 'multiply'), '/', 'divide')" /></xsl:variable>
                        <xsl:variable name="param3AsFinalString" >__<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(translate(translate($param3Updated, '.', '_'), ')', '_'), '(', '_')" /></xsl:with-param></xsl:call-template></xsl:variable>

                        <xsl:variable name="objectInParam0" ><xsl:value-of select="substring-before($param3, '.')" /></xsl:variable>
                        <xsl:variable name="objectInParam" ><xsl:if test="not(contains($objectInParam0, '(globals') or contains($objectInParam0, '(gameGlobals'))" ><xsl:value-of select="$objectInParam0" /></xsl:if></xsl:variable>

                <xsl:if test="contains($param3, $quote)" >
                        //GDStringLiteral - BuiltinCommonInstructions::CompareStrings
                        private val <xsl:value-of select="$param3AsFinalString" />: String = <xsl:call-template name="string-replace-all" >
                                            <xsl:with-param name="text" >
                                    <xsl:call-template name="string-replace-all" >
                                        <xsl:with-param name="text" ><xsl:value-of select="$param3" /></xsl:with-param>
                                        <xsl:with-param name="find" >&quot;&quot;</xsl:with-param>
                                        <xsl:with-param name="replacementText" >stringUtil.EMPTY_STRING</xsl:with-param>
                                    </xsl:call-template>
                                        </xsl:with-param>
                                        <xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param>
                                        <xsl:with-param name="replacementText" >"</xsl:with-param>
                                    </xsl:call-template></xsl:if>

                <xsl:variable name="param3Selected" >
                    <xsl:if test="contains($param3, $quote)" ><xsl:value-of select="$param3AsFinalString" /></xsl:if>
                    <xsl:if test="not(contains($param3, $quote))" ><xsl:call-template name="addGlobals" ><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="text" ><xsl:value-of select="$param3" /></xsl:with-param></xsl:call-template></xsl:if>
                </xsl:variable>

                    //ModVarGlobalTxt - //<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each> - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                    override fun process(): Boolean {
                        super.processStats()

                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        //objectInParam=<xsl:value-of select="$objectInParam" />
                        <xsl:text>&#10;</xsl:text>

                        <xsl:variable name="name" ><xsl:value-of select="$objectInParam" /></xsl:variable>
                        <xsl:if test="string-length($objectInParam) > 0" >
                            //Found object in param 3

                        <xsl:variable name="hasObjectGroup" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $name" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:if test="not($name = 'gameTickTimeDelayHelper' or $name = number($name))" >

                        <xsl:if test="contains($hasObjectGroup, 'found')" >
                            //This code should probably never be used - it is here to compile with at least some possible logic 2
                            val gdGameLayerList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(0) as BasicArrayList

                            if(gdGameLayerList.size() == 0) {
                                return false
                            }
                            val <xsl:value-of select="$name" />GDGameLayer: GDGameLayer = gdGameLayerList.get(0) as GDGameLayer
                        </xsl:if>

                        <xsl:if test="not(contains($hasObjectGroup, 'found'))" >
                            val <xsl:value-of select="$name" />GDGameLayer: GDGameLayer = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.get(0) as GDGameLayer
                        </xsl:if>

                            <xsl:text>&#10;</xsl:text>
                            val <xsl:value-of select="$name" />: GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$objectInParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /> =
                                (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$objectInParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" />)
                                <xsl:value-of select="$name" />GDGameLayer.gdObject
                            <xsl:text>&#10;</xsl:text>

                        </xsl:if>

                        </xsl:if>

                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" /></xsl:if>
                                <xsl:if test="position() = 2" ><xsl:value-of select="text()" /><xsl:if test="text() = '-'" >=</xsl:if><xsl:if test="text() = '+'" >=</xsl:if></xsl:if>
<!--                                string(number($param3)) = 'NaN'-->
                                <xsl:if test="position() = 3" ><xsl:variable name="updatedParam" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$param3Selected" /></xsl:with-param><xsl:with-param name="find" >Slider.Value()</xsl:with-param><xsl:with-param name="replacementText" >SliderGDGameLayer.Value()</xsl:with-param></xsl:call-template></xsl:variable><xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="$updatedParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template></xsl:if>
                                <xsl:if test="position() = last()" ></xsl:if>
                            </xsl:for-each>

                        return true
                    }


                    override fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): Boolean {
                        super.processStats(motionGestureEvent)

                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        return this.process()
                    }


                    override fun processGD(gameLayerArray: Array&lt;GDGameLayer&gt;): Boolean {
                        try {

                        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
                        <xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                             //objectInParam=<xsl:value-of select="$objectInParam" />
                            <xsl:text>&#10;</xsl:text>

                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" /></xsl:if>
                                <xsl:if test="position() = 2" ><xsl:value-of select="text()" /><xsl:if test="text() = '-'" >=</xsl:if><xsl:if test="text() = '+'" >=</xsl:if></xsl:if>
                                <xsl:if test="position() = 3" ><xsl:variable name="updatedParam" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$param3" /></xsl:with-param><xsl:with-param name="find" >Slider.Value()</xsl:with-param><xsl:with-param name="replacementText" >SliderGDGameLayer.Value()</xsl:with-param></xsl:call-template></xsl:variable><xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="$updatedParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template></xsl:if>
                                <xsl:if test="position() = last()" ></xsl:if>
                            </xsl:for-each>

                            <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                        } catch(e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
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
    </xsl:template>

</xsl:stylesheet>

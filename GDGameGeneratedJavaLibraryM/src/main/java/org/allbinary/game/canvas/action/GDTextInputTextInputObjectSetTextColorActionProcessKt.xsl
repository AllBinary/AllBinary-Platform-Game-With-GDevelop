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

    <xsl:template name="textInputTextInputObjectSetTextColorActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                    <xsl:variable name="hasBuiltinCommonInstructionsForEachToProcessGD" >
                        <xsl:call-template name="hasBuiltinCommonInstructionsForEachToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>

                    <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="param2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                    <xsl:variable name="hasObjectGroup" >
                        <xsl:for-each select="//objectsGroups" >
                            <xsl:if test="name = $param" >found</xsl:if>
                        </xsl:for-each>
                    </xsl:variable>

                                    <xsl:variable name="variableName" ><xsl:for-each select="//variables" ><xsl:if test="contains($param2, name)" ><xsl:value-of select="name" /></xsl:if></xsl:for-each></xsl:variable>
                                    <xsl:variable name="globalWithVariableName" >globals.<xsl:value-of select="$variableName" /></xsl:variable>
                                    //variableName=<xsl:value-of select="$variableName" /> globalWithVariableName=<xsl:value-of select="$globalWithVariableName" />

                                    <!-- if the color is from more than 1 variable this will break -->
                                    <xsl:variable name="param2b" >
                                        <xsl:if test="string-length($variableName) > 0" >
                                            <xsl:call-template name="string-replace-all" >
                                                <xsl:with-param name="text" ><xsl:value-of select="$param2" /></xsl:with-param>
                                                <xsl:with-param name="find" ><xsl:value-of select="$variableName" /></xsl:with-param>
                                                <xsl:with-param name="replacementText" ><xsl:value-of select="$globalWithVariableName" /></xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="string-length($variableName) = 0" ><xsl:value-of select="$param2" /></xsl:if>
                                    </xsl:variable>

                                    <xsl:variable name="color" >
                                        <xsl:if test="contains($param2, ';')" ><xsl:text>ARGB(255, </xsl:text><xsl:value-of select="translate(translate(translate($param2b, '+', ''), $quote, ''), ';', ',')" /></xsl:if>
                                        <xsl:if test="not(contains($param2, ';'))" ><xsl:text>(255, </xsl:text><xsl:value-of select="text()" /></xsl:if>
                                    </xsl:variable>

                        //TextInput::TextInputObject::SetTextColor - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                        override fun process(): Boolean {
                            super.processStats()

                            try {

                                //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                                <xsl:if test="contains($hasBuiltinCommonInstructionsForEachToProcessGD, 'found')" >
                                    if(true) throw RuntimeException()
                                </xsl:if>
                                <xsl:if test="not(contains($hasBuiltinCommonInstructionsForEachToProcessGD, 'found'))" >

                                    val colorAsInt: Int = basicColorUtil.get<xsl:value-of select="$color" />)
                                    <xsl:text>&#10;</xsl:text>

                                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                                    val size3: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$param" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$param" />GDGameLayerListOfList.size()
                                    for(index3 in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size3) {
                                        val <xsl:value-of select="$param" />GDGameLayerList: BasicArrayList = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$param" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$param" />GDGameLayerListOfList.get(index3) as BasicArrayList)
                                    </xsl:if>
                                    <xsl:if test="not(contains($hasObjectGroup, 'found'))" >
                                        val <xsl:value-of select="$param" />GDGameLayerList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$param" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$param" />GDGameLayerList
                                    </xsl:if>

                                        val basicColor: BasicColor = smallBasicColorCacheFactory.getAndOrCreate(colorAsInt)
                                        val size: Int = <xsl:value-of select="$param" />GDGameLayerList.size()
                                        lateinit var gameLayer: GDGameLayer
                                        for(index in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size) {
                                            gameLayer = <xsl:value-of select="$param" />GDGameLayerList.get(index) as GDGameLayer
                                            gameLayer.setBasicColor(basicColor)
                                            //<xsl:value-of select="$param" />TextAnimation.setBasicColor(smallBasicColorCacheFactory.getAndOrCreate(colorAsInt))
                                        }

                                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                                    }
                                    </xsl:if>

                                    <xsl:text>&#10;</xsl:text>

                                </xsl:if>


                            } catch(e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                            }

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

                        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
                        <xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                            val colorAsInt: Int = basicColorUtil.get<xsl:value-of select="$color" />)
                            <xsl:text>&#10;</xsl:text>
                            val basicColor: BasicColor = smallBasicColorCacheFactory.getAndOrCreate(colorAsInt)
                            <xsl:value-of select="$param" />GDGameLayer.setBasicColor(basicColor)

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

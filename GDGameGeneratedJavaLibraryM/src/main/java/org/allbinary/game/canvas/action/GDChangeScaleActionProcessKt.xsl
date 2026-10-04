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

    <xsl:template name="changeScaleActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                                <xsl:variable name="paramOne" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="paramThree0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="number(text()) = text()" >f</xsl:if></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="paramThree1" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$paramThree0" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$paramOne" />.</xsl:with-param><xsl:with-param name="replacementText" >globals.</xsl:with-param></xsl:call-template></xsl:variable>
                                <xsl:variable name="paramThree" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$paramThree1" /></xsl:with-param><xsl:with-param name="find" >ObjectTimerElapsedTime(</xsl:with-param><xsl:with-param name="replacementText" >ObjectTimerElapsedTime(index, </xsl:with-param></xsl:call-template></xsl:variable>

                        //ChangeScale - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                        override fun process(): Boolean {
                            super.processStats()

                            try {

                                //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                                val size: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOne" />GDGameLayerList.size()
                                lateinit var gameLayer: GDGameLayer
                                for(index in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size) {
                                    gameLayer = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOne" />GDGameLayerList.get(index) as GDGameLayer
                                    gameLayer.gdObject.scaleX = gameLayer.gdObject.scaleY = <xsl:value-of select="$paramThree" /> as float
                                    gameLayer.setScalable()
                                    gameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta)
                                }

                            } catch(e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                            }

                            return true
                        }


                        override fun process(index: Int): Boolean {
                            super.processStats()

                            try {

                                //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, this.commonStrings.PROCESS)

                                val gameLayer: GDGameLayer = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOne" />GDGameLayerList.get(index) as GDGameLayer
                                gameLayer.gdObject.scaleX = gameLayer.gdObject.scaleY = <xsl:value-of select="$paramThree" /> as float
                                gameLayer.setScalable()

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

                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
                        <xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                        <xsl:value-of select="$paramOne" />GDGameLayer.gdObject.scaleX = <xsl:value-of select="$paramOne" />GDGameLayer.gdObject.scaleY = <xsl:value-of select="$paramThree" /> as float
                        <xsl:value-of select="$paramOne" />GDGameLayer.setScalable()

                        <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

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

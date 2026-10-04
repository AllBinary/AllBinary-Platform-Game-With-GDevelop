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

    <xsl:template name="resizableCapabilityResizableBehaviorSetWidthActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                                <xsl:variable name="paramOne" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="paramFour" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /><xsl:if test="number(text()) = text()" >f</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:variable name="hasObject" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $paramOne" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                            <xsl:variable name="hasObjectGroup" >
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:if test="name = $paramOne" >
                                                    found
                                                </xsl:if>
                                            </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:variable>

                        <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$paramOne" /></xsl:variable>

                        //ResizableCapability::ResizableBehavior::SetWidth - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                        override fun process(): Boolean {
                            super.processStats()

                            try {

                                //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            val size4: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOne" />GDGameLayerListOfList.size()
                            for(index4 in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size4) {
                            val <xsl:value-of select="$paramOne" />GDGameLayerList: BasicArrayList = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOne" />GDGameLayerListOfList.get(index4) as BasicArrayList)
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup) = 0" >
                            val <xsl:value-of select="$paramOne" />GDGameLayerList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOne" />GDGameLayerList
                            </xsl:if>

                                val size: Int = <xsl:value-of select="$paramOne" />GDGameLayerList.size()
                                lateinit var <xsl:value-of select="$paramOne" />GDGameLayer: GDGameLayer
                                lateinit var <xsl:value-of select="$paramOne" />: <xsl:value-of select="$gdObjectFactory" />
                                for(index in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size) {
                                    <xsl:value-of select="$paramOne" />GDGameLayer = <xsl:value-of select="$paramOne" />GDGameLayerList.get(index) as GDGameLayer
                                    <xsl:value-of select="$paramOne" /> = <xsl:value-of select="$paramOne" />GDGameLayer.gdObject as <xsl:value-of select="$gdObjectFactory" />

                                    <xsl:value-of select="$paramOne" />.updateSize(<xsl:value-of select="$paramFour" />, <xsl:value-of select="$paramOne" />.height)
                                    <xsl:value-of select="$paramOne" />GDGameLayer.updateSize()
                                    <xsl:value-of select="$paramOne" />GDGameLayer.setScalable()
                                    <xsl:value-of select="$paramOne" />GDGameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta)
<!--
                                    if(<xsl:value-of select="$paramOne" />.scaleY == 1.0f) {
                                        <xsl:value-of select="$paramOne" />.widthAtInitialScale = <xsl:value-of select="$paramOne" />.width
                                        <xsl:value-of select="$paramOne" />.heightAtInitialScale = <xsl:value-of select="$paramOne" />.height
                                    }
                                    <xsl:value-of select="$paramOne" />.scaleX = (<xsl:value-of select="$paramFour" />) / <xsl:value-of select="$paramOne" />.widthAtInitialScale
                                    <xsl:value-of select="$paramOne" />GDGameLayer.setScalable()
                                    <xsl:value-of select="$paramOne" />GDGameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta)
-->
                                }

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            }
                            </xsl:if>

                            } catch(e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                            }

                            return true
                        }


                        override fun process(index: Int): Boolean {
                            super.processStats()

                            try {

                                //this.logUtil.putF(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, this.commonStrings.PROCESS)

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            val size4: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOne" />GDGameLayerListOfList.size()
                            for(index4 in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size4) {
                            val <xsl:value-of select="$paramOne" />GDGameLayerList: BasicArrayList = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOne" />GDGameLayerListOfList.get(index4) as BasicArrayList)
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup) = 0" >
                            val <xsl:value-of select="$paramOne" />GDGameLayerList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOne" />GDGameLayerList
                            </xsl:if>

                                val <xsl:value-of select="$paramOne" />GDGameLayer: GDGameLayer = <xsl:value-of select="$paramOne" />GDGameLayerList.get(index) as GDGameLayer
                                val <xsl:value-of select="$paramOne" />: <xsl:value-of select="$gdObjectFactory" /> = <xsl:value-of select="$paramOne" />GDGameLayer.gdObject as <xsl:value-of select="$gdObjectFactory" />

                                <xsl:value-of select="$paramOne" />.updateSize(<xsl:value-of select="$paramFour" />, <xsl:value-of select="$paramOne" />.height)
                                <xsl:value-of select="$paramOne" />GDGameLayer.updateSize()
                                <xsl:value-of select="$paramOne" />GDGameLayer.setScalable()
                                <xsl:value-of select="$paramOne" />GDGameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta)

<!--
                                if(<xsl:value-of select="$paramOne" />.scaleY == 1.0f) {
                                    <xsl:value-of select="$paramOne" />.widthAtInitialScale = <xsl:value-of select="$paramOne" />.width
                                    <xsl:value-of select="$paramOne" />.heightAtInitialScale = <xsl:value-of select="$paramOne" />.height
                                }
                                <xsl:value-of select="$paramOne" />.scaleY = (<xsl:value-of select="$paramFour" />) / <xsl:value-of select="$paramOne" />.heightAtInitialScale
                                <xsl:value-of select="$paramOne" />GDGameLayer.setScalable()
                                <xsl:value-of select="$paramOne" />GDGameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta)
-->

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            }
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

                        <xsl:value-of select="$paramOne" />.updateSize(<xsl:value-of select="$paramFour" />, <xsl:value-of select="$paramOne" />.height)
                        <xsl:value-of select="$paramOne" />GDGameLayer.updateSize()
                        <xsl:value-of select="$paramOne" />GDGameLayer.setScalable()
                        <xsl:value-of select="$paramOne" />GDGameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta)

<!--
                            if(<xsl:value-of select="$paramOne" />.width == 0 || <xsl:value-of select="$paramOne" />.height == 0) {
                               this.logUtil.putF("Skip scaling 0 sized object", this, this.commonStrings.PROCESS)
                            } else {
                                if(<xsl:value-of select="$paramOne" />.scaleY == 1.0f) {
                                    <xsl:value-of select="$paramOne" />.widthAtInitialScale = <xsl:value-of select="$paramOne" />.width
                                    <xsl:value-of select="$paramOne" />.heightAtInitialScale = <xsl:value-of select="$paramOne" />.height
                                }
                                <xsl:value-of select="$paramOne" />.scaleX = (<xsl:value-of select="$paramFour" />) / <xsl:value-of select="$paramOne" />.widthAtInitialScale
                                <xsl:value-of select="$paramOne" />GDGameLayer.setScalable()
                                <xsl:value-of select="$paramOne" />GDGameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta)
                            }
-->

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

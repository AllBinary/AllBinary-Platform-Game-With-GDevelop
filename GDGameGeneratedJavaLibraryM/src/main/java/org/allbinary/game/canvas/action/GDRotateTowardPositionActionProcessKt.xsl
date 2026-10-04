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

    <xsl:import href="../GDLayoutInstances.xsl" />

    <xsl:template name="rotateTowardPositionActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

        private val noDecimalTrigTable: NoDecimalTrigTable = NoDecimalTrigTable.getInstance()

        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

        <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /></xsl:variable>
                    //RotateTowardPosition - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                    override fun process(): Boolean {
                        super.processStats()

                        val size: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.size()
                        lateinit var <xsl:value-of select="$name" />GDGameLayer: GDGameLayer
                        for(index in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size) {
                            <xsl:value-of select="$name" />GDGameLayer = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.get(index) as GDGameLayer)
                            <xsl:variable name="id" ><xsl:for-each select="/game/layouts" ><xsl:if test="$layoutIndex = position() - 1" ><xsl:for-each select="objects" ><xsl:if test="$name = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="objectsGroups" ><xsl:if test="$name = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each><xsl:for-each select="/game" ><xsl:for-each select="objects" ><xsl:if test="$name = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="objectsGroups" ><xsl:if test="$name = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
                            gameGlobals.tempGameLayerArray[<xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />] = <xsl:value-of select="$name" />GDGameLayer
                            this.processGD(gameGlobals.tempGameLayerArray)
                            <xsl:value-of select="$name" />GDGameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta)
                        }

                        return true
                    }


                    override fun process(index: Int): Boolean {
                        super.processStats(index)

                        //this.logUtil.putF(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, this.commonStrings.PROCESS)

                        try {

                            <xsl:call-template name="layoutInstances" >
                                <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                                <xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param>
                            </xsl:call-template>

                        val gameLayer: GDGameLayer = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.get(index) as GDGameLayer)
                        val <xsl:value-of select="$name" />: <xsl:value-of select="$gdObjectFactory" /> = <xsl:value-of select="$name" />GDGameLayer.gdObject as <xsl:value-of select="$gdObjectFactory" />
                        <xsl:text>&#10;</xsl:text>

<xsl:text>                        </xsl:text>val dx: Int = <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.x - </xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" ></xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
<xsl:text>                        </xsl:text>val dy: Int = <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.y - </xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" ></xsl:if></xsl:for-each>

                            val angleOfTarget: Int = noDecimalTrigTable.antiTan(dx, dy)
                            var angle: Short = (270 - angleOfTarget - <xsl:value-of select="$name" />.angle) as short
                            while (angle <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 359) {
                                angle -= 360
                            }
                            while (angle <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 0) {
                                angle += 360
                            }

                            <xsl:value-of select="$name" />.rotationP = angle
                            if(<xsl:value-of select="$name" />.rotationP != 0) {
                                this.logUtil.put(StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(<xsl:value-of select="$name" />.rotationP).append("<xsl:text>&lt;</xsl:text>").append(<xsl:value-of select="$name" />.angle).toString(), this, this.commonStrings.PROCESS)
                            }
                            gameLayer.updateRotation(1000)
                            if(<xsl:value-of select="$name" />.rotationP != 0) {
                                this.logUtil.put(StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(<xsl:value-of select="$name" />.rotationP).append("<xsl:text>&gt;</xsl:text>").append(<xsl:value-of select="$name" />.angle).toString(), this, this.commonStrings.PROCESS)
                            }
                            <xsl:value-of select="$name" />.rotationP = 0

                        } catch(e: Exception) {
                            this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)
                        }

                        <xsl:text>&#10;</xsl:text>
                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

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

                            val angleOfTarget: Int = noDecimalTrigTable.antiTan(dx, dy)
                            var angle: Short = (270 - angleOfTarget - <xsl:value-of select="$name" />.angle) as short
                            while (angle <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 359) {
                                angle -= 360
                            }
                            while (angle <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 0) {
                                angle += 360
                            }

                            <xsl:value-of select="$name" />.rotationP = angle
                            if(<xsl:value-of select="$name" />.rotationP != 0) {
                                this.logUtil.put(StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(<xsl:value-of select="$name" />.rotationP).append("<xsl:text>&lt;</xsl:text>").append(<xsl:value-of select="$name" />.angle).toString(), this, this.commonStrings.PROCESS)
                            }
                            gameLayer.updateRotation(1000)
                            if(<xsl:value-of select="$name" />.rotationP != 0) {
                                this.logUtil.put(StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(<xsl:value-of select="$name" />.rotationP).append("<xsl:text>&gt;</xsl:text>").append(<xsl:value-of select="$name" />.angle).toString(), this, this.commonStrings.PROCESS)
                            }
                            <xsl:value-of select="$name" />.rotationP = 0

                        <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                        } catch(e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                        }

                        return true
                    }

                        fun process(gameLayer: GDGameLayer, x: Int, y: Int) {
                            val gdObject: GDObject = gameLayer.gdObject
                            this.process(gdObject, x, y)
                        }

                        fun process(gdObject: GDObject, x: Int, y: Int) {
                            throw RuntimeException()
                        }
    </xsl:template>

</xsl:stylesheet>

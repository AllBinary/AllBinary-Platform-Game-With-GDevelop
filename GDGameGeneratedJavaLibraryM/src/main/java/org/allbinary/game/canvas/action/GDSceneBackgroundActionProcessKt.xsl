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

    <xsl:template name="sceneBackgroundActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        <xsl:variable name="rgbParam1" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" /></xsl:for-each></xsl:variable>
        <xsl:variable name="rgbParam2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$rgbParam1" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="rgbParam" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$rgbParam2" /></xsl:with-param><xsl:with-param name="find" >;</xsl:with-param><xsl:with-param name="replacementText" >,</xsl:with-param></xsl:call-template></xsl:variable>

                                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        //SceneBackground - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                        override fun process(): Boolean {

                            this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                            val backgroundBasicColor: BasicColor = smallBasicColorCacheFactory.getAndOrCreate(
                                basicColorUtil.getARGB(255,
                                    <xsl:value-of select="$rgbParam" />))
                                    //ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />
                            val foregroundBasicColor: BasicColor = smallBasicColorCacheFactory.getAndOrCreate(
                                basicColorUtil.getARGB(255,
                                    255-backgroundBasicColor.red, 255-backgroundBasicColor.green, 255-backgroundBasicColor.blue))
                                    //ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />

                            val abToGBUtil: ABToGBUtil = ABToGBUtil.getInstance()
                            val allBinaryGameLayerManager: AllBinaryGameLayerManager = abToGBUtil.allBinaryGameLayerManager
                            allBinaryGameLayerManager.setBackgroundBasicColor(backgroundBasicColor)
                            allBinaryGameLayerManager.setForegroundBasicColor(foregroundBasicColor)

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

                            return this.process()
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

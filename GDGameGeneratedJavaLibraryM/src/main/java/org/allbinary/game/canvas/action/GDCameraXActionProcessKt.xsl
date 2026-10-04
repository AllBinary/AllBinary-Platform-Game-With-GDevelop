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

    <xsl:template name="cameraXActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />

        <xsl:variable name="quote" >"</xsl:variable>

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        //CameraX - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                        override fun process(): Boolean {

                            //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                            val abToGBUtil: ABToGBUtil = ABToGBUtil.getInstance()
                            val allBinaryGameLayerManager: AllBinaryGameLayerManager = abToGBUtil.allBinaryGameLayerManager
                            val size: Int = allBinaryGameLayerManager.getSize()
                            lateinit var gameLayer: GDGameLayer
                            for(index in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size)
                            {
                                gameLayer = allBinaryGameLayerManager.getLayerAt(index) as GDGameLayer
                                gameLayer.setPosition(gameLayer.getXP() -<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each> (<xsl:for-each select="parameters" ><xsl:if test="position() > 2" ><xsl:value-of select="translate(text(), $quote, '')" /></xsl:if> </xsl:for-each>).toInt(), gameLayer.getYP(), gameLayer.getZP())
                                gameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta)
                            }

                            return true
                        }


                    override fun process(index: Int): Boolean {
                        //this.processStats()

                        return this.process()
                    }


                    override fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): Boolean {
                        super.processStats(motionGestureEvent)

                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        return this.process()
                    }


                    override fun processGD(gameLayerArray: Array&lt;GDGameLayer&gt;): Boolean {
                        super.processGDStats(gameLayerArray)

                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, this.commonStrings.PROCESS)

                        return this.process()
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

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

    <xsl:template name="textEntryObjectAsStringActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                        private lateinit var hasReleased: BooleanArray

                        override fun init() {
                            hasReleased = BooleanArray(InputFactory.getInstance().MAX)
                            this.reset()
                        }

                        override fun reset() {
                            val size: Int = hasReleased.length
                            for(index in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size) {
                                hasReleased[index] = true
                            }
                        }

                        //TextEntryObject::String - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                        override fun process(): Boolean {
                            this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)
                            ((globals.TextEntryGDGameLayerList.get(0) as GDGameLayer).gdObject as GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.TextEntry).stringMaker.delete(0, ((globals.TextEntrGDGameLayerList.get(0) as GDGameLayer).gdObject as GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.TextEntry).stringMaker.length())

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


                        override fun process(keyAsInteger: Integer): Boolean {
                            super.processStats()
                            //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)
                            //<xsl:value-of select="parameters[2]" />

                            val key: Int = keyAsInteger.intValue()
                            if(hasReleased[key]) {
                                //this.logUtil.putF("append: " + keyAsInteger, this, this.commonStrings.PROCESS)
                                hasReleased[key] = false
                                ((globals.TextEntryGDGameLayerList.get(0) as GDGameLayer).gdObject as GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.TextEntry).stringMaker.append(key.toChar())
                            } else {
                                //this.logUtil.putF("not append: " + keyAsInteger, this, this.commonStrings.PROCESS)
                            }

                            return true
                        }


                        override fun processReleased(keyAsInteger: Integer): Boolean {
                            super.processStats()

                            val key: Int = keyAsInteger.intValue()
                            //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + key, this, this.commonStrings.PROCESS)
                            hasReleased[key] = true

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

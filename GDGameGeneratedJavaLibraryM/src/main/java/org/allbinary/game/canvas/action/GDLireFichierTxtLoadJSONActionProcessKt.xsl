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

    <xsl:template name="lireFichierTxtLoadJSONActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                            <xsl:variable name="param1" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            <xsl:variable name="param2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
<!--                            <xsl:variable name="param3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>-->
                            <xsl:variable name="param4" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        private val RECORD_ID: String = <xsl:call-template name="addGlobals" ><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="text" ><xsl:value-of select="$param1" /></xsl:with-param></xsl:call-template>
                        private val SECOND_PARAM: String = <xsl:value-of select="$param2" />

                        //ReadStringFromStorage - was //LireFichierTxt - //Load - action - START - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                        override fun process(): Boolean {
                            super.processStats()

                            //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                            val jsonPersistance: JSONPersistance = JSONPersistance(RECORD_ID)
                            jsonPersistance.loadAll(abeClientInformation)

                            val jsonAsString: String = jsonPersistance.getJSONAsString()
                            //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + jsonAsString, this, this.commonStrings.PROCESS)
                            if(jsonAsString != stringUtil.EMPTY_STRING) {

                                val jsonTokener: JSONTokener = JSONTokener(jsonAsString)
                                val jsonObject: JSONObject = jsonTokener.nextValue() as JSONObject

                                if(jsonObject.has(SECOND_PARAM)) {
                                    globals.<xsl:value-of select="$param4" /> = jsonObject.getString(SECOND_PARAM)
                                    this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + globals.<xsl:value-of select="$param4" />, this, this.commonStrings.PROCESS)
                                } else {
                                    this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "missing", this, this.commonStrings.PROCESS)
                                    //globals.<xsl:value-of select="$param4" /> = CommonPhoneStrings.getInstance().ZERO
                                    throw RuntimeException()
                                }

                            } else {
                                this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + stringUtil.NULL_STRING, this, this.commonStrings.PROCESS)
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
                            //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                            this.process()
                        } catch(e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                        }
                        return true
                    }

                        //LireFichierTxt - action - END
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

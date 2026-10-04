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

    <xsl:template name="jsonToGlobalVariableStructureActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                        //JSONToGlobalVariableStructure - action - START - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                        override fun process(): Boolean {
                            super.processStats()

                            //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

        <xsl:variable name="firstParametersAsString0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        <xsl:variable name="firstParametersAsString" ><xsl:value-of select="translate($firstParametersAsString0, '&#10;', '')" /></xsl:variable>
                            //val jsonTokener: JSONTokener = JSONTokener(globals.<xsl:value-of select="$firstParametersAsString" />)

                            //val jsonObject: JSONObject = jsonTokener.nextValue() as JSONObject

                            <xsl:variable name="param2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                            <xsl:variable name="start" ><xsl:for-each select="//variables" ><xsl:if test="name = $param2" ><xsl:if test="type = 'number'" >Integer.parseInt(</xsl:if><xsl:if test="type = 'boolean'" ></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                            <xsl:variable name="end" ><xsl:for-each select="//variables" ><xsl:if test="name = $param2" ><xsl:if test="type = 'number'" >)</xsl:if><xsl:if test="type = 'boolean'" >)</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                            //gameGlobals.<xsl:value-of select="$param2" />JSONObject = jsonObject
                            //gameGlobals.<xsl:value-of select="$param2" /> = <xsl:value-of select="$start" />jsonObject.getString("<xsl:value-of select="$param2" />")<xsl:value-of select="$end" />
                            if(globals.<xsl:value-of select="$firstParametersAsString" /> != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> globals.<xsl:value-of select="$firstParametersAsString" />.length() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                gameGlobals.<xsl:value-of select="$param2" /> = <xsl:value-of select="$start" />globals.<xsl:value-of select="$firstParametersAsString" /><xsl:value-of select="$end" />
                                this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + gameGlobals.<xsl:value-of select="$param2" />, this, this.commonStrings.PROCESS)
                            } else {
                                this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "null or empty", this, this.commonStrings.PROCESS)
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

                            return this.process()
                        } catch(e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                        }
                        return true
                    }

                        //JSONToGlobalVariableStructure - action - END
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

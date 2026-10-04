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

    <xsl:template name="jsonToVariableStructure2ActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                    //JSONToVariableStructure2 - takes a string variable and parses it to a JSONObject/Structure - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                    override fun process(): Boolean {
                        super.processStats()

                        this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)
        <xsl:variable name="firstParametersAsString0" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        <xsl:variable name="firstParametersAsString" ><xsl:value-of select="translate($firstParametersAsString0, '&#10;', '')" /></xsl:variable>

                        <xsl:variable name="withGetJSONType" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /><xsl:value-of select="$firstParametersAsString" /></xsl:with-param><xsl:with-param name="find" >ToJSON</xsl:with-param><xsl:with-param name="replacementText" >ToJSONType</xsl:with-param></xsl:call-template></xsl:variable>

                        <xsl:variable name="variableName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:if test="contains($withGetJSONType, 'ToJSON')" >
                        //This probably should not occur
                        if(<xsl:value-of select="$withGetJSONType" /> == 1) {
                        </xsl:if>

                            val jsonTokener: JSONTokener = JSONTokener(<xsl:value-of select="$firstParametersAsString" />)

                            val jsonObject: JSONObject = jsonTokener.nextValue() as JSONObject
                            globals.<xsl:value-of select="$variableName" />JSONObject = jsonObject

                        <xsl:for-each select="//variables" >
                            <xsl:if test="name = $variableName" >
                            val jsonObject2: JSONObject = <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="$variableName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>JSONObject as JSONObject
                        <xsl:call-template name="variableJSONMapping" >
                            <xsl:with-param name="parentName" >jsonObject2</xsl:with-param>
                            <xsl:with-param name="variableName" >
                                <xsl:value-of select="$variableName" />
                            </xsl:with-param>
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>
                            </xsl:if>
                        </xsl:for-each>

                        <xsl:if test="contains($withGetJSONType, 'ToJSON')" >
                        } else if(<xsl:value-of select="$withGetJSONType" /> == 2) {

                            val jsonTokener: JSONTokener = JSONTokener(<xsl:value-of select="$firstParametersAsString" />)

                            val jsonArray: JSONArray = jsonTokener.nextValue() as JSONArray
                            globals.<xsl:value-of select="$variableName" />JSONArray = jsonArray

                            this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + " I don't think JSONArrays should map here", this, this.commonStrings.PROCESS)
                        }
                        </xsl:if>

                        return true
                    }


                    override fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): Boolean {
                        super.processStats(motionGestureEvent)

                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        return this.process()
                    }


                    override fun processGD(gameLayerArray: Array&lt;GDGameLayer&gt;): Boolean {
                        try {
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

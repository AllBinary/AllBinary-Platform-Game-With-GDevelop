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

    <xsl:template name="setZOrderActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="addGlobalsForVariables" ><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:variable name="beforeSecondParam0" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>
                        <xsl:variable name="beforeSecondParam" ><xsl:if test="contains($beforeSecondParam0, '-')" ><xsl:value-of select="substring-after($beforeSecondParam0, '-')" /></xsl:if><xsl:if test="not(contains($beforeSecondParam0, '-'))" ><xsl:value-of select="$beforeSecondParam0" /></xsl:if></xsl:variable>
                        <xsl:variable name="beforeSecondParam2" ><xsl:if test="contains($beforeSecondParam0, '-')" >-</xsl:if></xsl:variable>

                        <xsl:variable name="gdObjectFactory2" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$beforeSecondParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeSecondParam" /></xsl:variable>

                        <xsl:variable name="hasObject" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObjectGroup" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup, 'found')" >
                        <xsl:if test="string-length($beforeSecondParam2)" >//beforeSecondParam2=<xsl:value-of select="$beforeSecondParam2" /></xsl:if>
                        //beforeSecondParam=<xsl:value-of select="$beforeSecondParam" />
                        </xsl:if>

                        <xsl:variable name="firstOrBeforeFourthParam" >
                            <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup, 'found')" >
                                <xsl:value-of select="$beforeSecondParam" />
                            </xsl:if>
                            <xsl:if test="not(contains($hasObject, 'found') or contains($hasObjectGroup, 'found'))" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                        </xsl:variable>

                    <xsl:variable name="paramOneNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="secondParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
<!--                    <xsl:variable name="paramTwoName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="paramTwoNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>-->

<!--                    <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$paramTwoNameObjectsGroups" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$paramTwoNameObjectsGroups" /></xsl:variable>-->

                        //paramOneNameObjectsGroups=<xsl:value-of select="$paramOneNameObjectsGroups" />
                        //SetZOrder - was //ChangePlan - action - Probably means ChangePlane which is change zOrder - Change the z-order of - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                        override fun process(): Boolean {
                            super.processStats()

                            try {

                                //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                    <xsl:variable name="firstParamFound" ><xsl:call-template name="firstParamFound" ><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>

                        <xsl:if test="$paramOneNameObjectsGroups != ''" >

                        <xsl:variable name="text" ><xsl:value-of select="$paramOneNameObjectsGroups" /></xsl:variable>
                        <xsl:variable name="id" ><xsl:for-each select="/game/layouts" ><xsl:if test="$layoutIndex = position() - 1" ><xsl:for-each select="objects" ><xsl:if test="$text = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="objectsGroups" ><xsl:if test="$text = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each><xsl:for-each select="/game" ><xsl:for-each select="objects" ><xsl:if test="$text = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="objectsGroups" ><xsl:if test="$text = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
                        //SetZOrder - <xsl:value-of select="$text" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
                        lateinit var <xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayer = gameGlobals.tempGameLayerArray[<xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />]: GDGameLayer
                        if(<xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayer == null) {
                            <xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayer = gameGlobals.tempGameLayerArray[1]
                        }

                        if(<xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayer != null) {

<xsl:text>                        </xsl:text>
                        <xsl:text>&#10;</xsl:text>

                    <xsl:text>                        </xsl:text><xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayer<xsl:for-each select="parameters" ><xsl:if test="position() = 1" >.gdObject.zOrder</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" ></xsl:if></xsl:for-each>

                        <xsl:text>&#10;</xsl:text>
                            val abToGBUtil: ABToGBUtil = ABToGBUtil.getInstance()
                            val allBinaryGameLayerManager: AllBinaryGameLayerManager = abToGBUtil.allBinaryGameLayerManager
                            allBinaryGameLayerManager.update(<xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayer)

                        } else {
                            //Needs Impl
                            if(true) throw RuntimeException()
                        }

                            /*
                        </xsl:if>

                        <xsl:if test="$paramOneNameObjectsGroups = ''" >

                                <xsl:variable name="hasObjectGroup" >
                                    <xsl:for-each select="//objectsGroups" >
                                        <xsl:if test="name = $name" >found</xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>

                                <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" >
                                        <xsl:with-param name="name" >
                                            <xsl:value-of select="$name" />
                                        </xsl:with-param>
                                        <xsl:with-param name="layoutIndex" >
                                            <xsl:value-of select="$layoutIndex" />
                                        </xsl:with-param>
                                    </xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" />
                                </xsl:variable>

                                <xsl:if test="contains($hasObjectGroup, 'found')" >
                                    val <xsl:value-of select="$name" />GDGameLayerList: BasicArrayList = <xsl:call-template name="globals" > as BasicArrayList
                                        <xsl:with-param name="name" >
                                            <xsl:value-of select="$name" />
                                        </xsl:with-param>
                                    </xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(0)
                                </xsl:if>

                        val size: Int = <xsl:if test="not(contains($hasObjectGroup, 'found'))" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.</xsl:if><xsl:value-of select="$name" />GDGameLayerList.size()
                        </xsl:if>

                        <xsl:text>&#10;</xsl:text>
                        <xsl:text>&#10;</xsl:text>

                        for(index in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size) {
                            this.process(index)
                        }

                        <xsl:if test="$paramOneNameObjectsGroups != ''" >
<!--                        }-->
                        */
                        </xsl:if>

                            } catch(e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                            }

                            return true
                        }

                    //SetZOrder - index

                    override fun process(index: Int): Boolean {
                        super.processStats(index)

                        //this.logUtil.putF(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, this.commonStrings.PROCESS)

                        <xsl:variable name="hasObjectGroup" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $name" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:if test="contains($hasObjectGroup, 'found')" >
                        val groupSize: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.size()
                        for(groupIndex in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> groupSize) {
                            val <xsl:value-of select="$name" />GDGameLayerList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(groupIndex) as BasicArrayList
                        </xsl:if>
                        <xsl:if test="not(contains($hasObjectGroup, 'found'))" >
                            val <xsl:value-of select="$name" />GDGameLayerList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList
                        </xsl:if>

                        val <xsl:value-of select="$name" />GDGameLayer: GDGameLayer = (<xsl:value-of select="$name" />GDGameLayerList.get(index) as GDGameLayer)
                        <xsl:value-of select="$name" />GDGameLayer.gdObject.zOrder<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" ></xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>

                        val abToGBUtil: ABToGBUtil = ABToGBUtil.getInstance()
                        val allBinaryGameLayerManager: AllBinaryGameLayerManager = abToGBUtil.allBinaryGameLayerManager
                        allBinaryGameLayerManager.update(<xsl:value-of select="$name" />GDGameLayer)
                        <xsl:text>&#10;</xsl:text>

                    <xsl:if test="contains($hasObjectGroup, 'found')" >
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
                        super.processGDStats(gameLayerArray)

                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
                        <xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                        <xsl:value-of select="$name" />GDGameLayer.gdObject.zOrder<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" ></xsl:if></xsl:for-each>

                        <xsl:text>&#10;</xsl:text>
                        val abToGBUtil: ABToGBUtil = ABToGBUtil.getInstance()
                        val allBinaryGameLayerManager: AllBinaryGameLayerManager = abToGBUtil.allBinaryGameLayerManager
                        allBinaryGameLayerManager.update(<xsl:value-of select="$name" />GDGameLayer)
                        <xsl:text>&#10;</xsl:text>

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

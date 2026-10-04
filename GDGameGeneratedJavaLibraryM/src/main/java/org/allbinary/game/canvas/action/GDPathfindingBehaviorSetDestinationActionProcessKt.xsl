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

    <xsl:template name="pathfindingBehaviorSetDestinationActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

            <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="param4" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="param5" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="fourthParamBeforePeriod" ><xsl:value-of select="substring-before($param4, '.')" /></xsl:variable>

                    //PathfindingBehavior::SetDestination - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                    override fun process(): Boolean {
                        super.processStats()

                        this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        <xsl:if test="string-length($fourthParamBeforePeriod) > 0" >
                            //fourthParamBeforePeriod=<xsl:value-of select="$fourthParamBeforePeriod" /> - We will get the first and hopefully only GameLayer
                            <xsl:variable name="gameLayerName" ><xsl:value-of select="$fourthParamBeforePeriod" /></xsl:variable>
                            <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gameLayerName" /></xsl:variable>
                            val <xsl:value-of select="$gameLayerName" />GDGameLayer: GDGameLayer = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(0) as GDGameLayer
                            val <xsl:value-of select="$gameLayerName" />: <xsl:value-of select="$gdObjectFactory" /> = <xsl:value-of select="$gameLayerName" />GDGameLayer.gdObject as <xsl:value-of select="$gdObjectFactory" />
                        </xsl:if>

                            <xsl:variable name="hasObjectGroup" >
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:if test="name = $name" >
                                                    found
                                                </xsl:if>
                                            </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:variable>

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            val size: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.size()
                            for(index in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size) {
                            //val gdObjectList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.get(index) as BasicArrayList
                            val gdGameLayerList: BasicArrayList = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(index) as BasicArrayList)
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup) = 0" >
<!--                            //final BasicArrayList gdObjectList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectList;-->
                            val gdGameLayerList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList
                            </xsl:if>

                            val size2: Int = gdGameLayerList.size()
<!--                            //if(size2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                            //    result = true
                            //}-->

                            lateinit var gdGameLayer: GDGameLayer
<!--                            //GDObject gdObject;-->
                            for(index2 in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size2) {
<!--                            //if(gdObjectList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {-->
                                gdGameLayer = gdGameLayerList.get(index2) as GDGameLayer

                                (gdGameLayer.gdObject.getBehavior(gdBehaviorUtil.PATHFINDING_BEHAVIOR_INDEX) as PathFindingBehavior).setTarget(gdGameLayer,
                                    <xsl:if test="string-length($fourthParamBeforePeriod) > 0" ><xsl:variable name="gameLayerName" ><xsl:value-of select="$fourthParamBeforePeriod" /></xsl:variable><xsl:value-of select="$gameLayerName" />GDGameLayer</xsl:if>,
                                    <xsl:value-of select="$param4" />, <xsl:value-of select="$param5" />)
<!--                                //gdObject = gdGameLayer.gdObject as GDObject
                                //result = result <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            //}-->
                            }

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
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
                        try {

                        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
                        <xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                            (<xsl:value-of select="$name" />GDGameLayer.gdObject.getBehavior(gdBehaviorUtil.PATHFINDING_BEHAVIOR_INDEX) as PathFindingBehavior).setTarget(<xsl:value-of select="$name" />GDGameLayer,
                                <xsl:if test="string-length($fourthParamBeforePeriod) > 0" ><xsl:variable name="gameLayerName" ><xsl:value-of select="$fourthParamBeforePeriod" /></xsl:variable><xsl:value-of select="$gameLayerName" />GDGameLayer</xsl:if>,
                                <xsl:value-of select="$param4" />, <xsl:value-of select="$param5" />)

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

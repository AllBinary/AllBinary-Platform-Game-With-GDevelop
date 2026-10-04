<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" indent="yes" />

    <xsl:template name="collisionNPConditionGDNode" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="nodeList" />

        <xsl:variable name="quote" >"</xsl:variable>
        <xsl:variable name="typeValue" select="type/value" />
        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

                            <xsl:variable name="name2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                            <xsl:variable name="hasObjectGroup2" >
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:if test="name = $name2" >
                                                    found
                                                </xsl:if>
                                            </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:variable>
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

                            <xsl:variable name="id" ><xsl:for-each select="/game/layouts" ><xsl:if test="$layoutIndex = position() - 1" ><xsl:for-each select="objects" ><xsl:if test="$name2 = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="objectsGroups" ><xsl:if test="$name2 = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each><xsl:for-each select="/game" ><xsl:for-each select="objects" ><xsl:if test="$name2 = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="objectsGroups" ><xsl:if test="$name2 = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
                            <xsl:variable name="id2" ><xsl:for-each select="/game/layouts" ><xsl:if test="$layoutIndex = position() - 1" ><xsl:for-each select="objects" ><xsl:if test="$name = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="objectsGroups" ><xsl:if test="$name = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each><xsl:for-each select="/game" ><xsl:for-each select="objects" ><xsl:if test="$name = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="objectsGroups" ><xsl:if test="$name = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>

                        //CollisionNP - //collisionNPConditionGDNode
                    <xsl:if test="contains($forExtension, 'found')" >public </xsl:if>val NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = object : GDNode(<xsl:value-of select="$nodeList" />) {

                            <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                            private val CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: String = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />"

                            //CollisionNP - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                            @Throws(Exception::class)
                            override fun process(): Boolean {
                                super.processStats()

                                var result: Boolean = false
                                //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                    //var nodeId: Condition = <xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />

                            <xsl:if test="string-length($hasObjectGroup2) > 0" >
                            //CollisionNP - objectsGroups - //<xsl:value-of select="$name2" />
                            val <xsl:value-of select="$name2" />Size2: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerListOfList.size()
                            for(<xsl:value-of select="$name2" />Index2 in 0 until <xsl:text disable-output-escaping="yes" ></xsl:text><xsl:value-of select="$name2" />Size2) {
                            //val gdObjectList2: BasicArrayList = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDObjectListOfList.get(<xsl:value-of select="$name2" />Index2) as BasicArrayList)
                            val gdGameLayerList2: BasicArrayList = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerListOfList.get(<xsl:value-of select="$name2" />Index2) as BasicArrayList)
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup2) = 0" >
                            //CollisionNP - //<xsl:value-of select="$name2" />
                            //val gdObjectList2: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDObjectList
                            val gdGameLayerList2: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerList
                            </xsl:if>

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            //CollisionNP - objectsGroups - //<xsl:value-of select="$name" /> - 2
                            val <xsl:value-of select="$name" />Size3: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.size()
                            for(<xsl:value-of select="$name" />Index3 in 0 until <xsl:text disable-output-escaping="yes" ></xsl:text><xsl:value-of select="$name" />Size3) {
                            //val gdObjectList: BasicArrayList = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.get(<xsl:value-of select="$name" />Index3) as BasicArrayList)
                            val gdGameLayerList: BasicArrayList = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(<xsl:value-of select="$name" />Index3) as BasicArrayList)
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup) = 0" >
                            //CollisionNP - //<xsl:value-of select="$name" /> - 2
                            //val gdObjectList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectList
                            val gdGameLayerList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList
                            </xsl:if>

                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                    //val <xsl:value-of select="text()" />Size: Int = gdGameLayerList2.size()
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                    //val <xsl:value-of select="text()" />Size2: Int = gdGameLayerList.size()
                        </xsl:if>
                    </xsl:for-each>

                    //for(index2 in 0 until <xsl:text disable-output-escaping="yes" ></xsl:text><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />Size</xsl:if></xsl:for-each>) {
                    for(index2 in 0 until <xsl:text disable-output-escaping="yes" ></xsl:text>gdGameLayerList2.size()) {
                    val initialSize2: Int = gdGameLayerList2.size()
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        val gameLayer2: GDGameLayer = gdGameLayerList2.get(index2) as GDGameLayer
                        </xsl:if>
                    </xsl:for-each>
                    //for(index in 0 until <xsl:text disable-output-escaping="yes" ></xsl:text><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />Size2</xsl:if></xsl:for-each>) {
                    for(index in 0 until <xsl:text disable-output-escaping="yes" ></xsl:text>gdGameLayerList.size()) {
                    val initialSize: Int = gdGameLayerList.size()
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                        val gameLayer: GDGameLayer = gdGameLayerList.get(index) as GDGameLayer
                        </xsl:if>
                    </xsl:for-each>

                        if(<xsl:if test="$inverted = 'true'" >!</xsl:if>gameLayer2.getCollidableInferface().isCollision(gameLayer2, gameLayer)) {

                            if(gameLayer2.isDestroyed()) {
                               this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + " Collision not allowed is already destroyed", this, this.commonStrings.PROCESS)
                               return result
                            } //else {
                               //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + " TWB process collision", this, this.commonStrings.PROCESS)
                            //}

                            //CollisionNP - <xsl:value-of select="$name" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
                            gameGlobals.tempGameLayerArray[0] = gameLayer2
                            gameGlobals.tempGameLayerArray[1] = gameLayer
                            //id=<xsl:value-of select="$id" /> for <xsl:value-of select="$name2" />
                            //id2=<xsl:value-of select="$id2" /> for <xsl:value-of select="$name" />
                            gameGlobals.tempGameLayerArray[<xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />] = gameLayer2 //<xsl:value-of select="$name2" />GDGameLayer
                            gameGlobals.tempGameLayerArray[<xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id2]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id2]) + (count(//objectsGroups) + count(//objects))" />] = gameLayer //<xsl:value-of select="$name" />GDGameLayer<xsl:value-of select="count(//objectsGroups) + count(//objects)" />

                            //if(gameGlobals.tempGameLayerArray[1] != null) this.logUtil.put(gameGlobals.tempGameLayerArray[1].toString(), this, this.commonStrings.PROCESS)

                            //name=<xsl:value-of select="name()" />

                            result = true

                        }

                            if(initialSize <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> gdGameLayerList.size()) {
                                index--
                            }

                    <xsl:text>&#10;</xsl:text>
                    }

                        if(initialSize2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> gdGameLayerList2.size()) {
                            index2--
                        }

                    }

                    <xsl:if test="string-length($hasObjectGroup) > 0" >
                    }
                    </xsl:if>
                    <xsl:if test="string-length($hasObjectGroup2) > 0" >
                    }
                    </xsl:if>
                                super.processStatsE()

                                return result
                            }

                            @Throws(Exception::class)
                            override fun process(index3: Int): Boolean {
                                super.processStats()

                                var result: Boolean = false
                                //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                    //var nodeId: Condition = <xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />

                            <xsl:if test="string-length($hasObjectGroup2) > 0" >
                            //CollisionNP - objectsGroups - //<xsl:value-of select="$name2" />
                            val <xsl:value-of select="$name2" />Size2: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerListOfList.size()
                            for(<xsl:value-of select="$name2" />Index2 in 0 until <xsl:text disable-output-escaping="yes" ></xsl:text><xsl:value-of select="$name2" />Size2) {
                            //val gdObjectList2: BasicArrayList = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDObjectListOfList.get(<xsl:value-of select="$name2" />Index2) as BasicArrayList)
                            val gdGameLayerList2: BasicArrayList = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerListOfList.get(<xsl:value-of select="$name2" />Index2) as BasicArrayList)
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup2) = 0" >
                            //CollisionNP - //<xsl:value-of select="$name2" />
                            //val gdObjectList2: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDObjectList
                            val gdGameLayerList2: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerList
                            </xsl:if>

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            //CollisionNP - objectsGroups - //<xsl:value-of select="$name" /> - 2
                            val <xsl:value-of select="$name" />Size3: Int = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.size()
                            for(<xsl:value-of select="$name" />Index3 in 0 until <xsl:text disable-output-escaping="yes" ></xsl:text><xsl:value-of select="$name" />Size3) {
                            //val gdObjectList: BasicArrayList = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.get(<xsl:value-of select="$name" />Index3) as BasicArrayList)
                            val gdGameLayerList: BasicArrayList = (<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(<xsl:value-of select="$name" />Index3) as BasicArrayList)
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup) = 0" >
                            //CollisionNP - //<xsl:value-of select="$name" /> - 2
                            //val gdObjectList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectList
                            val gdGameLayerList: BasicArrayList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList
                            </xsl:if>

                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                    //val <xsl:value-of select="text()" />Size: Int = gdGameLayerList2.size()
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                    //val <xsl:value-of select="text()" />Size2: Int = gdGameLayerList.size()
                        </xsl:if>
                    </xsl:for-each>

                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        val gameLayer2: GDGameLayer = gdGameLayerList2.get(index3) as GDGameLayer
                        </xsl:if>
                    </xsl:for-each>
                    //for(index in 0 until <xsl:text disable-output-escaping="yes" ></xsl:text><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />Size2</xsl:if></xsl:for-each>) {
                    for(index in 0 until <xsl:text disable-output-escaping="yes" ></xsl:text>gdGameLayerList.size()) {
                    val initialSize: Int = gdGameLayerList.size()
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                        val gameLayer: GDGameLayer = gdGameLayerList.get(index) as GDGameLayer
                        </xsl:if>
                    </xsl:for-each>

                        if(<xsl:if test="$inverted = 'true'" >!</xsl:if>gameLayer2.getCollidableInferface().isCollision(gameLayer2, gameLayer)) {

                            if(gameLayer2.isDestroyed()) {
                               this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + " Collision not allowed is already destroyed", this, this.commonStrings.PROCESS)
                               return result
                            } //else {
                               //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + " TWB process collision", this, this.commonStrings.PROCESS)
                            //}

                            //CollisionNP - <xsl:value-of select="$name" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
                            gameGlobals.tempGameLayerArray[0] = gameLayer2
                            gameGlobals.tempGameLayerArray[1] = gameLayer
                            //id=<xsl:value-of select="$id" /> for <xsl:value-of select="$name2" />
                            //id2=<xsl:value-of select="$id2" /> for <xsl:value-of select="$name" />
                            gameGlobals.tempGameLayerArray[<xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />] = gameLayer2 //<xsl:value-of select="$name2" />GDGameLayer
                            gameGlobals.tempGameLayerArray[<xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id2]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id2]) + (count(//objectsGroups) + count(//objects))" />] = gameLayer //<xsl:value-of select="$name" />GDGameLayer<xsl:value-of select="count(//objectsGroups) + count(//objects)" />

                            //if(gameGlobals.tempGameLayerArray[1] != null) this.logUtil.put(gameGlobals.tempGameLayerArray[1].toString(), this, this.commonStrings.PROCESS)

                            //name=<xsl:value-of select="name()" />

                            result = true

                        }

                            if(initialSize <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> gdGameLayerList.size()) {
                                index--
                            }

                    <xsl:text>&#10;</xsl:text>
                    }

                    <xsl:if test="string-length($hasObjectGroup) > 0" >
                    }
                    </xsl:if>
                    <xsl:if test="string-length($hasObjectGroup2) > 0" >
                    }
                    </xsl:if>
                                super.processStatsE()

                                return result
                            }

                            @Throws(Exception::class)
                            override fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): Boolean {
                                super.processStats(motionGestureEvent)

                                //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "motion", this, this.commonStrings.PROCESS)

                                return this.process()
                            }

                    @Throws(Exception::class)
                    override fun processGD(gameLayerArray: Array&lt;GDGameLayer&gt;): Boolean {

                        var result: Boolean = false

                        try {

                        //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, this.commonStrings.PROCESS)

                        //Using Offset as Object/Group could be the same as the first param.
                        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
                        <xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param><xsl:with-param name="offsetRequestForOtherParam" >found<xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>
                        <xsl:variable name="count" ><xsl:call-template name="count-string" ><xsl:with-param name="text" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="substring" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template></xsl:variable>

                        <xsl:if test="$count = 2" >
                        //params are the same
                        <xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>
                        </xsl:if>


                        if(<xsl:if test="$inverted = 'true'" >!</xsl:if><xsl:value-of select="$name" />GDGameLayer<xsl:value-of select="count(//objectsGroups) + count(//objects)" />.getCollidableInferface().isCollision(<xsl:value-of select="$name" />GDGameLayer<xsl:value-of select="count(//objectsGroups) + count(//objects)" />, <xsl:value-of select="$name2" />GDGameLayer)) {

                            if(<xsl:value-of select="$name" />GDGameLayer<xsl:value-of select="count(//objectsGroups) + count(//objects)" />.isDestroyed()) {
                               this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + " GD Collision not allowed is already destroyed", this, this.commonStrings.PROCESS)
                               return result
                            }
                            //CollisionNP - <xsl:value-of select="$name" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />

                            gameLayerArray[<xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />] = <xsl:value-of select="$name2" />GDGameLayer
                            gameLayerArray[<xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id2]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id2]) + (count(//objectsGroups) + count(//objects))" />] = <xsl:value-of select="$name" />GDGameLayer<xsl:value-of select="count(//objectsGroups) + count(//objects)" />

                            result = true

                        }

                    <xsl:if test="string-length($hasObjectGroup) > 0" >
                    }
                    </xsl:if>
                    <xsl:if test="string-length($hasObjectGroup2) > 0" >
                    }
                    </xsl:if>

<!--                        <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param><xsl:with-param name="offsetRequestForOtherParam" >found<xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>-->

                        } catch(e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                        }

                        return result
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

                    }

                    <xsl:if test="not(contains($forExtension, 'found'))" >
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />")
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />
                    </xsl:if>

    </xsl:template>

</xsl:stylesheet>

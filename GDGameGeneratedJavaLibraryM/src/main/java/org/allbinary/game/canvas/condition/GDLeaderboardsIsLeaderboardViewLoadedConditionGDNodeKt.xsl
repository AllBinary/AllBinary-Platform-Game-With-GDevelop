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
    <xsl:template name="leaderboardsIsLeaderboardViewLoadedConditionGDNode" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />


        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

        <xsl:variable name="quote" >"</xsl:variable>

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                    //leaderboardsIsLeaderboardViewLoadedConditionGDNode - //Condition - //Leaderboards::IsLeaderboardViewLoaded - GDNode
                    <xsl:if test="contains($forExtension, 'found')" >public </xsl:if>val NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = object : GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                    <xsl:variable name="hasOtherConditions" ><xsl:for-each select="preceding-sibling::conditions" >found</xsl:for-each></xsl:variable>
                        private val CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />: String = "highscores <xsl:value-of select="translate($conditionAsString, $quote, ' ')" />"

                        //Leaderboards::IsLeaderboardViewLoaded - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Throws(Exception::class)
                        override fun process(): Boolean {

                            super.processStats()

                            //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                            if(globals.highscoreSubmissionComplete) {

                                val highScoresArray: Array&lt;HighScores&gt; = gameGlobals.highScoresHelper.getHighScoresArray()

                                val leaderBoardTotal: Int = highScoresArray.length

                                HighScores highScores
                                //val index2: Int = leaderBoardTotal - 1
                                //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + " TWB " + leaderBoardTotal + " s:" + gameGlobals.selectedLeaderboardIndex, this, this.commonStrings.PROCESS)
                                val index2: Int = if(leaderBoardTotal <xsl:text disable-output-escaping="yes" >&gt; </xsl:text> gameGlobals.selectedLeaderboardIndex) gameGlobals.selectedLeaderboardIndex else leaderBoardTotal - 1
                                //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + " TWB c: " + index2, this, this.commonStrings.PROCESS)
                                //for(index2 in 0 until <xsl:text disable-output-escaping="yes" ></xsl:text>leaderBoardTotal) {
                                if(org.allbinary.game.score.BasicHighScoresFactory.loaded(index2)) {
                                    highScores = highScoresArray[index2]

                                    gameGlobals.highScoresTitle = highScores.getHeading()
                                    //gameGlobals.highScoresColumnHeadingOne = highScores.getColumnOneHeading()
                                    //gameGlobals.highScoresColumnHeadingOne = highScores.getColumnTwoHeading()

                                    val highScoreList: BasicArrayList = highScores.getList()
                                    val size: Int = highScoreList.size()
                                    //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "highScoreList.size(): " + size, this, this.commonStrings.PROCESS)
                                    gameGlobals.highScoresNameArray = arrayOfNulls&lt;String&gt;(size)
                                    gameGlobals.highScoresLongArray = arrayOfNulls&lt;long&gt;(size)
                                    HighScore highScore
                                    for(index in 0 until <xsl:text disable-output-escaping="yes" ></xsl:text>size) {

                                        highScore = highScoreList.get(index) as HighScore
                                        gameGlobals.highScoresNameArray[index] = highScore.getName()
                                        gameGlobals.highScoresLongArray[index] = highScore.getScore()
                                    }
                                }

                            return true

                            }

                            return false
                        }

                        @Throws(Exception::class)
                        override fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): Boolean {
                            super.processStats(motionGestureEvent)

                            //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "motion", this, this.commonStrings.PROCESS)

                            return this.process()
                        }

                        @Throws(Exception::class)
                        override fun processGD(gameLayerArray: Array&lt;GDGameLayer&gt;): Boolean {
                            super.processGDStats(gameLayerArray)

                            try {
                                //this.logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, this.commonStrings.PROCESS)

                                if(globals.highscoreSubmissionComplete) {
                                    return true
                                }

                            } catch(e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                            }
                            return false
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

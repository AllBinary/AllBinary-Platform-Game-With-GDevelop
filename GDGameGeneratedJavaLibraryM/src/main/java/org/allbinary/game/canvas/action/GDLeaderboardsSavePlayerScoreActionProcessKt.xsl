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

    <xsl:template name="leaderboardsSavePlayerScoreActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
        <xsl:variable name="siblingOrParentOrList" ><xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>

                        <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:call-template name="addGlobalsForVariables" ><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:variable name="beforeSecondParam" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>

                        <xsl:variable name="param2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:call-template name="addGlobalsForVariables" ><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:variable name="beforeFourthParam" ><xsl:value-of select="substring-before($param2, '.')" /></xsl:variable>

                        <xsl:variable name="param4" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

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

                        //Leaderboards::SavePlayerScore - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >

                        override fun process(): Boolean {
                            super.processStats()

                            try {

                                //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                                <xsl:value-of select="$siblingOrParentOrList" />

                                <xsl:if test="$beforeFourthParam != ''" >
                                val name: String = <xsl:value-of select="$param4" />
                                </xsl:if>
                                <xsl:if test="$beforeFourthParam = ''" >
                                val name: String = null
                                </xsl:if>

                                val abToGBUtil: ABToGBUtil = ABToGBUtil.getInstance()
                                val abCanvas: AllBinaryGameCanvas = abToGBUtil.abCanvas as AllBinaryGameCanvas

                                this.logUtil.putF(StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(name).toString(), this, this.commonStrings.PROCESS)

                                class SaveHighScoreRunnable : Runnable {

                                    override fun run() {
                                        try {

                                val gameInfo: GameInfo = abCanvas.getLayerManager().getGameInfo()
                                if(name != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> name.length() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                    val score: Long = <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                                    this.logUtil.putF(StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Submitting and Fetching leaderboard(s): ").appendlong(score).toString(), this, this.commonStrings.RUN)

                                    HighScoreNamePersistanceSingleton.getInstance().save(abeClientInformation, gameInfo, name)

                                    val basicHighScoresFactory: BasicHighScoresFactory = BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance())

                                    class SaveHighScoresResultsListener : HighScoresResultsListener {
                                        override fun setHighScoresArray(highScoresArray: Array&lt;HighScores&gt;) {
                                            try {
                                            val highScoresHelperBase: HighScoresHelperBase = HighScoresHelperBase()
                                            gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray)
                                            val highScore: HighScore = abCanvas.createHighScore(score)
                                            val highScoreUtil: HighScoreUtil = HighScoreUtil(basicHighScoresFactory, highScoresHelperBase, abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScore)
                                            highScoreUtil.update(name)
                                            highScoreUtil.saveHighScore()
                                            highScoreUtil.submit(abCanvas)
                                            //this.logUtil.putF("saved highscores", this, this.commonStrings.PROCESS)
                                            globals.highscoreSubmissionComplete = true
                                            } catch(e: Exception) {
                                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                                            }
                                        }
                                    }

                                    val highScoresResultsListener: HighScoresResultsListener = SaveHighScoresResultsListener()

                                    basicHighScoresFactory.fetchHighScores(gameInfo, highScoresResultsListener)

                                } else {
                                    this.logUtil.putF(StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Fetching leaderboard(s): ").appendlong(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>).toString(), this, this.commonStrings.RUN)

                                    val basicHighScoresFactory: BasicHighScoresFactory = BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance())

                                    class SaveHighScoresResultsListener2 : HighScoresResultsListener {
                                        override fun setHighScoresArray(highScoresArray: Array&lt;HighScores&gt;) {
                                            try {
                                                val highScoresHelperBase: HighScoresHelperBase = HighScoresHelperBase()
                                                gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray)
                                                val highScore: HighScore = abCanvas.createHighScore(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>)
                                                val highScoreUtil: HighScoreUtil = HighScoreUtil(basicHighScoresFactory, highScoresHelperBase, abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScore)
                                                //this.logUtil.putF("set highscores", this, this.commonStrings.PROCESS)
                                                globals.highscoreSubmissionComplete = true
                                            } catch(e: Exception) {
                                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                                            }
                                        }
                                    }

                                    val highScoresResultsListener: HighScoresResultsListener = SaveHighScoresResultsListener2()

                                    basicHighScoresFactory.fetchHighScores(gameInfo, highScoresResultsListener)
                                }

                                        } catch(e: Exception) {
                                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e)
                                        }
                                    }
                                }

                                SecondaryThreadPool.getInstance().runTask(SaveHighScoreRunnable())

                                <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                            } catch(e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                            }

                            return true
                        }


                        override fun process(index: Int): Boolean {
                            super.processStats(index)

                            //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, this.commonStrings.PROCESS)

                            return this.process()
                        }


                    override fun process(motionGestureEvent: MotionGestureEvent, lastMotionGestureInput: MotionGestureInput): Boolean {
                        super.processStats(motionGestureEvent)

                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS)

                        return this.process()
                    }

                        <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup, 'found')" >
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


                        override fun processGD(gameLayerArray: Array&lt;GDGameLayer&gt;): Boolean {
                            try {

                                <xsl:value-of select="$siblingOrParentOrList" />

                                val abToGBUtil: ABToGBUtil = ABToGBUtil.getInstance()
                                val abCanvas: AllBinaryGameCanvas = abToGBUtil.abCanvas as AllBinaryGameCanvas

                                <xsl:if test="$beforeFourthParam != ''" >
                                val name: String = <xsl:value-of select="$param4" />
                                </xsl:if>
                                <xsl:if test="$beforeFourthParam = ''" >
                                val name: String = null
                                </xsl:if>

                                this.logUtil.putF(StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(name).toString(), this, this.commonStrings.PROCESS)

                                class SaveHighScoreRunnable : Runnable {

                                    override fun run() {
                                        try {

                                val gameInfo: GameInfo = abCanvas.getLayerManager().getGameInfo()

                                if(name != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> name.length() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                    val score: Long = <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                                    this.logUtil.putF(StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Submitting and Fetching leaderboard(s): ").appendlong(score).toString(), this, this.commonStrings.RUN)

                                    HighScoreNamePersistanceSingleton.getInstance().save(abeClientInformation, gameInfo, name)

                                    val basicHighScoresFactory: BasicHighScoresFactory = BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance())

                                    class SaveHighScoresResultsListener3 : HighScoresResultsListener {
                                        override fun setHighScoresArray(highScoresArray: Array&lt;HighScores&gt;) {
                                            try {
                                            val highScoresHelperBase: HighScoresHelperBase = HighScoresHelperBase()
                                            gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray)
                                            val highScore: HighScore = abCanvas.createHighScore(score)
                                            val highScoreUtil: HighScoreUtil = HighScoreUtil(basicHighScoresFactory, highScoresHelperBase, abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScore)
                                            highScoreUtil.update(name)
                                            highScoreUtil.saveHighScore()
                                            highScoreUtil.submit(abCanvas)
                                            //this.logUtil.putF("saved highscores", this, this.commonStrings.PROCESS)
                                            globals.highscoreSubmissionComplete = true
                                            } catch(e: Exception) {
                                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                                            }
                                        }
                                    }

                                    val highScoresResultsListener: HighScoresResultsListener = SaveHighScoresResultsListener3()

                                    basicHighScoresFactory.fetchHighScores(gameInfo, highScoresResultsListener)

                                } else {
                                    this.logUtil.putF(StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Fetching leaderboard(s): ").appendlong(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>).toString(), this, this.commonStrings.RUN)

                                    val basicHighScoresFactory: BasicHighScoresFactory = BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance())

                                    class SaveHighScoresResultsListener4 : HighScoresResultsListener {
                                        override fun setHighScoresArray(highScoresArray: Array&lt;HighScores&gt;) {
                                            try {
                                                val highScoresHelperBase: HighScoresHelperBase = HighScoresHelperBase()
                                                gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray)
                                                val highScore: HighScore = abCanvas.createHighScore(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>)
                                                val highScoreUtil: HighScoreUtil = HighScoreUtil(basicHighScoresFactory, highScoresHelperBase, abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScore)
                                                //this.logUtil.putF("set highscores", this, this.commonStrings.PROCESS)
                                                globals.highscoreSubmissionComplete = true
                                            } catch(e: Exception) {
                                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e)
                                            }
                                        }
                                    }

                                    val highScoresResultsListener: HighScoresResultsListener = SaveHighScoresResultsListener4()

                                    basicHighScoresFactory.fetchHighScores(gameInfo, highScoresResultsListener)

                                }


                                        } catch(e: Exception) {
                                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e)
                                        }
                                    }
                                }

                                SecondaryThreadPool.getInstance().runTask(SaveHighScoreRunnable())

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

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
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
        
                            try {

                                //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS);
                                                      
                                <xsl:value-of select="$siblingOrParentOrList" />

                                <xsl:if test="$beforeFourthParam != ''" >
                                final String name = <xsl:value-of select="$param4" />;
                                </xsl:if>
                                <xsl:if test="$beforeFourthParam = ''" >
                                final String name = null;
                                </xsl:if>
                                
                                final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
                                final AllBinaryGameCanvas abCanvas = (AllBinaryGameCanvas) abToGBUtil.abCanvas;
                                
                                this.logUtil.putF(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(name).toString(), this, this.commonStrings.PROCESS);
                                
                                class SaveHighScoreRunnable implements Runnable {

                                    public void run() {
                                        try {

                                final GameInfo gameInfo = abCanvas.getLayerManager().getGameInfo();
                                if(name != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> name.length() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                    final long score = <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>;
                                    this.logUtil.putF(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Submitting and Fetching leaderboard(s): ").appendlong(score).toString(), this, this.commonStrings.RUN);
                                    
                                    HighScoreNamePersistanceSingleton.getInstance().save(abeClientInformation, gameInfo, name);
                                    
                                    final BasicHighScoresFactory basicHighScoresFactory = new BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance());
                                    
                                    class SaveHighScoresResultsListener implements HighScoresResultsListener {
                                        public void setHighScoresArray(final HighScores[] highScoresArray) {
                                            try {
                                            final HighScoresHelperBase highScoresHelperBase = new HighScoresHelperBase();
                                            gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray);
                                            final HighScore highScore = abCanvas.createHighScore(score);
                                            final HighScoreUtil highScoreUtil = new HighScoreUtil(basicHighScoresFactory, highScoresHelperBase, abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScore);
                                            highScoreUtil.update(name);
                                            highScoreUtil.saveHighScore();
                                            highScoreUtil.submit(abCanvas);
                                            //this.logUtil.putF("saved highscores", this, this.commonStrings.PROCESS);
                                            globals.highscoreSubmissionComplete = true;
                                            } catch(Exception e) {
                                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e);
                                            }
                                        }
                                    };
                                    
                                    final HighScoresResultsListener highScoresResultsListener = new SaveHighScoresResultsListener();
                                    
                                    basicHighScoresFactory.fetchHighScores(gameInfo, highScoresResultsListener);
                                    
                                } else {
                                    this.logUtil.putF(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Fetching leaderboard(s): ").appendlong(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>).toString(), this, this.commonStrings.RUN);
                                    
                                    final BasicHighScoresFactory basicHighScoresFactory = new BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance());
                                    
                                    class SaveHighScoresResultsListener2 implements HighScoresResultsListener {
                                        public void setHighScoresArray(final HighScores[] highScoresArray) {
                                            try {
                                                final HighScoresHelperBase highScoresHelperBase = new HighScoresHelperBase();
                                                gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray);
                                                final HighScore highScore = abCanvas.createHighScore(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>);
                                                final HighScoreUtil highScoreUtil = new HighScoreUtil(basicHighScoresFactory, highScoresHelperBase, abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScore);
                                                //this.logUtil.putF("set highscores", this, this.commonStrings.PROCESS);
                                                globals.highscoreSubmissionComplete = true;
                                            } catch(Exception e) {
                                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e);
                                            }
                                        }
                                    };
                                    
                                    final HighScoresResultsListener highScoresResultsListener = new SaveHighScoresResultsListener2();
                                                                        
                                    basicHighScoresFactory.fetchHighScores(gameInfo, highScoresResultsListener);                                    
                                }
    
                                        } catch (Exception e) {
                                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
                                        }
                                    }
                                }

                                SecondaryThreadPool.getInstance().runTask(new SaveHighScoreRunnable());

                                <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                            } catch(Exception e) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e);
                            }
                            
                            return true;
                        }

                        @Override
                        public boolean process(final int index) throws Exception {
                            super.processStats(index);

                            //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, this.commonStrings.PROCESS);
                        
                            return this.process();
                        }

                    @Override
                    public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                        super.processStats(motionGestureEvent);
                        
                        //this.logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS);
                        
                        return this.process();
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

                        @Override
                        public boolean processGD(final GDGameLayer[] gameLayerArray) throws Exception {
                            try {

                                <xsl:value-of select="$siblingOrParentOrList" />

                                final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
                                final AllBinaryGameCanvas abCanvas = (AllBinaryGameCanvas) abToGBUtil.abCanvas;

                                <xsl:if test="$beforeFourthParam != ''" >
                                final String name = <xsl:value-of select="$param4" />;
                                </xsl:if>
                                <xsl:if test="$beforeFourthParam = ''" >
                                final String name = null;
                                </xsl:if>
                                                                
                                this.logUtil.putF(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(name).toString(), this, this.commonStrings.PROCESS);
                                                                
                                class SaveHighScoreRunnable implements Runnable {

                                    public void run() {
                                        try {

                                final GameInfo gameInfo = abCanvas.getLayerManager().getGameInfo();
                                
                                if(name != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> name.length() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                    final long score = <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>;
                                    this.logUtil.putF(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Submitting and Fetching leaderboard(s): ").appendlong(score).toString(), this, this.commonStrings.RUN);

                                    HighScoreNamePersistanceSingleton.getInstance().save(abeClientInformation, gameInfo, name);
                                    
                                    final BasicHighScoresFactory basicHighScoresFactory = new BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance());
                                    
                                    class SaveHighScoresResultsListener3 implements HighScoresResultsListener {
                                        public void setHighScoresArray(final HighScores[] highScoresArray) {
                                            try {
                                            final HighScoresHelperBase highScoresHelperBase = new HighScoresHelperBase();
                                            gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray);
                                            final HighScore highScore = abCanvas.createHighScore(score);
                                            final HighScoreUtil highScoreUtil = new HighScoreUtil(basicHighScoresFactory, highScoresHelperBase, abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScore);
                                            highScoreUtil.update(name);
                                            highScoreUtil.saveHighScore();
                                            highScoreUtil.submit(abCanvas);
                                            //this.logUtil.putF("saved highscores", this, this.commonStrings.PROCESS);
                                            globals.highscoreSubmissionComplete = true;
                                            } catch(Exception e) {
                                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e);
                                            }
                                        }
                                    };

                                    final HighScoresResultsListener highScoresResultsListener = new SaveHighScoresResultsListener3();
                                    
                                    basicHighScoresFactory.fetchHighScores(gameInfo, highScoresResultsListener);

                                } else {
                                    this.logUtil.putF(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Fetching leaderboard(s): ").appendlong(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>).toString(), this, this.commonStrings.RUN);
                                    
                                    final BasicHighScoresFactory basicHighScoresFactory = new BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance());
                                    
                                    public SaveHighScoresResultsListener4 implements HighScoresResultsListener {
                                        public void setHighScoresArray(final HighScores[] highScoresArray) {
                                            try {
                                                final HighScoresHelperBase highScoresHelperBase = new HighScoresHelperBase();
                                                gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray);
                                                final HighScore highScore = abCanvas.createHighScore(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>);
                                                final HighScoreUtil highScoreUtil = new HighScoreUtil(basicHighScoresFactory, highScoresHelperBase, abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScore);
                                                //this.logUtil.putF("set highscores", this, this.commonStrings.PROCESS);
                                                globals.highscoreSubmissionComplete = true;
                                            } catch(Exception e) {
                                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e);
                                            }
                                        }
                                    };

                                    final HighScoresResultsListener highScoresResultsListener = new SaveHighScoresResultsListener4();
                                                                        
                                    basicHighScoresFactory.fetchHighScores(gameInfo, highScoresResultsListener);                                    

                                }
                               
    
                                        } catch (Exception e) {
                                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e);
                                        }
                                    }
                                }

                                SecondaryThreadPool.getInstance().runTask(new SaveHighScoreRunnable());
              
                                <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                            } catch(Exception e) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, this.commonStrings.PROCESS, e);
                            }

                            return true;
                        }

                        </xsl:if>

                        <xsl:if test="contains($forExtension, 'found')" >
                        @Override
                        public boolean process(final Object[] objectArray, final int[] intArray, final long[] longArray, final float[] floatArray) {
                            
                            //Map from object array with action params
                            final GDGameLayer gameLayer = (GDGameLayer) objectArray[1];
                            this.process(gameLayer, intArray[3], intArray[5]);

                            return true;
                        }
                        </xsl:if>

                        public void process(final GDGameLayer gameLayer, final int x, final int y) {
                            final GDObject gdObject = gameLayer.gdObject;
                            this.process(gdObject, x, y);
                        }

                        public void process(final GDObject gdObject, final int x, final int y) {
                            throw new RuntimeException();
                        }        
    </xsl:template>

</xsl:stylesheet>

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
        
                        <xsl:variable name="param" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 3" >
                                    <xsl:if test="not(contains(text(), 'SceneInstancesCount('))" >
                                        <xsl:value-of select="text()" />
                                    </xsl:if>
                                    <xsl:if test="contains(text(), 'SceneInstancesCount(')" >
                                        <xsl:variable name="objectName" >
                                            <xsl:value-of select="substring-before(substring-after(text(), 'SceneInstancesCount('), ')')" />
                                        </xsl:variable>
                                        <xsl:call-template name="string-replace-all" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="text()" />
                                            </xsl:with-param>
                                            <xsl:with-param name="find" >SceneInstancesCount(<xsl:value-of select="$objectName" /></xsl:with-param>
                                            <xsl:with-param name="replacementText" >SceneInstancesCount(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$objectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$objectName" />GDGameLayerList.size()</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                                                
                        <xsl:variable name="beforeSecondParam" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>

                        <xsl:variable name="param2" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 4" >
                                    <xsl:if test="not(contains(text(), 'SceneInstancesCount('))" >
                                        <xsl:value-of select="text()" />
                                    </xsl:if>
                                    <xsl:if test="contains(text(), 'SceneInstancesCount(')" >
                                        <xsl:variable name="objectName" >
                                            <xsl:value-of select="substring-before(substring-after(text(), 'SceneInstancesCount('), ')')" />
                                        </xsl:variable>
                                        <xsl:call-template name="string-replace-all" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="text()" />
                                            </xsl:with-param>
                                            <xsl:with-param name="find" >SceneInstancesCount(<xsl:value-of select="$objectName" /></xsl:with-param>
                                            <xsl:with-param name="replacementText" >SceneInstancesCount(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$objectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$objectName" />GDGameLayerList.size()</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                                                
                        <xsl:variable name="beforeFourthParam" ><xsl:value-of select="substring-before($param2, '.')" /></xsl:variable>


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

                                //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                
                                <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$beforeFourthParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeFourthParam" /></xsl:variable>

                                <xsl:if test="$beforeFourthParam != ''" >
                                final GDGameLayer <xsl:value-of select="$beforeFourthParam" /> = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$beforeFourthParam" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$beforeFourthParam" />GDGameLayerList.get(0);
                                //final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$beforeFourthParam" /> = (<xsl:value-of select="$gdObjectFactory" />) <xsl:value-of select="$beforeFourthParam" />GDGameLayer.gdObject;
                                final String name = <xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>;
                                </xsl:if>
                                <xsl:if test="$beforeFourthParam = ''" >
                                final String name = null;
                                </xsl:if>
                                
                                final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
                                final AllBinaryGameCanvas abCanvas = (AllBinaryGameCanvas) abToGBUtil.abCanvas;
                                
                                logUtil.put(new StringBuilder().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(name).toString(), this, commonStrings.PROCESS);
                                
                                class SaveHighScoreRunnable implements Runnable {

                                    public void run() {
                                        try {

                                final GameInfo gameInfo = abCanvas.getLayerManager().getGameInfo();
                                if(name != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> name.length() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                    final long score = <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>;
                                    logUtil.put(new StringBuilder().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Submitting and Fetching leaderboard(s): ").append(score).toString(), this, commonStrings.RUN);
                                    
                                    HighScoreNamePersistanceSingleton.getInstance().save(abeClientInformation, gameInfo, name);
                                    
                                    final BasicHighScoresFactory basicHighScoresFactory = new BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance());
                                    final HighScoresResultsListener highScoresResultsListener = new HighScoresResultsListener() {
                                        public void setHighScoresArray(final HighScores[] highScoresArray) {
                                            try {
                                            final HighScoresHelperBase highScoresHelperBase = new HighScoresHelperBase();
                                            gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray);
                                            final HighScore highScore = abCanvas.createHighScore(score);
                                            final HighScoreUtil highScoreUtil = new HighScoreUtil(basicHighScoresFactory, highScoresHelperBase, abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScore);
                                            highScoreUtil.update(name);
                                            highScoreUtil.saveHighScore();
                                            highScoreUtil.submit(abCanvas);
                                            //logUtil.put("saved highscores", this, commonStrings.PROCESS);
                                            globals.highscoreSubmissionComplete = true;
                                            } catch(Exception e) {
                                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                                            }
                                        }
                                    };
                                    
                                    basicHighScoresFactory.fetchHighScores(gameInfo, highScoresResultsListener);
                                    
                                } else {
                                    logUtil.put(new StringBuilder().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Fetching leaderboard(s): ").append(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>).toString(), this, commonStrings.RUN);
                                    
                                    final BasicHighScoresFactory basicHighScoresFactory = new BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance());
                                    
                                    final HighScoresResultsListener highScoresResultsListener = new HighScoresResultsListener() {
                                        public void setHighScoresArray(final HighScores[] highScoresArray) {
                                            try {
                                                final HighScoresHelperBase highScoresHelperBase = new HighScoresHelperBase();
                                                gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray);
                                                final HighScore highScore = abCanvas.createHighScore(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>);
                                                final HighScoreUtil highScoreUtil = new HighScoreUtil(basicHighScoresFactory, highScoresHelperBase, abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScore);
                                                //logUtil.put("set highscores", this, commonStrings.PROCESS);
                                                globals.highscoreSubmissionComplete = true;
                                            } catch(Exception e) {
                                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                                            }
                                        }
                                    };
                                                                        
                                    basicHighScoresFactory.fetchHighScores(gameInfo, highScoresResultsListener);                                    
                                }
    
                                        } catch (Exception e) {
                                            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                                        }
                                    }
                                }

                                SecondaryThreadPool.getInstance().runTask(new SaveHighScoreRunnable());

                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }
                            
                            return true;
                        }

                        @Override
                        public boolean process(final int index) throws Exception {
                            super.processStats(index);

                            //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS);
                        
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
        
                    <xsl:variable name="hasForEachProcessGD" >
                        <xsl:call-template name="hasBuiltinCommonInstructionsForEachToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasCollisionProcessGD" >
                        <xsl:call-template name="hasCollisionProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasDistanceProcessGD" >
                        <xsl:call-template name="hasDistanceProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                        <xsl:call-template name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    
                    /*hasForEachProcessGD=<xsl:value-of select="$hasForEachProcessGD" /> hasCollisionProcessGD=<xsl:value-of select="$hasCollisionProcessGD" /> hasDistanceProcessGD=<xsl:value-of select="$hasDistanceProcessGD" /> hasLinkedObjectsPickObjectsLinkedToProcessGD=<xsl:value-of select="$hasLinkedObjectsPickObjectsLinkedToProcessGD" />*/
                    
                    <xsl:call-template name="parentSelectionNodeProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        <xsl:with-param name="secondGameLayer" ><xsl:value-of select="$firstOrBeforeFourthParam" /></xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="not(contains($hasForEachProcessGD, 'found') or contains($hasCollisionProcessGD, 'found') or contains($hasDistanceProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >
                        
                        <xsl:variable name="hasSiblingActionWithObjectsGroupsOrObject" >
                            <xsl:for-each select=".." >
                                <xsl:for-each select="actions" >
                                    <xsl:if test="type/value = 'Create' and type/value != 'CreateByName'" >found</xsl:if>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:variable>                        

                        <xsl:if test="contains($hasSiblingActionWithObjectsGroupsOrObject, 'found')" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //Sibling - //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //Leaderboards::SavePlayerScore - From sibling action
                    public boolean processGD(final GDGameLayer gdGameLayer, final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final Graphics graphics) throws Exception {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasSiblingActionWithObjectsGroupsOrObject, 'found') or contains($hasForEachProcessGD, 'found') or contains($hasCollisionProcessGD, 'found') or contains($hasDistanceProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >
                    //Not from parent - //Leaderboards::SavePlayerScore
                    public boolean processGD(final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);

                        </xsl:if>
                    </xsl:if>

                            try {

                                <xsl:variable name="gdObjectFactory2" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$beforeSecondParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeSecondParam" /></xsl:variable>
                                
                                //final <xsl:value-of select="$gdObjectFactory2" /><xsl:text> </xsl:text><xsl:value-of select="$beforeSecondParam" /> = (<xsl:value-of select="$gdObjectFactory2" />) <xsl:value-of select="$beforeSecondParam" />GDGameLayer.gdObject;
                                
                                <xsl:if test="$beforeFourthParam != ''" >
                                final GDGameLayer <xsl:value-of select="$beforeFourthParam" /> = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$beforeFourthParam" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$beforeFourthParam" />GDGameLayerList.get(0);
                                //final <xsl:value-of select="$gdObjectFactory2" /><xsl:text> </xsl:text><xsl:value-of select="$beforeFourthParam" /> = (<xsl:value-of select="$gdObjectFactory2" />) <xsl:value-of select="$beforeFourthParam" />GDGameLayer.gdObject;
                                final String name = <xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>;
                                </xsl:if>
                                <xsl:if test="$beforeFourthParam = ''" >
                                final String name = null;
                                </xsl:if>

                                final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
                                final AllBinaryGameCanvas abCanvas = (AllBinaryGameCanvas) abToGBUtil.abCanvas;
                                
                                logUtil.put(new StringBuilder().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(name).toString(), this, commonStrings.PROCESS);
                                
                                class SaveHighScoreRunnable implements Runnable {

                                    public void run() {
                                        try {

                                final GameInfo gameInfo = abCanvas.getLayerManager().getGameInfo();
                                
                                if(name != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> name.length() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                    final long score = <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>;
                                    logUtil.put(new StringBuilder().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Submitting and Fetching leaderboard(s): ").append(score).toString(), this, commonStrings.RUN);

                                    HighScoreNamePersistanceSingleton.getInstance().save(abeClientInformation, gameInfo, name);
                                    
                                    final BasicHighScoresFactory basicHighScoresFactory = new BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance());
                                    final HighScoresResultsListener highScoresResultsListener = new HighScoresResultsListener() {
                                        public void setHighScoresArray(final HighScores[] highScoresArray) {
                                            try {
                                            final HighScoresHelperBase highScoresHelperBase = new HighScoresHelperBase();
                                            gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray);
                                            final HighScore highScore = abCanvas.createHighScore(score);
                                            final HighScoreUtil highScoreUtil = new HighScoreUtil(basicHighScoresFactory, highScoresHelperBase, abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScore);
                                            highScoreUtil.update(name);
                                            highScoreUtil.saveHighScore();
                                            highScoreUtil.submit(abCanvas);
                                            //logUtil.put("saved highscores", this, commonStrings.PROCESS);
                                            globals.highscoreSubmissionComplete = true;
                                            } catch(Exception e) {
                                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                                            }
                                        }
                                    };
                                    
                                    basicHighScoresFactory.fetchHighScores(gameInfo, highScoresResultsListener);

                                } else {
                                    logUtil.put(new StringBuilder().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Fetching leaderboard(s): ").append(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>).toString(), this, commonStrings.RUN);
                                    
                                    final BasicHighScoresFactory basicHighScoresFactory = new BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance());
                                    
                                    final HighScoresResultsListener highScoresResultsListener = new HighScoresResultsListener() {
                                        public void setHighScoresArray(final HighScores[] highScoresArray) {
                                            try {
                                                final HighScoresHelperBase highScoresHelperBase = new HighScoresHelperBase();
                                                gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray);
                                                final HighScore highScore = abCanvas.createHighScore(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>);
                                                final HighScoreUtil highScoreUtil = new HighScoreUtil(basicHighScoresFactory, highScoresHelperBase, abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScore);
                                                //logUtil.put("set highscores", this, commonStrings.PROCESS);
                                                globals.highscoreSubmissionComplete = true;
                                            } catch(Exception e) {
                                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                                            }
                                        }
                                    };
                                                                        
                                    basicHighScoresFactory.fetchHighScores(gameInfo, highScoresResultsListener);                                    

                                }
                               
    
                                        } catch (Exception e) {
                                            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                                        }
                                    }
                                }

                                SecondaryThreadPool.getInstance().runTask(new SaveHighScoreRunnable());

                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
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

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
        <xsl:param name="layoutIndex" />
                        
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

                        //Leaderboards::SavePlayerScore
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
        
                            try {

                                <xsl:if test="$beforeFourthParam != ''" >
                                final GDGameLayer <xsl:value-of select="$beforeFourthParam" /> = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$beforeFourthParam" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$beforeFourthParam" />GDGameLayerList.get(0);
                                //final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$beforeFourthParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeFourthParam" /><xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="$beforeFourthParam" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$beforeFourthParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeFourthParam" />) <xsl:value-of select="$beforeFourthParam" />GDGameLayer.gdObject;
                                final String name = <xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>;
                                </xsl:if>
                                <xsl:if test="$beforeFourthParam = ''" >
                                final String name = null;
                                </xsl:if>
                                
                                final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
                                final AllBinaryGameCanvas abCanvas = (AllBinaryGameCanvas) abToGBUtil.abCanvas;
                                
                                LogUtil.put(LogFactory.getInstance(new StringBuilder().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(name).toString(), this, commonStrings.PROCESS));
                                
                                class SaveHighScoreRunnable implements Runnable {

                                    public void run() {
                                        try {

                                final GameInfo gameInfo = abCanvas.getLayerManager().getGameInfo();
                                if(name != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> name.length() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                    final long score = <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>;
                                    LogUtil.put(LogFactory.getInstance(new StringBuilder().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Submitting and Fetching remote leaderboard: ").append(score).toString(), this, commonStrings.RUN));
                                    
                                    HighScoreNamePersistanceSingleton.getInstance().save(abeClientInformation, gameInfo, name);
                                    final HighScores[] highScoresArray = 
                                        new BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance()).createHighScores(gameInfo, false);
                                    gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray);
                                    final HighScore highScore = abCanvas.createHighScore(score);
                                    final HighScoreUtil highScoreUtil = new HighScoreUtil(abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScoresArray, highScore);
                                    highScoreUtil.update(name);
                                    highScoreUtil.saveHighScore();
                                    highScoreUtil.submit(abCanvas);
                                } else {
                                    LogUtil.put(LogFactory.getInstance(new StringBuilder().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Fetching remote leaderboard: ").append(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>).toString(), this, commonStrings.RUN));
                                    final HighScores[] highScoresArray = 
                                        new BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance()).createHighScores(gameInfo);
                                    gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray);
                                    final HighScore highScore = abCanvas.createHighScore(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>);
                                    final HighScoreUtil highScoreUtil = new HighScoreUtil(abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScoresArray, highScore);
                                }
                                
                                globals.highscoreSubmissionComplete = true;
    
                                        } catch (Exception e) {
                                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.RUN, e));
                                        }
                                    }
                                }

                                SecondaryThreadPool.getInstance().runTask(new SaveHighScoreRunnable());

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }
                            
                            return true;
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
        
                    <xsl:variable name="hasCollisionProcessGD" >
                        <xsl:call-template name="hasCollisionProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                        <xsl:call-template name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:call-template name="collisionProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="contains($hasCollisionProcessGD, 'found')" >
                        super.processGDStats(<xsl:call-template name="collisionProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template>GDGameLayer);
                    </xsl:if>
                    <xsl:if test="contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >
                        super.processGDStats(<xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template>GDGameLayer);
                    </xsl:if>
                    <xsl:if test="not(contains($hasCollisionProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >
                        
                        <xsl:variable name="hasSiblingActionWithObjectsGroupsOrObject" >
                            <xsl:for-each select=".." >
                                <xsl:for-each select="actions" >
                                    <xsl:if test="type/value = 'Create' and type/value != 'CreateByName'" >found</xsl:if>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:variable>                        

                        <xsl:for-each select=".." >
                        <xsl:for-each select="actions" >
                            <xsl:if test="type/value = 'Create' and type/value != 'CreateByName'" >
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //Sibling - //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //Leaderboards::SavePlayerScore - From sibling action
                    public boolean processGD(final GDGameLayer gdGameLayer, final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final Graphics graphics) throws Exception {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:for-each>
                        
                        <xsl:if test="not(contains($hasSiblingActionWithObjectsGroupsOrObject, 'found'))" >
                    //Leaderboards::SavePlayerScore - Not from parent collision
                    public boolean processGD(final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);

                        </xsl:if>
                    </xsl:if>

                            try {

                                //final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$beforeSecondParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeSecondParam" /><xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="$beforeSecondParam" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$beforeSecondParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeSecondParam" />) <xsl:value-of select="$beforeSecondParam" />GDGameLayer.gdObject;
                                
                                <xsl:if test="$beforeFourthParam != ''" >
                                final GDGameLayer <xsl:value-of select="$beforeFourthParam" /> = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$beforeFourthParam" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$beforeFourthParam" />GDGameLayerList.get(0);
                                //final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$beforeFourthParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeFourthParam" /><xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="$beforeFourthParam" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$beforeFourthParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeFourthParam" />) <xsl:value-of select="$beforeFourthParam" />GDGameLayer.gdObject;
                                final String name = <xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>;
                                </xsl:if>
                                <xsl:if test="$beforeFourthParam = ''" >
                                final String name = null;
                                </xsl:if>

                                final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
                                final AllBinaryGameCanvas abCanvas = (AllBinaryGameCanvas) abToGBUtil.abCanvas;
                                
                                LogUtil.put(LogFactory.getInstance(new StringBuilder().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(name).toString(), this, commonStrings.PROCESS));
                                
                                class SaveHighScoreRunnable implements Runnable {

                                    public void run() {
                                        try {

                                final GameInfo gameInfo = abCanvas.getLayerManager().getGameInfo();
                                
                                if(name != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> name.length() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                    final long score = <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>;
                                    LogUtil.put(LogFactory.getInstance(new StringBuilder().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Submitting and Fetching remote leaderboard: ").append(score).toString(), this, commonStrings.RUN));
                                    HighScoreNamePersistanceSingleton.getInstance().save(abeClientInformation, gameInfo, name);
                                    final HighScores[] highScoresArray = 
                                        new BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance()).createHighScores(gameInfo, false);
                                    gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray);
                                    final HighScore highScore = abCanvas.createHighScore(score);
                                    final HighScoreUtil highScoreUtil = new HighScoreUtil(abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScoresArray, highScore);
                                    highScoreUtil.update(name);
                                    highScoreUtil.saveHighScore();
                                    highScoreUtil.submit(abCanvas);
                                } else {
                                    LogUtil.put(LogFactory.getInstance(new StringBuilder().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Fetching remote leaderboard: ").append(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>).toString(), this, commonStrings.RUN));
                                    final HighScores[] highScoresArray = 
                                        new BasicHighScoresFactory(abeClientInformation, GDGameSoftwareInfo.getInstance()).createHighScores(gameInfo);
                                    gameGlobals.highScoresHelper.setHighScoresArray(highScoresArray);
                                    final HighScore highScore = abCanvas.createHighScore(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>);
                                    final HighScoreUtil highScoreUtil = new HighScoreUtil(abeClientInformation, gameInfo, abCanvas.getCustomCommandListener(), name, highScoresArray, highScore);
                                }
                                
                                globals.highscoreSubmissionComplete = true;
    
                                        } catch (Exception e) {
                                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.RUN, e));
                                        }
                                    }
                                }

                                SecondaryThreadPool.getInstance().runTask(new SaveHighScoreRunnable());

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }
        
    </xsl:template>

</xsl:stylesheet>

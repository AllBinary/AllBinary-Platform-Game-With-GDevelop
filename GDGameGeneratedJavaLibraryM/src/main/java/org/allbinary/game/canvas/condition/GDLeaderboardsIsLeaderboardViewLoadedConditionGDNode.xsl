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
        <xsl:param name="parametersAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
        
        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        
                    //leaderboardsIsLeaderboardViewLoadedConditionGDNode - //Condition - //Leaderboards::IsLeaderboardViewLoaded - GDNode
                    <xsl:if test="contains($forExtension, 'found')" >public </xsl:if>final GDNode NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                    <xsl:variable name="hasOtherConditions" ><xsl:for-each select="preceding-sibling::conditions" >found</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "highscores <xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        //Leaderboards::IsLeaderboardViewLoaded - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {

                            super.processStats();

                            //logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                            if(globals.highscoreSubmissionComplete) {

                                final HighScores[] highScoresArray = gameGlobals.highScoresHelper.getHighScoresArray();
                                
                                final int leaderBoardTotal = highScoresArray.length;
                                
                                HighScores highScores;
                                //final int index2 = leaderBoardTotal - 1;
                                //logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + " TWB " + leaderBoardTotal + " s:" + gameGlobals.selectedLeaderboardIndex, this, commonStrings.PROCESS);
                                final int index2 = leaderBoardTotal <xsl:text disable-output-escaping="yes" >&gt; </xsl:text> gameGlobals.selectedLeaderboardIndex ? gameGlobals.selectedLeaderboardIndex : leaderBoardTotal - 1;
                                //logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + " TWB c: " + index2, this, commonStrings.PROCESS);                            
                                //for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt; </xsl:text> leaderBoardTotal; index2++) {
                                if(org.allbinary.game.score.BasicHighScoresFactory.loaded(index2)) {
                                    highScores = highScoresArray[index2];
                                                                
                                    gameGlobals.highScoresTitle = highScores.getHeading();
                                    //gameGlobals.highScoresColumnHeadingOne = highScores.getColumnOneHeading();
                                    //gameGlobals.highScoresColumnHeadingOne = highScores.getColumnTwoHeading();

                                    final BasicArrayList highScoreList = highScores.getList();
                                    final int size = highScoreList.size();
                                    //logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "highScoreList.size(): " + size, this, commonStrings.PROCESS);
                                    gameGlobals.highScoresNameArray = new String[size];
                                    gameGlobals.highScoresLongArray = new long[size];
                                    HighScore highScore;
                                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt; </xsl:text> size; index++) {

                                        highScore = (HighScore) highScoreList.get(index);
                                        gameGlobals.highScoresNameArray[index] = highScore.getName();
                                        gameGlobals.highScoresLongArray[index] = highScore.getScore();
                                    }
                                }
                            
                            return true;
                            
                            }

                            return false;
                        }

                        @Override
                        public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                            super.processStats(motionGestureEvent);
                            
                            //logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "motion", this, commonStrings.PROCESS);
                            
                            return this.process();
                        }

                        @Override
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2) throws Exception {
                            super.processGDStats(gameLayer);

                            //logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, commonStrings.PROCESS);

                            if(globals.highscoreSubmissionComplete) {

                            return true;
                           }
                                                        
                           return false;
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
                        
                    };

                    <xsl:if test="not(contains($forExtension, 'found'))" >
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;
                    </xsl:if>

    </xsl:template>

</xsl:stylesheet>

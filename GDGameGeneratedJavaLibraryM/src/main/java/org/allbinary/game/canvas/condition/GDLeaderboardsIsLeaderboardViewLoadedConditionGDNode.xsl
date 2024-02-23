<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" indent="yes" />
    <xsl:template name="leaderboardsIsLeaderboardViewLoadedConditionGDNode" >
        <xsl:param name="parametersAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
                    //leaderboardsIsLeaderboardViewLoadedConditionGDNode - //Condition - //Leaderboards::IsLeaderboardViewLoaded - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                    <xsl:variable name="hasOtherConditions" ><xsl:for-each select="preceding-sibling::conditions" >found</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        //Leaderboards::IsLeaderboardViewLoaded - condition
                        @Override
                        public boolean process() throws Exception {

                            super.processStats();

                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                            if(globals.highscoreSubmissionComplete) {

                                final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
                                final AllBinaryGameCanvas abCanvas = (AllBinaryGameCanvas) abToGBUtil.abCanvas;
                                final HighScores[] highScoresArray = abCanvas.getHighScoresArray();
                                
                                final int leaderBoardTotal = highScoresArray.length;
                                
                                HighScores highScores;
                                final int index2 = leaderBoardTotal - 1;
                                //for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt; </xsl:text> leaderBoardTotal; index2++) {
                                    highScores = highScoresArray[index2];
                                
                                    gameGlobals.highScoresTitle = highScores.getHeading();
                                    gameGlobals.highScoresColumnHeadingOne = highScores.getColumnOneHeading();
                                    gameGlobals.highScoresColumnHeadingOne = highScores.getColumnTwoHeading();
                                    
                                    final BasicArrayList highScoreList = highScores.getList();
                                    final int size = highScoreList.size();
                                    gameGlobals.highScoresNameArray = new String[size];
                                    gameGlobals.highScoresIntArray = new int[size];
                                    HighScore highScore;
                                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt; </xsl:text> size; index++) {

                                        highScore = (HighScore) highScoreList.get(index);
                                        gameGlobals.highScoresNameArray[index] = highScore.getName();
                                        gameGlobals.highScoresIntArray[index] = (int) highScore.getScore();
                                    }
                                //}
                            
                            <xsl:for-each select="preceding-sibling::conditions" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                            //Preceding-Sibling - //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                            //Preceding-Sibling - //Condition - //<xsl:value-of select="type/value" /> - call
                            if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                                return true;
                            }
                            </xsl:for-each>

                            <xsl:if test="not(contains($hasOtherConditions, 'found'))" >
                                <xsl:for-each select=".." >

                                <xsl:for-each select="actions" >
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                                <xsl:text>&#10;</xsl:text>
                                //Action - //<xsl:value-of select="type/value" /> - call
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                </xsl:for-each>
                                    
                                <xsl:for-each select="events" >
                                    <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" />
                                //Event - //<xsl:value-of select="type" /> - call
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                    </xsl:if>
                                    <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                //Event - //BuiltinCommonInstructions::Link - call
                                globals.<xsl:value-of select="target" />GDNode.process();
                                    </xsl:if>
                                </xsl:for-each>

                                </xsl:for-each>
                            </xsl:if>
                            return true;
                            
                            }

                            return false;
                        }
                        
                        @Override
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                            this.processGDStats(gameLayer);

                            if(globals.highscoreSubmissionComplete) {

                            <xsl:for-each select="preceding-sibling::conditions" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                            //Preceding-Sibling - //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                            //Preceding-Sibling - //Condition - //<xsl:value-of select="type/value" /> - call
                            if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameLayer2, graphics)) {
                                return true;
                            }
                            </xsl:for-each>

                            <xsl:if test="not(contains($hasOtherConditions, 'found'))" >
                                <xsl:for-each select=".." >

                                <xsl:for-each select="actions" >
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                                <xsl:text>&#10;</xsl:text>
                                //Action - //<xsl:value-of select="type/value" /> - call
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameLayer2, graphics);
                                </xsl:for-each>
                                    
                                <xsl:for-each select="events" >
                                    <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" />
                                //Event - //<xsl:value-of select="type" /> - call
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameLayer2, graphics);
                                    </xsl:if>
                                    <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                                //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                //Event - //BuiltinCommonInstructions::Link - call
                                globals.<xsl:value-of select="target" />GDNode.processGD(gameLayer, gameLayer2, graphics);
                                    </xsl:if>
                                </xsl:for-each>

                                </xsl:for-each>
                            </xsl:if>
                            return true;
                           }
                                                        
                           return false;
                        }
                        
                    };

    </xsl:template>

</xsl:stylesheet>

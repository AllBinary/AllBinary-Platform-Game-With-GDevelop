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

    <xsl:import href="../GDAction.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template name="objectTimerConditionGDNode" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="caller" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="thisNodeArray" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="eventAsString" />
        <xsl:param name="actionAsStringsStrings" />
        <xsl:param name="logString" />
        <xsl:param name="eventsCreateProcessUsed" />
    
        <xsl:variable name="quote" >"</xsl:variable>
                    //objectTimerConditionGDNode - //Condition - //Timer - GDNode
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:value-of select="$eventAsString" disable-output-escaping="yes" />
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        //A:
                        <xsl:value-of select="$actionAsStringsStrings" disable-output-escaping="yes" />

                            <!--
                        public boolean process() throws Exception {
                            if(globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.isTime(GameTickTimeDelayHelperFactory.getInstance().getStartTime())) {
                            <xsl:for-each select="../actions" >
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                            <xsl:text>&#10;</xsl:text>
                                //Action - //<xsl:value-of select="type/value" /> - call
                                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:for-each>
                            return true;
                            -->
                            
                <xsl:for-each select="../../events" >

                <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                        final GDGameLayerFactory <xsl:value-of select="text()" />GDGameLayerFactory = resources.<xsl:value-of select="text()" />GDGameLayerFactory;
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                </xsl:for-each>
                
                </xsl:for-each>

                        //ObjectTimer - condition
                        private final Runnable runnable = new Runnable() {
                        
                            public void run() {
                                try {
                                    gdNodeStatsFactory.push(0, <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />);

                                    //LogUtil.put(LogFactory.getInstance(new StringBuilder().append(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.getElapsed()).append('/').append(globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.getDelay()).toString(), this, commonStrings.PROCESS));
                                    <xsl:variable name="list" >globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>ObjectTimeDelayHelperList</xsl:variable>

                                    final long startTime = GameTickTimeDelayHelperFactory.getInstance().getStartTime();
                                    TimeDelayHelper timeDelayHelper;

                                    final int size = <xsl:value-of select="$list" />.size();
                                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                                        timeDelayHelper = (TimeDelayHelper) <xsl:value-of select="$list" />.get(index);
                                        if(timeDelayHelper.isTime(startTime)) {
                                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                                            <xsl:variable name="conditionPosition" ><xsl:value-of select="position()" /></xsl:variable>
                                            <xsl:for-each select=".." >

                                            //eventsCreateAssignGDObject - actionsWithIndexes - START
                                            <xsl:call-template name="actionsWithIndexes" >
                                                <xsl:with-param name="indexInUse" >index</xsl:with-param>
                                                <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //eventsCreateAssignGDObject</xsl:with-param>
                                                <xsl:with-param name="thisNodeIndex" >
                                                    <xsl:value-of select="$thisNodeIndex" />
                                                </xsl:with-param>
                                                <xsl:with-param name="thisNodeArray" >
                                                    <xsl:value-of select="$thisNodeArray" />
                                                </xsl:with-param>                    
                                                <xsl:with-param name="conditionPosition" >
                                                    <xsl:value-of select="$conditionPosition" />
                                                </xsl:with-param>                    
                                                <xsl:with-param name="layoutIndex" >
                                                    <xsl:value-of select="$layoutIndex" />
                                                </xsl:with-param>
                                                <xsl:with-param name="parametersAsString" >
                                                    <xsl:value-of select="$parametersAsString" />
                                                </xsl:with-param>
                                                <xsl:with-param name="objectsAsString" >
                                                    <xsl:value-of select="$objectsAsString" />
                                                </xsl:with-param>
                                                <xsl:with-param name="createdObjectsAsString" >
                                                    <xsl:value-of select="$createdObjectsAsString" />
                                                </xsl:with-param>
                                                <xsl:with-param name="logString" >
                                                    <xsl:value-of select="$logString" />
                                                </xsl:with-param>
                                            </xsl:call-template>
                                            //eventsCreateAssignGDObject - actionsWithIndexes - END
                                        
                                            </xsl:for-each>
                                        
                                        }
                                    
                                    }
                                    gdNodeStatsFactory.push(1, <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />);
                
                                } catch(Exception e) {
                                    LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "Runnable", this, commonStrings.RUN, e));
                                }
                            }
                        };
                        
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            //if(this.currentRunnable != this.runnable) {
                                this.currentRunnable = this.runnable;
                            //} else {
                                //Best to not remark out when parent conditions include: SourisBouton, SourisSurObjet, or KeyFromTextPressed
                                //LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "Runnable already set: " + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, new Exception()));
                            //}

                            return true;
                        }

                        @Override
                        public void processReleased() throws Exception { //Timer
                            super.processReleasedStats();

                            if(this.currentRunnable != NullRunnable.getInstance()) {
                                this.currentRunnable = NullRunnable.getInstance();
                            } else {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "Runnable was not set: " + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, globals.PROCESS_RELEASE));
                            }
                        }

                        <xsl:value-of select="$eventsCreateProcessUsed" disable-output-escaping="yes" />

                    };
                    globals.gdNodeWithRunnableList.add(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
    </xsl:template>

</xsl:stylesheet>

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

    <xsl:import href="../GDHack.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template name="timerConditionGDNode" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="caller" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="eventAsString" />
        <xsl:param name="actionAsStringsStrings" />
        <xsl:param name="logString" />
        <xsl:param name="eventsCreateProcessUsed" />
    
        <xsl:variable name="quote" >"</xsl:variable>
        
        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
                    //timerConditionGDNode - //Condition - //Timer - GDNode
                    <xsl:if test="contains($forExtension, 'found')" >public </xsl:if>final GDNode NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:value-of select="$eventAsString" disable-output-escaping="yes" />
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        //A:
                        <xsl:value-of select="$actionAsStringsStrings" disable-output-escaping="yes" />

                            <!--
                        public boolean process() throws Exception {
                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if>globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.isTime(gameTickTimeDelayHelper.startTime)) {
                            //../actions
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

                        //Timer - runnable
                        <xsl:if test="not(contains($forExtension, 'found'))" >
<!--                        private final Runnable runnable = new Runnable() {
                        
                            public void run() {
                                try {
                                    gdNodeStatsFactory.push(0, <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />);

                                    globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.delay = (int) (1000 * <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>);
                                    //logUtil.put(new StringMaker().append(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.getElapsed(globals.globalsGameTickTimeDelayHelper.lastStartTime)).append('/').append(globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.delay).toString(), this, commonStrings.PROCESS);
                                    if(<xsl:if test="$inverted = 'true'" >!</xsl:if>globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.isTime(gameTickTimeDelayHelper.startTime)) {
                                        //logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                        
                                        <xsl:for-each select=".." >

                        <xsl:call-template name="actionsProcessing" >
                            <xsl:with-param name="methodCall" >process()</xsl:with-param>
                        </xsl:call-template>

                    <xsl:for-each select="events" >
                        <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if>
                            //Events only - //Event - //<xsl:value-of select="type" /> - call
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                        </xsl:if>
                        <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> 
                            <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> 
                            <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //Event - //BuiltinCommonInstructions::Link - call
                            <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process();
                        </xsl:if>
                    </xsl:for-each>

                                        </xsl:for-each>
                                        
                                    }
                                        
                                    gdNodeStatsFactory.push(1, <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />);
                
                                } catch(Exception e) {
                                    logUtil.put(commonStrings.EXCEPTION_LABEL + "Runnable", this, commonStrings.RUN, e);
                                }
                            }
                        };-->
                        </xsl:if>
                        
                        //Timer - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            //if(this.currentRunnable != this.runnable) {
<!--                            //Unremark if using a runnable-->
<!--                                this.currentRunnable = this.runnable;-->
                            //} else {
                                //Best to not remark out when parent conditions include: SourisBouton, SourisSurObjet, or KeyFromTextPressed
                                //logUtil.putF(commonStrings.EXCEPTION_LABEL + "Runnable already set: " + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, new Exception());
                            //}

                            globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.delay = (int) (1000 * <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>);
                            //logUtil.put(new StringMaker().append(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.getElapsed(globals.globalsGameTickTimeDelayHelper.lastStartTime)).append('/').append(globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.delay).toString(), this, commonStrings.PROCESS);
                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if>globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.isTime(gameTickTimeDelayHelper.startTime)) {
                                //logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);                                
                                return true;
                            } else {
                                return false;
                            }
                        }

                        @Override
                        public void processReleased() throws Exception { //Timer
                            super.processReleasedStats();
<!--                            //Unremark if using a runnable-->
<!--
                            if(this.currentRunnable != NullRunnable.getInstance()) {
                                this.currentRunnable = NullRunnable.getInstance();
                            } else {
                                logUtil.putF(commonStrings.EXCEPTION_LABEL + "Runnable was not set: " + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, globals.PROCESS_RELEASE);
                            }
-->
                        }

                        <xsl:value-of select="$eventsCreateProcessUsed" disable-output-escaping="yes" />
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

                    gdNodes.runnableList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
    </xsl:template>

</xsl:stylesheet>

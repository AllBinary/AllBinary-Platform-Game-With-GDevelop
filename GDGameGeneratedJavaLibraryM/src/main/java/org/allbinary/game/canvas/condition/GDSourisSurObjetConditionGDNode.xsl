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

    <xsl:template name="sourisSurObjetConditionGDNode" >
        <xsl:param name="parametersAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
                    <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
                    <xsl:variable name="conditions" ><xsl:for-each select="../../conditions" >found</xsl:for-each></xsl:variable>
                    <xsl:variable name="release" ><xsl:for-each select="../../conditions" ><xsl:if test="type/value = 'MouseButtonReleased'" >found</xsl:if></xsl:for-each><xsl:for-each select="../conditions" ><xsl:if test="type/value = 'MouseButtonReleased'" >found</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="press" ><xsl:for-each select="../../conditions" ><xsl:if test="type/value = 'SourisBouton' or type/value = 'MouseButtonPressed'" >found</xsl:if></xsl:for-each></xsl:variable>
        
                    //sourisSurObjetConditionGDNode - //Condition - //SourisSurObjet - //release=<xsl:value-of select="$release" /> - //press=<xsl:value-of select="$press" /> //inverted=<xsl:value-of select="$inverted" /> - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        //private final DisplayPointScalar displayPointScalar = DisplayPointScalar.getInstance();

                        private final Runnable runnable = new Runnable() {
                        
                            public void run() {
                                try {
                                    //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                                    gdNodeStatsFactory.push(0, <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />);

                                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 3; index++) {
                                    <xsl:for-each select=".." >
                                        <xsl:for-each select="actions" >
                                            <xsl:variable name="hasTimerChildCondition" ><xsl:call-template name="hasTimerChildCondition" /></xsl:variable>
                                            //press=<xsl:value-of select="contains($press, 'found')" /> //hasTimerChildCondition=<xsl:value-of select="contains($hasTimerChildCondition, 'found')" />
<!--                                        <xsl:if test="contains($press, 'found') or not(contains($conditions, 'found')) or contains($hasTimerChildCondition, 'found')" >-->
                                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                        //Action - call - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                                        //Action - //<xsl:value-of select="type/value" /> - call - press
                                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
<!--                                        </xsl:if>-->
                                        </xsl:for-each>

                                        <xsl:for-each select="events" >
                                        <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                                            <xsl:variable name="hasTimerChildCondition" ><xsl:call-template name="hasTimerChildCondition" /></xsl:variable>
                                            //press=<xsl:value-of select="contains($press, 'found')" /> //hasTimerChildCondition=<xsl:value-of select="contains($hasTimerChildCondition, 'found')" />
                                        <xsl:if test="contains($press, 'found') or not(contains($conditions, 'found')) or contains($hasTimerChildCondition, 'found')" >
                                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                        //Event - call - under SourisSurObjet press nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> parameters=<xsl:value-of select="$parametersAsString" />
                                        //Condition - //SourisSurObjet - //Event - //<xsl:value-of select="type" /> - call - press
                                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                        </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> 
                                        <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                                        //Event - //BuiltinCommonInstructions::Link - call
                                        globals.<xsl:value-of select="target" />GDNode.process();
                                        </xsl:if>
                                        </xsl:for-each>
                                        
                                        </xsl:for-each>
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

                        <xsl:if test="contains($press, 'found') or contains($release, 'found')" >
                            //if(this.currentRunnable != this.runnable) {
                                this.currentRunnable = this.runnable;
                            //} else {
                                //Best to not remark out when parent conditions include: SourisBouton, SourisSurObjet, or KeyFromTextPressed
                                //LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "Runnable already set: " + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, new Exception()));
                            //}
                        </xsl:if>

                            return true;
                        }

                        @Override
                        public void processReleased() throws Exception { //Timer
                            super.processReleasedStats();

                        <xsl:if test="contains($press, 'found') or contains($release, 'found')" >
                            if(this.currentRunnable != NullRunnable.getInstance()) {
                                this.currentRunnable = NullRunnable.getInstance();
                            } else {
                                //LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "Runnable was not set: " + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, globals.PROCESS_RELEASE));
                            }
                        </xsl:if>
                        
                        }
                                            
                        //SourisSurObjet
                        @Override
                        public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                            super.processStats(motionGestureEvent);

                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                                <xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 1" >
                            //final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />RectangleList.size();
                            //Rectangle <xsl:value-of select="text()" />Rectangle = null;                                        
                            final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size();
                            //final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />RectangleList.size();
                            GDGameLayer gameLayer;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            
                                //<xsl:value-of select="text()" />Rectangle = (Rectangle) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />RectangleList.get(index);
                                //LogUtil.put(LogFactory.getInstance("<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />Rectangle - Not Null", this, commonStrings.PROCESS));
                                //final GPoint point = displayPointScalar.process(motionGestureEvent.getCurrentPoint());
                                //final GPoint rectangePoint = <xsl:value-of select="text()" />Rectangle.getPoint();
                                
                                gameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                                //LogUtil.put(LogFactory.getInstance("<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDameLayer - Not Null", this, commonStrings.PROCESS));
                                final GPoint point = motionGestureEvent.getCurrentPoint();
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="text()" />Rectangle - motionGestureEvent: " + motionGestureEvent.toString(), this, commonStrings.PROCESS));
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="text()" /> - point: " + point.toString(), this, commonStrings.PROCESS));
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="text()" />GDGameLayer: " + gameLayer.toString(), this, commonStrings.PROCESS));
                                
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="text()" />Rectangle: " + <xsl:value-of select="text()" />Rectangle.toString(), this, commonStrings.PROCESS));
                                //if (rectangleCollisionUtil.isInside(rectangePoint.getX(), rectangePoint.getY() - 2, <xsl:value-of select="text()" />Rectangle.getMaxX(), <xsl:value-of select="text()" />Rectangle.getMaxY() + 2, point.getX(), point.getY()))
                                if (rectangleCollisionUtil.isInside(gameLayer.getX(), gameLayer.getY() - 2, gameLayer.getX2(), gameLayer.getY2() + 2, point.getX(), point.getY()))
                                {
                                    //LogUtil.put(LogFactory.getInstance("Inside", this, commonStrings.PROCESS));
                                    <xsl:if test="$inverted != 'true'" >
                                    <xsl:if test="not(contains($press, 'found') or contains($release, 'found'))" >
                                        runnable.run();
                                    </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="contains($press, 'found')" >
                                    //final MotionGestureInput motionGestureInput = motionGestureEvent.getMotionGesture();
                                    if (lastMotionGestureInput == touchMotionGestureFactory.PRESSED) {
                                        
                                        <xsl:if test="not(contains($conditions, 'found'))" >
                                        //Assume press when not parent condition telling us.
                                        </xsl:if>

                                        //if(globals.currentButtonGDNodePressed != null) {
                                        //    globals.currentButtonGDNodePressed.processReleased();
                                        //}
                                        //globals.currentButtonGDNodePressed = this;

                                        this.process();
                                        
                                        <!--
                                        <xsl:for-each select="../../actions" >
                                            <xsl:variable name="hasTimerChildCondition" ><xsl:call-template name="hasTimerChildCondition" /></xsl:variable>
                                            //press=<xsl:value-of select="contains($press, 'found')" /> //hasTimerChildCondition=<xsl:value-of select="contains($hasTimerChildCondition, 'found')" />
                                        <xsl:if test="contains($press, 'found') or not(contains($conditions, 'found')) or contains($hasTimerChildCondition, 'found')" >
                                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                        //Action - call - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                                        //Action - //<xsl:value-of select="type/value" /> - call - press
                                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                        </xsl:if>
                                        </xsl:for-each>

                                        <xsl:for-each select="../../events" >
                                        <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                                            <xsl:variable name="hasTimerChildCondition" ><xsl:call-template name="hasTimerChildCondition" /></xsl:variable>
                                            //press=<xsl:value-of select="contains($press, 'found')" /> //hasTimerChildCondition=<xsl:value-of select="contains($hasTimerChildCondition, 'found')" />
                                        <xsl:if test="contains($press, 'found') or not(contains($conditions, 'found')) or contains($hasTimerChildCondition, 'found')" >
                                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                        //Event - call - under SourisSurObjet press nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> parameters=<xsl:value-of select="$parametersAsString" />
                                        //Condition - //SourisSurObjet - //Event - //<xsl:value-of select="type" /> - call - press
                                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                        </xsl:if>
                                        </xsl:if>
                                        </xsl:for-each>
                                    -->
                                        
                                    } else if(lastMotionGestureInput == touchMotionGestureFactory.RELEASED) {
                                    
                                        this.processReleased();
                                    <!--
                                        <xsl:for-each select="../../actions" >
                                            <xsl:variable name="hasTimerChildCondition" ><xsl:call-template name="hasTimerChildCondition" /></xsl:variable>
                                            //release=<xsl:value-of select="contains($release, 'found')" /> //hasTimerChildCondition=<xsl:value-of select="contains($hasTimerChildCondition, 'found')" />
                                        <xsl:if test="(contains($press, 'found') and type/value = 'Rotate') or contains($release, 'found') or contains($hasTimerChildCondition, 'found')" >
                                        //Action - call - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                                        //Action - //<xsl:value-of select="type/value" /> - call - release
                                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                                        </xsl:if>
                                        </xsl:for-each>    
                                        <xsl:for-each select="../../events" >
                                        <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                                            <xsl:variable name="hasTimerChildCondition" ><xsl:call-template name="hasTimerChildCondition" /></xsl:variable>
                                            //release=<xsl:value-of select="contains($release, 'found')" /> //hasTimerChildCondition=<xsl:value-of select="contains($hasTimerChildCondition, 'found')" />
                                        //and type/value = 'Rotate')
                                        <xsl:if test="contains($press, 'found') or contains($release, 'found') or contains($hasTimerChildCondition, 'found')" >
                                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                        //Event - call - under SourisSurObjet release nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> parameters=<xsl:value-of select="$parametersAsString" />
                                        //Condition - //SourisSurObjet - //Event - //<xsl:value-of select="type" /> - call - release
                                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                                        </xsl:if>
                                        </xsl:if>
                                        </xsl:for-each>
                                    -->
                                    }
                                    </xsl:if>
                                    <xsl:if test="contains($release, 'found')" >
                                    //final MotionGestureInput motionGestureInput = motionGestureEvent.getMotionGesture();
                                    if (lastMotionGestureInput == touchMotionGestureFactory.PRESSED) {

                                    } else if(lastMotionGestureInput == touchMotionGestureFactory.RELEASED) {

                                        runnable.run();

                                    }
                                    </xsl:if>

                                } else {
                                
                                    <xsl:if test="contains($press, 'found')" >
                                        //Release button when not in button area
                                        this.processReleased();
                                    </xsl:if>
                                    
                                    <xsl:if test="$inverted = 'true'" >
                                    <xsl:if test="not(contains($press, 'found')) or contains($release, 'found')" >
                                        runnable.run();
                                    </xsl:if>
                                    </xsl:if>
                                }
                            } 
                            //if(size == 0) {
                                //LogUtil.put(LogFactory.getInstance("<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />Rectangle - Null", this, commonStrings.PROCESS));
                            //}
                                    </xsl:if>
                                </xsl:for-each>
                                
                            return true;
                        }
                                                
                    };

                    <xsl:if test="contains($press, 'found')" >
                    globals.gdNodeWithRunnableList.add(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]);
                    </xsl:if>

    </xsl:template>

    <xsl:template name="hasTimerChildCondition" >
        <xsl:for-each select="events" ><xsl:call-template name="hasTimerChildCondition" /></xsl:for-each><xsl:for-each select="actions" ><xsl:call-template name="hasTimerChildCondition" /></xsl:for-each><xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" >found</xsl:if><xsl:call-template name="hasTimerChildCondition" /></xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

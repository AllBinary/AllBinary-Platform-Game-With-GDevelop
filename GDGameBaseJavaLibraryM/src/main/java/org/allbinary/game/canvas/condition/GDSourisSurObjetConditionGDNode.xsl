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
        <xsl:variable name="quote" >"</xsl:variable>
                    //sourisSurObjetConditionGDNode - //Condition - //SourisSurObjet - GDNode
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="conditions" ><xsl:for-each select="../../conditions" >found</xsl:for-each></xsl:variable>
                    <xsl:variable name="release" ><xsl:for-each select="../../conditions" ><xsl:if test="type/value = 'MouseButtonReleased'" >found</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="press" ><xsl:for-each select="../../conditions" ><xsl:if test="type/value = 'SourisBouton'" >found</xsl:if></xsl:for-each></xsl:variable>

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        //SourisSurObjet
                        @Override
                        public void process(final MotionGestureEvent motionGestureEvent) throws Exception {
                            super.processStats(motionGestureEvent);

                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                                <xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 1" >
                            if(globals.<xsl:value-of select="text()" />Rectangle != null) {
                            
                                //LogUtil.put(LogFactory.getInstance("globals.<xsl:value-of select="text()" />Rectangle - Not Null", this, commonStrings.PROCESS));
                                final GPoint point = motionGestureEvent.getCurrentPoint();
                                final GPoint rectangePoint = globals.<xsl:value-of select="text()" />Rectangle.getPoint();
                                //LogUtil.put(LogFactory.getInstance("globals.<xsl:value-of select="text()" />Rectangle - motionGestureEvent: " + motionGestureEvent.toString(), this, commonStrings.PROCESS));
                                //LogUtil.put(LogFactory.getInstance("globals.<xsl:value-of select="text()" />Rectangle: " + globals.<xsl:value-of select="text()" />Rectangle.toString(), this, commonStrings.PROCESS));
                                if (RectangleCollisionUtil.isInside(rectangePoint.getX(), rectangePoint.getY() - 2, globals.<xsl:value-of select="text()" />Rectangle.getMaxX(), globals.<xsl:value-of select="text()" />Rectangle.getMaxY() + 2,
                                    point.getX(), point.getY()))
                                {
                                    //LogUtil.put(LogFactory.getInstance("Inside", this, commonStrings.PROCESS));
                                    final MotionGestureInput motionGestureInput = motionGestureEvent.getMotionGesture();
                                    if (motionGestureInput == TouchMotionGestureFactory.getInstance().PRESSED) {
                                        
                                        <xsl:if test="not(contains($conditions, 'found'))" >
                                        //Assume press when not parent condition telling us.
                                        </xsl:if>
                                        
                                        <xsl:for-each select="../../actions" >
                                            <xsl:variable name="hasTimerChildCondition" ><xsl:call-template name="hasTimerChildCondition" /></xsl:variable>
                                            //press=<xsl:value-of select="contains($press, 'found')" /> //hasTimerChildCondition=<xsl:value-of select="contains($hasTimerChildCondition, 'found')" />
                                        <xsl:if test="contains($press, 'found') or not(contains($conditions, 'found')) or contains($hasTimerChildCondition, 'found')" >
                                        //Action - call - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                                        //Action - //<xsl:value-of select="type/value" /> - call - presss
                                        globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                        </xsl:if>
                                        </xsl:for-each>

                                        <xsl:for-each select="../../events" >
                                        <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                                            <xsl:variable name="hasTimerChildCondition" ><xsl:call-template name="hasTimerChildCondition" /></xsl:variable>
                                            //press=<xsl:value-of select="contains($press, 'found')" /> //hasTimerChildCondition=<xsl:value-of select="contains($hasTimerChildCondition, 'found')" />
                                        <xsl:if test="contains($press, 'found') or not(contains($conditions, 'found')) or contains($hasTimerChildCondition, 'found')" >
                                        //Event - call - under SourisSurObjet press nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                                        //Event - //<xsl:value-of select="type" /> - call - presss
                                        globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                        </xsl:if>
                                        </xsl:if>
                                        </xsl:for-each>
                                        
                                    } else {
                                    

                                        <xsl:for-each select="../../actions" >
                                            <xsl:variable name="hasTimerChildCondition" ><xsl:call-template name="hasTimerChildCondition" /></xsl:variable>
                                            //release=<xsl:value-of select="contains($release, 'found')" /> //hasTimerChildCondition=<xsl:value-of select="contains($hasTimerChildCondition, 'found')" />
                                        <xsl:if test="(contains($press, 'found') and type/value = 'Rotate') or contains($release, 'found') or contains($hasTimerChildCondition, 'found')" >
                                        //Action - call - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                                        //Action - //<xsl:value-of select="type/value" /> - call - release
                                        globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                                        </xsl:if>
                                        </xsl:for-each>    
                                        <xsl:for-each select="../../events" >
                                        <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                                            <xsl:variable name="hasTimerChildCondition" ><xsl:call-template name="hasTimerChildCondition" /></xsl:variable>
                                            //release=<xsl:value-of select="contains($release, 'found')" /> //hasTimerChildCondition=<xsl:value-of select="contains($hasTimerChildCondition, 'found')" />
                                        <xsl:if test="(contains($press, 'found') and type/value = 'Rotate') or contains($release, 'found') or contains($hasTimerChildCondition, 'found')" >
                                        //Event - call - under SourisSurObjet release nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                                        //Condition - //SourisSurObjet - //Event - //<xsl:value-of select="type" /> - call - release
                                        globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                                        </xsl:if>
                                        </xsl:if>
                                        </xsl:for-each>

                                    }
                                }
                            } else {
                                //LogUtil.put(LogFactory.getInstance("globals.<xsl:value-of select="text()" />Rectangle - Null", this, commonStrings.PROCESS));
                            }
                                    </xsl:if>
                                </xsl:for-each>
                        }
                    };

    </xsl:template>

    <xsl:template name="hasTimerChildCondition" >
        <xsl:for-each select="events" ><xsl:call-template name="hasTimerChildCondition" /></xsl:for-each><xsl:for-each select="actions" ><xsl:call-template name="hasTimerChildCondition" /></xsl:for-each><xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" >found</xsl:if><xsl:call-template name="hasTimerChildCondition" /></xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

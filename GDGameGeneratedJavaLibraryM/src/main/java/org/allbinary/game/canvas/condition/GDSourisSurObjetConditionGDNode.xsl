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
                    //sourisSurObjetConditionGDNode - //Condition - //SourisSurObjet - GDNode
                    if(globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="conditions" ><xsl:for-each select="../../conditions" >found</xsl:for-each></xsl:variable>
                    <xsl:variable name="release" ><xsl:for-each select="../../conditions" ><xsl:if test="type/value = 'MouseButtonReleased'" >found</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="press" ><xsl:for-each select="../../conditions" ><xsl:if test="type/value = 'SourisBouton' or type/value = 'MouseButtonPressed'" >found</xsl:if></xsl:for-each></xsl:variable>

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        private final DisplayPointScalar displayPointScalar = DisplayPointScalar.getInstance();

                        //SourisSurObjet
                        @Override
                        public void process(final MotionGestureEvent motionGestureEvent) throws Exception {
                            super.processStats(motionGestureEvent);

                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                                <xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 1" >
                            final int size = globals.<xsl:value-of select="text()" />RectangleList.size();
                            Rectangle <xsl:value-of select="text()" />Rectangle = null;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            
                                <xsl:value-of select="text()" />Rectangle = (Rectangle) globals.<xsl:value-of select="text()" />RectangleList.get(index);
                                //LogUtil.put(LogFactory.getInstance("globals.<xsl:value-of select="text()" />Rectangle - Not Null", this, commonStrings.PROCESS));
                                final GPoint point = displayPointScalar.process(motionGestureEvent.getCurrentPoint());
                                final GPoint rectangePoint = <xsl:value-of select="text()" />Rectangle.getPoint();
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="text()" />Rectangle - motionGestureEvent: " + motionGestureEvent.toString(), this, commonStrings.PROCESS));
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="text()" /> - point: " + point.toString(), this, commonStrings.PROCESS));
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="text()" />Rectangle: " + <xsl:value-of select="text()" />Rectangle.toString(), this, commonStrings.PROCESS));
                                if (RectangleCollisionUtil.isInside(rectangePoint.getX(), rectangePoint.getY() - 2, <xsl:value-of select="text()" />Rectangle.getMaxX(), <xsl:value-of select="text()" />Rectangle.getMaxY() + 2,
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
                                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                        //Action - call - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                                        //Action - //<xsl:value-of select="type/value" /> - call - presss
                                        globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
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
                                        //Event - //<xsl:value-of select="type" /> - call - presss
                                        globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                        </xsl:if>
                                        </xsl:if>
                                        </xsl:for-each>
                                        
                                    } else {
                                    

                                        <xsl:for-each select="../../actions" >
                                            <xsl:variable name="hasTimerChildCondition" ><xsl:call-template name="hasTimerChildCondition" /></xsl:variable>
                                            //release=<xsl:value-of select="contains($release, 'found')" /> //hasTimerChildCondition=<xsl:value-of select="contains($hasTimerChildCondition, 'found')" />
                                        <xsl:if test="(contains($press, 'found') and type/value = 'Rotate') or contains($release, 'found') or contains($hasTimerChildCondition, 'found')" >
                                        //Action - call - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                                        //Action - //<xsl:value-of select="type/value" /> - call - release
                                        globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                                        </xsl:if>
                                        </xsl:for-each>    
                                        <xsl:for-each select="../../events" >
                                        <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                                            <xsl:variable name="hasTimerChildCondition" ><xsl:call-template name="hasTimerChildCondition" /></xsl:variable>
                                            //release=<xsl:value-of select="contains($release, 'found')" /> //hasTimerChildCondition=<xsl:value-of select="contains($hasTimerChildCondition, 'found')" />
                                        <xsl:if test="(contains($press, 'found') and type/value = 'Rotate') or contains($release, 'found') or contains($hasTimerChildCondition, 'found')" >
                                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                        //Event - call - under SourisSurObjet release nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> parameters=<xsl:value-of select="$parametersAsString" />
                                        //Condition - //SourisSurObjet - //Event - //<xsl:value-of select="type" /> - call - release
                                        globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                                        </xsl:if>
                                        </xsl:if>
                                        </xsl:for-each>

                                    }
                                }
                            } 
                            //if(size == 0) {
                                //LogUtil.put(LogFactory.getInstance("globals.<xsl:value-of select="text()" />Rectangle - Null", this, commonStrings.PROCESS));
                            //}
                                    </xsl:if>
                                </xsl:for-each>
                        }
                    };

    </xsl:template>

    <xsl:template name="hasTimerChildCondition" >
        <xsl:for-each select="events" ><xsl:call-template name="hasTimerChildCondition" /></xsl:for-each><xsl:for-each select="actions" ><xsl:call-template name="hasTimerChildCondition" /></xsl:for-each><xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" >found</xsl:if><xsl:call-template name="hasTimerChildCondition" /></xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

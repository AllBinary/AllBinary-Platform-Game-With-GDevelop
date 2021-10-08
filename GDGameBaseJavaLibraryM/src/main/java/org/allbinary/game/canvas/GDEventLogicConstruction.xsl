<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="eventsLogicConstruction" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="conditionEventPosition" />
        
        //eventsLogicConstruction - START
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
            
            <xsl:call-template name="eventsLogicConstruction" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="conditionEventPosition" >
                    <xsl:value-of select="$eventPosition" />
                </xsl:with-param>
            </xsl:call-template>

            //Event <xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
            <xsl:for-each select="comment" >
                //Comment: <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="comment2" >
                <xsl:if test="string-length(text()) > 0" >
                    //Comment 2: <xsl:value-of select="text()" />
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="iterableVariableName" >
                //iterableVariableName: <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="valueIteratorVariableName" >
                //valueIteratorVariableName: <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="keyIteratorVariableName" >
                //keyIteratorVariableName <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="name" >
                //name <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="source" >
                <xsl:if test="string-length(text()) > 0" >
                    //source <xsl:value-of select="text()" />
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="colorR" >
                //colorR <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="colorG" >
                //colorG <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="colorB" >
                //colorB <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="target" >
                //target <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:if test="repeatExpression" >
                //repeatExpression <xsl:value-of select="repeatExpression" />
            </xsl:if>

            <xsl:choose>
            <xsl:when test="not(preceding::events/actions[parameters = current()/actions/parameters])">
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:if test="$typeValue = 'ModVarScene'" >
                        // - No Preceding text=<xsl:value-of select="parameters" /><xsl:text>&#10;</xsl:text>
                        <xsl:if test="current()/parameters[2]/text() = '+'" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 2" ><xsl:if test="text() = '+'" >=</xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each></xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                    // - Already Preceded text=<xsl:value-of select="current()/parameters" /><xsl:text>&#10;</xsl:text>
                </xsl:for-each>
            </xsl:otherwise>
            </xsl:choose>

            <xsl:variable name="hasAssociatedSiblingCondition" select="conditions/type/value = 'MouseButtonReleased' or conditions/type/value = 'VarScene' or conditions/type/value = 'Timer'" />

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="nodeId" select="generate-id()" />
                //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>

                    //Action for Condition totalRecursions=<xsl:value-of select="$totalRecursions" /> eventPosition=<xsl:value-of select="$eventPosition" /> conditionEventPosition=<xsl:value-of select="$conditionEventPosition" /> hasAssociatedSiblingCondition=<xsl:value-of select="$hasAssociatedSiblingCondition" />
                    this.actionArrayOfArrays[<xsl:value-of select="number(substring(generate-id(), 3))" />] = new GDAction() {
                        public void process() {
                            <xsl:if test="$typeValue = 'Scene'" >            
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                            //<xsl:value-of select="translate(text(), '\&quot;', '')" />
                            final String TEXT = <xsl:value-of select="text()" />;
                            </xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                            
                            try {
                            <xsl:variable name="quote" >"</xsl:variable>
                            <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="$nodeId" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />"));
                                
                                <xsl:if test="$typeValue = 'Scene'" >
                                ((GDGameMIDlet) MIDletBridge.getCurrentMIDlet()).setGDLayout(TEXT);
                                </xsl:if>
                                
                                <xsl:if test="$typeValue != 'Scene' and $typeValue != 'MettreX' and $typeValue != 'MettreY' and $typeValue != 'SceneBackground' and $typeValue != 'Rotate'" >
                                    
                                </xsl:if>
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }
                            
                        }
                        
                        <xsl:if test="$typeValue = 'Rotate'" >
                        public void process(GDObject <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>) {
                                <xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.rotation =<xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>
                        }
                        </xsl:if>
                                
                        public void process(final MotionGestureEvent motionGestureEvent) {
                            <xsl:for-each select="../conditions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                                <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                            if(<xsl:value-of select="text()" />Rectangle != null) {
                                final GPoint point = motionGestureEvent.getCurrentPoint();
                                final GPoint rectangePoint = <xsl:value-of select="text()" />Rectangle.getPoint();
                                if (RectangleCollisionUtil.isInside(rectangePoint.getX(), rectangePoint.getY(), <xsl:value-of select="text()" />Rectangle.getMaxX(), <xsl:value-of select="text()" />Rectangle.getMaxY(),
                                    point.getX(), point.getY()))
                                {
                                    this.process();
                                }
                            }
                            </xsl:if>
                                </xsl:for-each>
                                </xsl:if>
                            </xsl:for-each>
                        }
                    };                    
            </xsl:for-each>
    
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'MouseButtonReleased'" >
                    this.eventListenerInterface_<xsl:value-of select="generate-id()" /> = new BaseMotionGestureEventListener() {

                        public void onEvent(final AllBinaryEventObject eventObject)
                        {
                        }

                        public void onMotionGestureEvent(final MotionGestureEvent motionGestureEvent) {
                    
                            //Event for Condition
                    <xsl:for-each select=".." >
                            <xsl:call-template name="actionIdsMotionGestureEvent" >
                                <xsl:with-param name="totalRecursions" >0</xsl:with-param>                                
                            </xsl:call-template>
                    </xsl:for-each>                            
                        }
                             
                    };
                </xsl:if>
                
                <xsl:if test="$typeValue = 'CollisionNP'" >
                    size = this.<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>GDGameLayerList.size();
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                        collidableBehavior = ((GDCollidableBehavior) ((GDGameLayer) this.<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>GDGameLayerList.get(index)).getCollidableInferface());
                        final GroupInterface groupInterface = ((GDGameLayer) this.<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>GDGameLayerList.get(0)).getGroupInterface()[0];
                        //Child VarScene conditions with actions
                        <xsl:for-each select="../events" >
                            <xsl:if test="actions" >
                                //1
                                collidableBehavior.groupCollisionList.add(groupInterface);
                                collidableBehavior.actionCollisionList.add(this.actionArrayOfArrays[<xsl:value-of select="number(substring(generate-id(), 3))" />]);
                            </xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="../events/events" >
                            <xsl:if test="actions" >
                                //2
                                collidableBehavior.groupCollisionList.add(groupInterface);
                                collidableBehavior.actionCollisionList.add(this.actionArrayOfArrays[<xsl:value-of select="number(substring(generate-id(), 3))" />]);
                            </xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="../events/events/events" >
                            <xsl:if test="actions" >
                                //3
                                collidableBehavior.groupCollisionList.add(groupInterface);
                                collidableBehavior.actionCollisionList.add(this.actionArrayOfArrays[<xsl:value-of select="number(substring(generate-id(), 3))" />]);
                            </xsl:if>
                        </xsl:for-each>
                    }
                </xsl:if>
                
            </xsl:for-each>

        </xsl:for-each>
        //eventsLogicConstruction - END
        
    </xsl:template>

</xsl:stylesheet>

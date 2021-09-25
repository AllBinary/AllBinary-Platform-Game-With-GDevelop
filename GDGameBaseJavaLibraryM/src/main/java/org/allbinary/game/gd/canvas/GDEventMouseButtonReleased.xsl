<?xml version="1.0" encoding="windows-1252"?>

<!--
    Document   : GDEvent.xsl
    Created on : September 10, 2021, 4:07 PM
    Author     : User
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="eventsMouseButtonReleased" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="conditionEventPosition" />
        
        //eventsMouseButtonReleased
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
            
            <xsl:call-template name="eventsMouseButtonReleased" >
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
            <xsl:for-each select="repeatExpression" >
                //repeatExpression <xsl:value-of select="text()" />
            </xsl:for-each>

            <xsl:choose>
            <xsl:when test ="not(preceding::events/actions[parameters = current()/actions/parameters])">
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Action type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each><xsl:text>&#10;</xsl:text>
                    <xsl:if test="$typeValue = 'ModVarScene'" >
                        //eventsMouseButtonReleased - No Preceding text=<xsl:value-of select="parameters" /><xsl:text>&#10;</xsl:text>
                        <xsl:if test="current()/parameters[2]/text() = '+'" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 2" ><xsl:if test="text() = '+'" >=</xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each></xsl:if>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Action type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each><xsl:text>&#10;</xsl:text>
                    //eventsMouseButtonReleased - Already Preceded text=<xsl:value-of select="current()/parameters" /><xsl:text>&#10;</xsl:text>
                </xsl:for-each>
            </xsl:otherwise>
            </xsl:choose>

            <xsl:variable name="hasAssociatedSiblingCondition" select="conditions/type/value = 'MouseButtonReleased' or conditions/type/value = 'VarScene' or conditions/type/value = 'Timer'" />

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Action type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each><xsl:text>&#10;</xsl:text>
                
                <xsl:if test="$typeValue = 'Scene'" >
                    <xsl:if test="$hasAssociatedSiblingCondition" >
                        //Action for Condition totalRecursions=<xsl:value-of select="number($totalRecursions)" /> eventPosition=<xsl:value-of select="$eventPosition" /> hasAssociatedSiblingCondition=<xsl:value-of select="$hasAssociatedSiblingCondition" />
                        this.actionArrayOfArrays[<xsl:value-of select="$eventPosition" />] = new GDAction() {
                        public void process() {
                            //<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                            final String TEXT = <xsl:value-of select="text()" />;
                            try {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, TEXT));
                                ((GDGameMIDlet) MIDletBridge.getCurrentMIDlet()).setGDLayout(TEXT);
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }
                            </xsl:if>
                            </xsl:for-each>                            
                        }
                    };
                    </xsl:if>                    
                    <xsl:if test="not($hasAssociatedSiblingCondition)" >
                        //Action for Parent Condition totalRecursions=<xsl:value-of select="number($totalRecursions)" /> eventPosition=<xsl:value-of select="$eventPosition" /> conditionEventPosition=<xsl:value-of select="$conditionEventPosition" /> hasAssociatedSiblingCondition=<xsl:value-of select="$hasAssociatedSiblingCondition" />
                    this.actionArrayOfArrays[<xsl:value-of select="$conditionEventPosition" />] = new GDAction() {
                        public void process() {
                            //<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                            final String TEXT = <xsl:value-of select="text()" />;
                            try {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, TEXT));
                                ((GDGameMIDlet) MIDletBridge.getCurrentMIDlet()).setGDLayout(TEXT);
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }
                            </xsl:if>
                            </xsl:for-each>
                        }
                    };
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
    
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'MouseButtonReleased'" >
                    this.eventListenerInterface_<xsl:value-of select="number($totalRecursions)" />_<xsl:value-of select="$eventPosition" /> = new EventListenerInterface() {
                        public void onEvent(AllBinaryEventObject eventObject)
                        {
                             actionArrayOfArrays[<xsl:if test="number($totalRecursions) > 0" ><xsl:value-of select="number($totalRecursions)" /></xsl:if><xsl:value-of select="$eventPosition" />].process();
                        }
                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'DepartScene'" >
                </xsl:if>
            </xsl:for-each>

        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

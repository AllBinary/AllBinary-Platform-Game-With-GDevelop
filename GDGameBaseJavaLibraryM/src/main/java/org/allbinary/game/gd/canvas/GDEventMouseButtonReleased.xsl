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

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Action type=<xsl:value-of select="$typeValue" />
                //<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'Scene'" >
                    <xsl:if test="not($conditionEventPosition)" >
                        //Action for Condition <xsl:value-of select="number($totalRecursions)" />
                    this.actionArrayOfArrays[<xsl:value-of select="$eventPosition" />] = new GDAction() {
                        public void process() {
                            //<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="text()" />));    
                            </xsl:if>
                            </xsl:for-each>                            
                        }
                    };
                    </xsl:if>                    
                    <xsl:if test="$conditionEventPosition" >
                        //Action for Parent Condition <xsl:value-of select="number($totalRecursions)" />
                    this.actionArrayOfArrays[<xsl:value-of select="$conditionEventPosition" />] = new GDAction() {
                        public void process() {
                            //<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="text()" />));    
                            </xsl:if>
                            </xsl:for-each>
                        }
                    };
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
    
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition type=<xsl:value-of select="$typeValue" />
                //<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'MouseButtonReleased'" >
                    this.eventListenerInterface_<xsl:value-of select="number($totalRecursions)" />_<xsl:value-of select="$eventPosition" /> = new EventListenerInterface() {
                        public void onEvent(AllBinaryEventObject eventObject)
                        {
                             actionArrayOfArrays[<xsl:value-of select="$eventPosition" />].process();
                        }
                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'DepartScene'" >
                </xsl:if>
            </xsl:for-each>

        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

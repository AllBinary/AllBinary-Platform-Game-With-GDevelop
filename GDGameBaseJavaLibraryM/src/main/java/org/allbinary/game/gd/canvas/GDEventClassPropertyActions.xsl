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

    <xsl:template name="eventsClassPropertyActions" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="conditionEventPosition" />
        <xsl:param name="hasParentDepartSceneCondition" />
        <xsl:param name="hasParentOnceCondition" />

        //eventsClassPropertyActions - START
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
                                    
            //Event position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
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
                <xsl:when test ="preceding::events/actions[parameters[1]/text() = current()/actions/parameters/text()]">
                    //eventsClassPropertyActions - No Preceding text=<xsl:value-of select="parameters[1]/text()" />
                    <xsl:text>&#10;</xsl:text>

                    <xsl:for-each select="conditions" >
                        <xsl:variable name="typeValue" select="type/value" />
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" >
                            <xsl:value-of select="text()" />,</xsl:for-each>
                        <xsl:if test="$typeValue = 'Timer'" >
                            <xsl:for-each select="../actions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                                <xsl:text>&#10;</xsl:text>
                                <xsl:if test="$typeValue = 'ModVarScene'" >
                                    //eventsClassPropertyActions - ModVarScene - 1
                                </xsl:if>                    
                            </xsl:for-each>                    
                        </xsl:if>
                    </xsl:for-each>
                                                                                                                        
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="conditions" >
                        <xsl:variable name="typeValue" select="type/value" />
                        //eventsClassPropertyActions - Had preceding text Condition nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" >
                            <xsl:value-of select="text()" />,</xsl:for-each>
                        <xsl:if test="$typeValue = 'Timer'" >
                            <xsl:for-each select="../actions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                                <xsl:text>&#10;</xsl:text>
                            </xsl:for-each>                    
                        </xsl:if>                
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>

            <xsl:choose>
                <xsl:when test ="$hasParentDepartSceneCondition = 'true' or conditions/type/value = 'DepartScene'">
                    <!-- DepartScene sibling/parent condition -->
                    <xsl:for-each select="actions" >
                        <xsl:variable name="typeValue" select="type/value" />
                            //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                            <xsl:text>&#10;</xsl:text>
                        <xsl:if test="$typeValue = 'ModVarScene'" >
                            //eventsClassPropertyActions - ModVarScene - 2
                            <xsl:if test="parameters[2]/text() = '='" >
                                private int <xsl:for-each select="parameters" >
                                    <xsl:value-of select="text()" />
                                    <xsl:if test="position() != last()" >
                                        <xsl:text> </xsl:text>
                                    </xsl:if>
                                    <xsl:if test="position() = last()" >;</xsl:if>
                                </xsl:for-each>
                            </xsl:if>
                        </xsl:if>                    
                        <xsl:if test="$typeValue = 'ModVarGlobal'" >
                            <xsl:if test="parameters[2]/text() = '='" >private int <xsl:for-each select="parameters" >
                                    <xsl:value-of select="text()" />
                                    <xsl:if test="position() != last()" >
                                        <xsl:text> </xsl:text>
                                    </xsl:if>
                                    <xsl:if test="position() = last()" >;</xsl:if>
                                </xsl:for-each>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="$typeValue = 'ModVarGlobalTxt'" >
                            <xsl:if test="parameters[2]/text() = '='" >private String <xsl:for-each select="parameters" >
                                    <xsl:value-of select="text()" />
                                    <xsl:if test="position() != last()" >
                                        <xsl:text> </xsl:text>
                                    </xsl:if>
                                    <xsl:if test="position() = last()" >;</xsl:if>
                                </xsl:for-each>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="$typeValue = 'UnPauseTimer'" >
                            <xsl:if test="parameters[2]/text() = '='" >private int <xsl:for-each select="parameters" >
                                    <xsl:value-of select="text()" />
                                    <xsl:if test="position() != last()" >
                                        <xsl:text> </xsl:text>
                                    </xsl:if>
                                    <xsl:if test="position() = last()" >;</xsl:if>
                                </xsl:for-each>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test ="$hasParentOnceCondition = 'true' or conditions/type/value = 'BuiltinCommonInstructions::Once'">
                    <!-- Once sibling/parent condition -->

                    <xsl:choose>
                        <xsl:when test ="not(preceding::events/actions[parameters[1]/text() = current()/actions/parameters/text()])">
                            //eventsClassPropertyActions - No Preceding text=<xsl:value-of select="parameters[1]/text()" />
                            <xsl:text>&#10;</xsl:text>
                            <xsl:for-each select="actions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                                <xsl:text>&#10;</xsl:text>
                                <xsl:if test="$typeValue = 'ModVarScene'" >
                                    //eventsClassPropertyActions - ModVarScene - 3
                                    <xsl:if test="parameters[2]/text() = '='" >
                                        private int <xsl:for-each select="parameters" >
                                            <xsl:value-of select="text()" />
                                            <xsl:if test="position() != last()" >
                                                <xsl:text> </xsl:text>
                                            </xsl:if>
                                            <xsl:if test="position() = last()" >;</xsl:if>
                                        </xsl:for-each>
                                    </xsl:if>
                                </xsl:if>                    
                                <xsl:if test="$typeValue = 'ModVarGlobal'" >
                                    <xsl:if test="parameters[2]/text() = '='" >private int <xsl:for-each select="parameters" >
                                            <xsl:value-of select="text()" />
                                            <xsl:if test="position() != last()" >
                                                <xsl:text> </xsl:text>
                                            </xsl:if>
                                            <xsl:if test="position() = last()" >;</xsl:if>
                                        </xsl:for-each>
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="$typeValue = 'ModVarGlobalTxt'" >
                                    <xsl:if test="parameters[2]/text() = '='" >private String <xsl:for-each select="parameters" >
                                            <xsl:value-of select="text()" />
                                            <xsl:if test="position() != last()" >
                                                <xsl:text> </xsl:text>
                                            </xsl:if>
                                            <xsl:if test="position() = last()" >;</xsl:if>
                                        </xsl:for-each>
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="$typeValue = 'UnPauseTimer'" >
                                    <xsl:if test="parameters[2]/text() = '='" >private int <xsl:for-each select="parameters" >
                                            <xsl:value-of select="text()" />
                                            <xsl:if test="position() != last()" >
                                                <xsl:text> </xsl:text>
                                            </xsl:if>
                                            <xsl:if test="position() = last()" >;</xsl:if>
                                        </xsl:for-each>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                    
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:for-each select="actions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                //eventsClassPropertyActions - Had Preceding Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" >
                                    <xsl:value-of select="text()" />,</xsl:for-each>
                                <xsl:text>&#10;</xsl:text>
                            </xsl:for-each>                
                        </xsl:otherwise>
                    </xsl:choose>
                
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="actions" >
                        <xsl:variable name="typeValue" select="type/value" />
                        //No Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" >
                            <xsl:value-of select="text()" />,</xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>

            <xsl:if test="conditions/type/value = 'BuiltinCommonInstructions::Once'" >
                //hasParentDepartSceneCondition=<xsl:value-of select="$hasParentDepartSceneCondition" />
                //hasParentOnceCondition=true
                <xsl:call-template name="eventsClassPropertyActions" >
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="number($totalRecursions) + 1" />
                    </xsl:with-param>
                    <xsl:with-param name="conditionEventPosition" >
                        <xsl:value-of select="$eventPosition" />
                    </xsl:with-param>                
                    <xsl:with-param name="hasParentDepartSceneCondition" >
                        <xsl:if test="$hasParentDepartSceneCondition = 'true'" >true</xsl:if>
                        <xsl:if test="$hasParentDepartSceneCondition != 'true'" >false</xsl:if>
                    </xsl:with-param>
                    <xsl:with-param name="hasParentOnceCondition" >true</xsl:with-param>
                </xsl:call-template>
            </xsl:if>
            <xsl:if test="conditions/type/value = 'DepartScene'" >
                //hasParentDepartSceneCondition=true
                //hasParentOnceCondition=<xsl:value-of select="$hasParentOnceCondition" />
                <xsl:call-template name="eventsClassPropertyActions" >
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="number($totalRecursions) + 1" />
                    </xsl:with-param>
                    <xsl:with-param name="conditionEventPosition" >
                        <xsl:value-of select="$eventPosition" />
                    </xsl:with-param>                
                    <xsl:with-param name="hasParentDepartSceneCondition" >true</xsl:with-param>
                    <xsl:with-param name="hasParentOnceCondition" >
                        <xsl:if test="$hasParentOnceCondition = 'true'" >true</xsl:if>
                        <xsl:if test="$hasParentOnceCondition != 'true'" >false</xsl:if>
                    </xsl:with-param>                
                </xsl:call-template>
            </xsl:if>

            <xsl:if test="not(conditions/type/value = 'DepartScene' and conditions/type/value = 'BuiltinCommonInstructions::Once')" >
                //hasParentDepartSceneCondition=<xsl:value-of select="$hasParentDepartSceneCondition" />
                //hasParentOnceCondition=<xsl:value-of select="$hasParentOnceCondition" />
                <xsl:call-template name="eventsClassPropertyActions" >
                    <xsl:with-param name="totalRecursions" >
                        <xsl:value-of select="number($totalRecursions) + 1" />
                    </xsl:with-param>
                    <xsl:with-param name="conditionEventPosition" >
                        <xsl:value-of select="$eventPosition" />
                    </xsl:with-param>                
                    <xsl:with-param name="hasParentDepartSceneCondition" >
                        <xsl:if test="$hasParentDepartSceneCondition = 'true'" >true</xsl:if>
                        <xsl:if test="$hasParentDepartSceneCondition != 'true'" >false</xsl:if>
                    </xsl:with-param>
                    <xsl:with-param name="hasParentOnceCondition" >
                        <xsl:if test="$hasParentOnceCondition = 'true'" >true</xsl:if>
                        <xsl:if test="$hasParentOnceCondition != 'true'" >false</xsl:if>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:if>

        </xsl:for-each>
        //eventsClassPropertyActions - END
    </xsl:template>

    <xsl:template name="externalEventsClassPropertyActions" >
        <xsl:param name="totalRecursions" />

        //externalEventsClassPropertyActions - START
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>
                <xsl:if test="$typeValue = 'ModVarScene'" >
                    //externalEventsClassPropertyActions - ModVarScene
                    <xsl:if test="substring-after(parameters[3]/text(), '.') != ''" >
                    <xsl:if test="parameters[2]/text() = '='" >
                        private double <xsl:for-each select="parameters" >
                            <xsl:value-of select="text()" />
                            <xsl:if test="position() != last()" >
                                <xsl:text> </xsl:text>
                            </xsl:if>
                            <xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    </xsl:if>
                    <xsl:if test="substring-after(parameters[3]/text(), '.') = ''" >
                    <xsl:if test="parameters[2]/text() = '='" >
                        private int <xsl:for-each select="parameters" >
                            <xsl:value-of select="text()" />
                            <xsl:if test="position() != last()" >
                                <xsl:text> </xsl:text>
                            </xsl:if>
                            <xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>

            <xsl:call-template name="externalEventsClassPropertyActions" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
        
        //externalEventsClassPropertyActions - END
    </xsl:template>

</xsl:stylesheet>

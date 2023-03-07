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

    <xsl:template name="eventsClassPropertyActions" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="conditionEventPosition" />
        <xsl:param name="hasParentDepartSceneCondition" />
        <xsl:param name="hasParentOnceCondition" />

        //eventsClassPropertyActions - START
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />

            <xsl:choose>
                <xsl:when test ="preceding::events/actions[parameters[1]/text() = current()/actions/parameters/text()]">
                    //eventsClassPropertyActions - No Preceding text=<xsl:value-of select="parameters[1]/text()" />
                    <xsl:text>&#10;</xsl:text>

                    <xsl:for-each select="conditions" >
                        <xsl:variable name="typeValue" select="type/value" />
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                        <xsl:if test="$typeValue = 'Timer'" >
                            <xsl:for-each select="../actions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                                <xsl:text>&#10;</xsl:text>
                                <xsl:if test="$typeValue = 'ModVarScene'" >
                                    //eventsClassPropertyActions - //ModVarScene - 1
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>

                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="conditions" >
                        <xsl:variable name="typeValue" select="type/value" />
                        //eventsClassPropertyActions - Had preceding text Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                        <xsl:if test="$typeValue = 'Timer'" >
                            <xsl:for-each select="../actions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
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
                            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                            <xsl:text>&#10;</xsl:text>
                        <xsl:if test="$typeValue = 'ModVarScene'" >
                            //eventsClassPropertyActions - //ModVarScene - 2
                            <xsl:if test="parameters[2]/text() = '='" >
                                public int <xsl:for-each select="parameters" >
                                    <xsl:value-of select="text()" />
                                    <xsl:if test="position() != last()" >
                                        <xsl:text> </xsl:text>
                                    </xsl:if>
                                    <xsl:if test="position() = last()" >;</xsl:if>
                                </xsl:for-each>
                                <!-- //public boolean <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />_updated<xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" > = true;</xsl:if></xsl:for-each> -->
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="$typeValue = 'ModVarGlobal'" >
                            //eventsClassPropertyActions - //ModVarGlobal
                            <xsl:if test="parameters[2]/text() = '='" >public int <xsl:for-each select="parameters" >
                                    <xsl:value-of select="text()" />
                                    <xsl:if test="position() != last()" >
                                        <xsl:text> </xsl:text>
                                    </xsl:if>
                                    <xsl:if test="position() = last()" >;</xsl:if>
                                </xsl:for-each>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="$typeValue = 'ModVarGlobalTxt'" >
                            //eventsClassPropertyActions - //ModVarGlobalTxt
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
                            <xsl:if test="parameters[2]/text() = '='" >public int <xsl:for-each select="parameters" >
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
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                                <xsl:text>&#10;</xsl:text>
                                <xsl:if test="$typeValue = 'ModVarScene'" >
                                    //eventsClassPropertyActions - //ModVarScene - 3
                                    <xsl:if test="parameters[2]/text() = '='" >
                                        public int <xsl:for-each select="parameters" >
                                            <xsl:value-of select="text()" />
                                            <xsl:if test="position() != last()" >
                                                <xsl:text> </xsl:text>
                                            </xsl:if>
                                            <xsl:if test="position() = last()" >;</xsl:if>
                                        </xsl:for-each>
                                        <!-- public boolean <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />_updated<xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" > = true;</xsl:if></xsl:for-each> -->
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="$typeValue = 'ModVarGlobal'" >
                                    //eventsClassPropertyActions - //ModVarGlobal - 2
                                    <xsl:if test="parameters[2]/text() = '='" >public int <xsl:for-each select="parameters" >
                                            <xsl:value-of select="text()" />
                                            <xsl:if test="position() != last()" >
                                                <xsl:text> </xsl:text>
                                            </xsl:if>
                                            <xsl:if test="position() = last()" >;</xsl:if>
                                        </xsl:for-each>
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="$typeValue = 'ModVarGlobalTxt'" >
                                    //eventsClassPropertyActions - //ModVarGlobalTxt - 2
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
                                    <xsl:if test="parameters[2]/text() = '='" >public int <xsl:for-each select="parameters" >
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
                                //eventsClassPropertyActions - Had Preceding Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                                <xsl:text>&#10;</xsl:text>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>

                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="actions" >
                        <xsl:variable name="typeValue" select="type/value" />
                        //No Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
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
                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>
                <xsl:if test="$typeValue = 'ModVarScene'" >
                    //externalEventsClassPropertyActions - //ModVarScene
                    <xsl:if test="substring-after(parameters[3]/text(), '.') != ''" >
                    <xsl:if test="parameters[2]/text() = '='" >
                        public double <xsl:for-each select="parameters" >
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
                        public int <xsl:for-each select="parameters" >
                            <xsl:value-of select="text()" />
                            <xsl:if test="position() != last()" >
                                <xsl:text> </xsl:text>
                            </xsl:if>
                            <xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        <!-- //public boolean <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />_updated<xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" > = true;</xsl:if></xsl:for-each> -->
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

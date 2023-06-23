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

    <xsl:template name="variablesStructuresChildren" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="parentName" />
        //children - totalRecursions=<xsl:value-of select="$totalRecursions" />
        
        <xsl:for-each select="children" >
            <xsl:if test="type = 'structure'" >
            public class GDStructure<xsl:value-of select="name" /> extends GDStructure {

            <xsl:call-template name="variablesStructuresChildren" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="parentName" ><xsl:value-of select="name" /></xsl:with-param>
            </xsl:call-template>
                 
            }
            
            public final GDStructure<xsl:value-of select="name" /><xsl:text> </xsl:text><xsl:if test="number(name) >= 0" >n</xsl:if><xsl:value-of select="name" /> = new GDStructure<xsl:value-of select="name" />();
            
            <xsl:if test="number(name) >= 0" >
            public GDStructure<xsl:value-of select="name" /> get<xsl:value-of select="$parentName" />Size() {
                return this.get<xsl:value-of select="name" />();
            }
            </xsl:if>
            
            public GDStructure<xsl:value-of select="name" /> get<xsl:value-of select="name" />() {
                return <xsl:if test="number(name) >= 0" >n</xsl:if><xsl:value-of select="name" />;
            }
            
            </xsl:if>
            
            <xsl:if test="type = 'string'" >
            //public String <xsl:value-of select="name" /> = "<xsl:value-of select="value" />";
            public int <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
            </xsl:if>            

        </xsl:for-each>

    </xsl:template>

    <xsl:template name="variablesStructures" >
        
        <xsl:for-each select="variables" >

public class GDStructure<xsl:value-of select="name" /> extends GDStructure {

    public GDStructure<xsl:value-of select="name" />() {
        Size = <xsl:for-each select="children" ><xsl:if test="type = 'structure'" >1 + </xsl:if></xsl:for-each>0;
    }

        <xsl:call-template name="variablesStructuresChildren" >
            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
            <xsl:with-param name="parentName" ><xsl:value-of select="name" /></xsl:with-param>
        </xsl:call-template>
    
}                    

        </xsl:for-each>
        
        //JSONToVariableStructure - global - START
        <xsl:call-template name="jsonObjects">
            <xsl:with-param name="iteration" >0</xsl:with-param>
        </xsl:call-template>
        //JSONToVariableStructure - global - END
    </xsl:template>

    <xsl:template name="jsonObjects">
        <xsl:param name="iteration" />
        
        <xsl:for-each select="events" >
            
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'JSONToVariableStructure'" >
        public JSONObject <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>JSONObject = null;
                </xsl:if>
            </xsl:for-each>
        
        <xsl:call-template name="jsonObjects">
            <xsl:with-param name="iteration" select="number($iteration) + 1" />
        </xsl:call-template>

        </xsl:for-each>

    </xsl:template>

    <xsl:template name="eventsClassPropertyArrayActions" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="conditionEventPosition" />
        <xsl:param name="hasParentDepartSceneCondition" />
        <xsl:param name="hasParentOnceCondition" />
        <xsl:param name="hasParentButton" />

        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />

            <xsl:variable name="hasParentButtonSibling" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'SourisSurObjet'" >found</xsl:if></xsl:for-each></xsl:variable>
            
            <xsl:choose>
                <xsl:when test ="($hasParentOnceCondition = 'true' and not(contains($hasParentButtonSibling, 'found'))) or conditions/type/value = 'BuiltinCommonInstructions::Once'">
                    <!-- Once sibling/parent condition -->

                    <xsl:choose>
                        <xsl:when test="not(preceding::events/actions[parameters[1]/text() = current()/actions/parameters/text()])">
                            //eventsClassPropertyArrayActions - No Preceding text=<xsl:value-of select="parameters[1]/text()" />
                            <xsl:text>&#10;</xsl:text>
                            <xsl:for-each select="actions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                                <xsl:text>&#10;</xsl:text>
                                <xsl:if test="$typeValue = 'ModVarScene'" >
                                    //eventsClassPropertyArrayActions - //ModVarScene - 3
                                    <xsl:if test="parameters[2]/text() = '='" >
                                        <xsl:variable name="foundArray" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1 and contains(text(), '[')" >found</xsl:if></xsl:for-each></xsl:variable>
                                        <xsl:if test="contains($foundArray, 'found')" >
                                        <xsl:for-each select="parameters" >
                                    <!--
                                    <xsl:variable name="textTurnArrayToGet" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" >[</xsl:with-param><xsl:with-param name="replacementText" >.get(</xsl:with-param></xsl:call-template></xsl:variable>
                                    <xsl:variable name="textTurnArrayToGet2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$textTurnArrayToGet" /></xsl:with-param><xsl:with-param name="find" >]</xsl:with-param><xsl:with-param name="replacementText" >)</xsl:with-param></xsl:call-template></xsl:variable>
                                    <xsl:variable name="textValue" ><xsl:value-of select="$textTurnArrayToGet2" /></xsl:variable>
                                            
                                    <xsl:variable name="rootText1" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" >[VariableString(</xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template></xsl:variable>
                                    <xsl:variable name="rootText2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$rootText1" /></xsl:with-param><xsl:with-param name="find" >.Size)]</xsl:with-param><xsl:with-param name="replacementText" >Size()</xsl:with-param></xsl:call-template></xsl:variable>
                                    <xsl:variable name="rootText" ><xsl:value-of select="$rootText2" /></xsl:variable>
                                    <xsl:value-of select="$rootText" />
                                    -->
                                    <xsl:variable name="textTurnArrayToGet" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" >[VariableString(</xsl:with-param><xsl:with-param name="replacementText" >.get</xsl:with-param></xsl:call-template></xsl:variable>
                                    <xsl:variable name="textTurnArrayToGet2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$textTurnArrayToGet" /></xsl:with-param><xsl:with-param name="find" >.Size)]</xsl:with-param><xsl:with-param name="replacementText" >Size()</xsl:with-param></xsl:call-template></xsl:variable>
                                    <xsl:variable name="textValue" ><xsl:value-of select="$textTurnArrayToGet2" /></xsl:variable>
                                    
                                            <xsl:value-of select="$textValue" />
                                            <xsl:if test="position() != last()" >
                                                <xsl:text> </xsl:text>
                                            </xsl:if>
                                            <xsl:if test="position() = last()" >;</xsl:if>
                                        </xsl:for-each>
                                        </xsl:if>
                                        <!-- public boolean <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />_updated<xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" > = true;</xsl:if></xsl:for-each> -->
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>

                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:for-each select="actions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                //eventsClassPropertyArrayActions - Had Preceding Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                                <xsl:text>&#10;</xsl:text>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>

                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="actions" >
                        <xsl:variable name="typeValue" select="type/value" />
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //No Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                        <xsl:text>&#10;</xsl:text>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>

            <xsl:if test="conditions/type/value = 'BuiltinCommonInstructions::Once'" >
                //hasParentDepartSceneCondition=<xsl:value-of select="$hasParentDepartSceneCondition" />
                //hasParentOnceCondition=true
                <xsl:call-template name="eventsClassPropertyArrayActions" >
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
                    <xsl:with-param name="hasParentButton" ><xsl:if test="not(contains($hasParentButtonSibling, 'found'))" ><xsl:value-of select="$hasParentButton" /></xsl:if><xsl:if test="contains($hasParentButtonSibling, 'found')" >true</xsl:if></xsl:with-param>
                </xsl:call-template>
            </xsl:if>
            <xsl:if test="conditions/type/value = 'DepartScene'" >
                //hasParentDepartSceneCondition=true
                //hasParentOnceCondition=<xsl:value-of select="$hasParentOnceCondition" />
                <xsl:call-template name="eventsClassPropertyArrayActions" >
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
                    <xsl:with-param name="hasParentButton" ><xsl:if test="not(contains($hasParentButtonSibling, 'found'))" ><xsl:value-of select="$hasParentButton" /></xsl:if><xsl:if test="contains($hasParentButtonSibling, 'found')" >true</xsl:if></xsl:with-param>
                </xsl:call-template>
            </xsl:if>

            <xsl:if test="not(conditions/type/value = 'DepartScene' and conditions/type/value = 'BuiltinCommonInstructions::Once')" >
                //hasParentDepartSceneCondition=<xsl:value-of select="$hasParentDepartSceneCondition" />
                //hasParentOnceCondition=<xsl:value-of select="$hasParentOnceCondition" />
                <xsl:call-template name="eventsClassPropertyArrayActions" >
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
                    <xsl:with-param name="hasParentButton" ><xsl:if test="not(contains($hasParentButtonSibling, 'found'))" ><xsl:value-of select="$hasParentButton" /></xsl:if><xsl:if test="contains($hasParentButtonSibling, 'found')" >true</xsl:if></xsl:with-param>
                </xsl:call-template>
            </xsl:if>

        </xsl:for-each>
    </xsl:template>

    <xsl:template name="eventsClassPropertyActions" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="conditionEventPosition" />
        <xsl:param name="hasParentDepartSceneCondition" />
        <xsl:param name="hasParentOnceCondition" />
        <xsl:param name="hasParentButton" />

        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
            
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />

            <xsl:variable name="hasParentButtonSibling" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'SourisSurObjet'" >found</xsl:if></xsl:for-each></xsl:variable>
                        
            <xsl:choose>
                <xsl:when test ="preceding::events/actions[parameters[1]/text() = current()/actions/parameters/text()]">
                    //eventsClassPropertyActions - No Preceding text=<xsl:value-of select="parameters[1]/text()" />
                    <xsl:text>&#10;</xsl:text>

                    <xsl:for-each select="conditions" >
                        <xsl:variable name="typeValue" select="type/value" />
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                        <xsl:if test="$typeValue = 'Timer'" >
                            <xsl:for-each select="../actions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
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
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //eventsClassPropertyActions - Had preceding text Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                        <xsl:if test="$typeValue = 'Timer'" >
                            <xsl:for-each select="../actions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
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
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
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
                            //eventsClassPropertyActions - //UnPauseTimer
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
                <xsl:when test ="($hasParentOnceCondition = 'true' and not(contains($hasParentButtonSibling, 'found'))) or conditions/type/value = 'BuiltinCommonInstructions::Once'">
                    <!-- Once sibling/parent condition -->

                    <xsl:choose>
                        <xsl:when test="not(preceding::events/actions[parameters[1]/text() = current()/actions/parameters/text()])">
                            //eventsClassPropertyActions - No Preceding text=<xsl:value-of select="parameters[1]/text()" />
                            <xsl:text>&#10;</xsl:text>
                            <xsl:for-each select="actions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                                <xsl:text>&#10;</xsl:text>
                                <xsl:if test="$typeValue = 'ModVarScene'" >
                                    //eventsClassPropertyActions - //ModVarScene - 3
                                    <xsl:if test="parameters[2]/text() = '='" >
                                        <xsl:variable name="foundArray" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1 and contains(text(), '[')" >found</xsl:if></xsl:for-each></xsl:variable>
                                        <xsl:if test="not(contains($foundArray, 'found'))" >
                                        public int <xsl:for-each select="parameters" >
                                            <xsl:value-of select="text()" />
                                            <xsl:if test="position() != last()" >
                                                <xsl:text> </xsl:text>
                                            </xsl:if>
                                            <xsl:if test="position() = last()" >;</xsl:if>
                                        </xsl:for-each>
                                        </xsl:if>
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
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                                //eventsClassPropertyActions - Had Preceding Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                                <xsl:text>&#10;</xsl:text>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>

                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="actions" >
                        <xsl:variable name="typeValue" select="type/value" />
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //No Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
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
                    <xsl:with-param name="hasParentButton" ><xsl:if test="not(contains($hasParentButtonSibling, 'found'))" ><xsl:value-of select="$hasParentButton" /></xsl:if><xsl:if test="contains($hasParentButtonSibling, 'found')" >true</xsl:if></xsl:with-param>
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
                    <xsl:with-param name="hasParentButton" ><xsl:if test="not(contains($hasParentButtonSibling, 'found'))" ><xsl:value-of select="$hasParentButton" /></xsl:if><xsl:if test="contains($hasParentButtonSibling, 'found')" >true</xsl:if></xsl:with-param>
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
                    <xsl:with-param name="hasParentButton" ><xsl:if test="not(contains($hasParentButtonSibling, 'found'))" ><xsl:value-of select="$hasParentButton" /></xsl:if><xsl:if test="contains($hasParentButtonSibling, 'found')" >true</xsl:if></xsl:with-param>
                </xsl:call-template>
            </xsl:if>

        </xsl:for-each>
    </xsl:template>

    <xsl:template name="externalEventsClassPropertyActions" >
        <xsl:param name="totalRecursions" />

        //externalEventsClassPropertyActions - START
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
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

    <xsl:template name="gdNodeToOnceList" >
        <xsl:param name="once" />
        <xsl:param name="iteration" />

        <xsl:if test="contains($once, 'found')" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Opacity'" >
                <xsl:for-each select="parameters" >
                    <xsl:if test="position() = 1" >
                        <xsl:if test="text() != ''" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:if>
                </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>

        <xsl:for-each select="events" >
            
            <xsl:variable name="once" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" >found</xsl:if></xsl:for-each></xsl:variable>

            <xsl:call-template name="gdNodeToOnceList" >
                <xsl:with-param name="iteration" ><xsl:value-of select="$iteration + 1" /></xsl:with-param>
                <xsl:with-param name="once" ><xsl:value-of select="$once" /></xsl:with-param>
            </xsl:call-template>
        
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>

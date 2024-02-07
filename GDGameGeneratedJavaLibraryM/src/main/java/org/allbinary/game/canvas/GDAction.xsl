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

    <xsl:template name="actionsWithUndefinedVariables" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="variables" />
        
        <xsl:for-each select="events" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'ModVarScene'" >
                    <xsl:variable name="parametersOne" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />,</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="not(contains($variables, $parametersOne))" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

                    <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                    <xsl:variable name="hasPriorUndefinedVariable" ><xsl:if test="//actions[type/value/text() = 'ModVarScene' and number(substring(generate-id(), 2) - 65536) &lt; $id]/parameters[1]/text() = parameters[1]/text()">found</xsl:if></xsl:variable>
<!--                    //hasPriorUndefinedVariable=<xsl:value-of select="$hasPriorUndefinedVariable" />-->
                    <xsl:if test="not(contains($hasPriorUndefinedVariable, 'found'))" >
                    //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
                    <xsl:if test="contains(parameters[3]/text(), '.') and number(parameters[3]/text())" >
                    public double <xsl:value-of select="parameters[1]/text()" /> = 0;    
                    </xsl:if>
                    <xsl:if test="not(contains(parameters[3]/text(), '.') and number(parameters[3]/text()))" >
                    public int <xsl:value-of select="parameters[1]/text()" /> = 0;    
                    </xsl:if>                    
                    <xsl:text>&#10;</xsl:text>
                    </xsl:if>

                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
            
            <xsl:call-template name="actionsWithUndefinedVariables" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="variables" >
                    <xsl:value-of select="$variables" />
                </xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="actionsWithUndefinedGlobalVariables" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="variables" />
        
        <xsl:for-each select="events" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'ModVarGlobal'" >
                    <xsl:variable name="parametersOne" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />,</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="not(contains($variables, $parametersOne))" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

                    <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                    <xsl:variable name="hasPriorUndefinedVariable" ><xsl:if test="//actions[type/value/text() = 'ModVarGlobal' and number(substring(generate-id(), 2) - 65536) &lt; $id]/parameters[1]/text() = parameters[1]/text()">found</xsl:if></xsl:variable>
<!--                    //hasPriorUndefinedVariable=<xsl:value-of select="$hasPriorUndefinedVariable" />-->
                    <xsl:if test="not(contains($hasPriorUndefinedVariable, 'found'))" >
                    //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
                    <xsl:if test="contains(parameters[3]/text(), '.') and number(parameters[3]/text())" >
                    public double <xsl:value-of select="parameters[1]/text()" /> = 0;    
                    </xsl:if>
                    <xsl:if test="not(contains(parameters[3]/text(), '.') and number(parameters[3]/text()))" >
                    public int <xsl:value-of select="parameters[1]/text()" /> = 0;    
                    </xsl:if>                    
                    <xsl:text>&#10;</xsl:text>
                    </xsl:if>

                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
            
            <xsl:call-template name="actionsWithUndefinedGlobalVariables" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="variables" >
                    <xsl:value-of select="$variables" />
                </xsl:with-param>
            </xsl:call-template>
            
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

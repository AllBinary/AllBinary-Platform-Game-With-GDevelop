<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : GDConditionUtils.xsl
    Created on : June 9, 2023, 1:55 AM
    Author     : User
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template name="generateCanvasKeyFromGDNameHack" >
        <xsl:param name="key" />
        <xsl:variable name="key2" ><xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="$key" /></xsl:with-param></xsl:call-template></xsl:variable>

        <xsl:choose>
        <xsl:when test="contains($key2, 'up')" >Canvas.UP</xsl:when>
        <xsl:when test="contains($key2, 'thrust')" >Canvas.UP</xsl:when>
        <xsl:when test="contains($key2, 'forward')" >Canvas.UP</xsl:when>
        <xsl:when test="contains($key2, 'down')" >Canvas.DOWN</xsl:when>
        <xsl:when test="contains($key2, 'left')" >Canvas.LEFT</xsl:when>
        <xsl:when test="contains($key2, 'right')" >Canvas.RIGHT</xsl:when>
        <xsl:when test="contains($key2, 'fire')" >Canvas.KEY_NUM0</xsl:when>
        <xsl:when test="contains($key2, 'shoot')" >Canvas.KEY_NUM0</xsl:when>
        <xsl:when test="contains($key2, 'secondary')" >Canvas.KEY_NUM7</xsl:when>
        <xsl:when test="contains($key2, 'return')" >Canvas.KEY_NUM0</xsl:when>
        
        <!-- these are for testing -->
        <xsl:when test="contains($key2, 'num0')" >Canvas.KEY_NUM0</xsl:when>
        <xsl:when test="contains($key2, 'num1')" >Canvas.KEY_NUM1</xsl:when>
        <xsl:when test="contains($key2, 'num2')" >Canvas.KEY_NUM2</xsl:when>
        <xsl:when test="contains($key2, 'num3')" >Canvas.KEY_NUM3</xsl:when>
        <xsl:when test="contains($key2, 'num4')" >Canvas.KEY_NUM4</xsl:when>
        <xsl:when test="contains($key2, 'num5')" >Canvas.KEY_NUM5</xsl:when>
        <xsl:when test="contains($key2, 'num6')" >Canvas.KEY_NUM6</xsl:when>
        <xsl:when test="contains($key2, 'num7')" >Canvas.KEY_NUM7</xsl:when>
        <xsl:when test="contains($key2, 'num8')" >Canvas.KEY_NUM8</xsl:when>
        <xsl:when test="contains($key2, 'num9')" >Canvas.KEY_NUM9</xsl:when>
        
        <xsl:otherwise>Canvas.UNKNOWN</xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>

    <xsl:template name="actionsProcess" >
        <xsl:param name="caller" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="parametersAsString" />

                            <xsl:for-each select=".." >
                                <xsl:variable name="hasCreate" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" >found</xsl:if></xsl:for-each></xsl:variable>
                        
                                <xsl:for-each select="actions" >
                                    <xsl:if test="type/value = 'Create'" >
                                        
                                        <xsl:variable name="nodeIdAsString" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                            //actionProcess - //createGDObject - START
                            <xsl:call-template name="createGDObject" >
                                <xsl:with-param name="layoutIndex" >
                                    <xsl:value-of select="$layoutIndex" />
                                </xsl:with-param>                         
                                <xsl:with-param name="objectsGroupsAsString" >
                                    <xsl:value-of select="$objectsGroupsAsString" />
                                </xsl:with-param>
                                <xsl:with-param name="objectsAsString" >
                                    <xsl:value-of select="$objectsAsString" />
                                </xsl:with-param>
                                <xsl:with-param name="nodeAsString" >
                                    <xsl:value-of select="$nodeIdAsString" />
                                </xsl:with-param>
                                <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //actionsProcess</xsl:with-param>
                            </xsl:call-template>
                            //actionProcess - //createGDObject - END
                                        
                            <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="typs/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                            //caller=<xsl:value-of select="$caller" /> - //hackProcessing - //Action - //Create - call
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processCreate(<xsl:value-of select="$name" />GDobject2);
                            final int index = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.size() - 1;
                                    </xsl:if>
                                </xsl:for-each>

                                <xsl:for-each select="actions" >
                                    <xsl:if test="type/value = 'Create' or type/value = 'SetBooleanVariable'" >
                                    //Skipping
                                    </xsl:if>
                                    <xsl:if test="not(type/value = 'Create' or type/value = 'SetBooleanVariable')" >
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:if test="contains($hasCreate, 'found')" >index</xsl:if>);
                                    </xsl:if>
                                </xsl:for-each>

                                <xsl:for-each select="actions" >
                                    <xsl:if test="type/value = 'Create'" >
                            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processEnd(index);
                                    </xsl:if>
                                    <xsl:if test="type/value = 'SetBooleanVariable'" >
                            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                    </xsl:if>
                                </xsl:for-each>
                                
                            </xsl:for-each>

     </xsl:template>

</xsl:stylesheet>

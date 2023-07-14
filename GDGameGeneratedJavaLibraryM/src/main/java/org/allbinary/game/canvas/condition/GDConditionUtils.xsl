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
        <xsl:otherwise>Canvas.UNKNOWN</xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>

    <xsl:template name="actionsProcess" >
        <xsl:param name="caller" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="parametersAsString" />

                            <xsl:for-each select=".." >
                                <xsl:variable name="hasCreate" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" >found</xsl:if></xsl:for-each></xsl:variable>
                        
                                <xsl:for-each select="actions" >
                                    <xsl:if test="type/value = 'Create'" >
                                        
                                        <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                            //createGDObject - SceneVariableAsBoolean - START                    
                            <xsl:call-template name="createGDObject" >
                                <xsl:with-param name="objectsAsString" ><xsl:value-of select="$objectsAsString" /></xsl:with-param>
                                <xsl:with-param name="nodeAsString" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                            </xsl:call-template>
                            //createGDObject - SceneVariableAsBoolean - END
                                        
                            <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="typs/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                            //caller=<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //Create - call
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processCreate(<xsl:value-of select="$name" />GDobject2);
                            final int index = globals.<xsl:value-of select="$name" />GDGameLayerList.size() - 1;
                                    </xsl:if>
                                </xsl:for-each>

                                <xsl:for-each select="actions" >
                                    <xsl:if test="type/value != 'Create' and type/value != 'SetSceneVariableAsBoolean'" >
                                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:if test="contains($hasCreate, 'found')" >index</xsl:if>);
                                    </xsl:if>
                                </xsl:for-each>

                                <xsl:for-each select="actions" >
                                    <xsl:if test="type/value = 'Create'" >
                            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processEnd(index);
                                    </xsl:if>
                                    <xsl:if test="type/value = 'SetSceneVariableAsBoolean'" >
                            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                    </xsl:if>
                                </xsl:for-each>
                                
                            </xsl:for-each>

     </xsl:template>

</xsl:stylesheet>

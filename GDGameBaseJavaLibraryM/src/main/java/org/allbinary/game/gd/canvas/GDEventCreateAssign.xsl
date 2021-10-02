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

    <xsl:template name="eventsCreateAssign" >
        <xsl:param name="totalRecursions" />

        //eventsCreateAssign - START
        <xsl:for-each select="events" >
            //Event <xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
            <xsl:for-each select="comment" >
                //Comment: <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="comment2" >
                <xsl:if test="string-length(text()) > 0" >
                    //Comment 2: <xsl:value-of select="text()" />
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="infiniteLoopWarning" >
                //infiniteLoopWarning <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="iterableVariableName" >
                //iterableVariableName: <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="valueIteratorVariableName" >
                //valueIteratorVariableName: <xsl:value-of select="text()" />
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
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
            </xsl:for-each>                        
            <xsl:if test="actions" >
                //repeatExpression <xsl:value-of select="repeatExpression" />
                size = <xsl:if test="not(repeatExpression)" >1</xsl:if><xsl:if test="repeatExpression" ><xsl:value-of select="repeatExpression" /></xsl:if>;
                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            </xsl:if>
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>
                <xsl:if test="$typeValue = 'UnPauseTimer'" >
                    <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="translate(text(), '&quot;', '')" />TimeDelayHelper.unPause();</xsl:if></xsl:for-each>
                </xsl:if>
                <xsl:if test="$typeValue = 'Create'" >
                    <xsl:for-each select="parameters" ><xsl:variable name="index" select="position() - 1" />
                        <xsl:if test="number($index) = 1" >
                            final GDObject <xsl:value-of select="text()" /> = <xsl:value-of select="text()" />Array[index];
                            final GDGameLayer <xsl:value-of select="text()" />GDGameLayer = <xsl:value-of select="text()" />GDGameLayerFactory.create(
                                <xsl:value-of select="text()" />
                            );                                                                                                                
                        </xsl:if>
                    </xsl:for-each>

                    <xsl:for-each select="parameters" >
                        <xsl:variable name="index" select="position() - 1" />
                        <xsl:if test="number($index) = 1" >
                            if(<xsl:value-of select="text()" />GDGameLayer != null) {
                                allBinaryGameLayerManager.append(<xsl:value-of select="text()" />GDGameLayer);
                            }
                        </xsl:if>
                    </xsl:for-each>
                    
                </xsl:if>
            </xsl:for-each>
            <xsl:if test="actions" >
                }
            </xsl:if>
            
            <xsl:call-template name="eventsCreateAssign" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
        //eventsCreateAssign - END
    </xsl:template>

</xsl:stylesheet>

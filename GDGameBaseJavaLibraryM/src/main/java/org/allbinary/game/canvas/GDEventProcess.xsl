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

    <xsl:template name="eventsProcess" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="conditionEventPosition" />
        
        //eventsProcess
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
            
            <xsl:call-template name="eventsProcess" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="conditionEventPosition" >
                    <xsl:value-of select="$eventPosition" />
                </xsl:with-param>
            </xsl:call-template>

            //Event nodeId=<xsl:value-of select="generate-id()" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
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

            //totalRecursions=<xsl:value-of select="number($totalRecursions)" /> eventPosition=<xsl:value-of select="$eventPosition" /> conditionEventPosition=<xsl:value-of select="$conditionEventPosition" />
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
    
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'Timer'" >
                    if(this.<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.isTime(GameTickTimeDelayHelperFactory.getInstance().getStartTime())) {
                    <xsl:for-each select="actions" >
                        //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        this.actionArray[<xsl:value-of select="number(substring(generate-id(), 3))" />].process();
                    </xsl:for-each>
                    }                    
                </xsl:if>
                <xsl:if test="$typeValue = 'PosX'" >
                    <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    size = <xsl:value-of select="$gdObjectName" />Array.length;
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    
                    GDObject <xsl:value-of select="$gdObjectName" /><xsl:text> = </xsl:text><xsl:value-of select="$gdObjectName" />Array[index];
                    if(<xsl:for-each select="parameters" ><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="position() = 1" >.x</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                        <xsl:for-each select=".." >
                            <xsl:call-template name="actionIdsGDObject" >
                                <xsl:with-param name="totalRecursions" >0</xsl:with-param>   
                                <xsl:with-param name="gdObjectName" ><xsl:value-of select="$gdObjectName" />Array[index]</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    }
                    
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'PosY'" >
                    <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    size = <xsl:value-of select="$gdObjectName" />Array.length;
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                    GDObject <xsl:value-of select="$gdObjectName" /><xsl:text> = </xsl:text><xsl:value-of select="$gdObjectName" />Array[index];
                    if(<xsl:for-each select="parameters" ><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="position() = 1" >.y</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                        <xsl:for-each select=".." >
                            <xsl:call-template name="actionIdsGDObject" >
                                <xsl:with-param name="totalRecursions" >0</xsl:with-param>                                
                                <xsl:with-param name="gdObjectName" ><xsl:value-of select="$gdObjectName" />Array[index]</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    }
                    
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'NbObjet'" >
                    
                    if(<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(this.gdGroupHelper.get(this.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:with-param></xsl:call-template>))</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                        <xsl:for-each select=".." >
                            <xsl:call-template name="actionIds" >
                                <xsl:with-param name="totalRecursions" >0</xsl:with-param>                                
                            </xsl:call-template>
                        </xsl:for-each>
                    }
                    
                </xsl:if>
                <xsl:if test="$typeValue = 'VarObjet'" >
                    <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    size = <xsl:value-of select="$gdObjectName" />Array.length;
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    
                    if(<xsl:for-each select="parameters" ><xsl:if test="text() = 'rotation'" >Array[index].</xsl:if><xsl:if test="position() != 1 and  text() != 'rotation'" ><xsl:text> </xsl:text></xsl:if><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="text() = '='" >=</xsl:if></xsl:for-each>) {
                        <xsl:for-each select=".." >
                            <xsl:call-template name="actionIdsGDObject" >
                                <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                <xsl:with-param name="gdObjectName" ><xsl:value-of select="$gdObjectName" />Array[index]</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    }

                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarScene'" >
                    if(<xsl:for-each select="parameters" ><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                        <xsl:for-each select=".." >
                            <xsl:call-template name="actionIds" >
                                <xsl:with-param name="totalRecursions" >0</xsl:with-param>                                
                            </xsl:call-template>
                        </xsl:for-each>
                    }
                </xsl:if>
            </xsl:for-each>

        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

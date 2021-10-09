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

    <xsl:template name="eventsCreateAssignGDObject" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="createdObjectsAsString" />

        //eventsCreateAssignGDObject - START
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
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Action nodeId=<xsl:value-of select="generate-id()" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>            
            <xsl:variable name="actionWithUsedType" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="$typeValue = 'UnPauseTimer' or $typeValue = 'SetAngle' or $typeValue = 'ChangePlan' or $typeValue = 'ChangeAnimation' or $typeValue = 'ModVarObjet'" >found</xsl:if>
                </xsl:for-each>
            </xsl:variable>

            <xsl:if test="contains($actionWithUsedType, 'found')" >

                this.actionArrayOfArrays[<xsl:value-of select="number(substring(generate-id(), 3))" />] = new GDAction() {

                    public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2) {

                        //repeatExpression <xsl:value-of select="repeatExpression" />                
                        final int size = <xsl:if test="not(repeatExpression)" >1</xsl:if><xsl:if test="repeatExpression" ><xsl:value-of select="repeatExpression" /></xsl:if>;
                <xsl:for-each select="actions" >
                    
                    <xsl:if test="not(preceding-sibling::actions[type/value/text() = 'Create'])">
                        //No preceding action with Create
                        <xsl:call-template name="objectGDObjectAtIndex" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="parametersAsString" >
                                <xsl:for-each select="parameters" ><xsl:if test="position() > 2" ><xsl:value-of select="text()" />,</xsl:if></xsl:for-each>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>                        
                                                            
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="$typeValue = 'Create'" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                <xsl:value-of select="text()" />Array = new GDObject[size];
                <xsl:value-of select="text()" />GDGameLayerList = new BasicArrayList(size);
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />

                <xsl:if test="$typeValue = 'UnPauseTimer'" >
                    <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="translate(text(), '&quot;', '')" />TimeDelayHelper.unPause();</xsl:if></xsl:for-each>
                </xsl:if>
                <xsl:if test="$typeValue = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:value-of select="text()" />Array[index] = new <xsl:value-of select="text()" />(
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() != 2" >
                            <xsl:if test="position() != last()" >
                                <xsl:if test="string-length(text()) = 0" >
                                    null
                                </xsl:if>
                                <xsl:if test="string-length(text()) > 0" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>,
                            </xsl:if>
                            <xsl:if test="position() = last()" >
                                <xsl:if test="string-length(text()) = 0" >
                                    null
                                </xsl:if>
                                <xsl:if test="string-length(text()) > 0" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>);
                </xsl:if>

                <xsl:if test="$typeValue = 'SetAngle'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index].angle</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>Array[index].<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>
                
                <xsl:if test="$typeValue = 'ChangePlan'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index].z</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeAnimation'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index].animation</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarObjet'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" ><xsl:value-of select="text()" />Array[index].</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>Array[index].<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>
                
            </xsl:for-each>
                    }
                }
            };
            </xsl:if>
                        
            <xsl:call-template name="eventsCreateAssignGDObject" >
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="createdObjectsAsString" >
                    <xsl:value-of select="$createdObjectsAsString" />
                </xsl:with-param>                        
                
            </xsl:call-template>
        </xsl:for-each>
        //eventsCreateAssignGDObject - END
        
    </xsl:template>

    <xsl:template name="paramIndexedArray" >
        <xsl:param name="createdObjectsAsString" />
        <xsl:variable name="name2" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:variable><xsl:variable name="key" >,<xsl:value-of select="$name2" />,</xsl:variable><xsl:if test="contains($createdObjectsAsString, $key)" ><xsl:value-of select="$name2" /></xsl:if>
    </xsl:template>


</xsl:stylesheet>

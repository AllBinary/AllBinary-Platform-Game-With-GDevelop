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

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template name="gameLayer" >
        <xsl:param name="name" />
        <xsl:param name="iteration" />

                                    <xsl:if test="$iteration > 1" >//iteration=<xsl:value-of select="$iteration" /> - More than 2 game layers</xsl:if>
                                    <xsl:if test="2 > $iteration" ></xsl:if>
                                    <xsl:if test="$iteration >= 1" ></xsl:if>
                                    final GDGameLayer <xsl:value-of select="$name" />GDGameLayer = ((GDGameLayer) gameLayerArray[<xsl:value-of select="$iteration" />]);
                                    GDObject <xsl:value-of select="$name" /> = null;
                                    if(<xsl:value-of select="$name" />GDGameLayer != null) {
                                        <xsl:value-of select="$name" /> = <xsl:value-of select="$name" />GDGameLayer.gdObject;
                                    } else {
                                        final String message = "eventsCreateProcessUsed - iteration=<xsl:value-of select="$iteration" /> - <xsl:value-of select="$name" /> warning: not initialized";
                                        LogUtil.put(LogFactory.getInstance(message, this, message));
                                    }

    </xsl:template>

    <xsl:template name="gameLayerList" >
        <xsl:param name="name" />

                                    final GDGameLayer <xsl:value-of select="$name" />GDGameLayer = ((GDGameLayer) globals.<xsl:value-of select="$name" />GDGameLayerList.get(index));

    </xsl:template>

    <xsl:template name="objectGDObjectAtIndex" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />

        //objectGDObjectAtIndex - START
        //objectGDObjectAtIndex - layoutIndex=<xsl:value-of select="$layoutIndex" /> parametersAsString=<xsl:value-of select="$parametersAsString" />
        <xsl:for-each select="/game">
            <xsl:for-each select="layouts" >
                <xsl:variable name="index" select="position() - 1" />
                <xsl:if test="number($index) = $layoutIndex" >

                    <xsl:variable name="names" >
                        <xsl:for-each select="objects" >
                            <xsl:variable name="typeValue" select="type" />
                            <xsl:variable name="name" ><xsl:value-of select="name" />.</xsl:variable>
                            <xsl:variable name="name_comma" ><xsl:value-of select="name" />,</xsl:variable>

                            <xsl:if test="contains($parametersAsString, $name) = text() or contains($parametersAsString, $name_comma) = text()" >
                                <xsl:if test="$typeValue = 'Sprite'" ><xsl:value-of select="name" />,</xsl:if>
                                <xsl:if test="$typeValue = 'TextObject::Text'" ><xsl:value-of select="name" />,</xsl:if>
                            </xsl:if>

                        </xsl:for-each>
                    </xsl:variable>

                    //names=<xsl:value-of select="$names" />
                    <xsl:call-template name="split" >
                        <xsl:with-param name="names" >
                            <xsl:value-of select="$names" />
                        </xsl:with-param>
                        <xsl:with-param name="iteration" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="templateName" >gameLayer</xsl:with-param>
                    </xsl:call-template>

                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        //objectGDObjectAtIndex - END

    </xsl:template>

    <xsl:template name="objectGDObjectAtIndex2" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="thisNodeArray" />
        <xsl:param name="logString" />

        //objectGDObjectAtIndex2 - layoutIndex=<xsl:value-of select="$layoutIndex" /> parametersAsString=<xsl:value-of select="$parametersAsString" />
        <xsl:for-each select="/game">
            <xsl:for-each select="layouts" >
                <xsl:variable name="index" select="position() - 1" />
                <xsl:if test="number($index) = $layoutIndex" >

                    <xsl:variable name="params" >
                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="name" ><xsl:value-of select="name" />.</xsl:variable>

                        <xsl:if test="contains($parametersAsString, $name) = text()" >
                            <xsl:if test="$typeValue = 'Sprite'" >
                        <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />,
                            </xsl:if>
                            <xsl:if test="$typeValue = 'TextObject::Text'" >
                        <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />,
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    </xsl:variable>

                    <xsl:if test="$thisNodeArray = 'globals.nodeArray[11047]'" >
                        //Hack - gdNodeList
                        final GDGameLayer gdGameLayer = ((GDGameLayer) globals.playerGDGameLayerList.get(0));
                        globals.nodeArray[11047].gameLayerArray[0] = gdGameLayer;
                        globals.nodeArray[11047].processM(globals.nodeArray[11047].gameLayerArray, null, null);
                    </xsl:if>

                    <!--
                    <xsl:if test="never" >
                        //Hackish - gdNodeList
                        final GDNode gdNode = <xsl:value-of select="$thisNodeArray" />;
                        final BasicArrayList gdNodeList = new BasicArrayList();

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="name" ><xsl:value-of select="name" />.</xsl:variable>
                        <xsl:variable name="colonName" >:<xsl:value-of select="name" />,</xsl:variable>
                        <xsl:variable name="before" select="substring-before(substring-before($parametersAsString, $name), $colonName)" />
                        <xsl:variable name="actionNodeIdFromRelatedParams" ><xsl:call-template name="after-lastIndexOf" ><xsl:with-param name="string" select="$before" /><xsl:with-param name="char" select="','" /></xsl:call-template></xsl:variable>
                        <xsl:if test="string-length($parametersAsString) > 0" >
                        //name=<xsl:value-of select="name" />
                        //before=<xsl:value-of select="$before" />
                        //actionNodeIdFromRelatedParams=<xsl:value-of select="$actionNodeIdFromRelatedParams" />
                        </xsl:if>
                        <xsl:variable name="beforeColon" select="substring-before($parametersAsString, ':')" />
                        <xsl:variable name="actionNodeId" ><xsl:if test="$actionNodeIdFromRelatedParams != ''" ><xsl:value-of select="$actionNodeIdFromRelatedParams" /></xsl:if><xsl:if test="$actionNodeIdFromRelatedParams = ''" ><xsl:value-of select="$beforeColon" /></xsl:if></xsl:variable>
                        //actionNodeId=<xsl:value-of select="$actionNodeId" />

                        <xsl:if test="contains($parametersAsString, $name) = text()" >
                            <xsl:if test="$typeValue = 'Sprite'" >
                        //objectGDObjectAtIndex2 - collide - Sprite
                        gdNodeList.add(globals.nodeArray[<xsl:value-of select="$actionNodeId" />]);
                            </xsl:if>
                            <xsl:if test="$typeValue = 'TextObject::Text'" >
                        //objectGDObjectAtIndex2 - collide - TextObject::Text
                        gdNodeList.add(globals.nodeArray[<xsl:value-of select="$actionNodeId" />]);
                            </xsl:if>
                        </xsl:if>

                    </xsl:for-each>

                        gdNodeList.add(globals.nodeArray[globals.FAKE_COLLISION_NODE_ID]);

                        //When gdNodeList size is 1 with only the 1 object above then nothing occurs
                        final GDNode node = ((GDNode) gdNodeList.get(0));
                        LogUtil.put(LogFactory.getInstance(<xsl:value-of select="$logString" /> + objectStrings.CALLING_GDNODE + node.getName(), this, commonStrings.PROCESS));
                        node.processN(gdNode, gdNodeList);
                    </xsl:if>
                    -->

                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>

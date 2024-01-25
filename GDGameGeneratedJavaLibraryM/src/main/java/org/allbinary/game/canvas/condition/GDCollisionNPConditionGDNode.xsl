<?xml version="1.0" encoding="UTF-8" ?>

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

    <xsl:output method="html" indent="yes" />

    <xsl:template name="collisionNPConditionGDNodeUsingAllBinary" >
        <xsl:param name="nodeList" />
        
<!--                  
                        //CollisionNP - //collisionNPConditionGDNodeUsingAllBinary
                        if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="$nodeList" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$nodeList" />");
                        }
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="$nodeList" />] = new GDNode(<xsl:value-of select="$nodeList" />) {
                        
                            private final String NODE_AT = "Process GDNode <xsl:value-of select="$nodeList" /> at index: ";

                            //Possibly more than 2 GameLayers.  So not all actions on group list are collisions but some are.
                            @Override
                            //public void processM(final CollidableCompositeLayer[] gameLayerArray, final GDNode gdNode, final BasicArrayList gdNodeList) { //construction
                            public void processM(final CollidableCompositeLayer[] gameLayerArray) { //construction
                                super.processMStats(gameLayerArray);

                                final int size = nodeList<xsl:value-of select="$nodeList" />.size();
                                GDNode node;
                                final int size2 = gameLayerArray.length;
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    //LogUtil.put(LogFactory.getInstance(NODE_AT + index, this, commonStrings.PROCESS));
                                    node = ((GDNode) nodeList<xsl:value-of select="$nodeList" />.get(index));
                                    //LogUtil.put(LogFactory.getInstance(objectStrings.CALLING_GDNODE + node.getName(), this, commonStrings.PROCESS));
                                    node.clear();
                                    for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                                        node.gameLayerArray[index2] = gameLayerArray[index2];
                                    }
                                    //node.processM(node.gameLayerArray, gdNode, gdNodeList);
                                    node.processM(node.gameLayerArray);
                                    node.clear2();
                                }
                                
                                super.processMStatsE(gameLayerArray);
                            }
                        };
-->

    </xsl:template>

    <xsl:template name="collisionNPConditionGDNode" >
        <xsl:param name="nodeList" />
        
        <xsl:variable name="quote" >"</xsl:variable>
        <xsl:variable name="typeValue" select="type/value" />
        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
        
                        //CollisionNP - //collisionNPConditionGDNode
                        if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="$nodeList" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$nodeList" />");
                        }
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="$nodeList" />] = new GDNode(<xsl:value-of select="$nodeList" />) {

                            <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                            //private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                                                
                            @Override
                            public boolean process() throws Exception {
                                super.processStats();
                            
                                boolean result = false;
                                //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                                
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />

                            <xsl:variable name="name2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    
                            <xsl:variable name="hasObjectGroup2" >
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:if test="name = $name2" >
                                                    found
                                                </xsl:if>
                                            </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:variable>
                            <xsl:variable name="hasObjectGroup" >
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:if test="name = $name" >
                                                    found
                                                </xsl:if>
                                            </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:variable>

                            <xsl:if test="string-length($hasObjectGroup2) > 0" >
                            //CollisionNP - objectsGroups - //<xsl:value-of select="$name2" />
                            final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDObjectListOfList.size();
                            for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index3++) {
                            //final BasicArrayList gdObjectList2 = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDObjectListOfList.get(index3));
                            final BasicArrayList gdGameLayerList2 = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerListOfList.get(index3));
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup2) = 0" >
                            //CollisionNP - //<xsl:value-of select="$name2" />
                            //final BasicArrayList gdObjectList2 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDObjectList;
                            final BasicArrayList gdGameLayerList2 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerList;
                            </xsl:if>
                    
                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            //CollisionNP - objectsGroups - //<xsl:value-of select="$name" />
                            final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.size();
                            for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index3++) {
                            //final BasicArrayList gdObjectList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.get(index3));
                            final BasicArrayList gdGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(index3));
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup) = 0" >
                            //CollisionNP - //<xsl:value-of select="$name" />
                            //final BasicArrayList gdObjectList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectList;
                            final BasicArrayList gdGameLayerList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList;
                            </xsl:if>
                                        
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                    final int <xsl:value-of select="text()" />Size = gdGameLayerList2.size();
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                    final int <xsl:value-of select="text()" />Size2 = gdGameLayerList.size();
                        </xsl:if>
                    </xsl:for-each>

                    for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />Size</xsl:if></xsl:for-each>; index2++) {
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        final GDGameLayer gameLayer2 = (GDGameLayer) gdGameLayerList2.get(index2);
                        </xsl:if>
                    </xsl:for-each>
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />Size2</xsl:if></xsl:for-each>; index++) {
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                        final GDGameLayer gameLayer = (GDGameLayer) gdGameLayerList.get(index);
                        </xsl:if>
                    </xsl:for-each>

                        if(gameLayer2.getCollidableInferface().isCollision(gameLayer)) {
                            
                            gameGlobals.gameLayer2 = gameLayer;

                            ((GDCustomGameLayer) gameLayer2).<xsl:value-of select="parameters[1]/text()" /><xsl:value-of select="parameters[2]/text()" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />ProcessGDCollision();
                            //name=<xsl:value-of select="name()" />
        
                            <xsl:if test="name() = 'subInstructions'" >
            <xsl:for-each select=".." >
            <xsl:for-each select=".." >
            <xsl:for-each select="actions" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                <xsl:text>&#10;</xsl:text>
            //Action - //<xsl:value-of select="type/value" /> - call
            //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer2, null, null);
            </xsl:for-each>
            
            <xsl:for-each select="events" >
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
            //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer2, null, null);
            </xsl:for-each>
            </xsl:for-each>
            </xsl:for-each>
                            </xsl:if>

                            <xsl:if test="not(name() = 'subInstructions')" >
            <xsl:for-each select=".." >
            <xsl:for-each select="actions" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                <xsl:text>&#10;</xsl:text>
            //Action - //<xsl:value-of select="type/value" /> - call
            //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer2, null, null);
            </xsl:for-each>
            
            <xsl:for-each select="events" >
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
            //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer2, null, null);
            </xsl:for-each>
            </xsl:for-each>
                            </xsl:if>

                            result = true;
         
                        }
                    
                    <xsl:text>&#10;</xsl:text>
                    }

                    }
                                
                    <xsl:if test="string-length($hasObjectGroup) > 0" >
                    }
                    </xsl:if>
                    <xsl:if test="string-length($hasObjectGroup2) > 0" >
                    }
                    </xsl:if>
                                super.processStatsE();
                        
                                return result;
                            }
                        };
    </xsl:template>

</xsl:stylesheet>

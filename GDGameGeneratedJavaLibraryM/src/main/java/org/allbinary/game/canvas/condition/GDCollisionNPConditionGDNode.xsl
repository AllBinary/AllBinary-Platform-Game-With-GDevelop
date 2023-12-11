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
                        if(globals.nodeArray[globals.NODE_<xsl:value-of select="$nodeList" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$nodeList" />");
                        }
                        globals.nodeArray[globals.NODE_<xsl:value-of select="$nodeList" />] = new GDNode(<xsl:value-of select="$nodeList" />) {
                        
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
                        if(globals.nodeArray[globals.NODE_<xsl:value-of select="$nodeList" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$nodeList" />");
                        }
                        globals.nodeArray[globals.NODE_<xsl:value-of select="$nodeList" />] = new GDNode(<xsl:value-of select="$nodeList" />) {

                            <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                            //private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                                                
                            @Override
                            public boolean process() throws Exception {
                                super.processStats();
                            
                                //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                                
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                    final int <xsl:value-of select="text()" />Size = globals.<xsl:value-of select="text()" />GDGameLayerList.size();
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                    final int <xsl:value-of select="text()" />Size2 = globals.<xsl:value-of select="text()" />GDGameLayerList.size();
                        </xsl:if>
                    </xsl:for-each>

                    for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />Size</xsl:if></xsl:for-each>; index2++) {
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        final GDGameLayer gameLayer2 = (GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index2);
                        </xsl:if>
                    </xsl:for-each>
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />Size2</xsl:if></xsl:for-each>; index++) {
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                        final GDGameLayer gameLayer = (GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                        </xsl:if>
                    </xsl:for-each>

                        if(gameLayer2.getCollidableInferface().isCollision(gameLayer)) {
                    
            <xsl:for-each select=".." >
            <xsl:for-each select="actions" >
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                <xsl:text>&#10;</xsl:text>
            //Action - //<xsl:value-of select="type/value" /> - call
            globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
            </xsl:for-each>
            </xsl:for-each> 
         
                        }
                    
                    <xsl:text>&#10;</xsl:text>
                    }

                    }
                                
                                super.processStatsE();
                        
                                return true;
                            }
                        };
    </xsl:template>

</xsl:stylesheet>

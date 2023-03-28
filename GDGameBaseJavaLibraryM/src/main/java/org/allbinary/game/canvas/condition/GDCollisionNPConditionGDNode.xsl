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

    <xsl:template name="collisionNPConditionGDNode" >
        <xsl:param name="nodeList" />
                        //collisionNPConditionGDNode
                        globals.nodeArray[<xsl:value-of select="$nodeList" />] = new GDNode(<xsl:value-of select="$nodeList" />) {
                        
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
    </xsl:template>

</xsl:stylesheet>

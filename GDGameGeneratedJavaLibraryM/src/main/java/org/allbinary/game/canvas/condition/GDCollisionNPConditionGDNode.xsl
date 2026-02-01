<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

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
                            public void processM(final CollidableCompositeLayer[] gameLayerArray) { //construction
                                super.processMStats(gameLayerArray);

                                final int size = nodeList<xsl:value-of select="$nodeList" />.size();
                                GDNode node;
                                final int size2 = gameLayerArray.length;
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    //logUtil.put(NODE_AT + index, this, commonStrings.PROCESS);
                                    node = ((GDNode) nodeList<xsl:value-of select="$nodeList" />.get(index));
                                    //logUtil.put(objectStrings.CALLING_GDNODE + node.getName(), this, commonStrings.PROCESS);
                                    node.clear();
                                    for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                                        node.gameLayerArray[index2] = gameLayerArray[index2];
                                    }
                                    node.processM(node.gameLayerArray);
                                    node.clear2();
                                }
                                
                                super.processMStatsE(gameLayerArray);
                            }
                        };
-->

    </xsl:template>

    <xsl:template name="collisionNPConditionGDNode" >
        <xsl:param name="forExtension" />
        <xsl:param name="nodeList" />
        
        <xsl:variable name="quote" >"</xsl:variable>
        <xsl:variable name="typeValue" select="type/value" />
        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

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

                            <xsl:variable name="text" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>        </xsl:variable>
                            <xsl:variable name="id" ><xsl:for-each select="//objectsGroups" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="//objects" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>

                        //CollisionNP - //collisionNPConditionGDNode
                        if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="$nodeList" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$nodeList" />");
                        }
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="$nodeList" />] = new GDNode(<xsl:value-of select="$nodeList" />) {

                            <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                            private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                                  
                            //CollisionNP - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                            @Override
                            public boolean process() throws Exception {
                                super.processStats();
                            
                                boolean result = false;
                                //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />

                            <xsl:if test="string-length($hasObjectGroup2) > 0" >
                            //CollisionNP - objectsGroups - //<xsl:value-of select="$name2" />
                            final int <xsl:value-of select="$name2" />Size2 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerListOfList.size();
                            for(int <xsl:value-of select="$name2" />Index2 = 0; <xsl:value-of select="$name2" />Index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> <xsl:value-of select="$name2" />Size2; <xsl:value-of select="$name2" />Index2++) {
                            //final BasicArrayList gdObjectList2 = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDObjectListOfList.get(<xsl:value-of select="$name2" />Index2));
                            final BasicArrayList gdGameLayerList2 = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerListOfList.get(<xsl:value-of select="$name2" />Index2));
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup2) = 0" >
                            //CollisionNP - //<xsl:value-of select="$name2" />
                            //final BasicArrayList gdObjectList2 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDObjectList;
                            final BasicArrayList gdGameLayerList2 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerList;
                            </xsl:if>
                    
                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            //CollisionNP - objectsGroups - //<xsl:value-of select="$name" /> - 2
                            final int <xsl:value-of select="$name" />Size3 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.size();
                            for(int <xsl:value-of select="$name" />Index3 = 0; <xsl:value-of select="$name" />Index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> <xsl:value-of select="$name" />Size3; <xsl:value-of select="$name" />Index3++) {
                            //final BasicArrayList gdObjectList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.get(<xsl:value-of select="$name" />Index3));
                            final BasicArrayList gdGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(<xsl:value-of select="$name" />Index3));
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup) = 0" >
                            //CollisionNP - //<xsl:value-of select="$name" /> - 2
                            //final BasicArrayList gdObjectList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectList;
                            final BasicArrayList gdGameLayerList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList;
                            </xsl:if>
                                        
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                    //final int <xsl:value-of select="text()" />Size = gdGameLayerList2.size();
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                    //final int <xsl:value-of select="text()" />Size2 = gdGameLayerList.size();
                        </xsl:if>
                    </xsl:for-each>

                    //for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />Size</xsl:if></xsl:for-each>; index2++) {
                    for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> gdGameLayerList2.size(); index2++) {
                    final int initialSize2 = gdGameLayerList2.size();
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        final GDGameLayer gameLayer2 = (GDGameLayer) gdGameLayerList2.get(index2);
                        </xsl:if>
                    </xsl:for-each>
                    //for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />Size2</xsl:if></xsl:for-each>; index++) {
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> gdGameLayerList.size(); index++) {
                    final int initialSize = gdGameLayerList.size();
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                        final GDGameLayer gameLayer = (GDGameLayer) gdGameLayerList.get(index);
                        </xsl:if>
                    </xsl:for-each>

                        if(<xsl:if test="$inverted = 'true'" >!</xsl:if>gameLayer2.getCollidableInferface().isCollision(gameLayer)) {

                            if(gameLayer2.isDestroyed()) {
                               logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + " Collision not allowed is already destroyed", this, commonStrings.PROCESS);
                               return result;
                            } //else {
                               //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + " TWB process collision", this, commonStrings.PROCESS);
                            //}
                        
                            //CollisionNP - <xsl:value-of select="$text" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
                            gameGlobals.tempGameLayerArray[0] = gameLayer;
                            //if(gameGlobals.tempGameLayerArray[0] != null) logUtil.put(gameGlobals.tempGameLayerArray[0].toString(), this, commonStrings.PROCESS);

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
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
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
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
            //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer2, null, null);
            </xsl:for-each>
            </xsl:for-each>
                            </xsl:if>

                            result = true;
         
                        }

                            if(initialSize <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> gdGameLayerList.size()) {
                                index--;
                            }
                                        
                    <xsl:text>&#10;</xsl:text>
                    }

                        if(initialSize2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> gdGameLayerList2.size()) {
                            index2--;
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
                            
                            @Override
                            public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2x, final Graphics graphics) throws Exception {
                    
                                super.processGDStats(gameLayer);

                                boolean result = false;
                                //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, commonStrings.PROCESS);
                                
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />

                            <xsl:if test="string-length($hasObjectGroup2) > 0" >
                            //CollisionNP - objectsGroups - //<xsl:value-of select="$name2" />
                            final int <xsl:value-of select="$name2" />Size2 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerListOfList.size();
                            for(int <xsl:value-of select="$name2" />Index2 = 0; <xsl:value-of select="$name2" />Index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> <xsl:value-of select="$name2" />Size2; <xsl:value-of select="$name2" />Index2++) {
                            //final BasicArrayList gdObjectList2 = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDObjectListOfList.get(<xsl:value-of select="$name2" />Index2));
                            final BasicArrayList gdGameLayerList2 = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerListOfList.get(<xsl:value-of select="$name2" />Index2));
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup2) = 0" >
                            //CollisionNP - //<xsl:value-of select="$name2" />
                            //final BasicArrayList gdObjectList2 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDObjectList;
                            final BasicArrayList gdGameLayerList2 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name2" />GDGameLayerList;
                            </xsl:if>
                                                            
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                    //final int <xsl:value-of select="text()" />Size = gdGameLayerList2.size();
                        </xsl:if>
                    </xsl:for-each>

                    //for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />Size</xsl:if></xsl:for-each>; index2++) {
                    for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> gdGameLayerList2.size(); index2++) {
                    final int initialSize2 = gdGameLayerList2.size();
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        final GDGameLayer gameLayer2 = (GDGameLayer) gdGameLayerList2.get(index2);
                        </xsl:if>
                    </xsl:for-each>

                        if(<xsl:if test="$inverted = 'true'" >!</xsl:if>gameLayer2.getCollidableInferface().isCollision(gameLayer)) {

                            if(gameLayer2.isDestroyed()) {
                               logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + " GD Collision not allowed is already destroyed", this, commonStrings.PROCESS);
                               return result;
                            }
                                        
                            //CollisionNP - <xsl:value-of select="$text" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
                            gameGlobals.tempGameLayerArray[0] = gameLayer;
                            //if(gameGlobals.tempGameLayerArray[0] != null) logUtil.put(gameGlobals.tempGameLayerArray[0].toString(), this, commonStrings.PROCESS);

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
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
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
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
            //gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer2, null, null);
            </xsl:for-each>
            </xsl:for-each>
                            </xsl:if>

                            result = true;
         
                        }

                        if(initialSize2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> gdGameLayerList2.size()) {
                            index2--;
                        }

                    }

                    <xsl:if test="string-length($hasObjectGroup2) > 0" >
                    }
                    </xsl:if>

                                super.processStatsE();
                        
                                return result;

                            }
                        </xsl:if>

                        <xsl:if test="contains($forExtension, 'found')" >
                        @Override
                        public boolean process(final Object[] objectArray, final int[] intArray, final long[] longArray, final float[] floatArray) {
                            
                            //Map from object array with action params
                            final GDGameLayer gameLayer = (GDGameLayer) objectArray[1];
                            this.process(gameLayer, intArray[3], intArray[5]);

                            return true;
                        }
                        </xsl:if>

                        public void process(final GDGameLayer gameLayer, final int x, final int y) {
                            final GDObject gdObject = gameLayer.gdObject;
                            this.process(gdObject, x, y);
                        }

                        public void process(final GDObject gdObject, final int x, final int y) {
                            throw new RuntimeException();
                        }
                            
                        };
    </xsl:template>

</xsl:stylesheet>

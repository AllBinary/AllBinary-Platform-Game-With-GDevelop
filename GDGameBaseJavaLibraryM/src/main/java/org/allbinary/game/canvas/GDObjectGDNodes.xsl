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
    
    <xsl:template name="hasTimerChildCondition" >
        <xsl:for-each select="events" ><xsl:call-template name="hasTimerChildCondition" /></xsl:for-each><xsl:for-each select="actions" ><xsl:call-template name="hasTimerChildCondition" /></xsl:for-each><xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" >found</xsl:if><xsl:call-template name="hasTimerChildCondition" /></xsl:for-each>
    </xsl:template>

    <xsl:template name="objectGDObjectGDNodes" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="actionTypesAsString" />
        <xsl:param name="parentEventType" />

        //objectGDObjectGNodes - layoutIndex=<xsl:value-of select="$layoutIndex" /> parametersAsString=<xsl:value-of select="$parametersAsString" />
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

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="name" ><xsl:value-of select="name" />.</xsl:variable>
                        <xsl:variable name="colonName" >:<xsl:value-of select="name" />,</xsl:variable>
                        <xsl:variable name="before" select="substring-before(substring-before($parametersAsString, $name), $colonName)" />
                        <xsl:variable name="actionNodeIdFromRelatedParams" ><xsl:call-template name="after-lastIndexOf" ><xsl:with-param name="string" select="$before" /><xsl:with-param name="char" select="','" /></xsl:call-template></xsl:variable>
                        <xsl:variable name="beforeColon" select="substring-before($parametersAsString, ':')" />
                        <xsl:variable name="actionNodeId" ><xsl:if test="$actionNodeIdFromRelatedParams != ''" ><xsl:value-of select="$actionNodeIdFromRelatedParams" /></xsl:if><xsl:if test="$actionNodeIdFromRelatedParams = ''" ><xsl:value-of select="$beforeColon" /></xsl:if></xsl:variable>
                        <xsl:if test="string-length($parametersAsString) > 0 or $actionNodeId != ''" >//objectGDObjectGDNodes - <xsl:if test="string-length($parametersAsString) > 0" >//name=<xsl:value-of select="name" /> - //typeValue=<xsl:value-of select="$typeValue" /> - //before=<xsl:value-of select="$before" /> - //actionNodeIdFromRelatedParams=<xsl:value-of select="$actionNodeIdFromRelatedParams" /></xsl:if> <xsl:if test="$actionNodeId != ''" >//actionNodeId=<xsl:value-of select="$actionNodeId" /></xsl:if></xsl:if>

                        <xsl:if test="contains($parametersAsString, $name) = text()" >
                            <xsl:if test="$typeValue = 'Sprite'" >
                        //objectGDObjectAtIndex2 - //Objects - //GDNode - //collide - //Sprite - //<xsl:value-of select="$name" />
                        if(globals.nodeArray[<xsl:value-of select="$actionNodeId" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$actionNodeId" />");
                        }
                        globals.nodeArray[<xsl:value-of select="$actionNodeId" />] = new GDNode(<xsl:value-of select="$actionNodeId" />) {

                            <xsl:variable name="thisNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />

                            private final String ACTION_PARAMETER_ID_AS_STRING_<xsl:value-of select="$actionNodeId" /> = "Parameter - <xsl:value-of select="$actionNodeId" />";
                            <xsl:text>&#10;</xsl:text>
                            
                            @Override
                            public boolean process() throws Exception {
                                super.processStats();

                                this.clear();
                                this.processM(this.gameLayerArray, null, null);
                                this.clear2();
                                
                                return true;
                            }

                            <!--
                            @Override
                            public void processN(final GDNode gdNode, final BasicArrayList gdNodeList) {
                                super.processNStats(gdNode, gdNodeList);

                                this.clear();
                                this.processM(this.gameLayerArray, gdNode, gdNodeList);
                                this.clear2();
                            }
                            -->

                            private final String ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" /> = "Collision: " + ACTION_PARAMETER_ID_AS_STRING_<xsl:value-of select="$actionNodeId" />;
                            private final String ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE = ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" /> + objectStrings.CALLING_GDNODE;

                            //objectGDObjectAtIndex2 - collide - Sprite - <xsl:value-of select="$name" /> - call
                            @Override
                            public void processM(final CollidableCompositeLayer[] gameLayerArray, final GDNode gdNode, final BasicArrayList gdNodeList) { //collide - Sprite
                                super.processMStats(gameLayerArray, gdNode, gdNodeList);

                                //LogUtil.put(LogFactory.getInstance(ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />, this, commonStrings.PROCESS));
                                
                        //if(globals.<xsl:value-of select="name" />GDGameLayerList != null) {
                        if(globals.<xsl:value-of select="name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            if(globals.<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                final int size = globals.<xsl:value-of select="name" />GDGameLayerList.size();
                                GDGameLayer gdGameLayer;
                                GDNode node;
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    //<xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />
                                    gdGameLayer = ((GDGameLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(index));
                                    <xsl:if test="string-length($params) > 0" >
                                    /*
                                        <xsl:value-of select="$params" />
                                    */
                                    final int indexOfGDNode = gdNodeList.indexOf(this) + 1;
                                    //final String <xsl:value-of select="name" /> = "<xsl:value-of select="$actionNodeId" />; indexOfGDNode: " + indexOfGDNode;
                                    //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, commonStrings.PROCESS));
                                    if(indexOfGDNode == 1) {
                                        <!-- 5179, 6129, 7079, 7856, 8256  contains($actionTypesAsString, 'AddForceAL') and not(contains($hasConditions, 'found')) and not(contains($hasParentConditions, 'found')) -->
                                        <xsl:if test="$parentEventType = 'BuiltinCommonInstructions::ForEach' and contains($actionTypesAsString, 'AddForceAL')" >
                                        //TWB Skipping <xsl:value-of select="$actionNodeId" /><xsl:text> </xsl:text><xsl:value-of select="$actionTypesAsString" />
                                        </xsl:if>
                                        <xsl:if test="not($parentEventType = 'BuiltinCommonInstructions::ForEach' and contains($actionTypesAsString, 'AddForceAL'))" >
                                        node = ((GDNode) gdNodeList.get(indexOfGDNode));
                                        //LogUtil.put(LogFactory.getInstance(ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE + node.getName(), this, commonStrings.PROCESS));
                                        node.clear();
                                        node.gameLayerArray[0] = gdGameLayer;
                                        node.processM(node.gameLayerArray, gdNode, gdNodeList);
                                        node.clear2();
                                        </xsl:if>
                                    } else if(indexOfGDNode == 2) { //1
                                        //if(gameLayer.getGroupInterface()[0] != gameLayer.getGroupInterface()[0]) {
                                            node = ((GDNode) gdNodeList.get(indexOfGDNode));
                                            //LogUtil.put(LogFactory.getInstance(ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE + node.getName(), this, commonStrings.PROCESS));
                                            node.clear();
                                            node.gameLayerArray[0] = gameLayerArray[0];
                                            node.gameLayerArray[1] = gdGameLayer;
                                            node.processM(node.gameLayerArray, gdNode, gdNodeList);
                                            node.clear2();
                                        //} else {
                                            //LogUtil.put(LogFactory.getInstance("Do not collide when the same group", this, commonStrings.PROCESS));
                                        //}
                                    }
                                    </xsl:if>
                                }
                            } else {
                                final int indexOfGDNode = gdNodeList.indexOf(this) + 1;
                                //final String <xsl:value-of select="name" /> = "<xsl:value-of select="$actionNodeId" /> <xsl:value-of select="name" /> warning: list size was 0; indexOfGDNode: " + indexOfGDNode;
                                //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, commonStrings.PROCESS));
                                if(indexOfGDNode == 1) {
                                    final GDNode node = ((GDNode) gdNodeList.get(indexOfGDNode));
                                    //LogUtil.put(LogFactory.getInstance(ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE + node.getName(), this, commonStrings.PROCESS));
                                    node.clear();
                                    node.processM(node.gameLayerArray, gdNode, gdNodeList);
                                    node.clear2();
                                } else if(indexOfGDNode == 2) { //2
                                    final GDNode node = ((GDNode) gdNodeList.get(indexOfGDNode));
                                    //LogUtil.put(LogFactory.getInstance(ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE + node.getName(), this, commonStrings.PROCESS));
                                    node.clear();
                                    node.gameLayerArray[0] = gameLayerArray[0];
                                    node.gameLayerArray[1] = gameLayerArray[1];
                                    node.processM(node.gameLayerArray, gdNode, gdNodeList);
                                    node.clear2();
                                }
                            }
                        } else {
                            final int indexOfGDNode = gdNodeList.indexOf(this) + 1;
                            //final String <xsl:value-of select="name" /> = "<xsl:value-of select="$actionNodeId" /> <xsl:value-of select="name" /> warning: was null; indexOfGDNode: " + indexOfGDNode;
                            //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, commonStrings.PROCESS));
                            if(indexOfGDNode == 1) {
                                final GDNode node = ((GDNode) gdNodeList.get(indexOfGDNode));
                                //LogUtil.put(LogFactory.getInstance(ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE + node.getName(), this, commonStrings.PROCESS));
                                node.clear();
                                node.processM(node.gameLayerArray, gdNode, gdNodeList);
                                node.clear2();
                            } else if(indexOfGDNode == 2) { //3
                                final GDNode node = ((GDNode) gdNodeList.get(indexOfGDNode));
                                //LogUtil.put(LogFactory.getInstance(ACTION_PARAMETER_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE + node.getName(), this, commonStrings.PROCESS));
                                node.clear();
                                node.gameLayerArray[0] = gameLayerArray[0];
                                node.gameLayerArray[1] = gameLayerArray[1];
                                node.processM(node.gameLayerArray, gdNode, gdNodeList);
                                node.clear2();
                            }
                        }
                        //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />.gdObject;

                                super.processMStatsE(gameLayerArray, gdNode, gdNodeList);
                            }
                        };

                            </xsl:if>
                            <xsl:if test="$typeValue = 'TextObject::Text'" >
                        //objectGDObjectAtIndex2 - //Objects - //GDNode - //collide - //TextObject::Text - //<xsl:value-of select="$name" />
                        if(globals.nodeArray[<xsl:value-of select="$actionNodeId" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$actionNodeId" />");
                        }
                        globals.nodeArray[<xsl:value-of select="$actionNodeId" />] = new GDNode(<xsl:value-of select="$actionNodeId" />) {

                            <xsl:variable name="thisNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />

                            private final String ACTION_ID_AS_STRING_<xsl:value-of select="$actionNodeId" /> = "Parameter - <xsl:value-of select="$actionNodeId" />";
                            <xsl:text>&#10;</xsl:text>
                        
                            @Override
                            public boolean process() throws Exception {
                                super.processStats();

                                this.clear();
                                this.processM(this.gameLayerArray, null, null);
                                this.clear2();
                                
                                return true;
                            }

                            <!--
                            @Override
                            public void processN(final GDNode gdNode, final BasicArrayList gdNodeList) {
                                super.processNStats(gdNode, gdNodeList);

                                this.clear();
                                this.processM(this.gameLayerArray, gdNode, gdNodeList);
                                this.clear2();
                            }
                            -->

                            private final String ACTION_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" /> = "Collision: " + ACTION_ID_AS_STRING_<xsl:value-of select="$actionNodeId" />;
                            private final String ACTION_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE = ACTION_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" /> + objectStrings.CALLING_GDNODE;

                            //objectGDObjectAtIndex2 - collide - TextObject::Text - <xsl:value-of select="$name" />
                            @Override
                            public void processM(final CollidableCompositeLayer[] gameLayerArray, final GDNode gdNode, final BasicArrayList gdNodeList) { //collide - TextObject::Text
                                super.processMStats(gameLayerArray, gdNode, gdNodeList);

                                //LogUtil.put(LogFactory.getInstance(ACTION_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />, this, commonStrings.PROCESS));
                                
                                final CollidableCompositeLayer gameLayer = gameLayerArray[0];
                                final CollidableCompositeLayer gameLayer2 = gameLayerArray[1];

                        //if(globals.<xsl:value-of select="name" />GDGameLayerList != null) {
                        if(globals.<xsl:value-of select="name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            if(globals.<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                final int size = globals.<xsl:value-of select="name" />GDGameLayerList.size();
                                GDGameLayer gdGameLayer;
                                GDNode node;
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    //globals.<xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />
                                    gdGameLayer = ((GDGameLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(index));
                                    <xsl:if test="string-length($params) > 0" >
                                    /*
                                        <xsl:value-of select="$params" />
                                    */
                                    final int indexOfGDNode = gdNodeList.indexOf(this) + 1;
                                    //final String <xsl:value-of select="name" /> = "<xsl:value-of select="$actionNodeId" />; indexOfGDNode: " + indexOfGDNode;
                                    //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, commonStrings.PROCESS));
                                    if(indexOfGDNode == 1) {
                                        node = ((GDNode) gdNodeList.get(indexOfGDNode));
                                        //LogUtil.put(LogFactory.getInstance(ACTION_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE + node.getName(), this, commonStrings.PROCESS));
                                        node.clear();
                                        node.gameLayerArray[0] = gdGameLayer;
                                        node.processM(node.gameLayerArray, gdNode, gdNodeList);
                                        node.clear2();
                                    } else if(indexOfGDNode == 2) { //4
                                        //if(gameLayer.getGroupInterface()[0] != gameLayer.getGroupInterface()[0]) {
                                            node = ((GDNode) gdNodeList.get(indexOfGDNode));
                                            //LogUtil.put(LogFactory.getInstance(ACTION_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE + node.getName(), this, commonStrings.PROCESS));
                                            node.clear();
                                            node.gameLayerArray[0] = gameLayerArray[0];
                                            node.gameLayerArray[1] = gdGameLayer;
                                            node.processM(node.gameLayerArray, gdNode, gdNodeList);
                                            node.clear2();
                                        //} else {
                                            LogUtil.put(LogFactory.getInstance("Do not collide when the same group", this, commonStrings.PROCESS));
                                        //}
                                    }
                                    </xsl:if>
                                }
                            } else {
                                final int indexOfGDNode = gdNodeList.indexOf(this) + 1;
                                final String <xsl:value-of select="name" /> = "<xsl:value-of select="$actionNodeId" /> <xsl:value-of select="name" /> warning: list size was 0: " + indexOfGDNode;
                                LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, commonStrings.PROCESS));
                            }
                        } else {
                            final int indexOfGDNode = gdNodeList.indexOf(this) + 1;
                            //final String <xsl:value-of select="name" /> = "<xsl:value-of select="$actionNodeId" /> <xsl:value-of select="name" /> warning: was null: " + indexOfGDNode;
                            //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, commonStrings.PROCESS));
                            if(indexOfGDNode == 1) {
                                final GDNode node = ((GDNode) gdNodeList.get(indexOfGDNode));
                                //LogUtil.put(LogFactory.getInstance(ACTION_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE + node.getName(), this, commonStrings.PROCESS));
                                node.clear();
                                node.processM(node.gameLayerArray, gdNode, gdNodeList);
                                node.clear2();
                            } else if(indexOfGDNode == 2) { //5
                                final GDNode node = ((GDNode) gdNodeList.get(indexOfGDNode + 1));
                                //LogUtil.put(LogFactory.getInstance(ACTION_ID_AS_STRING_COLLISION_<xsl:value-of select="$actionNodeId" />_CALLING_GDNODE + node.getName(), this, commonStrings.PROCESS));
                                node.clear();
                                node.gameLayerArray[0] = gameLayerArray[0];
                                node.gameLayerArray[1] = gameLayerArray[1];
                                node.processM(node.gameLayerArray, gdNode, gdNodeList);
                                node.clear2();
                            }
                        }
                        //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />.gdObject;

                                super.processMStatsE(gameLayerArray, gdNode, gdNodeList);
                            }
                        };

                            </xsl:if>
                        </xsl:if>

                            <!--
                            @Override
                            public void processN(final GDNode gdNode, final BasicArrayList gdNodeList) {
                                super.processNStats(gdNode, gdNodeList);

                                //if(globals.<xsl:value-of select="name" />GDGameLayerList != null) {
                                if(globals.<xsl:value-of select="name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                                    if(globals.<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                        this.clear();
                                        this.gameLayerArray[0] = (CollidableCompositeLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(0);
                                        this.processM(this.gameLayerArray, gdNode, gdNodeList);
                                        this.clear2();
                                    }
                                }
                            }
                            -->

                    </xsl:for-each>

                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="addGDNodeToOnceList" >
        <xsl:param name="iteration" />
        <xsl:param name="nodeId" />
        
        <xsl:for-each select="actions" >
            <xsl:for-each select="parameters" >
                <xsl:if test="position() = 1 and text() != ''" >
        globals.<xsl:value-of select="text()" />OnceGDNodeList.add(globals.nodeArray[<xsl:value-of select="$nodeId" />]);
                </xsl:if>
            </xsl:for-each>
            
            <!--
            <xsl:call-template name="addGDNodeToOnceList" >
                <xsl:with-param name="iteration" ><xsl:value-of select="$iteration" /></xsl:with-param>
                <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
            </xsl:call-template>
            -->
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

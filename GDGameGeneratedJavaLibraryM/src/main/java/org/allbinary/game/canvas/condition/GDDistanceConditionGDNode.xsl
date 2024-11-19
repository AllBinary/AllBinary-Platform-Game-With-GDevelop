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
    <xsl:template name="distanceConditionGDNode" >
        <xsl:param name="parametersAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        <xsl:variable name="hasOtherConditions" ><xsl:for-each select="preceding-sibling::conditions" >found</xsl:for-each></xsl:variable>
        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
                    //distanceConditionGDNode - //Condition - //Distance - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                    <xsl:variable name="param1" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="param2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="param3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="before" ><xsl:value-of select="substring-before($param3, '.')" /></xsl:variable>
                    <xsl:variable name="gdObjectName" ><xsl:call-template name="after-lastIndexOf" ><xsl:with-param name="string" ><xsl:value-of select="$before" /></xsl:with-param><xsl:with-param name="char" select="' '" /></xsl:call-template></xsl:variable>
                    
                        <xsl:variable name="hasObject" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $param1" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObjectGroup" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $param1" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObject2" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $param2" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObjectGroup2" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $param2" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        private final LayerDistanceUtil layerDistanceUtil = LayerDistanceUtil.getInstance();

                        //hasObject=<xsl:value-of select="$hasObject" />
                        //hasObjectGroup=<xsl:value-of select="$hasObjectGroup" />

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        //Distance - condition
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        <xsl:if test="contains($hasObjectGroup, 'found')" >
                            final int size3 = <xsl:call-template name="globals" >
                                <xsl:with-param name="name" >
                                    <xsl:value-of select="$param1" />
                                </xsl:with-param>
                            </xsl:call-template>.<xsl:value-of select="$param1" />GDGameLayerListOfList.size();
                            for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; index3++) {
                            final BasicArrayList gdGameLayerList = (BasicArrayList) <xsl:call-template name="globals" >
                                <xsl:with-param name="name" >
                                    <xsl:value-of select="$param1" />
                                </xsl:with-param>
                            </xsl:call-template>.<xsl:value-of select="$param1" />GDGameLayerListOfList.get(index3);
                        </xsl:if>
                        <xsl:if test="not(contains($hasObjectGroup, 'found'))" >
                            final BasicArrayList gdGameLayerList = <xsl:call-template name="globals" >
                                <xsl:with-param name="name" >
                                    <xsl:value-of select="$param1" />
                                </xsl:with-param>
                            </xsl:call-template>.<xsl:value-of select="$param1" />GDGameLayerList;
                        </xsl:if>

                        <xsl:if test="contains($hasObjectGroup2, 'found')" >
                            final int size3 = <xsl:call-template name="globals" >
                                <xsl:with-param name="name" >
                                    <xsl:value-of select="$param2" />
                                </xsl:with-param>
                            </xsl:call-template>.<xsl:value-of select="$param2" />GDGameLayerListOfList.size();
                            for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; index3++) {
                            final BasicArrayList gdGameLayerList2 = (BasicArrayList) <xsl:call-template name="globals" >
                                <xsl:with-param name="name" >
                                    <xsl:value-of select="$param2" />
                                </xsl:with-param>
                            </xsl:call-template>.<xsl:value-of select="$param2" />GDGameLayerListOfList.get(index3);
                        </xsl:if>
                        <xsl:if test="not(contains($hasObjectGroup2, 'found'))" >
                            final BasicArrayList gdGameLayerList2 = <xsl:call-template name="globals" >
                                <xsl:with-param name="name" >
                                    <xsl:value-of select="$param2" />
                                </xsl:with-param>
                            </xsl:call-template>.<xsl:value-of select="$param2" />GDGameLayerList;
                        </xsl:if>
                                        
                        //final int size = gdGameLayerList.size();
                            
                        GDGameLayer gameLayer;
                        GDGameLayer gameLayer2;
                        //for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> gdGameLayerList.size(); index++) {
                        
                        final int initialSize = gdGameLayerList.size();
                        gameLayer = (GDGameLayer) gdGameLayerList.get(index);

                        //for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                        for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> gdGameLayerList2.size(); index2++) {

                            final int initialSize2 = gdGameLayerList2.size();
                            gameLayer2 = (GDGameLayer) gdGameLayerList2.get(index2);
                            
                        <xsl:if test="contains($param3, '.') and not(contains($gdObjectName, 'Variable('))" >
                            GDObject <xsl:value-of select="$gdObjectName" /> = gameLayer.gdObject;
                        </xsl:if>
                            
                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if>(this.layerDistanceUtil.getDistance(gameLayer, gameLayer2) <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> <xsl:value-of select="$param3" />)) {

                            //LogUtil.put(LogFactory.getInstance(new StringMaker().append(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append("<xsl:if test="$inverted = 'true'" >!</xsl:if>").append(" d: ").append(this.layerDistanceUtil.getDistance(gameLayer, gameLayer2)).append(" lt ").append(<xsl:value-of select="$param3" />).toString(), this, commonStrings.PROCESS));

                        <xsl:for-each select=".." >
                        <xsl:for-each select="conditions" >
                            <xsl:if test="$nodeId != number(substring(generate-id(), 2) - 65536)" >
                            //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" />
                            gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameLayer2, null);
                            </xsl:if>
                        </xsl:for-each>
                        <xsl:if test="not(contains($hasOtherConditions, 'found'))" >
                            <xsl:for-each select="actions" >
                                <xsl:variable name="parametersAsString0" >
                                    <xsl:for-each select="actions" >
                                        <xsl:for-each select="parameters" >
                                            <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="text()" />,</xsl:for-each>
                                    </xsl:for-each>
                                </xsl:variable>
                                <xsl:variable name="parametersAsString" >
                                    <xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" />
                                </xsl:variable>
                                //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                                gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameLayer2, null);
                            </xsl:for-each>
                            <xsl:for-each select="events" >
                                <xsl:variable name="parametersAsString0" >
                                    <xsl:for-each select="actions" >
                                        <xsl:for-each select="parameters" >
                                            <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="text()" />,</xsl:for-each>
                                    </xsl:for-each>
                                </xsl:variable>
                                <xsl:variable name="parametersAsString" >
                                    <xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" />
                                </xsl:variable>
                                <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                                    //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> 
                                    //<xsl:if test="$param1" > object=<xsl:value-of select="$param1" /></xsl:if> 
                                    //disable=<xsl:value-of select="disabled" />
                                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, gameLayer2, null);
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                        </xsl:for-each>

                            }

                            if(initialSize2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> gdGameLayerList2.size()) {
                                index2--;
                            }
                            
                        }

                            if(initialSize <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> gdGameLayerList.size()) {
                                index--;
                            }

                        }

                        <xsl:if test="contains($hasObjectGroup2, 'found')" >
                            }
                        </xsl:if>
                        <xsl:if test="contains($hasObjectGroup, 'found')" >
                            }
                        </xsl:if>
                            return true;

                        }
                        
                        @Override
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                        
                            super.processGDStats(gameLayer);

                        <xsl:if test="contains($param3, '.') and not(contains($gdObjectName, 'Variable('))" >
                            GDObject <xsl:value-of select="$gdObjectName" /> = gameLayer.gdObject;
                        </xsl:if>
                            
                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if>(this.layerDistanceUtil.getDistance(gameLayer, gameLayer2) <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> <xsl:value-of select="$param3" />)) {

                                //LogUtil.put(LogFactory.getInstance(new StringMaker().append(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append("<xsl:if test="$inverted = 'true'" >!</xsl:if>").append(" d: ").append(this.layerDistanceUtil.getDistance(gameLayer, gameLayer2)).append(" lt ").append(<xsl:value-of select="$param3" />).toString(), this, commonStrings.PROCESS));

                                return true;
                            }

                            return false;
                        }

                    };

    </xsl:template>

</xsl:stylesheet>

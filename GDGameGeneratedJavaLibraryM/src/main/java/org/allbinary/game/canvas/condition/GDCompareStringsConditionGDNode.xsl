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

    <xsl:template name="compareStringsConditionGDNode" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />

        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
        
        <xsl:variable name="quote" >"</xsl:variable>
                    //compareStringsConditionGDNode - //Condition - //BuiltinCommonInstructions::CompareStrings - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        //private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="param3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="param3WithoutQuotes" ><xsl:value-of select="translate($param3, $quote, '')" /></xsl:variable>
                        <xsl:variable name="param3Updated" ><xsl:value-of select="translate(translate(translate(translate(translate($param3WithoutQuotes, '=', 'equal'), '+', 'plus'), '-', 'minus'), '*', 'multiply'), '/', 'divide')" /></xsl:variable>
                        <xsl:variable name="param3AsFinalString" >__<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$param3Updated" /></xsl:with-param></xsl:call-template></xsl:variable>

                <xsl:variable name="hasObjectGroup" >
                    <xsl:for-each select="//objectsGroups" >
                        <xsl:if test="contains($param, name)" >found</xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="objectGroupName" >
                    <xsl:for-each select="//objectsGroups" >
                        <xsl:if test="contains($param, name)" ><xsl:value-of select="name" /></xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <xsl:variable name="hasObject" >
                    <xsl:for-each select="/game/layouts" >
                        <xsl:if test="$layoutIndex = position() - 1" >
                            <xsl:for-each select="objects" >
                                <xsl:if test="contains($param, name)" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="objectName" >
                    <xsl:for-each select="/game/layouts" >
                        <xsl:if test="$layoutIndex = position() - 1" >
                            <xsl:for-each select="objects" >
                                <xsl:if test="contains($param, name)" ><xsl:value-of select="name" /></xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                //hasObjectGroup=<xsl:value-of select="$hasObjectGroup" />
                //objectGroupName=<xsl:value-of select="$objectGroupName" />
                //hasObject=<xsl:value-of select="$hasObject" />
                //objectName=<xsl:value-of select="$objectName" />

                        private final String <xsl:value-of select="$param3AsFinalString" /> = <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>;
                        
                        //BuiltinCommonInstructions::CompareStrings - condition - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                            //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

<!--   
                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                    final int size3 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$objectGroupName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$objectGroupName" />GDGameLayerListOfList.size();
                    for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; index3++) {
                    final BasicArrayList gdGameLayerList = (BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$objectGroupName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$objectGroupName" />GDGameLayerListOfList.get(index3);
                    final GDGameLayer <xsl:value-of select="$objectGroupName" />GDGameLayer = gdGameLayerList.get(0);
                    final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$objectGroupName" /> <xsl:value-of select="$objectGroupName" /> = <xsl:value-of select="$objectGroupName" />GDGameLayer.gdObject;
                    </xsl:if>
-->
                    <xsl:if test="contains($hasObject, 'found')" >
                    final BasicArrayList gdGameLayerList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$objectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$objectName" />GDGameLayerList;
                    final GDGameLayer <xsl:value-of select="$objectName" /> = (GDGameLayer) gdGameLayerList.get(0);
<!-- 
                    GDGameLayer
                    final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$objectName" /><xsl:text> </xsl:text><xsl:value-of select="$objectName" /> = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$objectName" />) <xsl:value-of select="$objectName" />GDGameLayer.gdObject;
-->
                    </xsl:if>
                                                        
                            if(<xsl:if test="$inverted = 'true'" >!</xsl:if>(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template></xsl:if><xsl:if test="position() = 2" ><xsl:if test="text() = '='" >.compareTo(<xsl:value-of select="$param3AsFinalString" />) == 0</xsl:if><xsl:if test="text() = '!='" ></xsl:if></xsl:if><xsl:text> </xsl:text></xsl:for-each>)) {
                                //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "<xsl:if test="$inverted = 'true'" >!</xsl:if>(<xsl:for-each select="parameters" ><xsl:if test="position() != 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 2" ><xsl:call-template name="replace-escaped-conditionals" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template></xsl:if><xsl:text> </xsl:text></xsl:for-each>", this, commonStrings.PROCESS);
                                return true;
                            }
                            return false;
                        }
                        
                        @Override
                        public boolean process(final int index) throws Exception {
                            super.processStats(index);

                            ////logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "index", this, commonStrings.PROCESS);

                            return this.process();
                        }

                        @Override
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                            super.processGDStats(gameLayer);

                            ////logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, commonStrings.PROCESS);

                            return this.process();
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

<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="textInputTextInputObjectSetFillColorActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        
                    <xsl:variable name="hasBuiltinCommonInstructionsForEachToProcessGD" >
                        <xsl:call-template name="hasBuiltinCommonInstructionsForEachToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>

                    <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                    <xsl:variable name="hasObjectGroup" >
                        <xsl:for-each select="//objectsGroups" >
                            <xsl:if test="name = $param" >found</xsl:if>
                        </xsl:for-each>
                    </xsl:variable>

                        //TextInput::TextInputObject::SetFillColor - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            try {

                                //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                                <xsl:if test="contains($hasBuiltinCommonInstructionsForEachToProcessGD, 'found')" >
                                    if(true) throw new RuntimeException();
                                </xsl:if>
                                <xsl:if test="not(contains($hasBuiltinCommonInstructionsForEachToProcessGD, 'found'))" >
                                
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            final int colorAsInt = basicColorUtil.get</xsl:if>
                                        <xsl:if test="position() = 2" >
                                            <xsl:if test="contains(text(), ';')" >
                                                <xsl:text>ARGB(255, </xsl:text><xsl:value-of select="translate(translate(translate(text(), '+', ''), $quote, ''), ';', ',')" />
                                            </xsl:if>
                                            <xsl:if test="not(contains(text(), ';'))" >
                                                <xsl:text>(255, </xsl:text><xsl:value-of select="text()" />
                                            </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >); //, "<xsl:value-of select="type/value" />"));</xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>

                                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                                    final int size3 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$param" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$param" />GDGameLayerListOfList.size();
                                    for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; index3++) {
                                        final BasicArrayList <xsl:value-of select="$param" />GDGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$param" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$param" />GDGameLayerListOfList.get(index3));
                                    </xsl:if>
                                    <xsl:if test="not(contains($hasObjectGroup, 'found'))" >
                                        final BasicArrayList <xsl:value-of select="$param" />GDGameLayerList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$param" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$param" />GDGameLayerList;
                                    </xsl:if>

                                        final BasicColor basicColor = smallBasicColorCacheFactory.getAndOrCreate(colorAsInt);
                                        final int size = <xsl:value-of select="$param" />GDGameLayerList.size();
                                        GDGameLayer gameLayer;
                                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                            gameLayer = (GDGameLayer) <xsl:value-of select="$param" />GDGameLayerList.get(index);
                                            gameLayer.setBasicColor(basicColor);
                                            //<xsl:value-of select="$param" />TextAnimation.setBasicColor(smallBasicColorCacheFactory.getAndOrCreate(colorAsInt));
                                        }

                                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                                    }
                                    </xsl:if>

                                    <xsl:text>&#10;</xsl:text>

                                </xsl:if>


                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }

                            return true;
                        }

                        @Override
                        public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                            super.processStats(motionGestureEvent);
                        
                            //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                        
                            return this.process();
                        }

                        @Override
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2) throws Exception {
                            this.processGDStats(gameLayer);

                            try {

                                //logUtil.putF(ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                
                                <xsl:if test="contains($hasBuiltinCommonInstructionsForEachToProcessGD, 'found')" >
                                    <xsl:variable name="objectInForEach" >
                                        <xsl:call-template name="objectBuiltinCommonInstructionsForEachToProcessGD" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    //ForEach as parent with object=<xsl:value-of select="$objectInForEach" />
                                    GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$objectInForEach" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$objectInForEach" /><xsl:text> </xsl:text><xsl:value-of select="$objectInForEach" /> = 
                                        (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$objectInForEach" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$objectInForEach" />) gameLayer.gdObject;
                                </xsl:if>

                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            final int colorAsInt = basicColorUtil.get</xsl:if>
                                        <xsl:if test="position() = 2" >
                                            <xsl:if test="contains(text(), ';')" >
                                                <xsl:text>ARGB(255, </xsl:text><xsl:value-of select="translate(translate(translate(text(), '+', ''), $quote, ''), ';', ',')" />
                                            </xsl:if>
                                            <xsl:if test="not(contains(text(), ';'))" >
                                                <xsl:text>(255, </xsl:text><xsl:value-of select="text()" />
                                            </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >); //, "<xsl:value-of select="type/value" />"));</xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>
                                    
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            
                                        final BasicColor basicColor = smallBasicColorCacheFactory.getAndOrCreate(colorAsInt);
                                        gameLayer.setBasicColor(basicColor);
                                        //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />TextAnimation.setBasicColor(smallBasicColorCacheFactory.getAndOrCreate(colorAsInt));

                                        </xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>

                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }

                            return true;
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
    </xsl:template>

</xsl:stylesheet>

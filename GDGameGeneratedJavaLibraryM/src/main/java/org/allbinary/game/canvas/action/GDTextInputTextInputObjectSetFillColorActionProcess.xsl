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

                    <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="param2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
        <xsl:variable name="siblingOrParentOrList" ><xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param><xsl:with-param name="includeList" >found</xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList0" ><xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param><xsl:with-param name="includeList" >found</xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList0" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>final GDGameLayer </xsl:text><xsl:value-of select="$name" /><xsl:text>GDGameLayer = </xsl:text></xsl:with-param><xsl:with-param name="replacementText" >//final GDGameLayer <xsl:value-of select="$name" />GDGameLayer = </xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList3" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList2" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>if(</xsl:text><xsl:value-of select="$name" /><xsl:text>GDGameLayerList</xsl:text></xsl:with-param><xsl:with-param name="replacementText" >//if(<xsl:value-of select="$name" />GDGameLayerList</xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrList4" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList3" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>final GD</xsl:text>GlobalsGDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /><xsl:text> = (GDGlobalsGDObjectsFactory.</xsl:text><xsl:value-of select="$name" /><xsl:text></xsl:text>) <xsl:value-of select="$name" /><xsl:text></xsl:text>GDGameLayer.gdObject;</xsl:with-param><xsl:with-param name="replacementText" >//final GDGlobalsGDObjectsFactory.<xsl:value-of select="$name" /> <xsl:value-of select="$name" /> = (GDGlobalsGDObjectsFactory.<xsl:value-of select="$name" />) <xsl:value-of select="$name" />GDGameLayer.gdObject;</xsl:with-param></xsl:call-template></xsl:variable>
        <xsl:variable name="siblingOrParentOrListOnlyListForTheMainParamIncludeList" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$siblingOrParentOrList4" /></xsl:with-param><xsl:with-param name="find" ><xsl:text>final GD</xsl:text><xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /><xsl:text> = (GD</xsl:text><xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text></xsl:text>) <xsl:value-of select="$name" /><xsl:text></xsl:text>GDGameLayer.gdObject;</xsl:with-param><xsl:with-param name="replacementText" >//final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /> = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$name" />)<xsl:text> </xsl:text><xsl:value-of select="$name" />GDGameLayer.gdObject;</xsl:with-param></xsl:call-template></xsl:variable>

                    <xsl:variable name="hasObjectGroup" >
                        <xsl:for-each select="//objectsGroups" >
                            <xsl:if test="name = $param" >found</xsl:if>
                        </xsl:for-each>
                    </xsl:variable>

                                    <!-- if the color is from more than 1 variable this will break -->
                                    <xsl:variable name="variableName" ><xsl:for-each select="//variables" ><xsl:if test="contains($param2, name)" ><xsl:value-of select="name" /></xsl:if></xsl:for-each></xsl:variable>
                                    <xsl:variable name="globalWithVariableName" >globals.<xsl:value-of select="$variableName" /></xsl:variable>
                                    //variableName=<xsl:value-of select="$variableName" /> globalWithVariableName=<xsl:value-of select="$globalWithVariableName" />
                                    
                                    <xsl:variable name="param2b" >
                                        <xsl:if test="string-length($variableName) > 0" >
                                            <xsl:call-template name="string-replace-all" >
                                                <xsl:with-param name="text" ><xsl:value-of select="$param2" /></xsl:with-param>
                                                <xsl:with-param name="find" ><xsl:value-of select="$variableName" /></xsl:with-param>
                                                <xsl:with-param name="replacementText" ><xsl:value-of select="$globalWithVariableName" /></xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="string-length($variableName) = 0" ><xsl:value-of select="$param2" /></xsl:if>
                                    </xsl:variable>
                                    
                                    <xsl:variable name="color" >
                                        <xsl:if test="contains($param2, ';')" ><xsl:text>ARGB(255, </xsl:text><xsl:value-of select="translate(translate(translate($param2b, '+', ''), $quote, ''), ';', ',')" /></xsl:if>
                                        <xsl:if test="not(contains($param2, ';'))" ><xsl:text>(255, </xsl:text><xsl:value-of select="text()" /></xsl:if>
                                    </xsl:variable>                                

                        //TextInput::TextInputObject::SetFillColor - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            try {

                                //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                                    
                                final int colorAsInt = basicColorUtil.get<xsl:value-of select="$color" />);
                                <xsl:text>&#10;</xsl:text>

                                final GDGameLayer[] gameLayerArray = gameGlobals.tempGameLayerArray;
                                <xsl:value-of select="$siblingOrParentOrListOnlyListForTheMainParamIncludeList" />
                                <xsl:text>&#10;</xsl:text>

                                        final BasicColor basicColor = smallBasicColorCacheFactory.getAndOrCreate(colorAsInt);
                                        final int size = <xsl:value-of select="$param" />GDGameLayerList.size();
                                        GDGameLayer <xsl:value-of select="$param" />GDGameLayer;
                                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                            <xsl:value-of select="$param" />GDGameLayer = (GDGameLayer) <xsl:value-of select="$param" />GDGameLayerList.get(index);
                                            <xsl:value-of select="$param" />GDGameLayer.setBackgroundBasicColor(basicColor);
                                            //<xsl:value-of select="$param" />TextAnimation.setBasicColor(smallBasicColorCacheFactory.getAndOrCreate(colorAsInt));
                                        }
              
                                <xsl:if test="contains($hasObjectGroup, 'found')" >
                                }
                                </xsl:if>
<!--                                <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /><xsl:with-param name="includeList" >found</xsl:with-param></xsl:with-param></xsl:call-template>-->

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
                    public boolean processGD(final GDGameLayer[] gameLayerArray) throws Exception {
                        super.processGDStats(gameLayerArray);
                        try {
                     
                            <xsl:value-of select="$siblingOrParentOrList" />
                            <xsl:text>&#10;</xsl:text>

                            final int colorAsInt = basicColorUtil.get<xsl:value-of select="$color" />);
                            <xsl:text>&#10;</xsl:text>
                                                
                            final BasicColor basicColor = smallBasicColorCacheFactory.getAndOrCreate(colorAsInt);
                            <xsl:value-of select="$param" />GDGameLayer.setBackgroundBasicColor(basicColor);
              
                            <xsl:if test="contains($hasObjectGroup, 'found')" >
                            }
                            </xsl:if>
<!--                        <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param><xsl:with-param name="includeList" >found</xsl:with-param></xsl:call-template>-->

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

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

    <xsl:template name="primitiveDrawingFillColorActionProcess" >
       <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>        
        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        
                    //PrimitiveDrawing::FillColor - START
                        <xsl:variable name="param2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($param2, '.')" >
                            //Skipping variable usage for fill color
                        </xsl:if>
                        <xsl:if test="not(contains($param2, '.'))" >
                            public BasicColor RGB_<xsl:value-of select="translate(translate($param2, '\&quot;', ''), ';', '_')" />_BASIC_COLOR = smallBasicColorCacheFactory.getAndOrCreate(
                                basicColorUtil.getARGB(255, 
                                <xsl:value-of select="translate(translate($param2, '\&quot;', ''), ';', ',')" />)
                                );
                                //"RGB_<xsl:value-of select="translate(translate($param2, '\&quot;', ''), ';', '_')" />_BASIC_COLOR"
                        </xsl:if>
                    //PrimitiveDrawing::FillColor - END              
        
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
        
                    //PrimitiveDrawing::FillColor - action - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                        return true;
                    }

                    @Override
                    public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                        super.processStats(motionGestureEvent);
                        
                        //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                        
                        return this.process();
                    }


                        <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="addGlobalsForVariables" ><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:variable name="beforeSecondParam" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>

                        <xsl:variable name="hasObject" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
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

                        <xsl:variable name="firstOrBeforeFourthParam" >
                            <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup, 'found')" >
                                <xsl:value-of select="$beforeSecondParam" />
                            </xsl:if>
                            <xsl:if test="not(contains($hasObject, 'found') or contains($hasObjectGroup, 'found'))" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                        </xsl:variable>
                        //firstOrBeforeFourthParam=<xsl:value-of select="$firstOrBeforeFourthParam" />
                        //firstParam=<xsl:value-of select="$name" />

                    @Override      
                    public boolean processGD(final GDGameLayer[] gameLayerArray) throws Exception {
                        super.processGDStats(gameLayerArray);
                        try {
                     
                        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
                        <xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                        <xsl:if test="contains($param2b, '.')" >
                            BasicColor RGB_BASIC_COLOR = smallBasicColorCacheFactory.getAndOrCreate(
                                basicColorUtil.getARGB(255, 
                                <xsl:value-of select="translate(translate(translate($param2b, '+', ''), '\&quot;', ''), ';', ',')" />)
                                );
                        </xsl:if>
                                                
                            ((GDRectOnlyPrimitiveDrawing) <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>GDGameLayer.primitiveDrawing).addFillColor(
                            
                        <xsl:if test="contains($param2, '.')" >
                            RGB_BASIC_COLOR
                        </xsl:if>
                        <xsl:if test="not(contains($param2, '.'))" >
                            this.RGB_<xsl:value-of select="translate(translate($param2, '\&quot;', ''), ';', '_')" />_BASIC_COLOR
                        </xsl:if>

                                );

                        <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

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

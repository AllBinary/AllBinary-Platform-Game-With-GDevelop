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


                        <xsl:variable name="param" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >
                                    <xsl:if test="not(contains(text(), 'SceneInstancesCount('))" >
                                        <xsl:value-of select="text()" />
                                    </xsl:if>
                                    <xsl:if test="contains(text(), 'SceneInstancesCount(')" >
                                        <xsl:variable name="objectName" >
                                            <xsl:value-of select="substring-before(substring-after(text(), 'SceneInstancesCount('), ')')" />
                                        </xsl:variable>
                                        <xsl:call-template name="string-replace-all" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="text()" />
                                            </xsl:with-param>
                                            <xsl:with-param name="find" >SceneInstancesCount(<xsl:value-of select="$objectName" /></xsl:with-param>
                                            <xsl:with-param name="replacementText" >SceneInstancesCount(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$objectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$objectName" />GDGameLayerList.size()</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

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

                    <xsl:variable name="hasForEachProcessGD" >
                        <xsl:call-template name="hasBuiltinCommonInstructionsForEachToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasCollisionProcessGD" >
                        <xsl:call-template name="hasCollisionProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasDistanceProcessGD" >
                        <xsl:call-template name="hasDistanceProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                        <xsl:call-template name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasCreateProcessGD" >
                        <xsl:call-template name="hasCreateProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    
                    /*hasCreateProcessGD=<xsl:value-of select="$hasCreateProcessGD" /> hasForEachProcessGD=<xsl:value-of select="$hasForEachProcessGD" /> hasCollisionProcessGD=<xsl:value-of select="$hasCollisionProcessGD" /> hasDistanceProcessGD=<xsl:value-of select="$hasDistanceProcessGD" /> hasLinkedObjectsPickObjectsLinkedToProcessGD=<xsl:value-of select="$hasLinkedObjectsPickObjectsLinkedToProcessGD" />*/

                    <xsl:call-template name="parentSelectionNodeProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        <xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param>
                        <xsl:with-param name="secondGameLayer" ><xsl:value-of select="$firstOrBeforeFourthParam" /></xsl:with-param>
                        <xsl:with-param name="secondGameLayer2" ><xsl:value-of select="$name" /></xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="contains($hasCreateProcessGD, 'found')" >
                        //From parent BuiltinCommonInstructions::Standard with Create/CreateByName
                        //firstOrBeforeFourthParam=<xsl:value-of select="$firstOrBeforeFourthParam" />
                        @Override
                        public boolean processGD(final GDGameLayer <xsl:value-of select="$name" />GDGameLayer, final GDGameLayer gdGameLayer) throws Exception {

                            super.processGDStats(<xsl:value-of select="$name" />GDGameLayer);
                    </xsl:if>
                    <xsl:if test="contains($hasCollisionProcessGD, 'found')" >
                        <xsl:variable name="collisionProcessGDParamOne" ><xsl:call-template name="collisionProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="collisionProcessGDParamTwo" ><xsl:call-template name="collisionProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                        super.processGDStats(<xsl:value-of select="$collisionProcessGDParamOne" />GDGameLayer);
                        
                        <xsl:if test="$name != $collisionProcessGDParamOne and $name != $collisionProcessGDParamTwo" >
                        //From objectsGroup to object
                        GDGameLayer <xsl:value-of select="$name" />GDGameLayer = <xsl:value-of select="$collisionProcessGDParamOne" />GDGameLayer;
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >
                        <xsl:variable name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" ><xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template></xsl:variable>
                        super.processGDStats(<xsl:value-of select="$linkedObjectsPickObjectsLinkedToProcessGDParamOne" />GDGameLayer);
                        
                        <xsl:if test="$name != $linkedObjectsPickObjectsLinkedToProcessGDParamOne and $name != $linkedObjectsPickObjectsLinkedToProcessGDParamTwo" >
                        //From objectsGroup to object
                        GDGameLayer <xsl:value-of select="$name" />GDGameLayer = <xsl:value-of select="$linkedObjectsPickObjectsLinkedToProcessGDParamOne" />GDGameLayer;
                        </xsl:if>
                        
                    </xsl:if>
                    <xsl:variable name="hasKnownParamsFromParent" ><xsl:if test="contains($hasForEachProcessGD, 'found') or contains($hasCollisionProcessGD, 'found') or contains($hasDistanceProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >found</xsl:if></xsl:variable>
                    <xsl:if test="not(contains($hasCreateProcessGD, 'found') or contains($hasKnownParamsFromParent, 'found'))" >

                        <xsl:variable name="hasSiblingActionWithObjectsGroupsOrObject" >
                            <xsl:for-each select=".." >
                                <xsl:for-each select="actions" >
                                    <xsl:if test="type/value = 'Create' and type/value != 'CreateByName'" >found</xsl:if>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:variable>                        

                        <xsl:if test="contains($hasSiblingActionWithObjectsGroupsOrObject, 'found')" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //Sibling - //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //PrimitiveDrawing::FillColor - From sibling action
                    public boolean processGD(final GDGameLayer <xsl:value-of select="$name" />GDGameLayer, final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer) throws Exception {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasSiblingActionWithObjectsGroupsOrObject, 'found') or contains($hasKnownParamsFromParent, 'found'))" >
                    //PrimitiveDrawing::FillColor - //Not from parent
                    public boolean processGD(final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final GDGameLayer gameLayer2) throws Exception {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                        
                        //logUtil.putF(ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                        
                        </xsl:if>
                        
                    </xsl:if>

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

                        return true;                   
                    }

                    @Override      
                    public boolean processGD(final GDGameLayer[] gameLayerArray) throws Exception {
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

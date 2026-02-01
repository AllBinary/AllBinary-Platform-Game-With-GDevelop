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

    <xsl:template name="setObjectVariableAsBooleanActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        
        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        
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
                        //param=<xsl:value-of select="$param" />

                        <xsl:variable name="beforeSecondParam0" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>
                        //beforeSecondParam0=<xsl:value-of select="$beforeSecondParam0" />
                        <xsl:variable name="beforeSecondParam" ><xsl:if test="contains($beforeSecondParam0, '-')" ><xsl:value-of select="substring-after($beforeSecondParam0, '-')" /></xsl:if><xsl:if test="not(contains($beforeSecondParam0, '-'))" ><xsl:value-of select="$beforeSecondParam0" /></xsl:if><xsl:if test="not(string-length($beforeSecondParam0))" ><xsl:value-of select="$param" /></xsl:if></xsl:variable>
                        <xsl:variable name="beforeSecondParam2" ><xsl:if test="contains($beforeSecondParam0, '-')" >-</xsl:if></xsl:variable>
                        
                        <xsl:variable name="gdObjectFactory2" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$beforeSecondParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeSecondParam" /></xsl:variable>

                        //beforeSecondParam=<xsl:value-of select="$beforeSecondParam" />
                        //beforeSecondParam2=<xsl:value-of select="$beforeSecondParam2" />

                        <xsl:variable name="hasObject" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObjectGroup" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
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
                
                    <xsl:variable name="paramOneNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="secondParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
<!--                    <xsl:variable name="paramTwoName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="paramTwoNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>-->
                    
<!--                    <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$paramTwoNameObjectsGroups" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$paramTwoNameObjectsGroups" /></xsl:variable>-->

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
                    
                    /*hasForEachProcessGD=<xsl:value-of select="$hasForEachProcessGD" /> hasCollisionProcessGD=<xsl:value-of select="$hasCollisionProcessGD" /> hasDistanceProcessGD=<xsl:value-of select="$hasDistanceProcessGD" /> hasLinkedObjectsPickObjectsLinkedToProcessGD=<xsl:value-of select="$hasLinkedObjectsPickObjectsLinkedToProcessGD" />*/
                
                        //SetBooleanObjectVariable was //SetObjectVariableAsBoolean - action - START - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                        <xsl:if test="contains($hasObjectGroup, 'found')" >
                            final int size3 = <xsl:call-template name="globals" >
                                <xsl:with-param name="name" >
                                    <xsl:value-of select="$param" />
                                </xsl:with-param>
                            </xsl:call-template>.<xsl:value-of select="$param" />GDGameLayerListOfList.size();
                            for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; index3++) {
                            final BasicArrayList gdGameLayerList = (BasicArrayList) <xsl:call-template name="globals" >
                                <xsl:with-param name="name" >
                                    <xsl:value-of select="$param" />
                                </xsl:with-param>
                            </xsl:call-template>.<xsl:value-of select="$param" />GDGameLayerListOfList.get(index3);
                        </xsl:if>
                        <xsl:if test="not(contains($hasObjectGroup, 'found'))" >
                            final BasicArrayList gdGameLayerList = <xsl:call-template name="globals" >
                                <xsl:with-param name="name" >
                                    <xsl:value-of select="$param" />
                                </xsl:with-param>
                            </xsl:call-template>.<xsl:value-of select="$param" />GDGameLayerList;
                        </xsl:if>
                            
                            final int size = gdGameLayerList.size();
                            GDGameLayer <xsl:value-of select="$param" />GDGameLayer;
                            GDObject <xsl:value-of select="$param" />;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                                <xsl:value-of select="$param" />GDGameLayer = (GDGameLayer) gdGameLayerList.get(index);
                                this.processGD2(<xsl:value-of select="$param" /><xsl:text>GDGameLayer</xsl:text>, null, null);
                            }

                        <xsl:if test="contains($hasObjectGroup, 'found')" >
                            }
                        </xsl:if>
                                                        
                            return true;
                        }
                        
                        @Override
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                            super.processGDStats(gameLayer);
                            
                        <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$param" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$param" /></xsl:variable>

                        <xsl:if test="contains($hasForEachProcessGD, 'found')" >
                        <xsl:variable name="forEachGDParamOne" ><xsl:call-template name="forEachGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param><xsl:with-param name="secondGameLayer" ><xsl:value-of select="$param" /></xsl:with-param></xsl:call-template></xsl:variable>
                        //forEachGDParamOne=<xsl:value-of select="$forEachGDParamOne" /><xsl:text>&#10;</xsl:text>
                        <xsl:if test='$param = $forEachGDParamOne' >
                            final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$param" /><xsl:text> = </xsl:text>(<xsl:value-of select="$gdObjectFactory" />) gameLayer.gdObject;
                            <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) <xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 2" >).<xsl:value-of select="text()" /></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="string-length(text()) = 0" > = false;</xsl:if><xsl:if test="string-length(text()) > 0" > = <xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>;</xsl:if></xsl:if></xsl:for-each>
                        </xsl:if>
                        <xsl:if test='$param != $forEachGDParamOne' >
                            this.process();
                        </xsl:if>
                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasForEachProcessGD, 'found'))" >
                            final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$param" /><xsl:text> = </xsl:text>(<xsl:value-of select="$gdObjectFactory" />) gameLayer.gdObject;
                            <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) <xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 2" >).<xsl:value-of select="text()" /></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="string-length(text()) = 0" > = false;</xsl:if><xsl:if test="string-length(text()) > 0" > = <xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>;</xsl:if></xsl:if></xsl:for-each>
                        </xsl:if>                            

                            return true;
                        }
                        
                        public boolean processGD2(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                            super.processGDStats(gameLayer);

                            final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$param" /><xsl:text> = </xsl:text>(<xsl:value-of select="$gdObjectFactory" />) gameLayer.gdObject;
                            <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) <xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 2" >).<xsl:value-of select="text()" /></xsl:if></xsl:for-each><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="string-length(text()) = 0" > = false;</xsl:if><xsl:if test="string-length(text()) > 0" > = <xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>;</xsl:if></xsl:if></xsl:for-each>

                            return true;
                        }
                        
                        //SetObjectVariableAsBoolean - action - END
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

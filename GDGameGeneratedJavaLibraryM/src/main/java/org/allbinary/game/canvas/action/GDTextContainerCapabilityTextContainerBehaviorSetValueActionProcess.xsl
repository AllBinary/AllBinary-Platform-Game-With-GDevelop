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

    <xsl:template name="textContainerCapabilityTextContainerBehaviorSetValueActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 4" >
                                    <xsl:if test="contains(text(), '&quot;') and not(contains(text(), '+')) and text() != '&quot;&quot;'" >
                                        //GDStringLiteral
                                        private final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(translate(translate(text(), '?', '_'), '&quot;', ' '), ' ', '_')" /></xsl:with-param></xsl:call-template> = <xsl:value-of select="text()" />;
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                
                        //TextContainerCapability::TextContainerBehavior::SetValue - action - START - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                            //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="$nodeId" />, this, commonStrings.PROCESS);

                        <xsl:variable name="param4" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 4" >
                                    <xsl:if test="not(contains(text(), 'SceneInstancesCount(') or contains(text(), 'ToString('))" >
                                        <xsl:value-of select="text()" />
                                    </xsl:if>
                                    <xsl:if test="contains(text(), 'ToString(')" >
                                        <xsl:variable name="objectName" >
                                            <xsl:value-of select="substring-before(substring-after(text(), 'ToString('), ')')" />
                                        </xsl:variable>
                                        <xsl:value-of select="$objectName" />
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

                        <xsl:variable name="beforeSecondParam" ><xsl:value-of select="substring-before($param4, '.')" /></xsl:variable>

                        <xsl:variable name="hasObject3" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObjectGroup3" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        //param4=<xsl:value-of select="$param4" />
                        <xsl:if test="contains($hasObject3, 'found') or contains($hasObjectGroup3, 'found')" >
                        //beforeSecondParam=<xsl:value-of select="$beforeSecondParam" />
                        </xsl:if>
                        
                        <xsl:if test="contains($hasObjectGroup3, 'found') or contains($hasObject3, 'found')" >
                            <xsl:variable name="gameLayerName" ><xsl:value-of select="$beforeSecondParam" /></xsl:variable>

                                <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gameLayerName" /></xsl:variable>

                                <xsl:if test="contains($hasObjectGroup3, 'found')" >
                                    final BasicArrayList gdGameLayerList = (BasicArrayList) <xsl:call-template name="globals" >
                                        <xsl:with-param name="name" >
                                            <xsl:value-of select="$gameLayerName" />
                                        </xsl:with-param>
                                    </xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerListOfList.get(0);
                                    final GDGameLayer <xsl:value-of select="$gameLayerName" />GDGameLayer = (GDGameLayer) gdGameLayerList.get(0);
                                </xsl:if>
                                       
                                <xsl:if test="not(contains($hasObjectGroup3, 'found'))" >
                                    final GDGameLayer <xsl:value-of select="$gameLayerName" />GDGameLayer = (GDGameLayer) <xsl:call-template name="globals" >
                                        <xsl:with-param name="name" >
                                            <xsl:value-of select="$gameLayerName" />
                                        </xsl:with-param>
                                    </xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(0);
                                </xsl:if>
                                
                                    final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$gameLayerName" /> = (<xsl:value-of select="$gdObjectFactory" />)<xsl:text> </xsl:text><xsl:value-of select="$gameLayerName" />GDGameLayer.gdObject;
                                
                        </xsl:if>                                
                            
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >
                            final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size();
                            GDGameLayer gameLayer;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                gameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index);

                                </xsl:if>
                                <xsl:if test="position() = 3" >
                                    //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="$nodeId" />, this, commonStrings.PROCESS);
                                    <xsl:if test="text() = '='" >gameLayer.setText(</xsl:if>
                                </xsl:if>
                                <xsl:if test="position() = 4" >
                                    <xsl:if test="text() = '&quot;&quot;'" >stringUtil.EMPTY_STRING</xsl:if>
                                    <xsl:if test="text() != '&quot;&quot;'" >
                                        <xsl:if test="contains(text(), '&quot;') and not(contains(text(), '+'))" >
                                            <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(translate(translate(text(), '?', '_'), '&quot;', ' '), ' ', '_')" /></xsl:with-param></xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="not(contains(text(), '&quot;') and not(contains(text(), '+')))" >
<!--                                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template><xsl:call-template name="isGlobalsSep" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template><xsl:value-of select="text()" />-->
                                            <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="position() = last()" >);
                            }</xsl:if>
                            </xsl:for-each>
                            
                            return true;
                        }

                        @Override
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                            super.processGDStats(gameLayer);
                        
                            //logUtil.put(ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                            
                        <xsl:if test="contains($hasObjectGroup3, 'found') or contains($hasObject3, 'found')" >
                            <xsl:variable name="gameLayerName" ><xsl:value-of select="$beforeSecondParam" /></xsl:variable>

                                <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gameLayerName" /></xsl:variable>

                                <xsl:if test="contains($hasObjectGroup3, 'found')" >
                                    final BasicArrayList gdGameLayerList = (BasicArrayList) <xsl:call-template name="globals" >
                                        <xsl:with-param name="name" >
                                            <xsl:value-of select="$gameLayerName" />
                                        </xsl:with-param>
                                    </xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerListOfList.get(0);
                                    final GDGameLayer <xsl:value-of select="$gameLayerName" />GDGameLayer = (GDGameLayer) gdGameLayerList.get(0);
                                </xsl:if>
                                       
                                <xsl:if test="not(contains($hasObjectGroup3, 'found'))" >
                                    final GDGameLayer <xsl:value-of select="$gameLayerName" />GDGameLayer = (GDGameLayer) <xsl:call-template name="globals" >
                                        <xsl:with-param name="name" >
                                            <xsl:value-of select="$gameLayerName" />
                                        </xsl:with-param>
                                    </xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(0);
                                </xsl:if>
                                
                                    final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$gameLayerName" /> = (<xsl:value-of select="$gdObjectFactory" />)<xsl:text> </xsl:text><xsl:value-of select="$gameLayerName" />GDGameLayer.gdObject;
                                
                        </xsl:if>                                

                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 3" ><xsl:if test="text() = '='" >gameLayer.setText(</xsl:if></xsl:if>
                                <xsl:if test="position() = 4" >
                                    <xsl:if test="text() = '&quot;&quot;'" >stringUtil.EMPTY_STRING</xsl:if>
                                    <xsl:if test="text() != '&quot;&quot;'" >
                                        <xsl:if test="contains(text(), '&quot;') and not(contains(text(), '+'))" >
                                            <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(translate(translate(text(), '?', '_'), '&quot;', ' '), ' ', '_')" /></xsl:with-param></xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="not(contains(text(), '&quot;') and not(contains(text(), '+')))" >
<!--                                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template><xsl:call-template name="isGlobalsSep" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template><xsl:value-of select="text()" />-->
                                            <xsl:call-template name="addGlobals" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="position() = last()" >);</xsl:if>
                            </xsl:for-each>
                            
                            return true;
                        }
                        //TextContainerCapability::TextContainerBehavior::SetValue - action - END
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

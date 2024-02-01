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

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="mettreXActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="instancesAsString" />

                        private final String ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "G: " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;
                        
                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="isTextObject" ><xsl:for-each select="/game" ><xsl:for-each select="objects" ><xsl:if test="$name = name" ><xsl:if test="type = 'TextObject::Text'" >found</xsl:if></xsl:if></xsl:for-each><xsl:for-each select="layouts" ><xsl:for-each select="objects" ><xsl:if test="$name = name" ><xsl:if test="type = 'TextObject::Text'" >found</xsl:if></xsl:if></xsl:for-each></xsl:for-each></xsl:for-each></xsl:variable>

                        //MettreX
                        public boolean process() {
                        
                            //boolean result = false;

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

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            //final BasicArrayList gdObjectList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.get(index));
                            final BasicArrayList gdGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(index));
                            </xsl:if>
                            <xsl:if test="string-length($hasObjectGroup) = 0" >
                            //final BasicArrayList gdObjectList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectList;
                            final BasicArrayList gdGameLayerList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList;
                            </xsl:if>
                            
                            final int size2 = gdGameLayerList.size();
                            //if(size2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                            //    result = true;
                            //}

                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + size2, this, commonStrings.PROCESS));
                            for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                                final GDObject gdObject = (GDObject) ((GDGameLayer) gdGameLayerList.get(index2)).gdObject;
                                //result = result <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> 
                                this.processG(gdObject, gdGameLayerList, index2, globals.graphics);
                            }

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            }
                            </xsl:if>

                            //return result;
                            return true;
                        }
                        
                        @Override
                        public boolean processG(final GDObject gdObject, final BasicArrayList gdGameLayerList, final int gdObjectIndex, final Graphics graphics) {

                            try {
                                super.processGStats(gdObject, graphics);

                                final boolean result = this.processGPaint(gdObject, graphics);
                                
                                <xsl:if test="contains($isTextObject, 'found')" >
                                    //TextObject::Text - does not currently have a GameLayer
                                    //if(gdGameLayerList != null  gdGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                    //}
                                </xsl:if>
                                <xsl:if test="not(contains($isTextObject, 'found'))" >
                                    final GDGameLayer gameLayer = (GDGameLayer) gdGameLayerList.get(gdObjectIndex);
                                    //final GDObject gdObject = gameLayer.gdObject;
                                    gameLayer.updatePosition();
                                </xsl:if>
                                
                                return result;

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

                        <xsl:variable name="param" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 3" >
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
                                            <xsl:with-param name="find" >
                                                <xsl:value-of select="$objectName" />
                                            </xsl:with-param>
                                            <xsl:with-param name="replacementText" >SceneInstancesCount(gameGlobals.<xsl:value-of select="$objectName" />GDGameLayerList.size())</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                                                
                        <xsl:variable name="beforeSecondParam" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>

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

                        <xsl:if test="contains($hasObject3, 'found') or contains($hasObjectGroup3, 'found')" >
                        //beforeSecondParam=<xsl:value-of select="$beforeSecondParam" />
                        </xsl:if>

                        <xsl:variable name="firstOrBeforeFourthParam" >
                            <xsl:if test="contains($hasObject3, 'found') or contains($hasObjectGroup3, 'found')" >
                                <xsl:value-of select="$beforeSecondParam" />
                            </xsl:if>
                            <xsl:if test="not(contains($hasObject3, 'found') or contains($hasObjectGroup3, 'found'))" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                        </xsl:variable>
                
                    <xsl:variable name="paramOneNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="secondParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="paramTwoName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="paramTwoNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>                    
                    //paramOneNameObjectsGroups=<xsl:value-of select="$paramOneNameObjectsGroups" />
                    //paramTwoName=<xsl:value-of select="$paramTwoName" />
                    //paramTwoNameObjectsGroups=<xsl:value-of select="$paramTwoNameObjectsGroups" />

                    <xsl:variable name="hasCollisionProcessGD" >
                        <xsl:call-template name="hasCollisionProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:call-template name="collisionProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="not(contains($hasCollisionProcessGD, 'found'))" >
                    //Not from parent collision
                    public boolean processGD(final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                    </xsl:if>
                    <xsl:if test="contains($hasCollisionProcessGD, 'found')" >
                        super.processGDStats(<xsl:call-template name="collisionProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template>GDGameLayer);
                    </xsl:if>

                            try {

                    <xsl:if test="$paramOneNameObjectsGroups != ''" >
                                final boolean result = this.processGPaint(<xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayer.gdObject, graphics);
                                
                                <xsl:if test="contains($isTextObject, 'found')" >
                                    //TextObject::Text - does not currently have a GameLayer
                                </xsl:if>
                                <xsl:if test="not(contains($isTextObject, 'found'))" >
                                    <xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayer.updatePosition();
                                </xsl:if>
                    </xsl:if>

                    <xsl:if test="$paramOneNameObjectsGroups = ''" >
                                final boolean result = this.processGPaint(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer.gdObject, graphics);
                                
                                <xsl:if test="contains($isTextObject, 'found')" >
                                    //TextObject::Text - does not currently have a GameLayer
                                </xsl:if>
                                <xsl:if test="not(contains($isTextObject, 'found'))" >
                                    <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer.updatePosition();
                                </xsl:if>
                    </xsl:if>
                                                                
                                return result;

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

                        @Override
                        public boolean processGPaint(final GDObject gdObject, final Graphics graphics) {

                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                                
                                //if(gdObject == null) {
                                //    LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "gdObject was null", this, commonStrings.PROCESS));
                                //    return;
                                //}

                            <xsl:if test="not(contains($hasObjectGroup, 'found'))" >   
                                final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /><xsl:text> </xsl:text><xsl:value-of select="$name" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" />) gdObject;
                            </xsl:if>
                            
                            <xsl:if test="contains($hasObjectGroup, 'found')" >
                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                            </xsl:if>

                                //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="$name" />.toString(), this, commonStrings.PROCESS));

                                <xsl:variable name="existingValue" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.x</xsl:if></xsl:for-each></xsl:variable>

                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setX(</xsl:if>
                                <xsl:if test="position() = 2" ><xsl:if test="text() = '+'" ><xsl:value-of select="$existingValue" /> + </xsl:if><xsl:if test="text() = '-'" ><xsl:value-of select="$existingValue" /> - </xsl:if></xsl:if>
                                <xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if>
                                </xsl:for-each>);

                                //<xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.x</xsl:if></xsl:for-each>;

                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                final Rectangle <xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    pointFactory.getInstance(<xsl:value-of select="$name" />.x, <xsl:value-of select="$name" />.y),
                                    <xsl:value-of select="$name" />.Width(globals.graphics) * scale, <xsl:value-of select="$name" />.Height(globals.graphics) * scale);
                                <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />RectangleList.add(<xsl:value-of select="$name" />Rectangle);
                                </xsl:if>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

    </xsl:template>

</xsl:stylesheet>

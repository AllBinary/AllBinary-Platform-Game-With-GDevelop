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

    <xsl:template name="modVarObjetActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

                        <xsl:variable name="param" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 4" >
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

                        <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup, 'found')" >
                        //beforeSecondParam=<xsl:value-of select="$beforeSecondParam" />
                        </xsl:if>

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
                
                    <xsl:variable name="paramOneNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="secondParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="paramTwoName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="paramTwoNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>                    
                    //paramOneNameObjectsGroups=<xsl:value-of select="$paramOneNameObjectsGroups" />
                    //paramTwoName=<xsl:value-of select="$paramTwoName" />
                    //paramTwoNameObjectsGroups=<xsl:value-of select="$paramTwoNameObjectsGroups" />
                    //ModVarObjet - //<xsl:value-of select="$secondParam" />
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        <xsl:variable name="firstParam" ><xsl:call-template name="firstParam" /></xsl:variable>
                    
                        <xsl:if test="$paramOneNameObjectsGroups != ''" >
                        final GDGameLayer <xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayer = gameGlobals.tempGameLayerArray[0];
                        if(<xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayer != null) {

<xsl:text>                        </xsl:text>
                        <xsl:if test="$paramTwoName != ''" >final GDGameLayer paramTwoGameLayer = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramTwoName" />GDGameLayerList.get(0));</xsl:if>
                        <xsl:text>&#10;</xsl:text>

                        <xsl:if test="$paramTwoNameObjectsGroups != ''" >
                            //final GDGameLayer <xsl:value-of select="$paramTwoNameObjectsGroups" />GameLayer = gameLayer2;
                        <xsl:text>&#10;</xsl:text>
                            final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$paramTwoNameObjectsGroups" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$paramTwoNameObjectsGroups" /><xsl:text> </xsl:text><xsl:value-of select="$paramTwoNameObjectsGroups" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$paramTwoNameObjectsGroups" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$paramTwoNameObjectsGroups" />) <xsl:value-of select="$paramTwoNameObjectsGroups" />GDGameLayer.gdObject;
                        </xsl:if>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                                                
<xsl:text>                        </xsl:text><xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" ><xsl:if test="text() != $firstParam" >//orignalFirstParam=<xsl:value-of select="text()" /><xsl:text>&#10;</xsl:text></xsl:if></xsl:if>
                        <xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$firstParam" />) <xsl:value-of select="$firstParam" />GDGameLayer.gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="text() = '*'" >=</xsl:if><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if>
                        <xsl:if test="position() = 4" >

                            <xsl:if test="$paramTwoName != ''" >
                                <xsl:if test="substring-before($param, '.') = ''" >
                                    <xsl:value-of select="$param" />
                                </xsl:if>
                                <xsl:if test="substring-before($param, '.') != ''" >paramTwoGameLayer.gdObject.<xsl:value-of select="substring-after($param, '.')" /></xsl:if>
                            </xsl:if>
                            <xsl:if test="$paramTwoName = ''" >
                                <xsl:variable name="before" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>
                                <xsl:variable name="hasObject" >
                                    <xsl:for-each select="//objects" >
                                        <xsl:if test="name = $beforeSecondParam " >found</xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>

                                <xsl:if test="$beforeSecondParam != ''" >
                                    //<xsl:value-of select="$beforeSecondParam" /> - <xsl:value-of select="$hasObject" /><xsl:text>&#10;</xsl:text>
                                    <xsl:if test="contains($hasObject, 'found')" >
                                    ((GD<xsl:call-template name="objectFactory" >
                                        <xsl:with-param name="name" >
                                            <xsl:value-of select="$beforeSecondParam" />
                                        </xsl:with-param>
                                        <xsl:with-param name="layoutIndex" >
                                            <xsl:value-of select="$layoutIndex" />
                                        </xsl:with-param>
                                    </xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeSecondParam" />) <xsl:value-of select="$beforeSecondParam" />GDGameLayer.gdObject).<xsl:value-of select="substring-after($param, '.')" />
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(contains($hasObject, 'found'))" >
                                <xsl:value-of select="$param" />
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        
                        } else {
                            //Needs Impl
                            if(true) throw new RuntimeException();
                        }
                    
                            /*
                            final int size2 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayerListOfList.size();
                            for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                            final BasicArrayList <xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" >
                                <xsl:with-param name="name" >
                                    <xsl:value-of select="text()" />
                                </xsl:with-param>
                            </xsl:call-template>.<xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayerListOfList.get(index2));
                        <xsl:text>&#10;</xsl:text>
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >final int size = <xsl:value-of select="text()" />GDGameLayerList.size();</xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        
                        <xsl:if test="$paramOneNameObjectsGroups = ''" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size();</xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        
                        <xsl:text>&#10;</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                    
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            this.process(index);
                        }
                        
                        <xsl:if test="$paramOneNameObjectsGroups != ''" >
                        }
                        */
                        </xsl:if>
                        
                        return true;

                    }
                    
                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                        
                        <xsl:if test="$paramOneNameObjectsGroups != ''" >
                            /*
                            final int size2 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayerListOfList.size();
                            for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                            final BasicArrayList <xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" >
                                <xsl:with-param name="name" >
                                    <xsl:value-of select="text()" />
                                </xsl:with-param>
                            </xsl:call-template>.<xsl:value-of select="$paramOneNameObjectsGroups" />GDGameLayerListOfList.get(index2));
                        <xsl:text>&#10;</xsl:text>
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >final GDGameLayer paramOneGameLayer = ((GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index));</xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        
                        <xsl:if test="$paramOneNameObjectsGroups = ''" >
                        <xsl:for-each select="parameters" >
                        //parameter1
                        <xsl:if test="position() = 1" >final GDGameLayer paramOneGameLayer = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index));</xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        <xsl:text>&#10;</xsl:text>

<xsl:text>                        </xsl:text>
                        <xsl:if test="$paramTwoName != ''" >final GDGameLayer paramTwoGameLayer = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramTwoName" />GDGameLayerList.get(index));</xsl:if>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:if test="$paramTwoNameObjectsGroups != ''" >
                            final BasicArrayList <xsl:value-of select="$paramTwoNameObjectsGroups" />GDGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" >
                                <xsl:with-param name="name" >
                                    <xsl:value-of select="text()" />
                                </xsl:with-param>
                            </xsl:call-template>.<xsl:value-of select="$paramTwoNameObjectsGroups" />GDGameLayerListOfList.get(index));
                        <xsl:text>&#10;</xsl:text>
                            final GDGameLayer <xsl:value-of select="$paramTwoNameObjectsGroups" />GDGameLayer = ((GDGameLayer) <xsl:value-of select="$paramTwoNameObjectsGroups" />GDGameLayerList.get(index));
                        <xsl:text>&#10;</xsl:text>
                            final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$paramTwoNameObjectsGroups" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$paramTwoNameObjectsGroups" /><xsl:text> </xsl:text><xsl:value-of select="$paramTwoNameObjectsGroups" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$paramTwoNameObjectsGroups" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$paramTwoNameObjectsGroups" />) <xsl:value-of select="$paramTwoNameObjectsGroups" />GDGameLayer.gdObject;
                        </xsl:if>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                        
<xsl:text>                        </xsl:text><xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) paramOneGameLayer.gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="text() = '*'" >=</xsl:if><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if>
                        //parameter4
                        <xsl:if test="position() = 4" >
                            
                            <xsl:if test="$paramTwoName != ''" >
                                <xsl:if test="substring-before($param, '.') = ''" >
                                    <xsl:value-of select="$param" />
                                </xsl:if>
                                <xsl:if test="substring-before($param, '.') != ''" >paramTwoGameLayer.gdObject.<xsl:value-of select="substring-after($param, '.')" /></xsl:if>
                            </xsl:if>
                            <xsl:if test="$paramTwoName = ''" >
                                
                                <xsl:if test="$beforeSecondParam != ''" >
                                    //<xsl:value-of select="$beforeSecondParam" /> - <xsl:value-of select="$hasObject" /><xsl:text>&#10;</xsl:text>
                                    <xsl:if test="contains($hasObject, 'found')" >
                                    ((GD<xsl:call-template name="objectFactory" >
                                        <xsl:with-param name="name" >
                                            <xsl:value-of select="$beforeSecondParam" />
                                        </xsl:with-param>
                                        <xsl:with-param name="layoutIndex" >
                                            <xsl:value-of select="$layoutIndex" />
                                        </xsl:with-param>
                                    </xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeSecondParam" />) paramOneGameLayer.gdObject).<xsl:value-of select="substring-after($param, '.')" />
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(contains($hasObject, 'found'))" >
                                <xsl:value-of select="$param" />
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        
                        <xsl:if test="$paramOneNameObjectsGroups != ''" >
                            }
                            */
                            //Needs Impl
                            if(true) throw new RuntimeException();
                        </xsl:if>
                        <xsl:text>&#10;</xsl:text>
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_IS_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) (((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                        
                        return true;

                    }
                            
                    <xsl:variable name="hasCollisionProcessGD" >
                        <xsl:call-template name="hasCollisionProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                        <xsl:call-template name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:call-template name="collisionProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="contains($hasCollisionProcessGD, 'found')" >
                        super.processGDStats(<xsl:call-template name="collisionProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template>GDGameLayer);
                    </xsl:if>
                    <xsl:if test="contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >
                        super.processGDStats(<xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template>GDGameLayer);
                    </xsl:if>
                    <xsl:if test="not(contains($hasCollisionProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >
                    //ModVarObjet - Not from parent collision
                    public boolean processGD(final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                    </xsl:if>

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

<xsl:text>                        </xsl:text>
                        <xsl:if test="$paramTwoName != ''" >final GDGameLayer paramTwoGameLayer = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$paramTwoName" />GDGameLayerList.get(0));</xsl:if>
                        <xsl:text>&#10;</xsl:text>

                        <xsl:if test="$paramTwoNameObjectsGroups != ''" >
                            //final GDGameLayer <xsl:value-of select="$paramTwoNameObjectsGroups" />GameLayer = gameLayer2;
                        <xsl:text>&#10;</xsl:text>
                            final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$paramTwoNameObjectsGroups" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$paramTwoNameObjectsGroups" /><xsl:text> </xsl:text><xsl:value-of select="$paramTwoNameObjectsGroups" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$paramTwoNameObjectsGroups" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$paramTwoNameObjectsGroups" />) <xsl:value-of select="$paramTwoNameObjectsGroups" />GDGameLayer.gdObject;
                        </xsl:if>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                                                
<xsl:text>                        </xsl:text><xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" ><xsl:if test="text() != $firstParam" >//orignalFirstParam=<xsl:value-of select="text()" /><xsl:text>&#10;</xsl:text></xsl:if></xsl:if>
                        <xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$firstParam" />) <xsl:value-of select="$firstParam" />GDGameLayer.gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="text() = '*'" >=</xsl:if><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if>
                        <xsl:if test="position() = 4" >

                            <xsl:if test="$paramTwoName != ''" >
                                <xsl:if test="substring-before($param, '.') = ''" >
                                    <xsl:value-of select="$param" />
                                </xsl:if>
                                <xsl:if test="substring-before($param, '.') != ''" >paramTwoGameLayer.gdObject.<xsl:value-of select="substring-after($param, '.')" /></xsl:if>
                            </xsl:if>
                            <xsl:if test="$paramTwoName = ''" >
                                <xsl:variable name="before" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>
                                <xsl:variable name="hasObject" >
                                    <xsl:for-each select="//objects" >
                                        <xsl:if test="name = $beforeSecondParam " >found</xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>

                                <xsl:if test="$beforeSecondParam != ''" >
                                    //<xsl:value-of select="$beforeSecondParam" /> - <xsl:value-of select="$hasObject" /><xsl:text>&#10;</xsl:text>
                                    <xsl:if test="contains($hasObject, 'found')" >
                                    ((GD<xsl:call-template name="objectFactory" >
                                        <xsl:with-param name="name" >
                                            <xsl:value-of select="$beforeSecondParam" />
                                        </xsl:with-param>
                                        <xsl:with-param name="layoutIndex" >
                                            <xsl:value-of select="$layoutIndex" />
                                        </xsl:with-param>
                                    </xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeSecondParam" />) <xsl:value-of select="$beforeSecondParam" />GDGameLayer.gdObject).<xsl:value-of select="substring-after($param, '.')" />
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(contains($hasObject, 'found'))" >
                                <xsl:value-of select="$param" />
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_IS_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) <xsl:value-of select="text()" />GDGameLayer.gdObject).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                        return true;
                    }        

    </xsl:template>

</xsl:stylesheet>

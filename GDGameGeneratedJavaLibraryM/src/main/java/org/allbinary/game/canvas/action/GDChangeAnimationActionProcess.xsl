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

    <xsl:template name="changeAnimationActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        
        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        
        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        
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
                                            <xsl:with-param name="find" >SceneInstancesCount(<xsl:value-of select="$objectName" /></xsl:with-param>
                                            <xsl:with-param name="replacementText" >SceneInstancesCount(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$objectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$objectName" />GDGameLayerList.size()</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                                                
                        <xsl:variable name="beforeSecondParam0" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>
                        <xsl:variable name="beforeSecondParam" ><xsl:if test="contains($beforeSecondParam0, '-')" ><xsl:value-of select="substring-after($beforeSecondParam0, '-')" /></xsl:if><xsl:if test="not(contains($beforeSecondParam0, '-'))" ><xsl:value-of select="$beforeSecondParam0" /></xsl:if></xsl:variable>
                        <xsl:variable name="beforeSecondParam2" ><xsl:if test="contains($beforeSecondParam0, '-')" >-</xsl:if></xsl:variable>
                        
                        <xsl:variable name="gdObjectFactory2" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$beforeSecondParam" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$beforeSecondParam" /></xsl:variable>

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
                        <xsl:if test="string-length($beforeSecondParam2)" >//beforeSecondParam2=<xsl:value-of select="$beforeSecondParam2" /></xsl:if>
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
                    
                    <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$paramTwoNameObjectsGroups" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$paramTwoNameObjectsGroups" /></xsl:variable>

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

                    //paramOneNameObjectsGroups=<xsl:value-of select="$paramOneNameObjectsGroups" />
                    //paramTwoName=<xsl:value-of select="$paramTwoName" />
                    //paramTwoNameObjectsGroups=<xsl:value-of select="$paramTwoNameObjectsGroups" />        
                    //ChangeAnimation
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        final int animationIndex<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>

                        final GDGameLayer gdGameLayer = <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >(((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() - 1)))</xsl:if></xsl:for-each>;
//                        if(animationIndex <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> gdGameLayer.getIndexedAnimationInterfaceArray().length) {
//                            LogUtil.put(LogFactory.getInstance(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(gdGameLayer.toString()).append(" invalid animation index: ").append(animationIndex).toString(), this, commonStrings.PROCESS, new Exception()));
//                        }
                        
                        gdGameLayer.gdObject.animation = animationIndex;

                        return true;
                    }
        
                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                        
                        final int animationIndex<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>

                        final GDGameLayer gdGameLayer = <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >(((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index)))</xsl:if></xsl:for-each>;
//                        if(animationIndex <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> gdGameLayer.getIndexedAnimationInterfaceArray().length) {
//                            LogUtil.put(LogFactory.getInstance(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(gdGameLayer.toString()).append(" invalid animation index: ").append(animationIndex).toString(), this, commonStrings.PROCESS, new Exception()));
//                        }
                        
                        gdGameLayer.gdObject.animation = animationIndex;
                        
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >(((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject.animation</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        return true;
                    }

<!--
                    @Override
                    public boolean processGD(final GDGameLayer gdGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                    
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                        
                        final int animationIndex<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>

//                        if(animationIndex <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> gdGameLayer.getIndexedAnimationInterfaceArray().length) {
//                            LogUtil.put(LogFactory.getInstance(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(gdGameLayer.toString()).append(" invalid animation index: ").append(animationIndex).toString(), this, commonStrings.PROCESS, new Exception()));
//                        }
                        
                        gdGameLayer.gdObject.animation = animationIndex;
                                                
                        return true;                   
                    }
-->

    </xsl:template>

</xsl:stylesheet>

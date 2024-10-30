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

    <xsl:template name="activateBehaviorActionProcess" >
        
                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="param3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        
                    //ActivateBehavior - action
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                        
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

                            GDGameLayer gdGameLayer;
                            //GDObject gdObject;
                            for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                            //if(gdObjectList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                gdGameLayer = (GDGameLayer) gdGameLayerList.get(index2);
                                <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >gdGameLayer.gdObject.isBehaviorEnabledArray[</xsl:if><xsl:if test="position() = 2" >gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), ':', '_')" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each>_BEHAVIOR_INDEX] = <xsl:if test="$param3 = 'yes'" >true</xsl:if><xsl:if test="$param3 != 'yes'" >false</xsl:if>;
                                //gdObject = (GDObject) gdGameLayer.gdObject;
                                //result = result <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> 
                            //}
                            }

                            <xsl:if test="string-length($hasObjectGroup) > 0" >
                            }
                            </xsl:if>
                        
                        
                        return true;
                    }
                    
                    public boolean processGD(final GDGameLayer gdGameLayer, final GDGameLayer gdGameLayer2, final Graphics graphics) throws Exception {
                    
                        super.processGDStats(gdGameLayer);
                        
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                        
                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >gdGameLayer.gdObject.isBehaviorEnabledArray[</xsl:if><xsl:if test="position() = 2" >gdBehaviorUtil.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each>_BEHAVIOR_INDEX] = <xsl:if test="$param3 = 'yes'" >true</xsl:if><xsl:if test="$param3 != 'yes'" >false</xsl:if>;
                            
                        return true;

                    }

    </xsl:template>

</xsl:stylesheet>
